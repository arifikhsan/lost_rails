class Api::V1::ItemsController < Api::ApiController
  before_action :authenticate_user!, except: %i[index show search]
  before_action :set_item, only: %i[show edit update destroy]
  before_action :set_items, only: %i[index mine search]

  def index;end

  def mine
    @items = @items.where(user_id: current_user.id)
    render :index
  end

  def show; end

  def new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    @item.category_items.new if item_params[:category_items_attributes].blank?

    render_error_from(@item) unless @item.save
    render status: :created
  end

  def edit; end

  def update
    @item.update(item_params)

    @item.category_items.new if @item.category_items.blank?
    @item.save

    render_error_from(@item) unless @item.valid?
  end

  def destroy
    @item.destroy
  end

  def search
    @items = @items.search_by_query(with_search)
    render :index
  end

  protected

  def set_items
    @items = Item.published
    @items = @items.search_by_query(with_search) if with_search
    @items = @items.where(condition: with_condition) if with_condition
    @items = @items.joins(:reward).where.not(rewards: { id: nil }) if with_reward
    @items = @items.order(created_at: :desc)
    @items = @items.page(params[:page]).per(params[:per])
    @items = @items.includes(:categories, :reward, user: :user_detail)
  end

  def set_item
    @item = Item.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_not_found
  end

  private

  def item_params
    params.require(:item).permit(
      :title, :detail, :condition, :status, :time_start,
      :time_end, :latitude, :longitude, :radius,
      category_items_attributes: %i[id category_id _destroy],
      reward_attributes: %i[id value _destroy]
    )
  end

  def with_reward
    return if params[:reward].blank?

    params[:reward].to_s.downcase == 'yes'
  end

  def with_condition
    return if params[:condition].blank?
    return unless %w[lost found].include?(params[:condition].to_s.downcase)

    params[:condition].to_s.downcase
  end

  def with_search
    return if params[:query].blank?

    params[:query].to_s
  end
end

class Api::V1::ItemsController < Api::ApiController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, only: %i[show create update destroy]
  before_action :set_items, only: %i[index mine]

  def index; end

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
    @item.category_items.new unless item_params[:category_items_attributes]

    render_error unless @item.save
    render status: :created
  end

  def edit; end

  def update
    @item.update(item_params)
    render_error unless @item.valid?
  end

  def destroy
    @item.destroy
  end

  protected

  def set_items
    @items = Item.published.latest
    @items = @items.where(condition: params[:condition]) if params[:condition]
    @items = @items.page(params[:page]).per(params[:per])
    @items = @items.includes(:categories, :reward, user: :user_detail)
  end

  private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :title, :detail, :condition, :status, :time_start,
      :time_end, :latitude, :longitude, :radius,
      category_items_attributes: %i[id category_id],
      reward_attributes: %i[id value]
    )
  end

  def render_error
    render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
  end
end

class Api::V1::ItemsController < Api::ApiController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, except: %i[index create]

  def index
    @items = Item.published.latest
    @items = @items.where(condition: params[:condition]) if params[:condition]
    @items = @items.page(params[:page]).includes(:categories, :reward, user: :user_detail)
  end

  def show
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

  private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :title,
      :detail,
      :condition,
      :status,
      :time_start,
      :time_end,
      :latitude,
      :longitude,
      :radius,
      category_items_attributes: %i[id category_id],
      reward_attributes: %i[id value]
    )
  end

  def render_error
    render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
  end
end

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

    if @item.save
      render json: { message: 'created', data: @item }, status: :created
    else
      render_error
    end
  end

  def edit; end

  def update
    @item.update(item_params)

    if @item.valid?
      render json: {message: 'updated', data: @item}
    else
      render_error
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def item_params
    params.permit(
      :title,
      :detail,
      :condition,
      :status,
      :reward,
      :time_start,
      :time_end,
      :latitude,
      :longitude,
      :radius
    )
  end

  def render_error
    render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
  end
end

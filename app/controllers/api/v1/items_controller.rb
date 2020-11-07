class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, except: %i[index]

  def index
    @items = Item.show_active.page(params[:page]).includes(:category, user: :user_detail)
  end

  def show
  end

  private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def render_error
    render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
  end

  def item_params
    params.permit!
  end
end

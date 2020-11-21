class Api::V1::CategoriesController < Api::ApiController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
  end
end

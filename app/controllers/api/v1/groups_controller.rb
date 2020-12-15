class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
  end

  protected

  def set_groups
    @groups = Group.all
    @groups = @groups.order(created_at: :desc)
    @groups = @groups.page(params[:page]).per(params[:per])
  end
end

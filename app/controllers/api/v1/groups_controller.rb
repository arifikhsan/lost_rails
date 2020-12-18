class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_group, only: %i[show edit update destroy]
  before_action :set_groups, only: %i[index]

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    render_error_from(@group) unless @group.save
    render status: :created
  end

  def update
    @group.update(group_params)

    render_error_from(@group) unless @group.valid?
  end

  def destroy
    @group.destroy
  end

  protected

  def set_groups
    @groups = Group.all
    @groups = @groups.order(created_at: :desc)
    @groups = @groups.page(params[:page]).per(params[:per])
  end

  def set_group
    @group = Group.friendly.find(params[:id])
  rescue
    render_not_found
  end

  private

  def group_params
    params.require(:group).permit(:name, :username, :location, :private)
  end
end

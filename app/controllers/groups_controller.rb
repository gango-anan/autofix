class GroupsController < ApplicationController
  def index
    @groups = Current.user.groups
  end

  def new
    @group = Current.user.groups.build
  end

  def show
    if !Current.user.groups.include?(Group.find(params[:id]))
      flash[:alert] = "You are not authorized to view this group's expenditures."
      redirect_to groups_path
    else
      @group = Current.user.groups.find(params[:id])
      @group_expenditures = Current.user.expenditures.where(group_id: @group.id)
    end
  end

  def create
    @group = Current.user.groups.build(group_params)
    if Current.user.groups.pluck(:name).include?(group_params[:name])
      flash[:alert] = 'Group already exists try another name.'
      render :new
    else
      @group.save
      redirect_to groups_path, notice: 'Group Successfully added.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end
end
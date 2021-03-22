class GroupsController < ApplicationController
  def index
    @groups = Current.user.groups
  end

  def new
    @group = Current.user.groups.build
  end

  def show
    @group = Group.find(params[:id])
    @group_expenditures = Current.user.expenditures.where(group_id: @group.id)
  end

  def create
    group_params[:name].downcase!
    @group = Current.user.groups.build(group_params)
    if Current.user.groups.pluck(:name).include?(group_params[:name])
      flash[:alert] = 'Group already exists try another name.'
      render :new
    else
      @group.save
      redirect_to user_path(Current.user.id), notice: 'Group Successfully added.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
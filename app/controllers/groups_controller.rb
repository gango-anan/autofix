class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:picture_attachment).user_groups
  end

  def new
    @group = Current.user.groups.build
  end

  def show
    @group = Group.find_by(user_id: Current.user.id, id: params[:id])
    if @group.nil?
      flash[:alert] = 'You are not authorized to view these expenditures.'
      redirect_to groups_path
    else
      @group_expenditures = Expenditure.where(author_id: Current.user.id, group_id: @group.id)
    end
  end

  def create
    @group = Current.user.groups.build(group_params)
    if Current.user.user_group_names.include?(group_params[:name])
      flash[:alert] = 'Group already exists try another name.'
      render :new
    elsif @group.save
      redirect_to groups_path, notice: 'Group Successfully added.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end
end

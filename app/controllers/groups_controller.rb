class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:picture_attachment).where(user_id: [Current.user.id, nil])
  end

  def new
    @group = Current.user.groups.build
  end

  def show
    @group = Group.find_by(id: params[:id])
    @group_expenditures = Expenditure.where(group_id: params[:id])
  end

  def create
    @group = Current.user.groups.build(group_params)
    if @group.save
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

class ExpendituresController < ApplicationController
  def index
    @total_amount = Current.user.total_amount
    @expenditures = Expenditure.user_expenditures.includes(:group)
  end

  def other_expenditures
    @total_amount_other_expenditures = Current.user.total_amount_for_un_grouped_exps
    @other_expenditures = Expenditure.where(author_id: Current.user.id, group_id: nil)
  end

  def new
    @expenditure = Current.user.expenditures.build
  end

  def create
    @expenditure = Current.user.expenditures.build(expenditure_params)
    if @expenditure.save
      redirect_to expenditures_path, notice: 'Expenditure recorded.'
    else
      flash[:arlert] = 'Expenditure was not added try again.'
      render :new
    end
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount, :group_id)
  end
end

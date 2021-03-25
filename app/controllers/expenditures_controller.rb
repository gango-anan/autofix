class ExpendituresController < ApplicationController
  def index
    @total_amount = if Current.user.expenditures.blank?
                      0
                    else
                      Current.user.total_amount
                    end

    @expenditures = Current.user.expenditures
  end

  def other_expenditures
    @total_amount_other_expenditures = if Current.user.expenditures.un_grouped_expenditures.blank?
                                         0
                                       else
                                         Current.user.total_amount_for_un_grouped_exps
                                       end

    @other_expenditures = Current.user.expenditures.un_grouped_expenditures
  end

  def new
    @expenditure = Current.user.expenditures.build
  end

  def create
    @expenditure = Current.user.expenditures.build(expenditure_params)
    if @expenditure.save
      redirect_to expenditures_path, notice: 'Expenditure recorded.'
    else
      render :new
    end
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount, :group_id)
  end
end

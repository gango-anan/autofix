class ExpendituresController < ApplicationController
  def index
    if Current.user.expenditures.blank?
      @total_amount = 0
    else
      @total_amount = Current.user.total_amount
    end

    @expenditures = Current.user.expenditures
  end

  def new
    @expenditure = Current.user.expenditures.build
  end

  def create
    expenditure_params.name.downcase!
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
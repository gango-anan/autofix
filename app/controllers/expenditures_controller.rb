class ExpendituresController < ApplicationController
  def index
    @expenditures = Current.user.expenditures
    @total_amount = Current.user.total_amount
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
class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    @expense = Expense.find(params[:id])
    render json: @expense
  end
end

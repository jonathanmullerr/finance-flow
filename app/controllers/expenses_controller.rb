class ExpensesController < ApplicationController
  before_action :authorize_request

  # GET /expenses
  def index
    @expenses = Expense.all
    render json: @expenses
  end

  # GET /expenses/1
  def show
    @expense = Expense.find(params[:id])
    render json: @expense
  end
end

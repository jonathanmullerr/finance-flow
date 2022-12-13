class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  def index
    @expenses = Transaction::Expense.all

    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    @expense = Transaction::Expense.new(expense_params)

    if @expense.save
      render json: @expense, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
  end

  private
    def set_expense
      @expense = Transaction::Expense.find(params[:id])
    end

    def expense_params
      params.fetch(:expense, {})
    end
end

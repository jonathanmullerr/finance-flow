class ExpensesController < EntriesController
  before_action :authorize_request
  before_action :set_entry, only: [:update, :destroy]

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

  private

  def entry_params
    params.permit(:date, :transaction_type, :amount, :description).merge(user_id: @current_user.id, type: "Expense")
  end
end

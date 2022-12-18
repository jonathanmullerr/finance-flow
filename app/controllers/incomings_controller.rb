class IncomingsController < EntriesController
  before_action :authorize_request
  before_action :set_entry, only: [:update, :destroy]

  # GET /incomings
  def index
    @incomings = Incoming.for_user(@current_user)
    render json: @incomings
  end

  # GET /incomings/1
  def show
    @incoming = Incoming.for_user(@current_user).find(params[:id])
    render json: @incoming
  end

  private

  def entry_params
    params.permit(:date, :transaction_type, :amount, :description).merge(user_id: @current_user.id, type: "Incoming")
  end
end

class IncomingsController < ApplicationController
  before_action :authorize_request

  # GET /incomings
  def index
    @incomings = Incoming.all
    render json: @incomings
  end

  # GET /incomings/1
  def show
    @incoming = Incoming.find(params[:id])

    render json: @incoming
  end
end

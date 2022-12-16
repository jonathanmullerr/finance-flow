class IncomingsController < ApplicationController
  before_action :authorize_request

  def index
    @incomings = Incoming.all
    render json: @incomings
  end

  def show
    @incoming = Incoming.find(params[:id])

    render json: @incoming
  end
end

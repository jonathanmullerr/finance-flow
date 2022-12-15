class IncomingsController < ApplicationController
  def index
    @incomings = Incoming.all
    render json: @incomings
  end

  def show
    @incoming = Incoming.find(params[:id])

    render json: @incoming
  end

  
end

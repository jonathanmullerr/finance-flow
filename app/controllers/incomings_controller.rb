class IncomingsController < ApplicationController
  before_action :set_incoming, only: [:show, :update, :destroy]

  def index
    @incomings = Transaction::Incoming.all

    render json: @incomings
  end

  def show
    render json: @incoming
  end

  def create
    @incoming = Transaction::Incoming.new(incoming_params)

    if @incoming.save
      render json: @incoming, status: :created, location: @incoming
    else
      render json: @incoming.errors, status: :unprocessable_entity
    end
  end

  def update
    if @incoming.update(incoming_params)
      render json: @incoming
    else
      render json: @incoming.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @incoming.destroy
  end

  private

  def set_incoming
    @incoming = Transaction::Incoming.find(params[:id])
  end

  def incoming_params
    params.fetch(:incoming, {})
  end
end

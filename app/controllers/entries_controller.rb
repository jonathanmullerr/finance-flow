class EntriesController < ApplicationController
  before_action :authorize_request
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.where(user_id: @current_user.id)
    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy

    render json: { message: "Entry deleted successfully" }
  end

  private

  def set_entry
    @entry = Entry.find_by(id: params[:id], user_id: @current_user.id)
  end

  def entry_params
    params.permit(:date, :transaction_type, :amount, :description).merge(user_id: @current_user.id)
  end
end

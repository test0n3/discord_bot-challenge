# class Api::V1::MessagesController < ApplicationController
class Api::V1::MessagesController < ActionController::API
rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
rescue_from Mongoid::Errors::DocumentNotFound, with: :handle_document_not_found

  def index
    @messages = Message.where(state: 1).order_by(release_date: :desc)
    render json: @messages
  end

  def destroy
    @message = Message.find(params[:id])
    if @message[:state] == 1
      if @message.update(state: 3)
        render json: { message: "message deleted" }, status: :ok
      else
        render json: {
        errors: @message.errors.full_messages },
            status: :unprocessable_entity
      end
    else
      render json: {
        errors: "message already deleted" }, status: :unprocessable_entity
    end
  end

  def create
    @message = Message.new(message_params)
    @message.assign_attributes(state: 1)
    if @message.save
      render json: @message, status: :created
    else
      render json: {
        errors: @message.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:message).permit(:message_body, :release_date)
  end

  def handle_parameter_missing(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end

  def handle_document_not_found(exception)
    render json: { errors: "Message not found" }, status: :not_found
  end
end

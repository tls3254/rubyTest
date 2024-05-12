class ContentsController < ApplicationController
  before_action :set_content, only: [:update, :destroy]
  protect_from_forgery except: :create
  def create
    content = Content.create(
      title: params[:title],
      body: params[:body],
      user_id: current_user.id
    )
    if content.persisted?
      render json: { message: 'content created successfully' }, status: :created
    else
      render json: { errors: content.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @contents = Content.all
    render json: @contents
  end
  def update
  end
  def destroy
  end

  def set_content
    @content = Content.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Content not found' }, status: :not_found
  end
end

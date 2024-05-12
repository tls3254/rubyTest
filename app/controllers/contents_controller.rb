class ContentsController < ApplicationController
  before_action :set_content, only: [:update, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
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
    if @content.user_id == current_user.id
      if @content.update(title: params[:title],body: params[:body])
        render json: { message: 'Content updated successfully' }, status: :ok
      else
        render json: { errors: @content.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to update this content' }, status: :forbidden
    end
  end

  def destroy
    if @content.user_id == current_user.id
      if @content.destroy
        render json: { message: 'Content successfully deleted' }, status: :ok
      else
        render json: { errors: @content.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to delete this content' }, status: :forbidden
    end
  end

  def set_content
    @content = Content.find_by_id(params[:id])
  end
end

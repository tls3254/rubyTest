class UsersController < ApplicationController
  protect_from_forgery with: :null_session, except: [:signin, :signup]
  def signup
    user = User.create(
        firstName: params[:firstName],
        lastName: params[:lastName],
        email: params[:email],
        password: params[:password],
        country: params[:country]
        )
    if user.persisted?
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def signin
    user = User.find_by(email: params[:auth][:email])
    if user&.authenticate(params[:auth][:password])
      session[:user_id] = user.id
      render json: { message: 'Login successful' }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end

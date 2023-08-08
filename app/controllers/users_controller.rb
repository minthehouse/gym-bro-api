class UsersController < ApplicationController
  def update
    user = User.find(params[:id]) # Find the user by the provided userId

    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:goal, :gender, :age, :height_in_feet, :height_in_inches, :weight)
  end
end

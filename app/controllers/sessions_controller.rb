class SessionsController < DeviseTokenAuth::SessionsController

  def create
    super do
      render json: { user: current_user, 
                     token: @token }.to_json and return
    end
  end

  private

  def resource_params
    params.require(:session).permit(:email, :password)
  end


end

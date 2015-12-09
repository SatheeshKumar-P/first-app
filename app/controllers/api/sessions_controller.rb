class Api::SessionsController < Api::BasesController
   def create
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
     @status = "201 created successfully"
    else
      @errors = "401 UnAuthorized"
    end
  end

  private
  def create_params
    params.require(:user).permit(:email, :password)
  end
end

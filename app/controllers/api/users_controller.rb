class Api::UsersController < Api::BasesController
  before_action :authenticate
  before_action :set_user
  def index
    #if @current_user.present?
      @users = User.all
      rescue ActiveRecord::RecordNotFound
        @errors = "401 UnAuthorized"
      #@errors = { :errors => "User could not be found."}
            #respond_with(@errors.to_json, :status => 404)
            render(:json => @errors.to_json, :status => 404)
    #end
    #@errors = "401 UnAuthorized"
  end

  # GET /users/1.json
  def show
    respond_with(@user)        
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
      	@notice="User was successfully created."
      else
        @errors=@user.errors
      end
  end

  def update
      if @user.update(user_params)
      	@notice="User was successfully updated."
      else
      	@errors=@user.errors
      end
   end

  def destroy
    @user.destroy
    @notice="User was successfully destroyed."
  end

  private
    def set_user
      if params[:id].present?
        @user = User.find(params[:id])
      end
    end

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:mobile_number,:city,:state,:zip,:image)
  end
end

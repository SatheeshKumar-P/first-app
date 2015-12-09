class Api::BasesController < ApplicationController
  respond_to :json, :xml, :html
  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end
  
  #rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    return api_error(status: 404, errors: 'Not found')
  end
  
  def authenticate
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_email = options.blank?? nil : options[:email]
    @user = user_email && User.find_by(email: user_email)

    if @user && ActiveSupport::SecurityUtils.secure_compare(@user.tokens, token)
      @current_user = @user 
      return true
    else
      @errors = "unauthenticated!" 
      return false
      #return unauthenticated!
    end
  end

end

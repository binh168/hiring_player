class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def generic_callback
    @user = User.from_omniauth(request.env["omniauth.auth"])
    provider = @user.provider
    
    if @user.persisted?
      log_in @user
      redirect_back_or @user
      set_flash_message(:notice, :success, kind: provider.capitalize)
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to signup_path
    end
  end

  def failure
    redirect_to root_path
  end

  alias_method :facebook, :generic_callback
  alias_method :google_oauth2, :generic_callback
end

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # def google_oauth2
    #   @user = User.from_omniauth(request.env["omniauth.auth"])
    #   if @user.persisted?
    #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success",  kind => "Google"
    #     sign_in_and_redirect @user, :event => :authentication
    #   else
    #     session["devise.google_data"] = request.env["omniauth.auth"]except(:extra) #Removing extra as it can overflow some session stores
    #     redirect_to new_user_registration_url, alert: @usererrorsfull_messages.join("\n")
    #   end
    #   # raise request.env["omniauth.auth"].to_yaml
    # end
    def all
      user = User.from_omniauth(request.env["omniauth.auth"])
      if user.persisted?
        sign_in_and_redirect user, notice: "Signed in!"
      else
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
    end
    alias_method :google_oauth2, :all
end
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # skip_before_filter :verify_authenticity_token  
    # before_action :set_locale
    # helper_method :current_user
    
    # def current_user
    #   if session[:user_id]
    #     @current_user  = User.find(session[:user_id])
    #   end
    # end

    def log_in(user)
      session[:user_id] = user.id
      @current_user = user
      redirect_to root_path
    end

    def logged_in?
      !current_user.nil?
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [
                                                        :first_name, :campaign_name, :description, 
                                                        :second_name, :email, :password,
                                                        :nip, :country, :town, :zip_code,
                                                        :first_adress_line, :second_adress_line,
                                                        :contact_phone_number, :short_description,
                                                        :area_code, :logo, :paid
                                                    ])
        devise_parameter_sanitizer.permit(:account_update, keys: [
                                                                :first_name, :second_name, :name, :description, 
                                                                :email, :password, :current_password, :image_url,
                                                                :paid
                                                            ])
        
    end

    protect_from_forgery with: :exception

    before_action :current_cart

    private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
end

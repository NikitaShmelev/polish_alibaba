class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # skip_before_filter :verify_authenticity_token  
    # before_action :set_locale
    
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
                                                                :email, :password, :current_password, :images,
                                                                :paid
                                                            ])
        
    end

    # private

    # def set_locale
    #     I18n.locale = params[:locale] || I18n.default_locale
    # end

    # def default_url_options(options={})
    #     { locale: I18n.locale }.merge options
    # end
end

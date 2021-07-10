class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!
  before_action :set_locale
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
  #end of pun
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fname, :lname, :user_native_lang, :user_second_lang, :city, :town, :user_phone, :user_kakao_id, :user_nation, :address, :email, :gender, :instructor_reg, :edu, :aboutme, :subjectmajor, :edulevel, :color, :password, :photo, :photo_cache])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fname, :lname, :user_native_lang, :user_second_lang, :city, :town, :user_phone, :user_kakao_id, :user_nation, :address, :email, :gender, :instructor_reg, :edu, :aboutme, :subjectmajor, :edulevel, :color, :password, :photo, :photo_cache])
  end

  # define default URL option method
  # this will include the locale param into every link generated with rails helpers
  def default_url_options
    {locale: I18n.locale}
  end
  # call and set local using extract local method or use default language & locale
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
  def extract_locale
    parsed_locale = params[:locale]
    # check to make sure the parse_locale is supported or not
    I18n.available_locales.map(&:to_s).include?(parsed_locale)?
    parsed_locale.to_sym : nil
  end
end

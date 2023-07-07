class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_latest_today_word
  before_action :store_user_location!, if: :storable_location?

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_path
    else
      stored_location = stored_location_for(:user)

      if stored_location.present?
        stored_location
      else
        user_path(current_user)
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end

  def set_latest_today_word
    @latest_today_word = TodayWord.where(is_active: true).last
  end
end
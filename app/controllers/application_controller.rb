class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #deviseのパラメーター
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :birthday, :age, :prefecture_id, :gender_id, %i(image)])
  end
end

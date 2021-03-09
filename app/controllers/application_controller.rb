class ApplicationController < ActionController::Base
  # ↓これ不要かも。deviseコントローラーは作成不要とのことだから。
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :encrypted_password, :first_name_kanji, :first_name_kana, :last_name_kanji, :last_name_kana, :birthday])
  end
end

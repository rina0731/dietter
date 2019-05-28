class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
      users_top_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
      dietter_path # ログアウト後に遷移するpathを設定
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :height, :latest_weight, :ideal_weight, :age, :email, :password, :password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :height, :latest_weight, :ideal_weight, :age, :email, :password, :password_confirmation ])
  end
end

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, only: [:create, :update, :new]

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Você precisa estar logado para acessar essa página."
    end
  end
end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_user

  def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      # need to set cart.user_id = session[:user_id]
      session[:cart_id] = cart.id
      cart
    end
  end

  private
  def fetch_user
   @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
   session[:user_id] = nil unless @current_user.present?
  end

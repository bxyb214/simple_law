class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :resource, :resource_name, :devise_mapping
  helper_method :current_order
  helper_method :product_categories, :knowledge_categories, :child_categories



  def product_categories
    Category.where(parent_id: [0], typeof:[2])
  end

  def knowledge_categories
    Category.where(parent_id: [0], typeof:[1])
  end

  def child_categories(parent_id)
    Category.where(parent_id: [parent_id])
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end


end

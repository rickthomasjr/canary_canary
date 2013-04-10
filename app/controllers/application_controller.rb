class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_categories

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def load_categories
    @categories = Category.all
  end

end

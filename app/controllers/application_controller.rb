class ApplicationController < ActionController::Base
  protect_from_forgery
   
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access denied !"
    redirect_to root_url    
  end
end

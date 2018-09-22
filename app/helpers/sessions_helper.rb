module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_production
    if params[:id].present?
    @current_production ||= Production.find_by(id: params[:id])
    end
    
  end

  def logged_in?
    !!current_user
  end
end

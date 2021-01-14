class ApplicationController < ActionController::Base

  helper_method :current_author
  helper_method :logged_in?

  def current_author
    Author.find_by(id: session[:author_id])
  end

  def logged_in?
    redirect_to login_url, alert: "Not authorized" if current_author.nil?
  end
end

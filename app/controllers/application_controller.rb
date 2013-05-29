class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
    render :template => 'error_pages/404', :status => :not_found
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |login, password|
      if login == CONFIG['login'] and password == CONFIG['password']
        session[:admin] = true
        true
      end
    end
  end
end
class ApplicationController < ActionController::Base
  before_action :authorize

  private
  def get_time
    @time = Time.now
  end
  
  def initialize_visit_counter
    session[:visit_counter] ||= 0
  end

  def increment_visit_counter
    session[:visit_counter] += 1
    @visit_count =  session[:visit_counter]
  end

  protected
  
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end

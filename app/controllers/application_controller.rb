class ApplicationController < ActionController::Base

  private
  
  def initialize_visit_counter
    session[:visit_counter] ||= 0
  end

  def increment_visit_counter
    session[:visit_counter] += 1
    @visit_count =  session[:visit_counter]
  end
end

class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_i18n_locale_from_params

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

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not avaiable yet"
        logger.error flash.now[:notice]
      end
    end
  end
end

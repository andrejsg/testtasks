#encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

# Catch ActionController::RoutingError
  rescue_from ActionController::RoutingError, with: :render_routing_error

  def render_routing_error
	    message = "Routing Error."
	    logger.error message
	    if signed_in?
	      redirect_to static_pages_index_path
	    else
	      redirect_to login_path
	    end
	    flash[:danger] = message
	end

# Catch ActiveRecord::RecordNotFound
	rescue_from ActiveRecord::RecordNotFound do |exception|
	  message = "Record Not Found."
	  logger.error message
	  if signed_in?
	    redirect_to static_pages_index_path
	  else
	    redirect_to login_path
	  end
	  flash[:danger] = message
	end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  include SessionsHelper

  def handle_unverified_request
  	sign_out
  	super # SUPER!!!
  end
end

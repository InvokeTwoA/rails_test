class ApplicationController < ActionController::Base
	helper :all
  protect_from_forgery

def local_request?
    false
		end

end

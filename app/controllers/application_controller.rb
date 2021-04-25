class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include CurrentUserConcern
	include PageContent

end

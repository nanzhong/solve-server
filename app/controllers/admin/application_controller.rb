module Admin
  class ApplicationController < ::ApplicationController
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :require_login
    before_action :require_admin

    layout 'application'

    private
    def require_admin
      if current_user.username != 'nan'
        flash[:error] = "You are not an admin, and do not have access to this"
        redirect_to problems_path
      end
    end
  end
end

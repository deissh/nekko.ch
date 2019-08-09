class ApplicationController < ActionController::Base
  def authorize_admin
    return unless !current_user.role == 'admin'
    redirect_to root_path, alert: 'Admins only!'
  end
end

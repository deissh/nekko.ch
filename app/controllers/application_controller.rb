class ApplicationController < ActionController::Base
  def authorize_admin
    if current_user.role == 'admin'
      return
    end
    redirect_to root_path, alert: 'Admins only!'
  end
end

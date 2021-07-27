class ApplicationController < ActionController::Base
        
    def before_sign_in_path_for(resource)
        login_path
    end

    def after_sign_in_path_for(resource)
        if (current_user.role == 'admin')
            root_path
        else
            edit_user_path(current_user)
        end
    end

    def after_sign_out_path_for(resource)
        login_path
    end
    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        redirect_to root_url
    end
end

class DeviseInvitable::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
  protected

    def build_resource(hash = {})
      if hash[:email]
        self.resource = resource_class.where(email: hash[:email]).first
        if self.resource && self.resource.respond_to?(:invited_to_sign_up?) && self.resource.invited_to_sign_up?
          self.resource.attributes = hash
          self.resource.send_confirmation_instructions if self.resource.confirmation_required_for_invited?
          self.resource.accept_invitation
        else
          self.resource = nil
        end
      end
      self.resource ||= super
    end

    def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :role, :full_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:image ,:role , :full_name])
  end
end
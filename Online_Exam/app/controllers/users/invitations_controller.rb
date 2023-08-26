class Users::InvitationsController < Devise::InvitationsController
  include Pundit
  before_action :configure_permitted_parameters
  

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:email, :role])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
  end


    # This is called when creating invitation.
    # It should return an instance of resource class.
    def invite_resource
      byebug
      # skip sending emails on invite
      super
    end

    # This is called when accepting invitation.
    # It should return an instance of resource class.
    def accept_resource
      resource = resource_class.accept_invitation!(update_resource_params)
      # Report accepting invitation to analytics
      Analytics.report('invite.accept', resource.id)
      resource
    end

    def new
     byebug
    authorize current_user, :invite?
     user = User.invite!(invite_params) do |u|
     end
  
  end

  def create
    byebug
    authorize current_user, :invite?
     user = User.invite!(invite_params) do |u|
  end
  #  def new_invitation
  #   authorize current_user, :invite? # Assuming you're using Pundit for authorization
  #   @user = User.new
  # end

   def invite_params

    params.require(:user).permit(:email, :full_name , :image) # Make sure to include all the attributes needed
  end
end

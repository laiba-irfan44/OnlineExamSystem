class UsersController < ApplicationController

def create
  @user.image.attach(params[:user][:image])
end

def user_params

  params.require(:user).permit(:email, :password, :password_confirmation, :role , :request_sent, :total_score, :image, :full_name , :exam_taken)
end

end

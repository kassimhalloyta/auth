class PasswordResetsController < ApplicationController
 def create
  @user = User.find_by_email(params[:email])
  if @user
  @user.send_password_reset
  
  redirect_to root_url, :notice => "Email sent with password reset instructions.
   From now ...You have 1 hour to reset password "
 else 
  redirect_to root_url, :notice => "Unknown user email.."
 end
end
def edit 
  @user = User.find_by_password_reset_token!(params[:id])
end


def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to publishers_path, :alert => "Password reset has expired."
  elsif @user.update_attributes(params[:user])
    redirect_to publishers_path, :notice => "Password has been reset!"
  else
    render :edit
  end
end

end

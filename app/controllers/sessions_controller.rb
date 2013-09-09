class SessionsController < ApplicationController
  
def create
user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    cookies.signed[:secure_user_id] = {secure: true, value: "secure#{user.id}"}
   redirect_to publishers_path , :notice => "logged in #{current_user.username} "
  else
    flash.now.alert = "Invalid email or password"
    render "new"

  end
end

def destroy
  session[:user_id] = nil
  cookies.delete(:secure_user_id)
  redirect_to publishers_path , :notice => 'logged out '
end
end

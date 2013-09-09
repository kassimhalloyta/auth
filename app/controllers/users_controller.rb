class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @publishers = Publisher.where('user_id' => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  def edit
    a = User.find(params[:id])
     if  current_user.id == 1 || a.id ==  current_user.id
      
    @user = User.find(params[:id])
  else
   respond_to do |format|
      format.html { redirect_to publishers_path, notice: 'u dont have right to edit ! ' }
    end
end
  
  
  end
  def new
  @user = User.new
  end

  

 def create
  @user = User.new(params[:user])
  if @user.save
  	

    redirect_to log_in_path, :notice => "Unkaq ...your account is created successfully !!!"
  else
    render "new"
  end
end
def update
    @user = User.find(params[:id])
    respond_to do |format|
    
      if @user.update_attributes(params[:user])

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
      
    
  


end
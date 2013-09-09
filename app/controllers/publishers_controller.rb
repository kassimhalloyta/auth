class PublishersController < ApplicationController
  # GET /publishers
  # GET /publishers.json

  def index
    if params[:id] != nil
      # @publisher=Publisher.find(params[:id])
     @publishers =Publisher.order('id DESC').includes(:user)
   else
   @publishers =Publisher.order('id DESC').includes(:user) 
   end
   
   respond_to do |format|
      format.html # index.html.erb 
        format.js {render :layout => false}  
      format.json { render :json => @publishers }
    end   
  end

  def show 
  
   @publisher=Publisher.find(params[:id])
   @publishers = Publisher.order('id DESC').includes(:user) 
    
    respond_to do |format|
      format.html # show.html.erb
      format.js 
      format.json { render :json => @publishers }
    end
  end

  # GET /publishers/new
  # GET /publishers/new.json
  def new
    if current_user
    @publisher = Publisher.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @publisher }
      end
  else 
     redirect_to publishers_path , :notice => 'Maley isi asigile kalah ..tu qultam maduda !!! '
    end
    
  end

  # GET /publishers/1/edit
  
    def edit
    
    usr_id =Publisher.getPublishersUserId(params[:id])
    if current_user.id == 1 || usr_id == current_user.id
    @publisher = Publisher.find(params[:id])
    else
   
   respond_to do |format|
      format.html { redirect_to publishers_path, notice: 'u dont have right to edit ! ' }
    end
  end
end
    
  
  # POST /publishers
  # POST /publishers.json
  def create
    
    @publisher = Publisher.new(params[:publisher])
     
    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, :notice => "Gadda gey #{current_user.username } ... gad qulluumeh away "}

        format.json { render :json => @publisher, :status => created, :location => @publisher }
      else
        format.html { render :action => "new" }
        format.json { render :json => @publisher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publishers/1
  # PUT /publishers/1.json
  def update
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])

        format.html { redirect_to @publisher, :notice => 'Publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @publisher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end
end

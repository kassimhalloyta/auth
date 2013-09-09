class AnnouncementsController < ApplicationController
  def new
  	@announcement = Announcement.new
  end
  
  def create
  @announcement = Announcement.new(params[:announcement])
  if @announcement.save
    redirect_to root_path, :notice => "announcement is successfully created !!!"
  else
    render :new
  end
  end

end

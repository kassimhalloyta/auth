class Announcement < ActiveRecord::Base
attr_accessible :body
  validates_presence_of :body
  
  def self.newest
	Announcement.last
  end
  
  def self.newest_private
    Announcement.where("2").order("id desc").first
  end

  def self.newest_public
    Announcement.where("type = 'public'").order("id desc").first
  end
  
end

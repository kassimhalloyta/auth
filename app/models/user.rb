class User < ActiveRecord::Base
  has_many :publishers 
  attr_accessible :email, :password, :password_confirmation , :username, :publishers_count
  before_save :encrypt_password
  #before_create { generate_token(:auth_token) }
  attr_accessor :password , :password_confirmation
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
  :on => :create , :message => ' %{value} is invalid please try again'  }
  
  validates_presence_of :password, :on => :create ,:message => ' : foxo kibaanam Faxximta !'
  validates_presence_of :email , :on => :create , :message => ' : foxo kibaanam Faxximta !'
  validates_uniqueness_of :email ,:on => :create , :message => ' : %{value}  dumaak yanih ..Geeri email aktub'
  validates_uniqueness_of :username ,:on => :create  , :message => ' : %{value} (username) migaq dumaak yanih ..Geeri migaq aktub'
  validates_length_of :password, :minimum => 6 ,:on => :create 
  validates_length_of :username, :minimum => 3, :maximum => 15 
 
  validates_confirmation_of :password , :if => :password_present?,:message => ' password itta maceela !'
   
   private
   def password_present?
     password.present?
   end
  def self.authenticate(email, password)
    user = find_by_email(email)    
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.base64.tr("+/", "-_")
  end while User.exists?(column => self[column])
end
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
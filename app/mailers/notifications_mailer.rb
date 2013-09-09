class NotificationsMailer < ActionMailer::Base
default :from => "admin@waanisa.com"

  
  default :to =>  "kassimhalloyta@hotmail.com"

  def new_message(message)
  	
    @message = message
    mail(:subject => "[Farmo waanisa.com] #{message.subject}")
  end

   
end
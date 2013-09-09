class Publisher < ActiveRecord::Base
belongs_to :user , :counter_cache => true
attr_accessible :content, :title,:id , :created_at, :user_id 
attr_accessible :audio
has_attached_file :audio,  
                  :url  => "/assets/publisher/:id/:style/:basename.:extension",
                  :paths => ":rails_root/public/assets/publisher/:id/:style/:basename.:extension"

validates_attachment_presence :audio , :message => ' : Gaday qultam faxxa dorritam faxximta !'
validates_length_of :title, :maximum => 25 , :minimium => 3 , :message => ' : Gaddi migaq  3 kee 20 letters bisso yakkem faxximta'
validates_length_of :content, :maximum => 25 , :minimium => 3 , :message => ' : Fanan migaq 3 kee 25 letters bisso yakkem faxximta'
validates_attachment_size :audio, :less_than => 15.megabytes 
validates_attachment_content_type :audio, :content_type => ['audio/mpeg', 'audio/mp3' ] , :message => ' : Gad  MP3  format  yanim faxximta !' 
validates_presence_of :title , :message => ' :  Gaddi migaq taktubem faxximta !'
validates_presence_of :content , :message => ' :  Gad abe migaq taktubem faxximta !'


def self.get_publishers_by_ids(selected_ids)
records = Publisher.where(:id => selected_ids) unless selected_ids.nil?

end	


end

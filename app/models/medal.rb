class Medal < ActiveRecord::Base

  has_attached_file :cover, :styles => { :large => "300x300!", :medium => "200x200!", :thumb => "100x100!" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  has_many :cards , :through => :card_medals

end

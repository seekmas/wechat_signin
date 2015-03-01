class Card < ActiveRecord::Base

  include ActiveUUID::UUID

  belongs_to :user, :foreign_key => :user_id

  has_many :comments

  has_many :card_medals
  has_many :medals , :through => :card_medals

end
class Comment < ActiveRecord::Base
  include ActiveUUID::UUID

  belongs_to :card
  belongs_to :user

end

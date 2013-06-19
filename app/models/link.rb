class Link < ActiveRecord::Base
  attr_accessible :description, :link, :song_id, :user_id

  belongs_to :user
  belongs_to :song

end

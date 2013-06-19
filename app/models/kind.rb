class Kind < ActiveRecord::Base
  attr_accessible :description, :user_id, :name
  has_many :songs

end

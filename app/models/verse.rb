# == Schema Information
#
# Table name: verses
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Verse < ActiveRecord::Base
  attr_accessible :song_id, :text, :user_id
  belongs_to :song
  belongs_to :user
end

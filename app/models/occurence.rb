# == Schema Information
#
# Table name: occurences
#
#  id         :integer          not null, primary key
#  region_id  :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Occurence < ActiveRecord::Base
  attr_accessible :region_id, :song_id

  belongs_to :song
  belongs_to :region

end

class Report < ActiveRecord::Base
  attr_accessible :description, :song_id, :report_type

  belongs_to :song
end

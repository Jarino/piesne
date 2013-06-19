# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :occurences
  has_many :songs, :through => :occurences


  include PgSearch

  pg_search_scope :search_by_name, :against => [:name]


  def self.get_kinds(id)
  	return "ahoj"
  end


end

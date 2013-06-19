# == Schema Information
#
# Table name: songs
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  title_norm      :string(255)
#  first_letter_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Song < ActiveRecord::Base
  attr_accessible :title, :title_norm, :first_letter_id, :verses_attributes, :regions_attributes, :kind_id, :user_id, :regions

  has_many :verses
  has_many :links
  has_many :reports
  accepts_nested_attributes_for :verses

  before_save :normalize_title  

  has_many :occurences
  has_many :regions, :through => :occurences
  accepts_nested_attributes_for :regions

  has_many :favourites
  has_many :users, :through => :favourites

  belongs_to :kind
  belongs_to :user

  include PgSearch

  pg_search_scope :search_by_title, :against => [:title_norm]

  private

  def normalize_title
    self.title_norm = self.title.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').gsub(/ /, '_').to_s.downcase 
  end
end

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

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

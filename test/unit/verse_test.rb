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

require 'test_helper'

class VerseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

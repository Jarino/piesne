# == Schema Information
#
# Table name: first_letters
#
#  id         :integer          not null, primary key
#  let        :string(255)
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FirstLetterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

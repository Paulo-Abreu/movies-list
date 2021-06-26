# == Schema Information
#
# Table name: people
#
#  id           :bigint           not null, primary key
#  adult        :boolean
#  name         :string
#  popularity   :integer
#  profile_path :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  external_id  :integer
#
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

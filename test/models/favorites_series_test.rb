# == Schema Information
#
# Table name: favorites_series
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  serie_id   :integer
#  user_id    :integer
#
require "test_helper"

class FavoritesSeriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

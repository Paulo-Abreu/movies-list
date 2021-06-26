# == Schema Information
#
# Table name: movies
#
#  id                :bigint           not null, primary key
#  adult             :boolean
#  genre_ids         :string
#  name              :string
#  original_language :string
#  original_title    :string
#  overview          :string
#  popularity        :integer
#  poster_path       :string
#  release_date      :string
#  title             :string
#  vote_average      :integer
#  vote_count        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  external_id       :integer
#  user_id           :integer
#
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

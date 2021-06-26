# == Schema Information
#
# Table name: series
#
#  id                :bigint           not null, primary key
#  first_air_date    :string
#  genre_ids         :string
#  name              :string
#  original_language :string
#  original_name     :string
#  overview          :string
#  popularity        :integer
#  poster_path       :string
#  vote_average      :integer
#  vote_count        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  external_id       :integer
#  user_id           :integer
#
class Serie < ApplicationRecord
    belongs_to :user, optional: true
end

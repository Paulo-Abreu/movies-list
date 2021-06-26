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
class Person < ApplicationRecord
    belongs_to :user
end

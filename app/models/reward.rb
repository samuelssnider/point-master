class Reward < ApplicationRecord
  belongs_to :user
  validates :title, :url, presence: true, uniqueness: true
end

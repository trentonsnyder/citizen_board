class Organization < ApplicationRecord
  has_many :users
  has_many :pools

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name,
    presence: true,
    uniqueness: true
  
end

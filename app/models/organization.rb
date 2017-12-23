class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :pools, dependent: :destroy
  has_many :tickets, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name,
    presence: true,
    uniqueness: true
  
end

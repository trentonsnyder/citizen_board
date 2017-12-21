class Pool < ApplicationRecord
  belongs_to :organization
  has_many :lanes
  has_many :tickets
end

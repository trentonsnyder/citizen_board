class Lane < ApplicationRecord
  belongs_to :pool
  has_many :tickets
end

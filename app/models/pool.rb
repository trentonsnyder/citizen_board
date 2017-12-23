class Pool < ApplicationRecord
  belongs_to :organization
  has_many :lanes, dependent: :destroy
  has_many :tickets, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: { scope: :organization, case_sensitive: false }

  after_create :generate_lane

  def generate_lane
    self.lanes.create(name: 'First')
  end
end

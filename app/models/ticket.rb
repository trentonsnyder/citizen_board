class Ticket < ApplicationRecord
  belongs_to :pool
  belongs_to :lane
  belongs_to :organization

  validates :public_label,
    presence: true,
    uniqueness: { scope: :organization }

  extend FriendlyId
  friendly_id :public_label, use: :slugged
  
  before_validation :generate_label, :on => :create, prepend: true
  
  def generate_label
    self.public_label = CouponCode.generate
  end
end

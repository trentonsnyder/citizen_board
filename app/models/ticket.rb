class Ticket < ApplicationRecord
  belongs_to :pool
  belongs_to :lane
  
  after_create :generate_label

  def generate_label
    self.update(public_label: CouponCode.generate)
  end
  
end

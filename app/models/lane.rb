class Lane < ApplicationRecord
  belongs_to :pool
  acts_as_list scope: :pool

  has_many :tickets, dependent: :destroy

  before_destroy :minimum_one_lane, prepend: true

  # make sure each pool has at least one lane
  def minimum_one_lane
    self.pool.lanes.count > 1 ? true : false
  end
end

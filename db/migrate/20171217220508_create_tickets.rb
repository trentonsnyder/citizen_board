class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :public_label
      t.string :nickname
      t.belongs_to :pool, index: true
      t.belongs_to :lane, index: true
    end
  end
end

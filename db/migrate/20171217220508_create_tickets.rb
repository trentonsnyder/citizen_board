class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :public_label
      t.string :nickname
      t.string :email, null: false, default: ""
      t.string :slug, null: false
      t.belongs_to :organization, index: true
      t.belongs_to :pool, index: true
      t.belongs_to :lane, index: true
    end
  end
end

class CreateLanes < ActiveRecord::Migration[5.1]
  def change
    create_table :lanes do |t|
      t.string :name
      t.integer :position
      t.belongs_to :pool, index: true
    end
  end
end

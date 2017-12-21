class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|
      t.string :name
      t.belongs_to :organization, index: true
    end
  end
end

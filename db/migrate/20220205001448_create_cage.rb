class CreateCage < ActiveRecord::Migration[5.2]
  def change
    create_table :cages do |t|
      t.string :title
      t.boolean :is_open
      t.integer :ferret_count
      t.integer :ferret_capacity

      t.timestamps
    end
  end
end

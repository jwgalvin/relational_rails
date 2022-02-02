class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :married
      t.integer :children
      
      t.timestamps
    end
  end
end

class CreateFerret < ActiveRecord::Migration[5.2]
  def change
    create_table :ferrets do |t|
      t.string :name
      t.boolean :is_clean
      t.integer :age

      t.timestamps
    end
  end
end

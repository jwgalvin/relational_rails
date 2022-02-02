class CreateCults < ActiveRecord::Migration[5.2]
  def change
    create_table :cults do |t|
      t.string :name
      t.integer :member_size
      t.boolean :open_enrollment
      
      t.timestamps
    end
  end
end

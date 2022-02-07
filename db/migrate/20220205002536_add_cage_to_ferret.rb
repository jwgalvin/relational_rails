class AddCageToFerret < ActiveRecord::Migration[5.2]
  def change
    add_reference :ferrets, :cage, foreign_key: true
  end
end

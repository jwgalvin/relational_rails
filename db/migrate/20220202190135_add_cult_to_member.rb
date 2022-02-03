class AddCultToMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :cult, foreign_key: true
  end
end

class AddMemberToCult < ActiveRecord::Migration[5.2]
  def change
    add_reference :cults, :member, foreign_key: true
  end
end

class AddPlacesToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :admin, null: false, foreign_key: true
  end
end

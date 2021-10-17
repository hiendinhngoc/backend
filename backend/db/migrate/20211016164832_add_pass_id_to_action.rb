class AddPassIdToAction < ActiveRecord::Migration[6.1]
  def change
    add_column :actions, :pass_id, :integer
  end
end

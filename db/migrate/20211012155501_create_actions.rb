class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.integer :liked_id
      t.integer :like_id
      t.integer :passed_id

      t.timestamps
    end

    add_index :actions, :liked_id
    add_index :actions, :like_id
    add_index :actions, [:liked_id, :like_id], unique: true
  end
end

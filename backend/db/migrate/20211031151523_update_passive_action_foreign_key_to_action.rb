class UpdatePassiveActionForeignKeyToAction < ActiveRecord::Migration[6.1]
  def up
    add_column :actions, :owner_id, :bigint 

    Action.where.not(like_id: nil).update_all('owner_id = like_id')
    Action.where.not(pass_id: nil).update_all('owner_id = pass_id')

    remove_index :actions, :like_id
    remove_index :actions, %i[liked_id like_id], unique: true

    remove_column :actions, :like_id
    remove_column :actions, :pass_id

    add_index :actions, :owner_id
    add_index :actions, %i[owner_id liked_id], unique: true  
  end

  def down
    remove_index :actions, %i[owner_id liked_id], unique: true
    remove_index :actions, :owner_id

    add_column :actions, :like_id, :integer
    add_column :actions, :pass_id, :integer

    add_index :actions, %i[liked_id like_id], unique: true
    add_index :actions, :like_id

    Action.where.not(passed_id: nil).update_all('pass_id = owner_id')
    Action.where.not(liked_id: nil).update_all('like_id = owner_id')

    remove_column :actions, :owner_id
  end
end

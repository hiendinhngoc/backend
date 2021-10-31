class UpdatePassiveActionForeignKeyToAction < ActiveRecord::Migration[6.1]
  def change
    add_column :actions, :owner_id, :bigint 

    Action.all.each do |action|
      if action.like_id.present?
        action.update owner_id: action.like_id
      elsif 
        action.update owner_id: action.pass_id
      end
    end

    remove_index :actions, :like_id
    remove_index :actions, %i[liked_id like_id], unique: true

    remove_column :actions, :like_id
    remove_column :actions, :pass_id

    add_index :actions, :owner_id
    add_index :actions, %i[owner_id liked_id], unique: true  
  end
end

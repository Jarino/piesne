class AddIndexOnUserId < ActiveRecord::Migration
  def up
  	add_index :verses, :user_id
  end

  def down
  	remove_index :verses, :user_id
  end
end

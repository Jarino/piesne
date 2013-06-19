class AddVerseIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verse_id, :integer
  end
end

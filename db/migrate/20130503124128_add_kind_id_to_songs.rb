class AddKindIdToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :kind_id, :integer
  end
end

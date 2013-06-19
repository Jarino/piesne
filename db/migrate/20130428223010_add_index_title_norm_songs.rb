class AddIndexTitleNormSongs < ActiveRecord::Migration
  def up
  	add_index :songs, :title
  end

  def down
  	remove_index :songs, :title
  end
end

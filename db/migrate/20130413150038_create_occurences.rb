class CreateOccurences < ActiveRecord::Migration
  def change
    create_table :occurences do |t|
      t.integer :region_id
      t.integer :song_id

      t.timestamps
    end
  end
end

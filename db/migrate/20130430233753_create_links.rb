class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.text :description
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end

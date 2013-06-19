class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :type
      t.text :description
      t.integer :song_id

      t.timestamps
    end
  end
end

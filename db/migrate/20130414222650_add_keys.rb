class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "favourites", "songs", :name => "favourites_song_id_fk"
    add_foreign_key "favourites", "users", :name => "favourites_user_id_fk"
    add_foreign_key "occurences", "regions", :name => "occurences_region_id_fk"
    add_foreign_key "occurences", "songs", :name => "occurences_song_id_fk"
    add_foreign_key "songs", "first_letters", :name => "songs_first_letter_id_fk"
    add_foreign_key "verses", "songs", :name => "verses_song_id_fk"
  end
end

class AddKeys2 < ActiveRecord::Migration
  def change
    add_foreign_key "links", "songs", :name => "links_song_id_fk"
    add_foreign_key "links", "users", :name => "links_user_id_fk"
    add_foreign_key "songs", "kinds", :name => "songs_kind_id_fk"
    add_foreign_key "songs", "users", :name => "songs_user_id_fk"
    add_foreign_key "verses", "users", :name => "verses_user_id_fk"
  end
end

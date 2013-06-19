class AddCoordsToRegions < ActiveRecord::Migration
  def change
  	add_column :regions, :coords, :text
  end
end

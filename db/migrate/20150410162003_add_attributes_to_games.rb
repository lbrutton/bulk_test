class AddAttributesToGames < ActiveRecord::Migration
  def change
  	add_column :games, :icon, :string
  	add_column :games, :description, :string
  	add_column :games, :click_url, :string
  end
end

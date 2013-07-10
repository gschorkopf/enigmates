class AddColumnImageUrlToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :image_url, :string
  end
end

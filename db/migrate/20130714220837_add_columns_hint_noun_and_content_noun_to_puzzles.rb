class AddColumnsHintNounAndContentNounToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :hint_noun, :string
    add_column :puzzles, :content_noun, :string
  end
end

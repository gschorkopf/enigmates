class AddColumnPuzzleIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :puzzle_id, :integer
  end
end

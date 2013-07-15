class AddColumnSummaryToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :summary, :text
  end
end

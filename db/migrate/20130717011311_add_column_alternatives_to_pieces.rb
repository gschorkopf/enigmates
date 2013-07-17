class AddColumnAlternativesToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :alternatives, :string
  end
end

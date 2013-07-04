class RenameColumnTypeToFormat < ActiveRecord::Migration
  def change
    rename_column :puzzles, :type, :format
  end
end

class AddColumnHintToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :hint, :string
  end
end

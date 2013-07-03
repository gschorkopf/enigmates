class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :content

      t.timestamps
    end
  end
end

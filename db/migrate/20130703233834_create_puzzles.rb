class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :name
      t.string :topic
      t.string :type

      t.timestamps
    end
  end
end

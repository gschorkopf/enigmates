class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :piece_id
      t.integer :attempt_id
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end

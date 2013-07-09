class Guess < ActiveRecord::Base
  attr_accessible :attempt_id, :correct, :piece_id, :user_id
  belongs_to :attempt
  belongs_to :piece
  belongs_to :user
  
end

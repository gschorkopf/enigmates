class Invite < ActiveRecord::Base
  attr_accessible :puzzle_id, :attempt_id, :sender_id, :receiver_id

  belongs_to :puzzle
  belongs_to :attempt 
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  def message(verb)
    "#{sender} has #{verb} you to attempt <a href='/puzzles/#{puzzle_id}/attempts/#{attempt_id}'>#{puzzle}</a>"
  end
end

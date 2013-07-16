class Attempt < ActiveRecord::Base
  attr_accessible :mode

  has_many :guesses
  has_many :attempt_users
  has_many :users, through: :attempt_users
  belongs_to :puzzle

  def piece_solved?(piece_id)
    guesses.map(&:piece_id).include?(piece_id)
  end

  def piece_solved_by_player?(piece_id, user_id)
    guesses = Guess.where(piece_id: piece_id, user_id: user_id)
    !guesses.empty?
  end

  def within_player_limit?
    users.count <= 3
  end

  def add_player(user_id)
    attempt_users.create(
      attempt_id: id,
      user_id: user_id )
  end

  def has_player?(user_id)
    attempt_users.map(&:user_id).include?(user_id)
  end

  def team_score
    guesses.count
  end

  def player_score(user_id)
    guesses.where(user_id: user_id).count
  end

  def correct_guesses
    pieces = guesses.where(correct: true).map(&:piece)
    pieces.map{|p| p.content.gsub(" ", "")}
  end
end

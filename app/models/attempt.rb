class Attempt < ActiveRecord::Base
  has_many :guesses
  belongs_to :puzzle
end

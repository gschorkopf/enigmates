class Puzzle < ActiveRecord::Base
  attr_accessible :name, :topic, :format
  has_many :pieces
  has_many :attempts

  def contents
    pieces.map(&:content)
  end
end

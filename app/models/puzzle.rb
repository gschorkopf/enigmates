 class Puzzle < ActiveRecord::Base
  attr_accessible :name, :topic, :format, :image_url
  has_many :pieces
  has_many :attempts

  def to_s
    name
  end

  def contents
    pieces.map(&:content)
  end
end

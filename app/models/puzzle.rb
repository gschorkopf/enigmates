 class Puzzle < ActiveRecord::Base
  attr_accessible :name, :topic, :format, :image_url, :content_noun, :hint_noun
  has_many :pieces
  has_many :attempts

  def to_s
    name
  end

  def contents
    pieces.map(&:content)
  end

  def total
    pieces.count
  end
end

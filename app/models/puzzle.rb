class Puzzle < ActiveRecord::Base
  attr_accessible :name, :topic, :type
  has_many :pieces
end

class Node
  attr_reader :title, :score, :stored
  attr_accessor :left_node, :right_node

  def initialize(score, title)
    @title = title
    @score = score
    @left_node = nil
    @right_node = nil
    @stored = false
  end

  def stored?
    @stored
  end

  def store
    @stored = true
  end
end

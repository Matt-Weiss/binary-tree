class BinaryTree
attr_reader :root

  def initialize
    @root = nil
  end


  def insert(score, title)
    depth = 0
    new_node = Node.new(score, title)
    current_node = @root
    until new_node.stored?
      if @root == nil
        @root = new_node
        new_node.store
        return depth
      elsif current_node == nil
        current_node = new_node
        new_node.store
        return depth
      elsif (new_node.score < current_node.score) && (current_node.left_node == nil)
        current_node.left_node = new_node
        new_node.store
        return depth
      elsif (new_node.score > current_node.score) && (current_node.right_node == nil)
        current_node.right_node = new_node
        new_node.store
        return depth
      elsif new_node.score < current_node.score
        current_node = current_node.left_node
        depth += 1
      else new_node.score > current_node.score
        current_node = current_node.right_node
        depth += 1
      end
    end
  end

  def include?(score)
    current_node = @root
    until current_node == nil
      # binding.pry
      if current_node.score == score
        return true
      elsif score < current_node.score
        current_node = current_node.left_node
      else
        current_node = current_node.right_node
      end
      false
    end
  end

  def depth_of(score)
    depth = 0
    current_node = @root
    until current_node.score == score
      if score < current_node.score
        current_node = current_node.left_node
        depth += 1
      else
        current_node = current_node.right_node
        depth +=1
      end
    end
    depth
  end

  def max
    current_node = @root
    until current_node.right_node == nil
      current_node = current_node.right_node
    end
    {current_node.title=>current_node.score}
  end

  def min
    current_node = @root
    until current_node.left_node == nil
      current_node = current_node.left_node
    end
    {current_node.title=>current_node.score}
  end
end

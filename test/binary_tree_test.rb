require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/binary_tree'
require 'pry'

class BinaryTreeTest < Minitest::Test

  def test_it_has_root
    tree = BinaryTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal tree.root.score, 61
  end

  def test_can_add_multiple_nodes
    tree = BinaryTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.root.left_node.score, 16
    assert_equal tree.root.right_node.score, 92
    assert_equal tree.root.left_node.right_node.score, 50
  end

  def test_can_check_for_inclusion
    tree = BinaryTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(91)
  end

  def test_can_check_for_depth_of_score
    tree = BinaryTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal tree.depth_of(92), 1
    assert_equal tree.depth_of(50), 2
  end

  def test_can_check_for_max_and_min_score
    tree = BinaryTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal tree.max, {"Sharknado 3"=>92}
    assert_equal tree.min, {"Johnny English"=>16}
  end
end

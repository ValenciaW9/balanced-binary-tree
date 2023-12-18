class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root, :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(value)
    if @root == nil
      @root = TreeNode.new(value)
    else
      curr_node = @root
      previous_node = @root

      while curr_node != nil
        previous_node = curr_node

        if value < curr_node.value
          curr_node = curr_node.left
        else
          curr_node = curr_node.right
        end
      end

      if value < previous_node.value
        previous_node.left = TreeNode.new(value)
      else
        previous_node.right = TreeNode.new(value)
      end
    end

    @size += 1
  end

  def find_max(node = @root)
    if node == nil
      return nil
    elsif node.right == nil
      return node
    end

    return find_max(node.right)
  end

  def find_min(node = @root)
    if node == nil
      return nil
    elsif node.left == nil
      return node
    end

    return find_min(node.left)
  end

  def contains?(value, node = @root)
    if node == nil
      return false
    elsif value < node.value
      return contains?(value, node.left)
    elsif value > node.value
      return contains?(value, node.right)
    else
      return true
    end
  end

  def print_in_order(node = @root)
    if node != nil
      print "("
      print_in_order(node.left)
      print "#{node.value}, "
      print_in_order(node.right)
      print ")"
    end
  end

  def size
    @size
  end
end

# Add tests if you need them


class TestBinarySearchTree < Minitest::Test
  def setup
    @bst = BinarySearchTree.new
  end

  def test_insert
    @bst.insert(5)
    assert_equal 1, @bst.size

    @bst.insert(3)
    @bst.insert(7)
    assert_equal 3, @bst.size

    @bst.insert(2)
    @bst.insert(4)
    @bst.insert(6)
    @bst.insert(8)
    assert_equal 7, @bst.size
  end

  def test_find_max
    @bst.insert(5)
    @bst.insert(3)
    @bst.insert(7)

    assert_equal 7, @bst.find_max.value
  end

  def test_find_min
    @bst.insert(5)
    @bst.insert(3)
    @bst.insert(7)

    assert_equal 3, @bst.find_min.value
  end

  def test_contains
    @bst.insert(5)
    @bst.insert(3)
    @bst.insert(7)

    assert_equal true, @bst.contains?(5)
    assert_equal true, @bst.contains?(3)
    assert_equal true, @bst.contains?(7)
    assert_equal false, @bst.contains?(8)
  end

  def test_print_in_order
    @bst.insert(5)
    @bst.insert(3)
    @bst.insert(7)
    @bst.insert(2)
    @bst.insert(4)
    @bst.insert(6)
    @bst.insert(8)

    assert_output("(2, 3, 4, 5, 6, 7, 8)") { @bst.print_in_order }
  end
end

if __FILE__ == $PROGRAM_NAME
  Minitest.run
end
#{#{pseudocode:  # A test case for the `print_in_order` method of the BST class.
  #
  # This test case verifies that the elements of the BST are printed in
  # ascending order when the `print_in_order` method is called.
  #
  # Example:
  #
  #   bst = BST.new
  #   bst.insert(5)
  #   bst.insert(3)
  #   bst.insert(7)
  #   bst.insert(2)
  #   bst.insert(4)
  #   bst.insert(6)
  #   bst.insert(8)
  #   assert_output("(2, 3, 4, 5, 6, 7, 8)") { bst.print_in_order }
  #
  # Returns:
  #
  #   - None
  #
  # Side Effects:
  #
  #   - Inserts elements into the BST.}}


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

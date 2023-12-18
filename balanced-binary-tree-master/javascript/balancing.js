import { bstToArray, isBalanced } from "./validation_methods";
import { threeToTwenty, tenToTwoHundred } from "./solutions/balancing";

function Node(value, left = null, right = null) {
  this.value = value;
  this.left = left;
  this.right = right;
}

class Node {
  constructor(value, left = null, right = null) {
    this.value = value;
    this.left = left;
    this.right = right;
  }
}

function buildBalancedBST(list) {
  // Base case: When the list is empty, return null 
  if (list.length === 0) {
    return null;
  }

  // Find the middle index of the list
  const middleIndex = Math.floor(list.length / 2);

  // Create the root node with the value at the middle index
  const root = new Node(list[middleIndex]);

  // Recursively build the left subtree using the left half of the list
  const leftSubtree = buildBalancedBST(list.slice(0, middleIndex));

  // Recursively build the right subtree using the right half of the list
  const rightSubtree = buildBalancedBST(list.slice(middleIndex + 1));

  // Set the left and right subtrees as the children of the root node
  root.left = leftSubtree;
  root.right = rightSubtree;

  return root;
}

// Test the function with an example list 
const list = [1, 2, 3];
const root = buildBalancedBST(list);
console.log(root);

// list = [3, 5, 6, 9, 10, 20]
function threeToTwenty() {

}

// list = [10, 11, 30, 100, 200]
function tenToTwoHundred() {
  let left = new Node(10);
  let right = new Node(11);
  left.right = new Node(30);
  right.right = new Node(100);
  right.left = new Node(200);
  return new Node(20, left, right);
}

if (require.main === module) {
  // add tests in here if you need them
}

module.exports = {
  Node,
  threeToTwenty,
  tenToTwoHundred
};

// Please add your pseudocode to this file// And a written explanation of your solution
//This code defines a constructor function called Node in JavaScript. It takes three parameters: value, left, and right. The function creates an object with three properties: value which stores the value passed as the first parameter, left which stores the value passed as the second parameter (defaulting to null if not provided), and right which stores the value passed as the third parameter (also defaulting to null if not provided).


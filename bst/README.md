1. The problem will be solved when the binary search tree can upload numbers
and effectively perform a series of functions on them which are represented in
the specs
2. This can be used in the program itself and via uploading csv files to the
program
3. Minimum use case is an empty BST which will have nil in it
4. Minimum work case is a BST with 3 values a root and two leaves

How will it work?
------------
A BST is similar to a linked list. Using recursion to move through each node will
be ideal. This is different then a linked list due to the ordering that is done
within a BST. When traversing the tree the algorithm must check between left and
right. Left being less than and right being greater than. The root of the BST is
the first number inserted into the tree.

When appending another number to a tree. The pseudo code will be like this:

if data < node
   leftleaf == nil ? leftleaf = create node : append(leftleaf)
if data > node
  " "
end

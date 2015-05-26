
# class to define the structure of the BST node
class Node
	attr_accessor :left,:right,:value

	def initialize(v)
		@value = v
	end

end

#gloabl root of the tree
@root = nil

# function name : findParent
# arguments : object of class Node, integer x
# functionality : A function to find and return the (possible) parent of a
# 								value in the BST 
def findParent(node,x)

	if node == nil
		puts "Tree is empty"
		return nil
	end

	# given value x is greater and hence on right of node
	if node.value < x
		if node.right == nil || node.right.value == x
			return node
		end
		findParent(node.right,x)

	# given value x is lesser and hence on left of node
	elsif node.value > x
		if node.left == nil || node.left.value == x
			return node
		end
		findParent(node.left,x)

	# given value x is equal to node
	else
		return node
	end

end

# function name : insert
# arguments : an object of Node class, integer
# functionality : First find the possible parent for the new
#									value. Based on value and parent value insert
#									in right or left

def insert(node,x)
	new_node = Node.new(x)
	new_node.left = nil
	new_node.right = nil

	if node == nil
		@root = new_node
	else
		temp = findParent(node,x)

		# greater than parent => right side
		if temp.value < x
			if temp.right != nil
				puts "Duplicate insertion not allowed in BST"
			else
				temp.right = new_node
			end
		# lesser than parent => left side
		elsif temp.value > x
			if temp.left != nil
				puts "Duplicate insertion not allowed in BST"
			else
				temp.left = new_node
			end
		else
			puts "Duplicate insertion not allowed in BST"
		end

	end #end of outer if

end


# function name : display
# arguments : an object of Node class
# functionality : A display of the BST
def display(node)

	if node != nil
		print node.value.to_s + " has \n"
		if node.left != nil
			puts "Left child: "+node.left.value.to_s
		else
			puts "Left child: nil"
		end
		if node.right != nil
			puts "Right child: "+node.right.value.to_s
		else
			puts "Right child: nil"
		end
		print "\n"

		display(node.left)
		display(node.right)
	end

end


a = [42,2,13,6,44,-67,98,43]

for i in a
	insert(@root,i)
end

display(@root)
print "\n"


# 					42
# 			2				    44
#  -67		 13		43			98
#				 6 	
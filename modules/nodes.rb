class Node

	attr_reader 	:namespace
	attr_reader 	:identifier
	attr_reader 	:attribute_prefix
	attr_reader 	:attributes
	attr_accessor 	:nodes
	
	def initialize(namespace, identifier, attribute_prefix, attributes = nil)
		@namespace = namespace
		@identifier = identifier
		@attribute_prefix = attribute_prefix
		@attributes = attributes
		@nodes = []
	end
	
	def add(node)
		@nodes.push(node)
	end
	
end

class Attribute

	attr_reader 	:identifier
	attr_reader 	:value
	
	def initialize(identifier, value)
		@identifier = identifier
		@value = value
	end
	
end
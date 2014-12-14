class Element

	attr_reader 	:namespace
	attr_reader 	:identifier
	attr_reader 	:attribute_prefix
	attr_reader 	:attributes
	attr_accessor 	:elements
	attr_accessor	:data
	
	def initialize(namespace, identifier, attribute_prefix, attributes = nil)
		@namespace = namespace
		@identifier = identifier
		@attribute_prefix = attribute_prefix
		@attributes = attributes
		@elements = []
		@data = ""
	end
	
	def add(element)
		@elements.push(element)
	end
	
end

class Attribute

	attr_reader 	:identifier
	attr_reader 	:value
	attr_reader     :field
	
	def initialize(prefix, identifier, field)
		@prefix = prefix
		@identifier = identifier
		@field = field
	end
	
end
require_relative '../modules/symbols'
require_relative '../modules/element'

class XML_Parser
	
	def initialize
		@level = -1
		@current_line = 0
		@parents = []
	end
	
	################################################################################################
	# Returns object or objects
	################################################################################################
	# Returns the current line.
	def line
		return @file_data[@current_line]
	end
	
	################################################################################################
	# Returns logical boolean
	################################################################################################
	# Determines if the current line is the begining of a comment
	def comment_begins?
		return line.includes?(Syms.get_op(:COMO))
	end
	# Determines if the current line is the end of a comment
	def comment_finished?
		return line.includes?(Syms.get_op(:COMC))
	end
	# Determines if the current line is the openning of an element
	def openning_element?

	end
	# Determines if the current line is the closing of an element
	def closing_element?
	end
	# Does the element header contain attributes
	def attributes_exist?
	end
	# Does the next line contain a child, or a same level element
	def children_exist?
	end
	
	################################################################################################
	# Function/Mutation mixes
	################################################################################################
	def get_xml_header
	end
	def get_namespace
		if !line.includes?(":")
			return "" 
		end
		for i in 0...line.size
			if i 
		end
	end
	
	def down_line
		@current_line += 1
	end
	
	def up_line
		@current_line -= 1
	end
	
	################################################################################################
	# External calls
	################################################################################################
	#todo Check|Register for ? point for named xml document type.
	#todo Check|Register for version.
	#todo Check|Register for document UTF type.
		
	def parse
		#todo Check|Split for comment.
		if comment_begins?
			until comment_ends?
				down_line
			end
		end
		
		# increment level of recursion for debugging
		@level += 1
		
		#todo check for openning identifier
		if openning_element?
			# Gets the namespace, if one exists.
			tmp_namespace = get_namespace
			
			#todo Check|Register identifier prefix.
			tmp_identifier = get_identifier
			
			# creates attribute list for this level of the stack.
			attributes = []
			while attributes_exist?
				#todo Check|Register attribute prefix.
				attribute_prefix = get_attribute_prefix
				
				#todo Check|Register attribute identifier.
				attribute_identifier = get_attribute_identifier
				
				#todo Check|Register attribute field.
				attribute_field = get_attribute_field
				
				attributes.push Attribute.new(attribute_prefix, attribute_identifier, attribute_field)
			end
			element = Element.new(tmp_namespace, tmp_identifier, attributes)
			if children_exist?
				# Find the openning of a element.
				while children_exist?
					element.add(parse)
				end
				return element
			end
			
			#todo add element data
			element.data = get_element_data
			return element
		#todo check for closing identifier
		elsif closing_element?
		
		end
		
	end
	
	def open(file_location)
		@path = file_location
		begin
			p "Opening: #{@path}"
			@file_data = IO.readlines(@path)
			@file_data = @file_data.split!('\n')
		rescue
			p "Uncaught error: #{@path}"
		end
	end

end

$marker = XML_Parser.new
$marker.open("../test/test.xml")
$marker.parse
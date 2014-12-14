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
		
	end
	# Determines if the current line is the end of a comment
	def comment_finished?
		
	end
	
	# Determines if the current line contains the openning of an element
	def element_header?
		
	end
	
	# Gets the amount of elements in a line.
	def element_count
		left_points = occurances("<")
		right_points = occurances(">")
		closures = occurances("/")
		return 0 if left_points == 0
		if left_points == right_points
			if closures > 0
				
			end
		end
	end
	
	# Determines if the current line is the closing of an element
	def closing_element?
		
	end
	# Determines if the current line is a self contained element with attributes
	def inline_element?
		
	end
	# Does the element header contain attributes
	def attributes_exist?
	end
	# Does the next line contain a child
	def children_exist?
	end
	
	def line_has?(input_char, cline=line)
		return cline.include?(input_char)
	end
	
	def occurances(input,cline)
		occurance = 0
		return 0 if cline.nil? or input.nil?
		for c in cline.split("").each
			occurance += 1 if input == c
		end
		return occurance
	end
	
	def line_has_after?(position, input_char)
		for i in position+1...array.size
			return true if array[i] == input_char
		end
	end
	
	def enclosed?(cline)
		return occurances("<",cline) == occurances(">",cline) 
	end
	
	def inline?(cline)
		if cline[cline.size-1] != ">" and enclosed?(cline) and line_has?(">",cline)
			return true
		end
		return false
	end

	################################################################################################
	# Function/Mutation mixes
	################################################################################################
	def get_xml_header
		
	end
	def get_namespace
		
	end
	def get_identifier
		
	end
	def get_attribute_prefix(index)
		
	end
	def get_attribute_identifier(index)
		
	end
	def get_attribute_field(index)
		
	end
	
	def combine_down
		
	end
	
	def combine_up
	
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
	
	# Parses a complete element.
	def parse
		#todo Check|Split for comment.
		
		# increment level of recursion for debugging
		@level += 1
		
		#todo check for closing identifier
		while closing_element?
			down_line
		end
		
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
		
		#check for children of the element, then recursively create them.
		if children_exist?
			# Find the openning of a element.
			while children_exist?
				element.add(parse)
			end
		end
		#todo add element data
		element.data = get_element_data
		return element
	end
	
	def prepare_elements
		@file_data = @file_data.split("\n")
		# Iterates the list to perform pre parse functions.
		for index in 0...@file_data.size
			# Forces inline if attributes are indented.
			unless enclosed?(@file_data[index])
				if !@file_data[index+1].nil?
					@file_data[index] += " " + @file_data[index+1].strip 
					@file_data[index+1] = nil
				end
			end
		end
		@file_data.compact!
		@file_data.each { |line| p line; }
		p @file_data.size
	end
	
	def open(file_location)
		@path = file_location
		p "Opening: #{@path}"
		@file_data = File.open(@path).read
		prepare_elements
	end

end

$marker = XML_Parser.new
$marker.open("../test/test.xml")
#$marker.parse
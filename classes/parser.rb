require_relative '../modules/symbols'
require_relative '../modules/nodes'

class XML_Parser
	
	def initialize
		@level = -1
		@current_line = 0
		@parents = []
	end
	#todo Check|Register for ? point for named xml document type.
	#todo Check|Register for version.
	#todo Check|Register for document UTF type.
		
	def parse
		#todo Check|Split for comment.
		if line_is_comment?
			while line_is_comment?
				next_line
			end
			@comment_started = false
		end
		# increment level of recursion
		@level += 1
		
		# Gets the namespace, if one exists.
		tmp_namespace = get_namespace
		
		#todo Check|Register identifier prefix.
		identifier = get_identifier
		#todo Check|Register identifier name.
		identifier_name = get_identifier_name
		attributes = []
		while attributes_exist?
			#todo Check|Register attribute prefix.
			attribute_prefix = get_attribute_prefix
			#todo Check|Register attribute identifier.
			attribute_identifier = get_attribute_identifier
			@attributes.push 
		end

		# Find the openning of a node.
		node = Node.new
		while children_exist?
			node.add(parse)
		end
		return node
	end
	
	def line_is_comment?
		if @current_line.includes?("<!--")
			@comment_started = true
		elsif @current_line.inclued?("-->")
			@comment_started = false
		end
		return @comment_started
	end
	
	def get_xml_header
	end
	
	def get_table
	end
	
	def get_namespace
	end
	
	def next_line
		@current_line += 1
	end
	
	def back_line
		@current_line -= 1
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
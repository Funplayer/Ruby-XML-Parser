module Syms
	
	OPERATORS = {
		:LPNT => '<',
		:RPNT => '>',
		:CLOS => '/',
		:EQL  => '=',
		:QUOT => '"',
		:COMM => '!',
		:COLN => ':',
		:COMO => '<!--',
		:COMC => '-->',
	}
	
	SUBSTITUTE = {
		"lt" 	=> 	'<',
		"gt" 	=> 	'>',
		"amp"	=> 	'&',
		"apos"	=> '\'',
		"quot"	=> '\"',
	}
	
	def get_op(symb)
		return OPERATORS[symb]
	end
	
	def get_sub(stri)
		return SUBSTITUTE[stri]
	end
	
end

#Symbols::OPERATORS[:LPNT]
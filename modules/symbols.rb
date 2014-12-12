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
	
	#\s*<([a-zA-Z]*)\s*(?:[a-zA-Z]*)\s*=\s*"(\w*)"
	REGEXLOGIC = {
		:IDENT => /<([a-zA-Z]*)/,
		:ATTR1 => /<[a-zA-Z]* ([a-zA-Z]*)/
	}
	
	def get_op(symb)
		return OPERATORS[symb]
	end
	
	def get_sub(stri)
		return SUBSTITUTE[stri]
	end
	
end

Symbols::OPERATORS[:LPNT]
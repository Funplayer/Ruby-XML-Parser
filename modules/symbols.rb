module Symbols
	
	OPERATORS = {
		:LPNT => '<',
		:RPNT => '>',
		:CLOS => '/',
		:EQL  => '=',
		:QUOT => '"',
		:COMM => '!',
		:COLN => ':',
	}
	
	SUBSTITUTE = {
		"lt" 	=> 	'<',
		"gt" 	=> 	'>',
		"amp"	=> 	'&',
		"apos"	=> '\'',
		"quot"	=> '\"',
	}
	
end

Symbols::OPERATORS[:LPNT]
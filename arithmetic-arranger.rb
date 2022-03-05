def arithmetic_arranger(*args)
    if args[0].length > 5
        return 'Error: Too many problems.'
    elsif addition_substraction_checker(args[0]) == false
        return 'Error: Operator must be \'+\' or \'-\'.'
    elsif digit_checker(args[0]) == false
        return 'Error: Numbers must only contain digits.'
    elsif operand_length_checker(args[0]) == false
        return 'Error: Numbers cannot be more than four digits.'
    else 
    	return operation_formatter(*args)
    end
end



def addition_substraction_checker(args)
    args.each do |operation|
        if operation.include?('-') == false && operation.include?('+') == false
            return false
        end
    end
end



def digit_checker(args)
	digits = "0123456789"
	first = true
	second = true
	args.each do |operation|
		ope_separated = operation.split
		ope_separated[0].each_char do |digit|
			if digits.include?(digit) == false
				first = false
	        end
        end
        ope_separated[-1].each_char do |digit|
	        if digits.include?(digit) == false
		        second = false
	        end
        end
    end
    
    if first == false || second == false
	    return false
    end 

    return true
end



def operand_length_checker(args)
	check = true
	
	args.each do |operation|
		ope_separated = operation.split
	    if ope_separated[0].length > 4 || ope_separated [-1].length > 4
		    check = false
	    end
    end

    return check
end



def operation_formatter(*args)
    positive = {}
    args[0].each do |operation|
        sep_operation = operation.split
        if operation.include?('+')
            positive[sep_operation[0]] = sep_operation[1] + sep_operation[-1]
        elsif operation.include?('-')
            positive[sep_operation[0]] = sep_operation[1] + sep_operation[-1]
        end
    end
    
    top_array = []
    bottom_array = []
    dashes_array = []
    
    positive.each do | k, v |
        vlength_solved = v.length - 1
        if k.length > vlength_solved
            bottom_final_sepa = (k.length - vlength_solved) + 1
        elsif k.length <= v.length
            bottom_final_sepa = 1
        end
        args[0].each do |operation|
        sep_operation = operation.split
    
                bottom_line = sep_operation[1], ' ' * bottom_final_sepa, v[1..-1]
        
                top_final_sepa = bottom_line.join.length - k.length
                top_line = ' ' * top_final_sepa, k
                
                dashes = '-' * bottom_line.join.length
                
                top_array << top_line.join
                bottom_array << bottom_line.join
                dashes_array << dashes
        end
    end

    bottom_negative = []
    bottom_positive = []
    bottom_array.each do |ope|
        if ope.include?('-')
            bottom_negative << ope
        elsif ope.include?('+')
            bottom_positive << ope
        end
    end

    final_top_array = []
    final_array_bottom = []
    dashes_array_final = []
    i = 0
    e = 2
    while i < top_array.length
        final_top_array << top_array[i...e]
        final_array_bottom << bottom_array[i...e]
        dashes_array_final << dashes_array[i...e]
        
        i += args[0].length
        e += args[0].length
    end
    
    po = []
    ne = []
    final_array_bottom.each do |multi|
        po << multi[0]
        ne << multi[1]
    end
    
    # if
    end_bitch = []
    i = 0
    ara = args[0]
    while i < ara.length
        if ara[i].include?('+')
            end_bitch << po[i]
        elsif ara[i].include?('-')
            end_bitch << ne[i]
        end
        
        i += 1
    end
    
    tt = []
    final_top_array.each do |yo|
        tt << yo[0]
    end
    
    dd = []
    dashes_array_final.each do |lol|
        dd << lol[1]
    end
    
    print tt.join(' ' * 4)
    puts
    print end_bitch.join(' ' * 4)
    puts
    print dd.join(' ' * 4)
    puts
    
    answers = []
    a = ''
    args[0].each do |operation|
        sep_operations = operation.split
        if operation.include?('+')
            ans = sep_operations[0].to_i + sep_operations[-1].to_i 
            a = ans.to_s.length
            answers << ans
        elsif operation.include?('-')
            ans = sep_operations[0].to_i - sep_operations[-1].to_i
            a = ans.to_s.length
            answers << ans
        end
        
    end
    f_ans = []
    i = 0
    while i < args[0].length
        ans_len = answers[i].to_s.length
        dash_len = dd[i].length
        sp =  dash_len - ans_len
        f_ans << [' ' * sp + answers[i].to_s]
        
        
        i += 1
    end
    
    if args[1] == true
        print f_ans.join(' ' * 4)
    end
end




print(arithmetic_arranger( '44 + 815', '909 - 2', '45 + 43', '123 + 49','888 + 40', '653 + 87'))
puts
print(arithmetic_arranger(['3 / 855', '3801 - 2', '45 + 43', '123 + 49']))
puts
print(arithmetic_arranger(['98 + 3g5', '3801 - 2', '45 + 43', '123 + 49']))
puts
print(arithmetic_arranger(['3 + 855', '988 + 40'], true))
puts
print(arithmetic_arranger(['24 + 85215', '3801 - 2', '45 + 43', '123 + 49']))
puts
print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49", "55 + 5555"]))
puts 
print arithmetic_arranger(["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49", "3 + 3"], true)

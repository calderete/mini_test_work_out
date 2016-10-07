require 'pry'
class ArrySplitting

  def self.array_divider(*array)
  	#normally I would not save the array.count into a variable and just use array.slice!(array.count / 2)
  	#but the directions said to only iterate once and I was trying to keep in the spirit of that
  	length = array.count
  	unless length == 0 
	  	if length.even? 
		  	array.slice!(length / 2 - 1, 2)
		  	return array
	  	else 
		  	array.slice!(length / 2)
		  	return array
		  end
	  else
	  	return "List is empty"
	  end
  end

  def self.array_search(target, *arrays)
  	positive_results = []
  	arrays.each do |array|
  		if array.include?(target)
  			positive_results.push(array)  			
  		end
  	end

  	if positive_results.count == 1
  		return positive_results.flatten
    elsif positive_results.count > 1
    	return positive_results
    else positive_results.empty?
    	return "Could not find target"
    end
  end
end

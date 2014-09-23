class DiffableArray < Array
  def diff_merge(array)
    array1 = self.dup
    array2 = array.dup

    merged_array = DiffableArray.new

    while array1.length > 0 || array2.length > 0
      match = array1.find_first_match(array2)
      if match == [0, 0]
        merged_array << array1.slice!(0)
        array2.slice!(0)
      else
        if match[0] > 0
          merged_array << array1.slice!(0..(match[0] - 1))
          array1.slice!(0)
        end
        merged_array << array2.slice!(0..match[1])
      end
    end

    merged_array.flatten.uniq
  end

  def find_first_match(array)
    self.each_with_index do |item, index1|
      index2 = array.index(item)
      return [index1, index2] unless index2.nil?
    end
    [self.length, array.length]
  end
end

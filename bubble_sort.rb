class BubbleSort

  def bubble_sort(ary)

    sorted = ary.sort
    if ary == sorted
      puts "Array is sorted!"
      exit
    end

    while ary != sorted
      ary.each_with_index do |a, i|
      break if i == ary.length - 1
        if a > ary[i+1]
          ary[i], ary[i+1] = ary[i +1], ary[i]
        end
      end
    end
    ary
  end
end

bs = BubbleSort.new

puts bs.bubble_sort([4,2,5,1,7]).inspect
puts bs.bubble_sort([7, 2, 4, 7, 3, 1, 4, 6, 5, 8, 3, 9, 2, 6, 7, 6, 3]).inspect
puts bs.bubble_sort([1,2,3,4,5]).inspect

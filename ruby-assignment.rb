def climbingLeaderboard (ranked, player)
  
  # removed duplicates from the array
  ranked.uniq! 
  
  # new array to store all ranks
  ranks = Array.new 
  # new array to display the final ranks
  final_ranks = Array.new 

  # initialized ranks with values on the basis of elements 
  # in the ranked array
  ranked.each_with_index do | value, index |
    ranks.push(index + 1)
  end
  
  # picked up each player score from the player array
  player.each do |score|
    # if the score exists in the ranked array
    if ranked.include?(score) == true
      # get its index
      index = ranked.index(score)
      # get its rank from the rank array
      # put it into the final rank array
      final_ranks.push(ranks[index])
    # if score is not present into the ranked array
    else
      # put it into the ranked array
      ranked.push(score)
      # increment in the last present rank and store it
      ranks.push(ranks.last + 1)
      # sort the ranked array in descending order
      # so the highest score comes at the top and so on.
      ranked.sort! {|left, right| right <=> left}
      # get the index of the score from the ranked array
      index = ranked.index(score)
      # using that index pick rank from rank array
      # put that rank in the final rank array
      final_ranks.push(ranks[index])
    end
  end
  
  # display the final output
  puts "#{final_ranks}"
end

# main

# ranked score and player score arrays
#ranked = [100,90,90,80]
#player = [70,80,105]

#ranked = [100,100,50,40,40,20,10]
#player = [5,25,50,120]

ranked = [100,90,90,80,75,60]
player = [50,65,77,90,102]

# function call, passing arguments
climbingLeaderboard(ranked, player)
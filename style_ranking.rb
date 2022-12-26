require 'pry'

# https://www.codewars.com/kata/51fda2d95d6efda45e00004e/train/ruby

# Write a class called User that is used to calculate the amount that a user will progress through a ranking system similar to the one Codewars uses.

# Business Rules:
# 1. A user starts at rank -8 and can progress all the way to 8.
# 2. There is no 0 (zero) rank. The next rank after -1 is 1.
# 3. Users will complete activities. These activities also have ranks.
# 4. Each time the user completes a ranked activity the users rank progress is updated based off of the activity's rank
# 5. The progress earned from the completed activity is relative to what the user's current rank is compared
#   to the rank of the activity
# 6. A user's rank progress starts off at zero, each time the progress reaches 100
#   the user's rank is upgraded to the next level
# 7. Any remaining progress earned while in the previous rank will be applied towards the next rank's progress
#   (we don't throw any progress away). The exception is if there is no other rank left to progress towards
# (Once you reach rank 8 there is no more progression).
# A user cannot progress beyond rank 8.
# The only acceptable range of rank values is -8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8.
#   Any other value should raise an error.

# The progress is scored like so:

# Completing an activity that is ranked the same as that of the user's will be worth 3 points
# Completing an activity that is ranked one ranking lower than the user's will be worth 1 point
# Any activities completed that are ranking 2 levels or more lower than the user's ranking will be ignored
# Completing an activity ranked higher than the current user's rank will accelerate the rank progression. The greater the difference between rankings the more the progression will be increased. The formula is 10 * d * d where d equals the difference in ranking between the activity and the user.
# Logic Examples:
# If a user ranked -8 completes an activity ranked -7 they will receive 10 progress
# If a user ranked -8 completes an activity ranked -6 they will receive 40 progress
# If a user ranked -8 completes an activity ranked -5 they will receive 90 progress
# If a user ranked -8 completes an activity ranked -4 they will receive 160 progress, resulting in the user being upgraded to rank -7 and having earned 60 progress towards their next rank
# If a user ranked 

class User
  attr_reader :rank, :progress

  RANKS = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8].freeze

  def initialize
    @rank = -8
    @progress = 0
  end

  def inc_progress(task_rank)
    raise StandardError unless RANKS.include? task_rank

    calculate_rank(task_rank)
    @progress = 0 if @rank == 8
  end

  private

  def calculate_rank(task_rank)
    update_progress(@rank, task_rank)
  end

  def update_progress(current_rank, task_rank)
    new_score = score(current_rank, task_rank)
    updated_progress_score = progress + new_score

    if updated_progress_score >= 100
      value_to_index = updated_progress_score / 100

      @progress = updated_progress_score % 100
      update_rank(value_to_index)
    else
      @progress = updated_progress_score
    end
  end

  def update_rank(value_to_index)
    current_index = RANKS.index(@rank)

    @rank = RANKS[current_index + value_to_index]
  end

  def score(current_rank, task_rank)
    difference = RANKS.index(current_rank) - RANKS.index(task_rank)

    if current_rank < task_rank
      10 * difference * difference
    elsif RANKS.index(current_rank) == RANKS.index(task_rank)
      3
    elsif difference == 1
      1
    elsif difference >= 2
      0
    end
  end

  def calculate_difference(current_rank, task_rank)
    task_rank.negative? ? current_rank - task_rank : current_rank + task_rank
  end
end


user = User.new
puts user.rank # => -8
puts user.progress # => 0
user.inc_progress(-7) #be -2
puts user.progress # => 10
puts user.rank
user.inc_progress(nil) # will add 90 progress
puts  user.progress # => 0 # progress is now zero
puts  user.rank # => -7 # rank was upgraded to -7
# user.inc_progress(-7)
# puts  user.progress
# puts  user.rank #



# ==================================== Other solutions ================================


# class User
#   def initialize
#     @progress_max = 1500
#     @progress = 0
#     @ranks = [-8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8]
#   end
  
#   def rank
#     @ranks[@progress / 100]
#   end
  
#   def progress
#     @progress % 100
#   end
  
#   def inc_progress(kata_rank)
#     raise ArgumentError unless @ranks.include? kata_rank
#     d = (kata_rank > 0 ? kata_rank-1 : kata_rank) - (rank > 0 ? rank-1 : rank)
#     @progress += d < -1 ? 0 : d == -1 ? 1 : d == 0 ? 3 : 10*d*d 
#     @progress = @progress_max if @progress > @progress_max
#   end
# end







# class User
#   attr_reader :rank, :progress

#   RANKS = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8]

#   def initialize
#     @rank = -8
#     @progress = 0
#   end
  
#   def inc_progress(act_rank)
#     diff = RANKS.find_index(act_rank) - RANKS.find_index(@rank)
    
#     case
#       when diff < 0
#         exp = 1
#       when diff == 0
#         exp = 3
#       when diff > 0
#         exp = 10 * diff * diff
#     end
    
#     @rank = RANKS[RANKS.find_index(@rank) + ((@progress + exp) / 100)] || 8
#     @progress = @rank != 8 ? (@progress + exp) % 100 : 0
#   end
# end





# class User

#   def rank
#     @rank = -8 + (overall_progress / 100.0).floor
#     @rank += 1 if @rank >= 0
#     @rank
#   end
  
#   def progress
#     overall_progress.modulo(100)
#   end
  
#   def inc_progress(r)
#     raise 'Oh No!' unless (-8..8).include?(r) && r != 0
#     r -= 1 if r > 0 && rank < 0
#     if rank < r
#       @progress += 10 * (r - rank)**2
#     elsif rank == r
#       @progress += 3
#     else
#       @progress += 1
#     end
#   end
  
#   private
  
#   def overall_progress
#     [@progress ||= 0,1500].min
#   end

# end



# # TODO: create the User class
# # it must support rank, progress and inc_progress(rank) methods
# class User
#   attr_reader :progress, :rank
#   RANKS = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8]
  
# def initialize
#   @progress = 0
#   @rank = -8
# end

# def leveling
#   if @progress >= 100 && @rank < 8
#     @rank += 1
#     @rank == 0 ? @rank += 1 : @rank
#     @progress -= 100
#     @progress = 0 if @rank == 8
#     leveling()
#   end
# end

# def inc_progress(challenge_rank)
#   if RANKS.include?(challenge_rank)
#     d = RANKS.index(@rank) - RANKS.index(challenge_rank)
#     @progress += 10*d*d if @rank < challenge_rank
#     @progress += 3 if @rank == challenge_rank && @rank != 8
#     @progress += 0 if @rank - 2 >= challenge_rank
#     @progress += 1 if @rank - 1 >= challenge_rank
#     leveling()
#   else
#     raise "This is an exception"
#   end
# end
# end
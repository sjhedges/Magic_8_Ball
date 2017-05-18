@answers = ["Yes!", "No!", "Most certainly.", "I'm Thinking no.",
  "Try again later."]
@storage = []

def menu
  puts """Hello! Welcome to the Magic 8 Ball!
Please type a question below and I shall give you an answer.
Type 'list answers' to view the list of the possible answers.
Type 'add answer' to add your own answer to the possible answer list!
Type 'remove answer' to remove the last added answer from the list.
Type 'quit' to exit."""
  user_input = gets.chomp
  case user_input
  when "list answers"
    puts "Here are all the possible answers:"
    list_all_method
  when "add answer"
    add_answer_method
  when "remove answer"
    remove_answer_method
  when "quit"
    puts "Come back again soon! Goodbye."
    exit
  else
    puts "HERE IS YOUR ANSWER: #{@answers.sample}"
    menu
  end
end

def list_all_method
  puts @answers.uniq
  puts "1)To go back to the menu\n2)To add your own answer to this list."
  user_input = gets.strip.to_i
  case user_input
  when 1
    menu
  when 2
    add_answer_method
  else
    puts "Sorry that input is invalid. Please try again."
    list_all_method
  end
end

def add_answer_method
  puts """Type the answer you would like to add.
Type 'remove answer' to remove the last added answer from the list."""
  user_input = gets.chomp
  case user_input
    when "remove answer"
      remove_answer_method
    else
      @answers << user_input
      list_all_method
  end
end

def remove_answer_method
    @answers.pop
    list_all_method
end

menu

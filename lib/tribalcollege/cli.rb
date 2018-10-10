class Tribalcollege::CLI
  def call
    command = ""
    while command != '4'
      puts("Welcome to the tribal college directory!")
      puts("For information/help, type 1")
      puts("To list all tribal colleges, type 2")
      puts("To list all tribal colleges in a specific state, type 3")
      puts("To quit, type 4")
      puts("What would you like to do?")
      command = gets.strip
      case command
      when "1"
        list_help
      when "2"
        list_colleges
      when "3"
        select_state
      when "4"
        puts "Thank you for using the tribal college directory.  Have a great day!"
      else
        puts "That is not a valid option"
      end
    end
  end
  
  def list_help
    
  end
  
  def list_colleges
    
  end
  
  def select_state
    
  end
  
end

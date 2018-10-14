require_relative 'scraper.rb'
require_relative 'college.rb'

class Tribalcollege::CLI
  
  URL = 'http://www.aihec.org/who-we-serve/TCUroster-profiles.htm'
  
  def call
    get_colleges # pre-scrape everything so it is ready to display
    show_menu
  end
  
  def show_menu
    command = ""
    while command != '4'
      puts"Welcome to the tribal college directory!"  
      puts "Please enter the number of the option you would like: \n"
      puts"1. Information/help"
      puts"2. List all tribal colleges"
      puts"3. List all tribal colleges in a specific state"
      puts"4. Quit"
      puts"What would you like to do?"
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
    puts "This gem accesses information from the American Indian Higher Education"
    puts "Consortium to provide a list of all tribal colleges in the United States."
    puts "According to the AIHEC website, \"Each of these institutions was created and" 
    puts "chartered by its own tribal government for a specific purpose: to provide higher"
    puts "education opportunities to American Indians through programs that are locally"
    puts "and culturally based, holistic, and supportive. All TCUs offer associate degree"
    puts "programs; 14 offer baccalaureate programs; five offer master's degree programs.\""
    puts "\n"
    puts "To access this information, select from one of the menu options provided.\n\n"
  end
  
  def list_colleges
    puts "\n\n"
    Tribalcollege::College.all.each do |college|
      puts college.name
      puts college.state
      puts college.phone
      puts college.url 
      puts "\n"
    end
  end
  
  def select_state
    puts("Enter the state abbreviation (e.g. AZ)")
    puts("The states that have tribal colleges are: ")
    state_string = ""
    Tribalcollege::College.all_by_state.keys.sort.each do |state|
      state_string += state + " "
    end
    puts state_string
    
    command = gets.strip.upcase
    puts "\nTHE FOLLOWING COLLEGES ARE IN THE STATE OF #{command}: \n\n"
    Tribalcollege::College.all_by_state[command].each do |college|
      puts college.name
      puts college.state
      puts college.phone
      puts college.url 
      puts "\n"
    end
    puts "\n"
  end
  
  def get_colleges
    colleges_array = Tribalcollege::Scraper.scrape(URL)
    Tribalcollege::College.create_from_collection(colleges_array)
  end
  
end

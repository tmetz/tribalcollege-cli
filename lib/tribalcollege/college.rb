class Tribalcollege::College
  attr_accessor :name, :state, :phone, :url
  
  @@all = []
  
  @@all_by_state = {}

  def initialize(colleges_hash)
    colleges_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_from_collection(colleges_array)
    colleges_array.each do |college|
      new_college = Tribalcollege::College.new(college)
      @@all << new_college
      
      # Now store each college by the state it is located in, using
      # the @@all_by_state hash
      if @@all_by_state.include?(new_college.state)
        @@all_by_state[new_college.state] << new_college
      else
        # create a new hash element for this state that is an array, then add college
        @@all_by_state[new_college.state] = [] 
        @@all_by_state[new_college.state] << new_college
      end
    end
  end
  
  def self.all_by_state
    @@all_by_state
  end
  
  def self.all
    @@all
  end
end
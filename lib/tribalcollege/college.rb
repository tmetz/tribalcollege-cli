class Tribalcollege::College
  attr_accessor :name, :state, :phone, :url
  
  @@all = []

  def initialize(colleges_hash)
    colleges_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_from_collection(colleges_array)
    colleges_array.each do |college|
      new_college = Tribalcollege::College.new(college)
      @@all << new_college
    end
  end
  
  def self.all_by_state(state)
    @@all.select{|college| college.state == state }
  end
  
  def self.all
    @@all
  end
end
class Tribalcollege::College
  attr_accessor :name, :state, :phone, :url
  
  @@all = []

  def initialize(colleges_hash)
    colleges_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(colleges_array)
    colleges_array.each do |college|
      new_college = Tribalcollege::College.new(college)
    end
  end
  
  def self.all
    @@all
  end
end
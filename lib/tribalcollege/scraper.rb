require 'nokogiri'
require 'open-uri'

class Tribalcollege::Scraper
  
  attr_reader :colleges

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    @colleges = []
    #puts doc.xpath('//*[@id="t01"]/tbody/tr[1]').text
    
    #9u 12u(mobile) important(mobile) printSection
    doc.xpath('//*[@id="t01"]/tbody/tr').each do |college|
      college_hash = {
        :name => college.css("a").text,
        #:state => college.css("a p").text,
        #:phone => ,
        :url => college.css("a").attribute("href").value
      }
      @colleges << college_hash
    end
    @colleges
  end
end
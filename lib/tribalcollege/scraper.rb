require 'nokogiri'
require 'open-uri'

class Tribalcollege::Scraper
  
  attr_reader :colleges

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    @colleges = []
    puts doc.css('div.first')
    #9u 12u(mobile) important(mobile) printSection
    doc.css('div.content-wrapper div.content div.container div.row table.t01 tr td.cell20a').each do |college|
      college_hash = {
        :name => college.css("a").attribute("href").text,
        #:state => college.css("a p").text,
        #:phone => ,
        :college_url => college.css("a").attribute("href").value
      }
      puts college_hash[name]
      colleges << college_hash
    end
    @colleges
  end
end
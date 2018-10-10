require 'nokogiri'
require 'open-uri'

class Tribalcollege::Scraper

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    colleges = []
    doc.css("table.t01").each do |college|
      college_hash = {
        :name => college.css("tbody tr td a").attribute("href").text,
        #:state => college.css("a p").text,
        #:phone => ,
        :college_url => college.css("tbody tr td a").attribute("href").value
      }
      colleges << college_hash
    end
    colleges
  end
end
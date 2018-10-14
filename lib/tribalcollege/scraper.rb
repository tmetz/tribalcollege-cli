require 'nokogiri'
require 'open-uri'

class Tribalcollege::Scraper

  def self.scrape(url)
    # Get the text from the AIHEC tribal college list web page
    # then identify and store the name, state, phone number and url
    # for each colleges
    
    doc = Nokogiri::HTML(open(url))
    colleges = []

    doc.xpath('//*[@id="t01"]/tbody/tr').each do |college|
      address = college.css("td.cell20a br")[1].next.text.strip
      address_pieces = address.split()
      college_hash = {
        :name => college.css("a").text,
        :state => address_pieces[-2],
        :phone => college.css("td.cell20a br")[2].next.text.strip,
        :url => college.css("a").attribute("href").value
      }
      colleges << college_hash
    end
    colleges
  end
end
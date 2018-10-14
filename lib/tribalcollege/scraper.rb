require 'nokogiri'
require 'open-uri'

class Tribalcollege::Scraper
  
  attr_reader :colleges

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    @colleges = []

    doc.xpath('//*[@id="t01"]/tbody/tr').each do |college|
      college_hash = {
        :name => college.css("a").text,
        :state => college.xpath('//*[@class="cell20a"]/br')[1].next.text.strip,
        :phone => college.xpath('//*[@class="cell20a"]/br')[2].next.text.strip,
        :url => college.css("a").attribute("href").value
      }
      @colleges << college_hash
    end
    @colleges
  end
end
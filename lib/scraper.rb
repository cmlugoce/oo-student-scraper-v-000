require 'open-uri'
require 'pry'
require 'nokogiri'
class Scraper

attr attr_accessor :name, :location, :profile_url
  def self.scrape_index_page(index_url)
   doc = Nokogiri::HTML(open("./fixtures/student-site/index.html")) 
   binding.pry 
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

Scraper.scrape_index_page("./fixtures/student-site/index.html")
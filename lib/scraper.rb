require 'open-uri'
require 'pry'
require 'nokogiri'
class Scraper
 attr_accessor :name, :location, :profile_url
  def self.scrape_index_page(index_url)
   doc = Nokogiri::HTML(open("./fixtures/student-site/index.html")) 
   #doc.css(".student-card").first
        #doc.css(".student-card").first.css("h4").text
        #doc.css(".student-card").first.css("p").text
      #  doc.css(".student-card").css("a").attribute("href").value
   student_array = []
   student = {} 
   
   doc.css("div.student-card").each do |student|
     student = {
       :name => 
     }
   binding.pry 
   
   
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

Scraper.scrape_index_page("./fixtures/student-site/index.html")
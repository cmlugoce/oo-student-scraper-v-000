require 'open-uri'
require 'pry'
require 'nokogiri'
class Scraper
 attr_accessor :name, :location, :profile_url
  def self.scrape_index_page(index_url)
   doc = Nokogiri::HTML(open(index_url)) 
   #doc.css(".student-card").first
        #doc.css(".student-card").first.css("h4").text
        #doc.css(".student-card").first.css("p").text
      #  doc.css(".student-card").css("a").attribute("href").value
   student_array = []
   student = {} 
   
   doc.css("div.student-card").each do |student|
     student = {
       :name => student.css("h4").text,
       :location => student.css("p").text,
       :profile_url => student.css("a").first["href"]
     }
     
     student_array << student 
     
     student_array
   end
   
   
   
   
  end

  def self.scrape_profile_page(profile_url)
   profile_page = Nokogiri::HTML(open(profile_url))
    student = {}
        links = profile_page.css(".social-icon-container").children.css("a").map {|e| e.attribute('href').value}
          links.each do |link|
            if link.include?("linkedin")
              student[:linkedin] = link
            elsif link.include?("github")
              student[:github] = link
            elsif link.include?("twitter")
              student[:twitter] = link
            else
              student[:blog] = link
            end
          end
          student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
          student[:bio] = profile_page.css("div.bio-content.content-holder div.description-holder p").text if profile_page.css("div.bio-content.content-holder div.description-holder p")
          student
  end

end 


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
       :name => student.css("h4").text,
       :location => student.css("p").text,
       :profile_url => student.css("a").first["href"]
     }
     
     student_array << student 
   end
   
   
   
   
  end

  def self.scrape_profile_page(profile_url)
   html = File.read(profile_url)
   
    doc = Nokogiri::HTML(html)
    social_media = doc.css('div.social-icon-container').css('a')
    link = social_media.map {|social_media| social_media.attribute('href').value}
    student = {}
    
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
   
   
   
   student[:profile_quote] = doc.css('div.profile-quote').text
    student[:bio] = doc.css('div.description-holder p').text

    student
  end

end


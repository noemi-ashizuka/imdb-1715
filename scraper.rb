# Create a method to get the top 5 urls from https://www.imdb.com/chart/top/
# scrape_top_five_urls => an array with 5 url strings
require "open-uri"
require "nokogiri"

def scrape_top_five_urls
  url = "https://www.imdb.com/chart/top/"
  html_doc = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  doc = Nokogiri::HTML(html_doc)

  urls = []

  doc.search(".ipc-title-link-wrapper").first(5).each do |element|
    urls << "https://www.imdb.com#{element.attribute("href").value.split("?").first}"
  end

  urls
end

# p scrape_top_five_urls



# Create a method to scrape movie data from a specific movie page (ex. https://www.imdb.com/title/tt0111161/) - Title, Director, Cast, Year, Storyline, Rating

# get_movie_data(url) => a hash with movie data

def get_movie_data(url)
  html_content = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  doc = Nokogiri::HTML(html_content)

  storyline = doc.search('.sc-2d37a7c7-0').text.strip
  title = doc.search('.hero__primary-text').text.strip
  director = doc.search(".ipc-metadata-list-item__list-content-item--link").first.text.strip
  cast = []
  doc.search(".sc-bfec09a1-1").first(3).each do |element|
    cast << element.children.text.strip
  end
  p rating = doc.search('.sc-eb51e184-1').text.strip.to_f
  year = doc.search(".ipc-link.ipc-link--baseAlt.ipc-link--inherit-color")[5].text.strip.to_i
  
  {
      cast: cast,
      director: director,
      storyline: storyline,
      title: title,
      year: year,
      rating: rating
    }
end

get_movie_data("https://www.imdb.com/title/tt0111161/")
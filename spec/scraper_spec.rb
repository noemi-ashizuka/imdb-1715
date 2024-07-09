require_relative "../scraper"

describe "#scrape_top_five_urls" do
  it "it should return an array with the top 5 urls (as strings)" do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(scrape_top_five_urls).to eq(expected)
  end
end

describe "#get_movie_data(url)" do
  it "it should returns a hash with movie data" do
    url = "https://www.imdb.com/title/tt0111161/"
    expected = {
      cast: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"],
      director: "Frank Darabont",
      storyline: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.",
      title: "The Shawshank Redemption",
      year: 1994,
      rating: 9.39
    }
    expect(get_movie_data(url)).to eq(expected)
  end
end

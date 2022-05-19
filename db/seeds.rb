require "open-uri"
require "json"

url = "https://tmdb.lewagon.com/movie/top_rated"
base_poster_url = "https://image.tmdb.org/t/p/original"

10.times do |i|
  movies = JSON.parse(URI.open("#{url}?page=#{i+1}").read)["results"]
  movies.each do |movie|
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"])
  end
end

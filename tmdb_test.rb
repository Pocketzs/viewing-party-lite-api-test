require 'faraday'
require 'json'
@conn = Faraday.new(
  url: 'https://api.themoviedb.org/3',
  headers: { 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMGY5ZjMzZmE0MTZlMjAyM2FmZWU2NTU2MmQ5MmRmNyIsInN1YiI6IjYzZDlmODZiOTU1YzY1MDBhODQzMGZiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bp_qmnzMc-otjEGOSbQUm69Ia0dhlgUJRY1rhMVzHFc' }
)

# conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
#   faraday.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMGY5ZjMzZmE0MTZlMjAyM2FmZWU2NTU2MmQ5MmRmNyIsInN1YiI6IjYzZDlmODZiOTU1YzY1MDBhODQzMGZiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bp_qmnzMc-otjEGOSbQUm69Ia0dhlgUJRY1rhMVzHFc'
# end

top_rated = @conn.get('movie/top_rated')

json = JSON.parse(top_rated.body, symbolize_names: true)

titles = json[:results].map do |movie|
  movie[:title]
end

def self.search(query)
  search = @conn.get("search/movie?query=#{query}")
  json = JSON.parse(search.body, symbolize_names: true)
  require 'pry'; binding.pry
  json[:results].map do |movie|
    movie[:title]
  end
end

require 'pry'; binding.pry
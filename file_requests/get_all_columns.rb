require "uri"
require "net/http"
require "json"

uri = URI("http://127.0.0.1:3000/columns")

req = Net::HTTP.new(uri.host, uri.port).get(uri.path)
json = JSON.parse(req.body)
puts json
require "uri"
require "net/http"
require "json"

uri = URI("http://127.0.0.1:3000/api/v1/cards")

data = {name: "card1", column_id: 1, user_id: 1, description: "description_1"}
req = Net::HTTP.new(uri.host, uri.port).post(uri.path, data.to_json, "content-type" => "application/json")
json = JSON.parse(req.body)
p json
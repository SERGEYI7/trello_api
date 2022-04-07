require "uri"
require "net/http"
require "json"

uri = URI("http://127.0.0.1:3000/columns")

data = {name: "column3", user_id: 3}
req = Net::HTTP.new(uri.host, uri.port).post(uri.path, data.to_json, "content-type" => "application/json")
json = JSON.parse(req.body)
p json
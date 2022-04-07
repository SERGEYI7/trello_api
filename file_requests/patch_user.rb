require "uri"
require "net/http"
require "json"

uri = URI("http://127.0.0.1:3000/users/2")

data = {email: "asd@asd.asd(Этио нёвое строкэ)", password: "qazxsw", auth_token: "token_jkldfgbnm"}
req = Net::HTTP.new(uri.host, uri.port).patch(uri.path, data.to_json, "content-type" => "application/json")
json = JSON.parse(req.body)
p json
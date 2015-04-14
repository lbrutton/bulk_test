require 'net/http'
class GetGames

	def perform
		api_uri = URI "http://bulk.applift.com/api/bulk/v1/promotions?app_token=cc2a5ccfbfb53107ae12cb908c2b8799c81556ba5f12cc3fe61fe96606a80210&&countries%5B%5D=DEU"
		response = Net::HTTP.start(api_uri.host, api_uri.port) do |http|
		  request = Net::HTTP::Get.new api_uri.request_uri
		  http.request request
		end
		
	response_body = JSON.parse response.body
		body_length = response_body.length
		game_indexes = (0..(body_length-1)).to_a.sort{rand() - 0.5}[0..5]
		for i in game_indexes
			Game.create(title: response_body[i]["creatives"]["title"], 
				icon: response_body[i]["creatives"]["icon_url"],
				description: response_body[i]["creatives"]["description"],
				click_url: response_body[i]["campaigns"].first["click_url"])
		end
	end
end
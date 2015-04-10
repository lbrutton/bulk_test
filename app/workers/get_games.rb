class GetGames

	def perform
		api_uri = URI "http://bulk.applift.com/api/bulk/v1/promotions?app_token=cc2a5ccfbfb53107ae12cb908c2b8799c81556ba5f12cc3fe61fe96606a80210"
		response = Net::HTTP.start(api_uri.host, api_uri.port) do |http|
		  request = Net::HTTP::Get.new api_uri.request_uri
		  http.request request
		end
	response_body = JSON.parse response.body
	puts response_body[0]["creatives"]["title"]
		for i in 0..5
			Game.create(title: response_body[0]["creatives"]["title"])
		end
	end

end
class NerdService
  def initialize
    @_conn = Faraday.new(url: "http://trivia.propernerd.com/api")
    @_conn.basic_auth(ENV["nerd_api_key"], ENV["nerd_api_secret"])
  end

  def get_round
    response = conn.get("questions?limit=10&random=true")
    parse(response)
  end

  private
  def parse(response)
    JSON.parse(response.body)
  end

  def conn
    @_conn
  end
end

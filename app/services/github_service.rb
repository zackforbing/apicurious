class GithubService

  def initialize(user)
    @_conn = Faraday.new("https://api.github.com/") do |faraday|
      faraday.params['Authorization'] = "token #{user.token}"
    end
  end

  def starred_repos(user)
    response = conn.get("/users/#{user.username}/starred")
    parse(response.body)
  end

  private

    def parse(response)
      JSON.parse(response, symbolize_names: true, object_class: RecursiveOpenStruct)
    end

    def conn
      @_conn
    end
end

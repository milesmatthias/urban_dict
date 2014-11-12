require "urban_dict/version"
require "net/http"
require "uri"
require "json"

module UrbanDict

  ENDPOINT = "http://api.urbandictionary.com/v0/define"

  def self.define(word)

    if word.nil?
      exit "a word is required to define"
    end

    uri = URI.parse( [ENDPOINT, "?term=", word].join )

    response = Net::HTTP.get_response(uri)

    unless response.code == "200"
      return { error: "There was a problem using the urban dictionary endpoint. Response code = #{ response.code }" }
    end

    body = JSON.parse(response.body)

    definitions = body["list"]

    unless definitions.count > 0
      return { error: "No definition found for '#{ word }'." }
      return
    end

    entry = definitions.first

    #puts entry["definition"]
    #puts "Example: #{ entry["example"]}"

    return entry
  end

end

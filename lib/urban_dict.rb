require "urban_dict/version"
require "net/http"
require "uri"
require "json"

module UrbanDict

  class UrbanResponse
    attr_accessor :uri

    def initialize(url)
      @uri = URI.parse(url)
    end

    def get_response
      response = Net::HTTP.get_response(@uri)

      unless response.code == "200"
        return { error: "There was a problem using the urban dictionary endpoint. Response code = #{ response.code }" }
      end

      body = JSON.parse(response.body)

      definitions = body["list"]

      unless definitions.count > 0
        return { error: "No definition found for '#{ word }'." }
      end

      entry = definitions.first

      #puts entry["definition"]
      #puts "Example: #{ entry["example"]}"
    end
  end


  #
    ENDPOINT = "http://api.urbandictionary.com/v0/"

    def self.define(word = nil)
      if word.nil?
        random
      else
        UrbanResponse.new( [ENDPOINT, "define?term=", word].join ).get_response
      end
    end

    def self.random
      UrbanResponse.new( [ENDPOINT, "random"].join ).get_response
    end


end

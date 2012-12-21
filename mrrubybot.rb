require 'rubygems'
require 'rest_client'
require 'tweetstream'
require 'twitter'
require 'net/http'

require File.join(File.dirname(__FILE__), 'api_config')


Twitter.configure do |config|
  config.consumer_key       = $TW_CONSUMER_KEY
  config.consumer_secret    = $TW_CONSUMER_SECRET
  config.oauth_token        = $TW_OAUTH_TOKEN
  config.oauth_token_secret = $TW_OAUTH_TOKEN_SECRET
end

# Twitter.update("my first tweet")

url = 'http://www.iheartquotes.com/api/v1/random?max_characters=140&max_lines=1&show_permalink=false&show_source=false'
response = RestClient.get(url)
message = response.body
message = message.gsub(/&quot;/,'"')
message = message.strip
puts message

Twitter.update(message)

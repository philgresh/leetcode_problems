# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3673/
# Note: This is a companion problem to the (System Design)[https://leetcode.com/discuss/interview-question/system-design/] 
# problem: (Design TinyURL)[https://leetcode.com/discuss/interview-question/124658/Design-a-URL-Shortener-(-TinyURL-)-System/].
# TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it 
# returns a short URL such as http://tinyurl.com/4e9iAk.

# Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode 
# algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be 
# decoded to the original URL.

# Strategy:
# If not able to store shortURL=> longURL (database, hash table, etc), simply use Base64.urlsafe_encode64 to make sure the resulting
# tinyurl is url-safe


require "test/unit"
extend Test::Unit::Assertions
require 'base64'
BASE = "https://tinyurl.com/"
# Encodes a URL to a shortened URL.
#
# @param {string} long_url
# @return {string}
def encode(long_url)
  BASE + Base64.urlsafe_encode64(long_url)
end

# Decodes a shortened URL to its original URL.
#
# @param {string} short_url
# @return {string}
def decode(short_url)
  puts short_url
  Base64.urlsafe_decode64(short_url[BASE.size..-1])
end


# Your functions will be called as such:
# decode(encode(url))

# Example 1:
long_url = "https://leetcode.com/problems/design-tinyurl"
encoded = encode(long_url)
decoded = decode(encoded)
assert(long_url == decoded, "Failed example 2: Expected: #{long_url}, got: #{decoded}")

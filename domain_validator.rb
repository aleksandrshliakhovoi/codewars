# https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby

# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

# domain_name("http://github.com/carbonfive/raygun") == "github" 
# domain_name("http://www.zombie-bites.com") == "zombie-bites"
# domain_name("https://www.cnet.com") == "cnet"

require 'uri'

def domain_name(url)
  # return just the domain name
  if url.start_with?('http' || 'https')
    uri = URI(url).host
  else
    uri = url.to_s
  end

  arr = uri.to_s.split('.')

  if arr[0] == 'www'
    arr[1]
  else
    arr[0]
  end
end


p domain_name("http://github.com/carbonfive/raygun") # == "github" 
p domain_name("http://www.zombie-bites.com") # == "zombie-bites"
p domain_name("www.xakep.ru") # == "cnet"
p domain_name("https://www.cnet.com") # == "cnet"

############################ BEST PRACTISE ##################

    # def domain_name(url)
    #   URI.parse(url).host.split('.').last(2)[0]
    # end

    # def domain_name(url)
    #   regex = /(http|https):\/\/(?:www\.)?(?<domain_name>.*?)\./
    #   url.match(regex)[:domain_name]
    # end

    # URL_PATTERN = %r{
    #   (?<http>\w+:\/\/)
    #   (?<subdomain>\w+\.)?
    #   (?<domain>[\w-]+)\.
    #   (?<suffix>\w+)
    #   (?<path>.+)?
    # }x
      
    # def domain_name(url)
    #   url.match(URL_PATTERN)[:domain]
    # end

    # def domain_name(url)
    #   url.gsub!('http://', '')
    #   url.gsub!('https://', '')
    #   url.gsub!('www.', '')
    #   url.split(".")[0]
    # end

    # def domain_name(url)
    #   url.match(%r{//[^/]*?([^/.]+)\.[^/.]+(/|$)})[1]
    # end

    # def domain_name(url)
    #   url.match(/.*[\.\/](.*)\./)[1]
    # end

    # def domain_name(url)
    #   url.split("://")[-1].split(".")[-2]
    # end

    # def domain_name(url)
    #   url.gsub(/(https:..)|(http:..)|(www.)/, "").split(".")[0]
    # end
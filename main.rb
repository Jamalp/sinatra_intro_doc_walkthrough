require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?


helpers do
  def reverse_and_upcase(str)
    str.reverse.upcase
  end
end

#Hell World
get '/' do
  "Hello World"
end

get '/' do
  "Hello General Assembly"
end

get '/hello/:name/:age' do |n, a|
# matches "GET /hello/foo" and "GET /hello/bar"
# params[:name] is 'foo' or 'bar'
# n stores params[:name]
  "Hello #{n} #{a}!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  file = params[:splat] # => ["path/to/file", "xml"]
  @file_type = params[:splat][0]
end

#returns true/false if its a valid phone number or not
get 'is_valid_phone/*' do
end

#Wrapping Question marks around a parameter name makes it optional
get '/posts.?:format?' do
  # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc.
  # checks if the value of params[:format] is nil
  if params[:format].nil?
    return "no format"
  else
    return params[:format]
  end
end

# Big or Small
get '/blog_post/?:size?' do
  if params[:size] == "big"
    "this is my blog!".upcase
  else
    "this is my blog".downcase
  end
end

#SESSIONS
enable :sessions
get '/what_i_set' do
  "value = " + session[:value].inspect
end

get '/set/:value' do
  session[:value] = params[:value]
end
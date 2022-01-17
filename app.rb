require 'sinatra/base'
require 'sinatra/reloader'

class BookmarkManager < Sinatra::Base
  configure :test, :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmarks'
  end
end

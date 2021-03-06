require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :test, :development do
    register Sinatra::Reloader
  end

  get '/add' do
    erb :add
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/bookmarks' do
    Bookmark.add(Bookmark.new(title: params[:title], url: params[:url]))
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
  end
end

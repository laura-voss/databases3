
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(params['url'], params['title'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end

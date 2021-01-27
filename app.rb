require './lib/bookmarks.rb'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  get '/addbookmark' do
    erb(:addbookmark)
  end

  post '/addingbookmark' do
    Bookmarks.create(params['url'])
    redirect('/')
  end

  run! if app_file == $0
end

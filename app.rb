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
    Bookmarks.create(params['url'], params['title'])
    redirect('/')
  end

  get '/deletebookmark'do
    erb(:deletebookmark)
  end

  post '/deletingbookmark' do
    Bookmarks.delete(params['url'], params['title'])
    redirect('/')
  end

  get '/updatebookmark' do
    p params
    erb(:updatebookmark)
  end

  post '/updatingbookmark' do
    Bookmarks.update(params['current title'], params['new title'])
    p params
    redirect('/')
  end

  run! if app_file == $0
end

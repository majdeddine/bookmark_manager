 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
class Bookmark < Sinatra::Base

  get '/' do
    redirect '/create_link'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/create_link' do
    erb(:creating_link)
  end

  post '/links' do
     link = Link.create(name: params[:link_name], url: params[:link_url])
     tag = Tag.first_or_create(name: params[:tag])
     tag1 = Tag.first_or_create(name: params[:tag1])
     link.tags << tag
     link.tags << tag1
     link.save
    redirect '/links'

  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :tag
  end

 run! if app_file == $0

end

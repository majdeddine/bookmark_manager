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
     @link = Link.create(name: params[:link_name], url: params[:link_url])
     @tag = Tag.create(name: params[:link_tag], link_id: @link.id)
    redirect '/links'

  end

 run! if app_file == $0

end

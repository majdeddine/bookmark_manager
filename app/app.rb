 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
class Bookmark < Sinatra::Base

  get '/' do
    redirect '/create_link'
  end

  get '/links' do
    @links = Link.all
    #@link_tag = $link_tag
    # @link_tag = $tag_for_link
    erb(:links)
  end

  get '/create_link' do
    erb(:creating_link)
  end

  post '/links' do
    link_name = params[:link_name]
    link_url = params[:link_url]
    link_tag = params[:link_tag]
     @link = Link.create(name: link_name, url: link_url)
     @tag = Tag.create(name: link_tag, link_id: @link.id)
     #p $tag_for_link = @link.tags.last.name
    redirect '/links'

  end

 run! if app_file == $0

end

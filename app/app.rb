 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/create_link' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/create_link'
  end

  get '/create_link' do
    @email = $user_email
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

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :tag
  end


 def current_user
   @current_user ||= User.get(session[:user_id])
 end


 run! if app_file == $0

end

require('sinatra')
require('sinatra/contrib/all')
require("pry-byebug")
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/show/:id' do
  @tags = Tag.find(params['id'].to-i)
  erb(:"tags/show")
end

get '/tags/new' do
  @tags = Tag.all
  erb (:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to '/tags'
end

get '/tags/edit/:id' do
  id = params['id']
  @tag = Tag.find(id)
  erb(:"tags/edit")
end

post '/tags/:id' do
 Tag.new(params).update()
 redirect to "/tags"
end

post '/tags/:id/delete' do
  tag = Tag.find(params[:id])
  tag.delete()
  redirect to "/tags"
end

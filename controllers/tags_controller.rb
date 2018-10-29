require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags' do
  @tag = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/show/:id' do
  @tag = Tag.find(params['id'].to-i)
  erb(:"tags/show")
end

get '/tags/new' do
  @tags = Tag.all
  erb (:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to('/tags')
end

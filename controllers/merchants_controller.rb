require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchants/show/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb (:"merchants/show")
end

get '/merchants/new' do
  @merchants = Merchant.all
  erb (:"merchants/new")
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to('/merchants')
end

post "/merchants/:id/delete" do
  merchant = Merchant.find(params[:id])
  merchant.delete()
  redirect to("/merchants")
end

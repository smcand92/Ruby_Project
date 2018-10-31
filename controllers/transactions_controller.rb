require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb (:"transactions/new")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to ('/transactions')
end

get '/transactions/edit/:id' do
  id = params['id']
  @merchants = Merchant.all
  @tags = Tag.all
  @transaction = Transaction.find(id)
  erb(:"transactions/edit")
end

post '/transactions/:id' do
 Transaction.new(params).update()
 redirect to "/transactions"
end

post "/transactions/:id/delete" do
  transaction = Transaction.find(params[:id])
  transaction.delete()
  redirect to("/transactions")
end

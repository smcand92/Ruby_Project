require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')

get '/transactions' do
  @transaction = Transaction.all()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @transactions = Transaction.all
  erb (:"transactions/new")
end

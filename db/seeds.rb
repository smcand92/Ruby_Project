require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")

Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()

merchant1 = Merchant.new({
  "name" => "Tesco"
  })
  merchant1.save()

merchant2 = Merchant.new({
  "name" => "McDonalds"
  })
  merchant2.save()

merchant3 = Merchant.new({
  "name" => "Cineworld"
  })
  merchant3.save()

tag1= Tag.new({
  "Type" => "Groceries"
  })
  tag1.save()

tag2 = Tag.new({
  "Type" => "Food"
}
tag2.save()

tag3 = Tag.new({
  "Type" => "Entertainment"
  })
  tag3.save()

  

require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


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
  "type" => "Groceries"
  })
  tag1.save()

tag2 = Tag.new({
  "type" => "Food"
})
tag2.save()

tag3 = Tag.new({
  "type" => "Entertainment"
  })
  tag3.save()

  transaction1 = Transaction.new({
    "merchant_id" => merchant1.id,
    "tag_id" => tag1.id,
    "amount" => "80"
    })
    transaction1.save()

    transaction2 = Transaction.new({
      "merchant_id" => merchant2.id,
      "tag_id" => tag2.id,
      "amount" => "10"
      })
      transaction2.save()

      transaction3 = Transaction.new({
        "merchant_id" => merchant3.id,
        "tag_id" => tag3.id,
        "amount" => "30"
        })
        transaction3.save()


        binding.pry
        nil

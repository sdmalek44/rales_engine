require 'csv'

namespace :import do
  desc "TODO"
  task all: :environment do
    puts "Created:"
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      if $. < 1000
        Customer.create(row.to_h)
      end
    end
    puts "#{Customer.count} Customers"

    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      if $. < 1000
        Merchant.create(row.to_h)
      end
    end
    puts "#{Merchant.count} Merchants"

    CSV.foreach('./data/items.csv', headers: true) do |row|
      if $. < 1000
        Item.create(row.to_h)
      end
    end
    puts "#{Item.count} Items"

    CSV.foreach('./data/invoices.csv', headers: true) do |row|
      if $. < 1000
        Invoice.create(row.to_h)
      end
    end
    puts "#{Invoice.count} Invoices"

    CSV.foreach('./data/invoice_items.csv', headers: true) do |row|
      if $. < 1000
        InvoiceItem.create(row.to_h)
      end
    end
    puts "#{InvoiceItem.count} InvoiceItems"

    CSV.foreach('./data/transactions.csv', headers: true) do |row|
      if $. < 1000
        Transaction.create(row.to_h)
      end
    end
    puts "#{Transaction.count} Transactions"

  end
end

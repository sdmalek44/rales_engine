require 'rails_helper'

describe "Transactions API" do
  context "GET /api/v1/transactions" do
    it "returns a list of transactions" do
      create_list(:transaction, 3)

      get "/api/v1/transactions.json"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)
      transaction = transactions.first

      expect(transactions.count).to eq(3)
      expect(transaction).to have_key(:id)
      expect(transaction).to have_key(:invoice_id)
      expect(transaction).to have_key(:result)
      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to_not have_key(:credit_card_expiration_date)
      expect(transaction).to_not have_key(:created_at)
      expect(transaction).to_not have_key(:updated_at)
    end
  end

  context "GET /api/v1/transactions/random" do
    it "returns a random transaction" do
      create_list(:transaction, 3)

      get "/api/v1/transactions/random.json"

      expect(response).to be_successful

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction).to have_key(:id)
      expect(transaction).to have_key(:invoice_id)
      expect(transaction).to have_key(:result)
      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to_not have_key(:credit_card_expiration_date)
      expect(transaction).to_not have_key(:created_at)
      expect(transaction).to_not have_key(:updated_at)
    end
  end

   context "GET /api/v1/transactions/:id" do
    it "returns single transaction" do
      create_list(:transaction, 3)
      transact = Transaction.first

      get "/api/v1/transactions/#{transact.id}.json"

      expect(response).to be_successful

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction[:id]).to eq(transact.id)
      expect(transaction).to have_key(:invoice_id)
      expect(transaction).to have_key(:result)
      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to_not have_key(:credit_card_expiration_date)
      expect(transaction).to_not have_key(:created_at)
      expect(transaction).to_not have_key(:updated_at)
    end
  end

  context "GET /api/v1/transactions/find_all?" do
    it "returns objects that match query params" do
      create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?id=#{Transaction.first.id}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions[0][:id]).to eq(Transaction.first.id)
      expect(transactions[0]).to have_key(:id)
      expect(transactions[0]).to have_key(:invoice_id)
      expect(transactions[0]).to have_key(:result)
      expect(transactions[0]).to_not have_key(:created_at)
      expect(transactions[0]).to_not have_key(:updated_at)
    end
  end

  context "GET /api/v1/transactions/find?" do
    it "returns object that matches query params" do
      create_list(:transaction, 3)
      transact = Transaction.first
      get "/api/v1/transactions/find?id=#{transact.id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction[:id]).to eq(transact.id)
      expect(transaction).to have_key(:invoice_id)
      expect(transaction).to have_key(:result)
      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to_not have_key(:credit_card_expiration_date)
      expect(transaction).to_not have_key(:created_at)
      expect(transaction).to_not have_key(:updated_at)
    end
  end

  context "GET /api/v1/transactions/:id/invoice" do
    it "returns single invoice for given transaction id" do
    merchant = Merchant.create!(name: 'blah')
    customer = Customer.create!(first_name: 'blahblah', last_name: 'blahblahblah')
    invoice_1 = Invoice.create(status: 'blahmillion', customer_id: customer.id, merchant_id: merchant.id)
    transaction = invoice_1.transactions.create(credit_card_number: 7678345678987654, credit_card_expiration_date: '08/10/2018', result: 'success')

      get "/api/v1/transactions/#{transaction.id}/invoice.json"

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(invoice_1.id)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
      expect(invoice).to_not have_key(:result)
      expect(invoice).to_not have_key(:credit_card_number)
      expect(invoice).to_not have_key(:credit_card_expiration_date)
      expect(invoice).to_not have_key(:created_at)
      expect(invoice).to_not have_key(:updated_at)
    end
  end
end

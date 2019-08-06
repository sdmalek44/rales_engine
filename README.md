# Rales-Engine  
[![Build Status](https://travis-ci.com/sdmalek44/rales_engine.svg?branch=master)](https://travis-ci.com/sdmalek44/rales_engine)
[![Maintainability](https://api.codeclimate.com/v1/badges/d73e544fcb4ea6e46594/maintainability)](https://codeclimate.com/github/sdmalek44/rales_engine/maintainability)

Rales-Engine is a restful API built using ruby, rails, and active record. It is a JSON API which exposes a companies sales data schema. Company sales data was imported from multiple CSV files and seeded in the database. For each API route, the data was serialized to meet the spec and then presented to the user in JSON format. (Scroll down to view all endpoints and links to API deployed on heroku.)

### Accessing Rales-Engine
```
git clone git@github.com:sdmalek44/rales_engine.git
cd rales_engine
bundle update
rake db:{drop,create,migrate}
rake import:all
```

### Gems Utilized
- Active_model_serializers
- Byebug
- Database_cleaner
- Factory-Bot
- Faker
- Pry
- Pry-rails
- RSpec-rails
- Shoulda-matchers
- Simplecov  

#### Testing
This application utilizes RSpec for testing.  
In order to execute all tests, run the command `rspec` in the terminal.

### Basic Endpoints  
  
#### Merchants  

```GET /api/v1/merchants/:id``` Returns a single merchant with specific id  

```GET /api/v1/merchants/random``` Returns a single merchant at random  

```GET /api/v1/merchants``` Returns a collection of all merchants  

```GET /api/v1/merchants/find_all?id=1&name=Schroeder-Jerde``` Returns all merchants with passed in parameters - id, name  

```GET /api/v1/merchants/find?id=1&name=Schroeder-Jerde``` Returns the first merchant with passed in parameters - id, name  

#### Invoices  

```GET /api/v1/invoices/:id``` Returns a single invoice with specific id  

```GET /api/v1/invoices/random``` Returns a single invoice at random  

```GET /api/v1/invoices``` Returns a collection of all invoices  

```GET /api/v1/invoices/find_all?``` Returns all invoices with passed in parameters - id, status, merchant_id, customer_id  

```GET /api/v1/invoices/find?``` Returns the first invoice with passed in parameters - id, status, merchant_id, customer_id  

#### Invoice_items  

```GET /api/v1/invoice_items/:id``` Returns a single invoice_item with specific id  

```GET /api/v1/invoice_items/random``` Returns a single invoice_item at random  

```GET /api/v1/invoice_items``` Returns a collection of all invoice_items  

```GET /api/v1/invoice_items/find_all?``` Returns all invoice_items with passed in parameters - id, item_id, invoice_id, quantity, unit_price(as decimal)  

```GET /api/v1/invoice_items/find?``` Returns the first invoice_item with passed in parameters - id, item_id, invoice_id, quantity, unit_price(as decimal)  

#### Items  

```GET /api/v1/items/:id``` Returns a single item with specific id  

```GET /api/v1/items/random``` Returns a single item at random  

```GET /api/v1/items``` Returns a collection of all items  

```GET /api/v1/items/find_all?``` Returns all items with passed in parameters - id, name, description, unit_price(as decimal), merchant_id  

```GET /api/v1/Items/find?``` Returns the first Item with passed in parameters - id, name, description, unit_price(as decimal), merchant_id  

#### Transactions  

```GET /api/v1/transactions/:id``` Returns a single transaction with specific id  

```GET /api/v1/transactions/random``` Returns a single transaction at random  

```GET /api/v1/transactions``` Returns a collection of all transactions  

```GET /api/v1/transactions/find_all?``` Returns all transactions with passed in parameters - id, invoice_id, credit_card_number, result  

```GET /api/v1/transactions/find?``` Returns the first transaction with passed in parameters - id, invoice_id, credit_card_number, result  

#### Customers  

```GET /api/v1/customers/:id``` Returns a single customer with specific id  

```GET /api/v1/customers/random``` Returns a single customer at random  

```GET /api/v1/customers``` Returns a collection of all customers  

```GET /api/v1/customers/find_all?``` Returns all customers with passed in parameters - id, first_name, last_name  

```GET /api/v1/customers/find?``` Returns the first customer with passed in parameters - id, first_name, last_name  



### Relationship Endpoints


#### Merchants (https://rales-engine-8396.herokuapp.com/api/v1/merchants)
```GET /api/v1/merchants/:id/items``` Returns a collection of items associated with that merchant  

```GET /api/v1/merchants/:id/invoices``` Returns a collection of invoices associated with that merchant from their known orders  

#### Invoices (https://rales-engine-8396.herokuapp.com/api/v1/invoices)  

```GET /api/v1/invoices/:id/transactions``` Returns a collection of associated transactions  

```GET /api/v1/invoices/:id/invoice_items``` Returns a collection of associated invoice items  

```GET /api/v1/invoices/:id/items``` Returns a collection of associated items  

```GET /api/v1/invoices/:id/customer``` Returns the associated customer  

```GET /api/v1/invoices/:id/merchant``` Returns the associated merchant  

#### Invoice Items (https://rales-engine-8396.herokuapp.com/api/v1/invoice_items)
```GET /api/v1/invoice_items/:id/invoice``` Returns the associated invoice  

```GET /api/v1/invoice_items/:id/item``` Returns the associated item  

#### Items (https://rales-engine-8396.herokuapp.com/api/v1/items)
```GET /api/v1/items/:id/invoice_items``` Returns a collection of associated invoice items  

```GET /api/v1/items/:id/merchant``` Returns the associated merchant  

#### Transactions (https://rales-engine-8396.herokuapp.com/api/v1/transactions)  

```GET /api/v1/transactions/:id/invoice``` Returns the associated invoice  

#### Customers (https://rales-engine-8396.herokuapp.com/api/v1/customers)  

```GET /api/v1/customers/:id/invoices``` Returns a collection of associated invoices  

```GET /api/v1/customers/:id/transactions``` Returns a collection of associated transactions  


### Business Intelligence Endpoints

#### All Merchants (https://rales-engine-8396.herokuapp.com/api/v1/merchants)  

```GET /api/v1/merchants/most_revenue?quantity=x``` Returns the top x merchants ranked by total revenue  

```GET /api/v1/merchants/most_items?quantity=x``` Returns the top x merchants ranked by total number of items sold  

```GET /api/v1/merchants/revenue?date=x``` Returns the total revenue for date x across all merchants  


#### Single Merchant (https://rales-engine-8396.herokuapp.com/api/v1/merchants)  

```GET /api/v1/merchants/:id/revenue``` Returns the total revenue for that merchant across successful transactions  

```GET /api/v1/merchants/:id/revenue?date=x``` Returns the total revenue for that merchant for a specific invoice date x  

```GET /api/v1/merchants/:id/favorite_customer``` Returns the customer who has conducted the most total number of successful transactions.  

```GET /api/v1/merchants/:id/customers_with_pending_invoices``` Returns a collection of customers which have pending (unpaid) invoices 


#### All Items (https://rales-engine-8396.herokuapp.com/api/v1/items)  

```GET /api/v1/items/most_revenue?quantity=x``` Returns the top x items ranked by total revenue generated  

```GET /api/v1/items/most_items?quantity=x``` Returns the top x item instances ranked by total number sold  
  
#### Single Item (https://rales-engine-8396.herokuapp.com/api/v1/items/:id)

```GET /api/v1/items/:id/best_day``` Returns most recent date with the highest number of sales for a given item  

#### Single Customer (https://rales-engine-8396.herokuapp.com/api/v1/customers)  

```GET /api/v1/customers/:id/favorite_merchant``` Returns a merchant where the customer has conducted the most successful transactions  


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


### Relationship Endpoints


#### Merchants (https://rales-engine-.herokuapp.com/api/v1/merchants)
```GET /api/v1/merchants/:id/items``` Returns a collection of items associated with that merchant  

```GET /api/v1/merchants/:id/invoices``` Returns a collection of invoices associated with that merchant from their known orders  

#### Invoices (https://rales-engine-.herokuapp.com/api/v1/invoices)  

```GET /api/v1/invoices/:id/transactions``` Returns a collection of associated transactions  

```GET /api/v1/invoices/:id/invoice_items``` Returns a collection of associated invoice items  

```GET /api/v1/invoices/:id/items``` Returns a collection of associated items  

```GET /api/v1/invoices/:id/customer``` Returns the associated customer  

```GET /api/v1/invoices/:id/merchant``` Returns the associated merchant  

#### Invoice Items (https://rales-engine-.herokuapp.com/api/v1/invoice_items)
```GET /api/v1/invoice_items/:id/invoice``` Returns the associated invoice  

```GET /api/v1/invoice_items/:id/item``` Returns the associated item  

#### Items (https://rales-engine-.herokuapp.com/api/v1/items)
```GET /api/v1/items/:id/invoice_items``` Returns a collection of associated invoice items  

```GET /api/v1/items/:id/merchant``` Returns the associated merchant  

#### Transactions (https://rales-engine-.herokuapp.com/api/v1/transactions)  

```GET /api/v1/transactions/:id/invoice``` Returns the associated invoice  

#### Customers (https://rales-engine-.herokuapp.com/api/v1/customers)  

```GET /api/v1/customers/:id/invoices``` Returns a collection of associated invoices  

```GET /api/v1/customers/:id/transactions``` Returns a collection of associated transactions  


### Business Intelligence Endpoints

#### All Merchants (https://rales-engine-.herokuapp.com/api/v1/merchants)  

```GET /api/v1/merchants/most_revenue?quantity=x``` Returns the top x merchants ranked by total revenue  

```GET /api/v1/merchants/most_items?quantity=x``` Returns the top x merchants ranked by total number of items sold  

```GET /api/v1/merchants/revenue?date=x``` Returns the total revenue for date x across all merchants  


#### Single Merchant (https://rales-engine-.herokuapp.com/api/v1/merchants)  

```GET /api/v1/merchants/:id/revenue``` Returns the total revenue for that merchant across successful transactions  

```GET /api/v1/merchants/:id/revenue?date=x``` Returns the total revenue for that merchant for a specific invoice date x  

```GET /api/v1/merchants/:id/favorite_customer``` Returns the customer who has conducted the most total number of successful transactions.  

```GET /api/v1/merchants/:id/customers_with_pending_invoices``` Returns a collection of customers which have pending (unpaid) invoices 


#### All Items (https://rales-engine-.herokuapp.com/api/v1/items)  

```GET /api/v1/items/most_revenue?quantity=x``` Returns the top x items ranked by total revenue generated  

```GET /api/v1/items/most_items?quantity=x``` Returns the top x item instances ranked by total number sold  
  
#### Single Item (https://rales-engine-.herokuapp.com/api/v1/items/:id)

```GET /api/v1/items/:id/best_day``` Returns most recent date with the highest number of sales for a given item  

#### Single Customer (https://rales-engine-.herokuapp.com/api/v1/customers)  

```GET /api/v1/customers/:id/favorite_merchant``` Returns a merchant where the customer has conducted the most successful transactions  


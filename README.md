# Rales-Engine

Rales-Engine is a restful API built using ruby, rails, and active record. Company sales data was imported from multiple CSV files and seeded in the database. For each API route, the data was serialized to meet the project spec and then presented to the user in JSON format. (Scroll down to view all endpoints and links to API deployed on heroku.)

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
```GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant```  
```GET /api/v1/merchants/:id/invoices``` returns a collection of invoices associated with that merchant from their known orders
#### Invoices (https://rales-engine-.herokuapp.com/api/v1/invoices)  

```GET /api/v1/invoices/:id/transactions``` returns a collection of associated transactions  

```GET /api/v1/invoices/:id/invoice_items``` returns a collection of associated invoice items  

```GET /api/v1/invoices/:id/items``` returns a collection of associated items  

```GET /api/v1/invoices/:id/customer``` returns the associated customer  

```GET /api/v1/invoices/:id/merchant``` returns the associated merchant  

#### Invoice Items (https://rales-engine-.herokuapp.com/api/v1/invoice_items)
```GET /api/v1/invoice_items/:id/invoice``` returns the associated invoice  

```GET /api/v1/invoice_items/:id/item``` returns the associated item  

#### Items (https://rales-engine-.herokuapp.com/api/v1/items)
```GET /api/v1/items/:id/invoice_items``` returns a collection of associated invoice items  

```GET /api/v1/items/:id/merchant``` returns the associated merchant  

#### Transactions (https://rales-engine-.herokuapp.com/api/v1/transactions)
```GET /api/v1/transactions/:id/invoice``` returns the associated invoice  

#### Customers (https://rales-engine-.herokuapp.com/api/v1/customers)
```GET /api/v1/customers/:id/invoices``` returns a collection of associated invoices  

```GET /api/v1/customers/:id/transactions``` returns a collection of associated transactions  


### Business Intelligence Endpoints

#### All Merchants (https://rales-engine-.herokuapp.com/api/v1/merchants)
```GET /api/v1/merchants/most_revenue?quantity=x``` returns the top x merchants ranked by total revenue  

```GET /api/v1/merchants/most_items?quantity=x``` returns the top x merchants ranked by total number of items sold  

```GET /api/v1/merchants/revenue?date=x``` returns the total revenue for date x across all merchants  


#### Single Merchant (https://rales-engine-.herokuapp.com/api/v1/merchants)
```GET /api/v1/merchants/:id/revenue``` returns the total revenue for that merchant across successful transactions  

```GET /api/v1/merchants/:id/revenue?date=x``` returns the total revenue for that merchant for a specific invoice date x  

```GET /api/v1/merchants/:id/favorite_customer``` returns the customer who has conducted the most total number of successful transactions.  

```GET /api/v1/merchants/:id/customers_with_pending_invoices``` returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed.  


#### Items (https://rales-engine-.herokuapp.com/api/v1/items)
```GET /api/v1/items/most_revenue?quantity=x``` returns the top x items ranked by total revenue generated  

```GET /api/v1/items/most_items?quantity=x``` returns the top x item instances ranked by total number sold  

```GET /api/v1/items/:id/best_day``` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.  

#### Customers (https://rales-engine-.herokuapp.com/api/v1/customers)
```GET /api/v1/customers/:id/favorite_merchant``` returns a merchant where the customer has conducted the most successful transactions  

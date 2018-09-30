# Rales-Engine
[Project Spec](http://backend.turing.io/module3/projects/rails_engine "Project Spec")

Rales-Engine is a restful API built using ruby, rails, and active record. Company sales data was imported from multiple CSV files and seeded in the database. For each API path, the data was serialized and then presented in JSON format.  

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

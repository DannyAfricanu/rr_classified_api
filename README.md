===============================================================================
About
===============================================================================
This is my first attempt at a Ruby on Rails app. I played around for about a 
day, and this is what came out of it.

DISCLAIMER: this code is just what I learned after a day, not claiming to be a
Ruby/Rails expert by any means! :)

It's a simple REST api for classified ads, for details about what it does see 
the 'Run app' and 'Test app' sections.

Instructions in this file will work for sure on a clean install of Ubuntu 
16.04. This should be able to run on any computer that can run Rails 5 though, 
just make sure you have the necessary dependencies installed.


===============================================================================
Tested on
===============================================================================
Rails version: 5.0.0.1
Ruby version: 2.3.1 (x86_64-linux-gnu) 
OS: Ubuntu 16.04 AMD64


===============================================================================
Run app
===============================================================================


To run in dev mode:
____________________________________

cd <directory you extracted to>
sudo apt-get install ruby-dev libsqlite3-dev zlib1g-dev
sudo gem update
sudo gem install rails
./bin/bundle
./bin/rails s


Dev mode example urls:
____________________________________

all items: 
	http://127.0.0.1:3000/items

specific item: 
	http://127.0.0.1:3000/items/1

sold items for someone called 'seller': 
	http://127.0.0.1:3000/items/for_seller/seller/for_status/2

items in car category: 
	http://127.0.0.1:3000/items/for_category/0

items in clothing category: 
	http://127.0.0.1:3000/items/for_category/1

items in other category: 
	http://127.0.0.1:3000/items/for_category/2


===============================================================================
Test app
===============================================================================


To run tests:
____________________________________

cd <directory you extracted to>
sudo apt-get install ruby-dev libsqlite3-dev zlib1g-dev
sudo gem update
sudo gem install rails
./bin/bundle
./bin/rails test


Available tests:
____________________________________

- index should get cars category
- index should get clothing category
- index should get other category
- index should hide seller's name and published date for banned items
- should show sold items for seller
- categories should hide seller's name and published date for banned items
- specific item should hide seller's name and published date for banned items

Tests are in varagesaleapi/test/controllers/items_controller_test.rb

===============================================================================
Todo
===============================================================================

- normalize db.. code tables could be used for categories and statuses, seperate tables for submitters/items/etc
- throttling
- caching
- cross origin requests?
- learn more ruby syntax

# Problem Statement

Design a parking lot which can hold n cars of different color and different registration numbers.
Every car has been issued a ticket for a spot and the spot has been assigned based on the nearest entry point.

The system should also return some queries such as:

* Registration numbers of all cars of a particular Color.
* Ticket number in which a car with a given registration number is placed.
* Ticket numbers of all tickets where a car of a particular color is placed.

# This should be simple command line utility with minimum these capabilities
- create a parking lot
- park cars in it
- run the above specified queries

#### Run the application
1 Go to the folder after cloning the repo

``` cd parking_lot ```

2 Bundle install

``` bundle install ```

3 Run below command

``` ruby parking_app.rb ```

4 For running test cases

``` bundle exec rspec ```

5 For running specific spec

``` bundle exec rspec spec/application_lot_spec.rb ```
``` bundle exec rspec spec/parking_lot_spec.rb ```
``` bundle exec rspec spec/car_spec.rb ```

#
# Ruby

## Classes and Modules

1. Define class: 
``` Ruby
class Horse
end
```

2. Load a class:
``` Ruby
require './horse.rb'
```

3. View methods
``` Ruby 
Horse.methods.sort
=> [:!, :!=, ... list of class methods ...]
my_horse = Horse.new
my_horse.methods.sort
=> [:!, :!=, ... list of instance methods ...]
```

4. Instance method: 
> An instance method is a method that is defined so that individual instances of the class can make use of it. Think of each User's email address. 

5. Class method:
> A class method is something defined on the class itself that interacts with the whole class of things. Think about the most_recent method that we defined on the Idea class previously.

6.  Class and instance method example
``` Ruby
class Horse
  def speak!
    'Neigh!'
  end

  def self.herd_of_horses
    [Horse.new, Horse.new, Horse.new]
  end
end
```
7. Class signature.  Initialize:
``` Ruby
 def initialize(name)
    @name = name
  end
```
``` Ruby
horse = Horse.new('Shadowfax')
```
8. Module: contains a set of method definitions
``` Ruby
module Sleeps
  def go_to_sleep!
    @sleeping = true
  end

  def wake_up!
    @sleeping = false
  end
end
``` 

9. To mix in a module into a class: 
..* We use the require method to load the module file at the top of the class file outside of the class definition. This is just to load the file containing the module.
..* Then use the include method within the class definition to include all of the module methods in the class. This is what actually adds the methods defined in the module to the class definition.

``` Ruby
require './sleeps'

class Horse
  include Sleeps

end
```

## Conditionals

1. if - else

``` Ruby
if(animal.kind_of? Duck)
  food = 'Pond weed'
else
  food = 'No idea for this animal.  Probably bread'
end
```

2. elsif

``` Ruby
if(animal.kind_of? Duck)
  food = 'Pond weed'
elsif(animal.kind_of? Horse)
  food = 'Hay'
elsif(animals.kind_of? Dog)
  food = 'Peanut butter'
else
  food = 'No idea for this animal.  Probably bread'
end
```

3. Case statements

``` Ruby
case(animal)
  when Horse
    food = 'Hay'
  when Duck
    food = 'Pond weed'
  when Dog
    food = 'Peanut butter'
  else
    food = 'No idea for this animal.  Probably bread'
  end
```

4. Alternative format for case statement

``` Ruby
food = case(animal)
  when Horse    then 'Hay'
  when Duck     then 'Pond weed'
  when Dog      then 'Peanut butter'
  else 'No idea for this animal.  Probably bread'
  end
```

5. Single line conditionals and assignment to a variable

``` Ruby
class AnimalFarm
  def welcome(animal)
    @animals = [] if @animals.nil?

    @animals << animal
  end
end
```

## Inline blocks

1. Blocks
``` Ruby
array.each do |item|
  puts item
end
```

2. Inline block

``` Ruby
array.each {|item| puts item }

```

3. Use with each method
``` Ruby
  def noisy!
    @animals = [] if @animals.nil?
    @animals.each {|animal| puts animal.speak! }
  end
```

4. Map/reduce
``` Ruby
  def number_of_ducks
    @animals.count {|animal| animal.kind_of? Duck }
  end
```

## Numbers

1. Useful methods on floats
..* round
..* floor
..* ceil

2. Constants:  KILOMETERS
All caps

## Dates and times

1. Current time
``` Ruby
currently = Time.now
=> 2018-01-23 11:40:02 +0200
```

2. You can change a time instance with addition
``` Ruby
currently + 1
=> 2018-01-23 11:40:03 +0200
THIRTY_MINUTES = 60 * 30
currently + THIRTY_MINUTES
=> 2018-01-23 12:10:02 +0200
```

3. Time.new required passing values for year, month, day, hour, minute, second, and timezone offset.
``` Ruby
Time.new 2018, 6, 3, 14, 35, 9
=> 2018-06-03 14:35:09 +0200
Time.new 2018, 6, 3, 14
=> 2018-06-03 14:00:00 +0200
Time.new 2018, 6
=> 2018-06-01 00:00:00 +0200
```

4. Time.new == Time.now  assuming no parameters

5. You can get a timecode as an integer representing the number of seconds since 1970
``` Ruby
date_1 = Time.new 2005, 12, 13, 0, 0, 0, 0 # First public release of the Ruby on Rails framework
date_1.to_i
=> 1134432000
date_2 = Time.new 2000, 1, 1, 0, 0, 0, 0   # Midnight at the turn of the 21st century
date_2.to_i
=> 946684800
date_3 = Time.new 1979, 10, 15, 0, 0, 0, 0 # DHH's birthday
date_3.to_i
=> 308793600
date_4 = Time.new 1970, 1, 1, 0, 0, 0, 0   # The UNIX epoch date
date_4.to_i
=> 0
```

6. We can produce a date from a timestamp
``` Ruby
firefox_release_date = Time.new 2002, 9, 23, 0, 0, 0, 0 # First release of the Firefox browser in UTC
=> 2002-09-23 00:00:00 +0000
timestamp = firefox_release_date.to_i
=> 1032739200
Time.at timestamp
=> 2002-09-23 02:00:00 +0200
```

7. Convenience methods on time
 ``` Ruby
currently = Time.now
=> 2018-01-23 11:40:02 +0200
currently + 4.years
=> 2022-01-23 11:40:02 +0200
currently + 90.minutes
=> 2018-01-23 13:10:02 +0200
currently + 3.5.hours
=> 2018-01-23 14:10:02 +0200
```

## Formatting Time and numbers

1. Time.strftime

``` Ruby
ruby_release_date = Time.new(1995, 12, 25, 19, 15, 23, 9 * 60 * 60)

ruby_release_date.strftime("%l o'clock")
=> " 7 o'clock"

ruby_release_date.strftime("%S seconds after %H:%M")
=> "23 seconds after 19:15"

ruby_release_date.strftime("Ruby was released %j days into the year %Y... ")
=> "Ruby was released 359 days into the year 1995"

ruby_release_date.strftime(" ... which was a %A")
=> " ... which was a Monday"

ruby_release_date.strftime("%a %d %B '%y, at %i:%M%P and %S seconds, UTC+%z")
=> "Mon 25 December '95, at  7:15pm and 23 seconds, UTC+0900"
```

2. time_ago_in_words  

``` Ruby
include ActionView::Helpers::DateHelper

five_seconds_ago = Time.now - 5.seconds
time_ago_in_words(five_seconds_ago)
=> "less than a minute"
five_minutes_and_twenty_seconds_ago = Time.now - (5*60 + 20).seconds
time_ago_in_words(five_minutes_and_twenty_seconds_ago)
=> "5 minutes"
almost_one_day_ago = Time.now - 23.hours
time_ago_in_words(almost_one_day_ago)
=> "about 23 hours"
```

3. format function
``` Ruby
price = 4
=> 4
format("%.f", price)
=> "4"
format("%.1f", price)
=> "4.0"
format("%.2f", price)
=> "4.00"
format("%.3f", price)
=> "4.000"
format("%.2f€", price)
=> "4.00€"
format("£%.2f", price)
=> "£4.00"
format("$%.2f", price)
=> "$4.00"
```

## Or-equals

1. ||=
``` Ruby
//check if a value is nil and if it is, perform the assignment.  Otherwise leave it alone
@variable ||= 0
```

## Implementing passwords

1. Add bcrypt to our Gemfile
``` Ruby
 gem 'bcrypt'
```

``` Ruby
bundle install
```

2.  add password field that must be named password_digest
``` Ruby
rails generate migration AddPasswordDigestToUser password_digest:string
```

3. Add has_secure_password to User class
``` Ruby
class User < ApplicationRecord

  has_secure_password

end
```

4.Ensure unique password

``` Ruby
class User < Application Record

  validates :email, uniqueness: true

end
```

5. Within the form ensure the input field is of type="password".  To ensure ruby creates a field of this type use the password_field helper method.
``` Ruby
  <%= form_for(@user) do |form| %>
    <div class="input-group">
      <%= form.label(:email, class: 'input-group__label') %>
      <%= form.text_field(:email, class: 'input-group__field', placeholder: 'e.g. me@epfl.ch') %>
    </div>
    <div class="input-group">
      <%= form.label(:password, class: 'input-group__label') %>
      <%= form.password_field(:password, class: 'input-group__field') %>
    </div>
    <div class="prompt">
      <%= form.submit('Log in', class: 'btn btn--primary prompt__confirm') %>
    </div>
  <% end %>
```

6. Add the :password attribute to the strong parameters in UsersController.  

``` Ruby
class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if(@user.save)
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
```

7. Displaying error messages
``` Ruby
  <% if(@user.errors.any?) %>
    <div class="alert alert--wide">
      <%= @user.errors.full_messages.join('<br />').html_safe %>
    </div>
  <% end %>
  <%= form_for(@user) do |form| %>
    <div class="input-group">
      <%= form.label(:email, class: 'input-group__label') %>
```


**Fetching the first even entries from the TODO API** 

### Steps to setup
#NOTE- Make sure latest ruby version 3 should be installed in the system

   The first step is clone the repository and cd to the first_even_entries folder and run the dependency by following command 

    bundle install

To make it command line executable test file run the permission as follows

    chmod +x  test_find_first_even_entries.rb

To run the test file using following command

    ./test_find_first_even_entries.rb

Similarly make the command line executable file for actual code file `find_first_even_entries.rb`

    chmod +x  find_first_even_entries.rb

Run the main code by fetching first 20 even entries of TODO API as following

    ./find_first_even_entries.rb 20 '["https://jsonplaceholder.typicode.com/todos/1","https://jsonplaceholder.typicode.com/todos/2", "https://jsonplaceholder.typicode.com/todos/4"]'

>Note: first argument is limit i,e 20 and second argument is array of strings. 


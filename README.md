# SP_Tech_Challenge
  Write a ruby script that:
> a)Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log.

> b) Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc...







## Technologies:

* Ruby 3.0.2 
* Rspec


### Setup

Navigate to directory where the code script is located

```sh
$ cd ~/SP_Test/ruby_app
```
Install the dependencies and devDependencies.

```sh
$ rvm use 3.0.2
````
````
$ gem install rspec
````
```
$ bundle install
```

### Steps to run Script

Run the script by passing name of log file in my case its webserver.log
```sh
$ ruby ./print_report.rb webserver.log
```

### Steps for Testing Script

Navigate to directory where the code script is located

```sh
$ cd /SP_Test/ruby_app
```
Run the all test files as follows:
```sh
$ rspec spec/lib/*
```



### Code:

The script is developed by following basic ruby OOP.  I have created 2 classes. LogFileParser ie log_file_parser.rb is created as the main class and for now, it has the responsibility to validate a log. and to parse only a .log file. ReportGenerator class has been assigned responsibility for generating the report for logs.

As far as log_file_parser is concerned, the "parse_file" method is implemented in which I have avoided using each loop with readlines  and used while loop for improving performance ie less use of memory because it avoids the loading of logs in one go which causes more usage of memory and exerts pressure on GC(garbage collector). And then the file is closed using the file. close after the parsing is finished to avoid memory leakage.

All the code is implemented by following the Test Driven Development approach(TDD) using RSpec . 

### Scope for improvements:

The LogFileParser class can be improved for handling multiple file format currently not done implementation and multiple file formats can handled by extending it by creating classes for respective file extensions .




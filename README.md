[![Build Status](https://travis-ci.org/octopusinvitro/morphio-scraper-australian-parliament.svg?branch=master)](https://travis-ci.org/octopusinvitro/morphio-scraper-australian-parliament)
[![build status](https://gitlab.com/me-stevens/morphio-scraper-australian-parliament/badges/master/build.svg)](https://gitlab.com/me-stevens/morphio-scraper-australian-parliament/commits/master)


# Morph.io scraper :: Australian parliament

This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)

This version follows [this tutorial](https://www.openaustraliafoundation.org.au/tag/ruby-web-scraping-tutorial-on-morph-io/), **but using tests instead**. It is a template for a Ruby scraper on morph.io (https://morph.io)
including some code snippets below that you should find helpful.

You don't have to do things with the Mechanize or ScraperWiki libraries.
You can use whatever gems you want: [https://morph.io/documentation/ruby](https://morph.io/documentation/ruby).
All that matters is that your final data is written to an SQLite database
called "data.sqlite" in the current working directory which has at least a table
called "data".

Scrapers on morph.io use [the ScraperWiki library](https://github.com/openaustralia/scraperwiki-ruby/tree/morph_defaults) to save data to a SQLite database. This is how all data in morph.io is stored. Each scraper page provides options to download the SQLite database, a CSV file of each table, or access the data via [an API](https://morph.io/documentation/api).


## Getting started

[Create a new scraper on morph.io](https://morph.io/scrapers/new). This will create a new repository in your GitHub account. Git clone it in your computer and update it with your code.


## How to use this project

This is a Ruby project.
You will need to tell your favourite Ruby version manager to set your local Ruby version to the one specified in the `.ruby-version` file.

For example, if you are using [rbenv](https://cbednarski.com/articles/installing-ruby/):

1. Install the right Ruby version:
```bash
$ rbenv install < VERSION >
$ rbenv rehash
```
1. Move to the root directory of this project and type:
```bash
$ rbenv local < VERSION >
$ ruby -v
```

You will also need to install the `bundler` gem, which will allow you to install the rest of the dependencies listed in the `Gemfile` file of this project.

```bash
$ gem install bundler
$ rbenv rehash
```


### Folder structure

* `lib `: Sources
* `spec`: Tests


### To initialise the project

```bash
$ bundle install
$ bundle exec rake
```


### To run the tests

Serve the fixtures with your favorite server at localhost, for example:

```bash
$ ruby -run -e httpd -- -p 4000 spec/fixtures
```

and then run the tests:

```bash
$ bundle exec rspec
```

In the tests, the test url points to a page served by a local server that has a pagination of three pages with 50 members in each page.

**Caveat:** Because the `ScraperWiki` gem doesn't allow to choose where to save the database file or how to name it, it will always produce a `data.sqlite` file in the root directory when the tests are run and when the production code is run. I have to find a way to mock the `ScraperWiki` module, but for now I am using the ugly workaround:

```ruby
after(:all) do
  `rm data.sqlite`
end
```

and renaming the database file after running the production code:

```ruby
p `bin/app && mv data.sqlite members.sqlite`
```

This is ugly and doesn't really solve the problem, so it has to dissappear.


### To run the app

```bash
$ bundle exec ruby scraper.rb
```


### To open the created database in SQLite

First make sure you have [SQLite](https://www.sqlite.org/index.html) installed in your system:

```bash
$ sqlite3
SQLite version 3.8.2 2013-12-06 14:53:30
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> .exit
$
```

or [install it for your OS](http://www.tutorialspoint.com/sqlite/sqlite_installation.htm). Then, open the file and type some SQL statements:

```bash
$ sqlite3 members.sqlite
SQLite version 3.8.2 2013-12-06 14:53:30
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> SELECT count(*) FROM data;
150
sqlite> SELECT * FROM data;
...
```


### To run the scraper on morph.io

When you are finished, push your changes up to your remote GitHub repository and go to [https://morph.io](https://morph.io). Find your scraper and click "Run scraper". You can set your scraper to auto-run daily on your scraper's settings page so it's stays up to date with any changes


## License

[![License](https://img.shields.io/badge/gnu-license-green.svg?style=flat)](https://opensource.org/licenses/GPL-2.0)
GNU License

[![Build Status](https://travis-ci.org/octopusinvitro/morphio-scraper-australian-parliament.svg?branch=master)](https://travis-ci.org/octopusinvitro/morphio-scraper-australian-parliament)
[![build status](https://gitlab.com/me-stevens/morphio-scraper-australian-parliament/badges/master/build.svg)](https://gitlab.com/me-stevens/morphio-scraper-australian-parliament/commits/master)


# Morph.io scraper :: Australian parlamient

This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)

This version follows [this tutorial](https://www.openaustraliafoundation.org.au/tag/ruby-web-scraping-tutorial-on-morph-io/), **but using tests instead**.


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

Serve the fixtures with your favorite server at localhost and then:

```bash
$ bundle exec rspec
```

In the tests, the test url points to a page served by a local server that has a pagination of three pages with 50 members in each page.


### To run the app


```bash
$ bundle exec ruby scraper.rb
```


## License

[![License](https://img.shields.io/badge/gnu-license-green.svg?style=flat)](https://opensource.org/licenses/GPL-2.0)
GNU License

# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new
url   = 'https://morph.io/documentation/examples/australian_members_of_parliament'
page  = agent.get(url)

member = {
  title:      page.at('.title').at('a').inner_text,
  electorate: page.search('dd')[0].inner_text << ", " <<
              page.search('dd')[1].inner_text,
  url:        page.at('.title a').attr('href')
}

p member

#
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".

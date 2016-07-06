class ScraperCore

  def initialize(page)
    @page = page
  end

  def member
    {
      title:      page.at('.title').at('a').inner_text,
      electorate: page.search('dd')[0].inner_text << ", " <<
                  page.search('dd')[1].inner_text,
      url:        page.at('.title a').attr('href')
    }
  end

  private

  attr_reader :page

end

class ScraperCore

  def initialize(page)
    @page = page
  end

  def member_at(index)
    all_members[index]
  end

  def all_members
    page.at('.search-filter-results').search('li').map { |li|
      member_structure(li)
    }
  end

  private

  attr_reader :page

  def member_structure(li)
    {
      title:      li.at('.title a').inner_text,
      electorate: li.search('dd')[0].inner_text,
      party:      li.search('dd')[1].inner_text,
      url:        li.at('.title a').attr('href')
    }
  end

end

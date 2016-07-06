class PageScraper

  def member_at(index, page)
    all_members(page)[index]
  end

  def all_members(page)
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

class PageScraper

  def member_at(index, page)
    all_members_in(page)[index]
  end

  def all_members_in(page)
    page.at(".search-filter-results").search("li").map { |li|
      member_structure(li)
    }
  end

  def total_pages_in(page)
    last = last_link(page)
    last.nil? ? 1 : page_number_from(last)
  end

  private

  attr_reader :page

  def member_structure(li)
    {
      title:      li.at(".title a").inner_text,
      electorate: li.search("dd")[0].inner_text,
      party:      li.search("dd")[1].inner_text,
      url:        li.at(".title a").attr("href")
    }
  end

  def last_link(page)
    page.at(".results-pagination").search("li a").select { |a|
      is_pagination_link_and_last_link?(a)
    }.first
  end

  def is_pagination_link_and_last_link?(a)
    a.attr("href").include?("?page=") && a.inner_text.downcase.include?("last")
  end

  def page_number_from(a)
    a.attr("href").split("=").last.to_i
  end

end

class Paginator

  def initialize(fetcher, scraper)
    @fetcher = fetcher
    @scraper = scraper
  end

  def members_from_pages(page_url, pages)
    (1..last_page_in(page_url, pages)).map { |page_number|
      all_members_in(page_at(url(page_url, page_number)))
    }.flatten
  end

  private

  attr_reader :scraper, :fetcher

  def last_page_in(page_url, pages)
    total = total_pages_in(page_at(page_url))
    (pages > total) ? total : pages
  end

  def total_pages_in(page)
    scraper.total_pages_in(page)
  end

  def all_members_in(page)
    scraper.all_members_in(page)
  end

  def page_at(url)
    fetcher.page_at(url)
  end

  def url(page_url, page_number)
    page_url + "?page=" + page_number.to_s
  end

end

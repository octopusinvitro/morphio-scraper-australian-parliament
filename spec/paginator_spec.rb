describe "Paginator" do

  let(:paginator) {Paginator.new(PageFetcher.new, PageScraper.new)}

  it "runs page scraper for 1 page" do
    expect_total_members_from_pages(1, 50)
  end

  it "runs page scraper for 2 pages" do
    expect_total_members_from_pages(2, 100)
  end

  it "runs page scraper for 3 pages" do
    expect_total_members_from_pages(3, 150)
  end

  it "runs page scraper for the total pages if bigger number is supplied" do
    expect_total_members_from_pages(4, 150)
  end

  def expect_total_members_from_pages(pages, total_members)
    expect(paginator.members_from_pages(TEST_URL, pages).size).to eq(total_members)
  end

end

describe("PageScraper") do

  let(:scraper) {PageScraper.new}
  let(:page)    {page_at(TEST_URL)}

  describe "when there are search results" do
    it "finds the title of a member" do
      expect_field_to_be(:title, "The Hon Ian Macfarlane MP")
    end

    it "finds the electorate of a member" do
      expect_field_to_be(:electorate, "Groom, Queensland")
    end

    it "finds the party of a member" do
      expect_field_to_be(:party, "Liberal Party of Australia")
    end

    it "finds the url of a member" do
      expect_field_to_be(:url, "http://www.aph.gov.au/Senators_and_Members/Parliamentarian?MPID=WN6")
    end

    it "reads all the members" do
      expect(scraper.all_members_in(page).size).to eq(50)
    end

    def expect_field_to_be(field, value)
      expect(scraper.member_at(0, page)[field]).to eq(value)
    end
  end

  describe "when there is pagination" do
    it "finds the total number of pages" do
      expect(scraper.total_pages_in(page)).to eq(3)
    end

    it "detects single page if there are no pagination links" do
      page = page_at("#{TEST_URL}/nopaginationlinks.html")
      expect(scraper.total_pages_in(page)).to eq(1)
    end

    it "needs a link to the last page to find the total pages" do
      page = page_at("#{TEST_URL}/nolinktolastpage.html")
      expect(scraper.total_pages_in(page)).to eq(1)
    end
  end

  def page_at(url)
    PageFetcher.new.page_at(url)
  end

end

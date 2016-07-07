describe "PageFetcher" do

  it "returns a page" do
    fetcher = PageFetcher.new
    expect(fetcher.page_at(TEST_URL).class).to be(Mechanize::Page)
  end

end

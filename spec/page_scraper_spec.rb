require 'mechanize'
require 'page_scraper'

describe("PageScraper") do

  let(:page_scraper) {PageScraper.new}
  let(:page)         {Mechanize.new.get(TEST_URL)}

  it "returns the title of a member" do
    expect(page_scraper.member_at(0, page)[:title]).to eq("The Hon Ian Macfarlane MP")
  end

  it "returns the electorate of a member" do
    expect(page_scraper.member_at(0, page)[:electorate]).to eq("Groom, Queensland")
  end

  it "returns the party of a member" do
    expect(page_scraper.member_at(0, page)[:party]).to eq("Liberal Party of Australia")
  end

  it "returns the url of a member" do
    expect(page_scraper.member_at(0, page)[:url]).to eq("http://www.aph.gov.au/Senators_and_Members/Parliamentarian?MPID=WN6")
  end

  it "reads all the members" do
    expect(page_scraper.all_members(page).size).to eq(50)
  end
end

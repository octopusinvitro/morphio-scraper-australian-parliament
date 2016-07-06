require 'mechanize'
require 'page_scraper'

describe("PageScraper") do

  let(:scraper_core) {PageScraper.new(Mechanize.new.get("http://localhost:4000"))}

  it "returns the title of a member" do
    expect(scraper_core.member_at(0)[:title]).to eq("The Hon Ian Macfarlane MP")
  end

  it "returns the electorate of a member" do
    expect(scraper_core.member_at(0)[:electorate]).to eq("Groom, Queensland")
  end

  it "returns the party of a member" do
    expect(scraper_core.member_at(0)[:party]).to eq("Liberal Party of Australia")
  end

  it "returns the url of a member" do
    expect(scraper_core.member_at(0)[:url]).to eq("http://www.aph.gov.au/Senators_and_Members/Parliamentarian?MPID=WN6")
  end

  it "reads all the members" do
    expect(scraper_core.all_members.size).to eq(50)
  end
end

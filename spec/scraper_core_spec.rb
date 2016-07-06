require 'mechanize'
require 'scraper_core'

describe("ScraperCore") do

  let(:scraper_core) {ScraperCore.new(Mechanize.new.get("http://localhost:4000"))}

  it "returns the title of a member" do
    expect(scraper_core.member[:title]).to eq("The Hon Ian Macfarlane MP")
  end

  it "returns the electorate of a member" do
    expect(scraper_core.member[:electorate]).to eq("Groom, Queensland, Liberal Party of Australia")
  end

  it "returns the url of a member" do
    expect(scraper_core.member[:url]).to eq("http://www.aph.gov.au/Senators_and_Members/Parliamentarian?MPID=WN6")
  end

end

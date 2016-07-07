class PageFetcher

  def initialize(agent = Mechanize.new)
    @agent = agent
  end

  def page_at(url)
    agent.get(url)
  end

  private

  attr_reader :agent

end

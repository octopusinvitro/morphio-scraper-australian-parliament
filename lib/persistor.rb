class Persistor

  def initialize(wiki = ScraperWiki)
    @wiki = wiki
  end

  def save_member(member)
    wiki.save_sqlite([:title], member)
  end

  def save_all(members)
    members.map { |member|
      save_member(member)
    }
  end

  private

  attr_reader :wiki

end

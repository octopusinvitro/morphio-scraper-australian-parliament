describe "Persistor" do

  let(:persistor) {Persistor.new}
  let(:db)        {SQLite3::Database.new("data.sqlite")}

  after(:each) do
    db.execute("DROP table data")
  end

  after(:all) do
    `rm data.sqlite`
  end

  it "saves the right structure" do
    persistor.save_member(member)
    metadata = db.prepare(all_members)
    expect(metadata.columns).to eq(member_keys)
    expect(metadata.column_count).to eq(member_keys.size)
  end

  it "saves one member" do
    persistor.save_member(member)
    expect_size_to_eq(1)
  end

  it "doesn't add a member if it has the same id as other" do
    persistor.save_member(member)
    persistor.save_member(member)
    expect_size_to_eq(1)
  end

  it "saves all members" do
    persistor.save_all(members)
    expect_size_to_eq(50)
  end

  it "selects all with a certain attribute" do
    persistor.save_all(members)
    expect(persistor.all_with("party", "The Nationals").size).to eq(4)
  end

  def member
    {
      title:      "title",
      electorate: "electorate",
      party:      "party",
      url:        "url"
    }
  end

  def member_keys
    member.keys.map {|key| key.to_s}
  end

  def members
    Members.first_page
  end

  def expect_size_to_eq(size)
    expect(db.execute(all_members).size).to eq(size)
  end

  def all_members
    "SELECT * FROM data"
  end

end

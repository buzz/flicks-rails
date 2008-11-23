require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImdbEntry do
  before(:each) do
    @valid_attributes = {:imdb_number => rand(9999999)}
  end

  it "should create a new instance given valid attributes" do
    ImdbEntry.create!(@valid_attributes)
  end
  
  it "should find a remote title" do
    results = ImdbEntry.remote_find_title("Once Upon a Time in America")
    results.should have_at_least(1).items
  end

  it "should find a specific movie by title" do
    results = ImdbEntry.remote_find_title("Once Upon a Time in America")
    results.should include({:year=>"1984", :title=>"Once Upon a Time in America", :id=>87843})
  end

  it "should return the correct coverage" do
    m1 = Movie.new(:title => 'movie 1')
    m1.save
    m2 = Movie.new(:title => 'movie 2')
    m2.save
    entry = ImdbEntry.new(:imdb_number => '555')
    if entry.save!
      m3 = Movie.new(:title => 'movie 3', :imdb_entry => entry)
      m3.save
    end
    ImdbEntry.coverage.should be_close(ImdbEntry.count(:all).to_f / Movie.count(:all).to_f, 0.00001)
    [m1, m2, m3, entry].each do |e|
      e.destroy
    end
  end
end

describe ImdbEntry, '.imdb_sync' do
  before(:all) do
    @entry = ImdbEntry.create!({:imdb_number => rand(9999999)})
    @entry.imdb_sync
  end

  it "should synchronize the titles"

  it "should synchronize the languages"

  it "should synchronize the genres"

  after(:all) do
    @entry.destroy
  end
end

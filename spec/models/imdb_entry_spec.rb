require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImdbEntry do
  before(:each) do
    @valid_attributes = {
      :imdb_number => 87843
    }
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
    Movie.new.save!
    Movie.new.save!
    entry = ImdbEntry.new :imdb_number => '555'
    entry.save!
    movie = Movie.new :imdb_entry => entry
    movie.save!
    ImdbEntry.coverage.should be_close(0.33333, 0.00001)
  end

  it "should synchronize the titles"
  
  it "should synchronize with a remote entry"
  
end

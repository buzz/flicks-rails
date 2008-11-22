require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Genre do
  before(:each) do
    @valid_attributes = {
      :name => 'Action'
    }
  end

  it "should create a new instance given valid attributes" do
    Genre.create!(@valid_attributes)
  end
  
end

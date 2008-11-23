require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Language do
  before(:each) do
    @valid_attributes = {
      :name => 'japanese'
    }
  end

  it "should create a new instance given valid attributes" do
    Language.create!(@valid_attributes)
  end
  
  it "should fail without name" do 
    Language.create.should have(2).error_on(:name)
  end

  it "should fail with non-lowercase name" do
    Language.create(:name => 'Spanish').should have(1).error_on(:name)
  end
end

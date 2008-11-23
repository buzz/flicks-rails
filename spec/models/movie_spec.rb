require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Movie do
  fixtures :languages
  
  before(:each) do
    @movie = Movie.new
    @lang = {
      :german => Language.find_by_name('german'),
      :english => Language.find_by_name('english')
    }
  end
  
  it "should assign an audio language by string" do
    @movie.assign_audio_language('swahili')
    @movie.audio_languages.should include(Language.find_by_name('swahili'))
  end

  it "should assign an audio language" do
    @movie.assign_audio_language(@lang[:german])
    @movie.audio_languages.should include(@lang[:german])
  end

  it "should assign a subtitles language by string" do
    @movie.assign_subtitles_language('swahili')
    @movie.subtitles_languages.should include(Language.find_by_name('swahili'))
  end

  it "should assign a subtitles language" do
    @movie.assign_subtitles_language(@lang[:german])
    @movie.subtitles_languages.should include(@lang[:german])
  end
  
  after(:each) do
    @movie.destroy
  end
end

describe Movie, '.import_from_amc_xml' do
  before(:each) do
    @movies = Movie.import_from_amc_xml(File.open(File.join(File.dirname(__FILE__), '..', 'fixtures', 'movies.xml')).read)
    @lang = {
      :german => Language.find_by_name('german'),
      :english => Language.find_by_name('english')
    }
  end

  it "should import title" do
    @movies.first.title.should == 'Donnie Darko'
    @movies[1].title.should == 'Pirates of Silicon Valley'
    @movies[2].title.should == 'THX 1138'
  end

  it "should import imdb number" do
    @movies.first.imdb_entry.imdb_number.should be(246578)
    @movies[1].imdb_entry.imdb_number.should be(168122)
    @movies[2].imdb_entry.imdb_number.should be(66434)
  end

  it "should import video format" do
    @movies.first.video_format.should == 'divx'
    @movies[1].video_format.should be(nil)
    @movies[2].video_format.should be(nil)
  end
  
  it "should import audio format" do
    @movies.first.audio_format.should == 'mp3'
    @movies[1].audio_format.should be(nil)
    @movies[2].audio_format.should be(nil)
  end
  
  it "should import movie languages" do
    @movies.first.audio_languages.should include(@lang[:german])
    @movies.first.audio_languages.should include(@lang[:english])
    @movies[1].audio_languages.should include(@lang[:english])
    @movies[2].audio_languages.should include(@lang[:english])
  end

  it "should import subtitle languages" do
    @movies.first.subtitles_languages.should be_empty
    @movies[1].subtitles_languages.should include(@lang[:english])
    @movies[2].subtitles_languages.should include(@lang[:english])
    @movies[2].subtitles_languages.should include(@lang[:german])
  end

  it "should import disk id" do
    @movies.first.disk_id.should be(1)
    @movies[1].disk_id.should be(2)
    @movies[2].disk_id.should be(3)
  end
    
  it "should import disks" do
    @movies.first.disks.should be(2)
    @movies[1].disks.should be(nil)
    @movies[2].disks.should be(nil)
  end

  it "should import releaser" do
    @movies.first.releaser.should == 'ViTE'
    @movies[1].releaser.should be(nil)
    @movies[2].releaser.should be(nil)
  end
  
  after(:each) do
    @movies.each do |m|
      m.destroy
    end
  end
end

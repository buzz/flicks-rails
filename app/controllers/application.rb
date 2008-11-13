require 'alreves_controller'

class ApplicationController < AlrevesController
  helper :all
  protect_from_forgery

  def alreves_init
    super
    @components.first.data.merge! :menu => [{:name => 'Movies', :url => 'movies'},
                                            {:name => 'Search', :url => 'movies/search'},
                                            {:name => 'IMDb', :url => 'imdb_entries'},
                                            {:name => 'Stats', :url => 'stats'}]
  end
end

class StatsController < ApplicationController
  def index
    @components.push(Component.new(:dest => '#content', :template_name => 'stats/index',
                                   :data => {:movie_count => Movie.count(:all),
                                     :imdb_entry_count => ImdbEntry.count(:all),
                                     :imdb_coverage => ImdbEntry.coverage}))
  end
end

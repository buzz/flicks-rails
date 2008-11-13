class ImdbEntriesController < ApplicationController
  def index
    @components.push(Component.new(:dest => '#content', :template_name => 'imdb_entries/index'))
  end
end

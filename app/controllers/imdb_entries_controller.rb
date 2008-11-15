class ImdbEntriesController < ApplicationController
  def index
    @components.push(Component.new(:dest => '#content',
                                   :template_name => 'imdb_entries/index'))
  end

  def find_remote
    imdb_entries = {}
    if !params[:imdb_number].nil?
      imdb_entries = ImdbEntry.remote_find_id(params[:imdb_number].strip)
    else !params[:title].nil?
      imdb_entries = ImdbEntry.remote_find_title(params[:title].strip)
    end
    @components << Component.new(:dest => '#movie_results',
                                 :template_name => 'imdb_entries/results',
                                 :data => {:imdb_entries => imdb_entries})
  end
end

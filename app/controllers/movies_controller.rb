class MoviesController < ApplicationController
  def index
    @components.push(Component.new(:dest => '#content', :template_name => 'movies/index',
                                   :data => {:movies => {:data => Movie.find(:all),
                                       :json_opts => {:include => [:imdb_entry]}}}))
  end

  def search
    @components.push(Component.new(:dest => '#content', :template_name => 'movies/search'))
  end

  def show
    @components.push Component.new(:dest => '#movie_main',
                                   :template_name => 'movies/details',
                                   :data => {:movie => Movie.find(params[:id])})
  end

  def new
    @components.push(Component.new(:dest => '#movie_main',
                                   :template_name => "movies/new"))
  end

  def edit
    @movie = Movie.find(params[:id]).to_json(:only => [:id, :name])
    @components.push(Component.new(:dest => '#control', :template_name => "movies/edit", :data => {:movie => @movie}))
  end

  def create
    if !params[:movie].nil?
      @movie = Movie.new(params[:movie])
    elsif !params[:imdb_number].nil?
      @movie = Movie.new(:imdb_entry => ImdbEntry.new(:imdb_number => params[:imdb_number]))
    else
      redirect :back
    end
    if @movie.save
      @client_actions << "$.alreves.loadURL('imdb_entries/#{@movie.imdb_entry.id}');"
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      @client_actions << "$.alreves.loadURL('movies/#{@movie.id}');"
    else
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to :controller => 'movies', :action => 'index'
  end
end

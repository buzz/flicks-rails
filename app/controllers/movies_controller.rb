class MoviesController < ApplicationController
  def index
    @components.push(Component.new(:dest => '#content', :template_name => 'movies/index'))
  end

  def list
    @components.push Component.new(:dest => '#movie_list', :template_name => 'movies/list',
                                   :data => {
                                     :movies => {
                                       :data => Movie.find(:all, :order => 'id DESC'),
                                       :json_opts => {:only => [:id, :title]}}})

  end

  def search
    @components.push(Component.new(:dest => '#content', :template_name => 'movies/search'))
  end

  def show
    @components.push Component.new(:dest => '#movie_details', :template_name => 'movies/details',
                                   :data => {:movie => Movie.find(params[:id])})
  end

  def new
    @components.push(Component.new(:dest => '#control', :template_name => "movies/new"))
  end

  def edit
    @movie = Movie.find(params[:id]).to_json(:only => [:id, :name])
    @components.push(Component.new(:dest => '#control', :template_name => "movies/edit", :data => {:movie => @movie}))
  end

  def create
    @movie = Movie.new(params[:movie])
    top_cat = Movie.first(:select => 'prio', :order => 'prio DESC')
    @movie.prio = 0
    @movie.prio = top_cat.prio + 1 if !top_cat.nil?
    if @movie.save
      redirect_to :controller => 'movies', :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      redirect_to :controller => 'movies', :action => 'index'
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

require 'alreves_controller'

class ApplicationController < AlrevesController
  helper :all
  protect_from_forgery

  def alreves_init
    super
    @client_actions << "jQuery.alreves.injectJS('javascripts/jquery.dataTables.js')"
    @client_actions << "jQuery.alreves.injectCSS('stylesheets/layout.css')"
    @client_actions << "jQuery.alreves.injectCSS('stylesheets/typo.css')"
  end
end

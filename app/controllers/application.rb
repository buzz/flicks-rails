require 'alreves_controller'

class ApplicationController < AlrevesController
  helper :all
  protect_from_forgery

  def alreves_init
    super
    @client_actions << "jQuery.alreves.injectCSS('stylesheets/layout.css')"
  end
end

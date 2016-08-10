class WelcomeController < ApplicationController

  def index
    render text: '', layout: 'application'
  end

  def coming_soon
    render text: '', layout: 'coming_soon'
  end

end

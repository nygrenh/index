class WelcomeController < ApplicationController
  def index
    redirect_to links_path if current_user
    @message = ENV['WELCOME_MESSAGE'].presence || 'Index is a browser-based bookmarking application that is meant to be self-hosted.'
  end
end

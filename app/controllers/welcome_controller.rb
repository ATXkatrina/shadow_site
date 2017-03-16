class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @recent_articles = Article.all.limit(2).order(:created_at)
  end
end

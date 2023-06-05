class Public::QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def new
  end
  
  def create
  end

  def index
  end

  def show
  end
  
end

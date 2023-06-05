class Public::ApplicationController < ApplicationController
  before_action :authenticate_user!
end

class Public::HomesController < Public::ApplicationController
  skip_before_action :authenticate_user!
end

class Public::TodayWordsController < Public::ApplicationController
  skip_before_action :authenticate_user!
end

class Public::PostsController < Public::ApplicationController
  skip_before_action :authenticate_user!
end

class Public::QuestionsController < Public::ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
end
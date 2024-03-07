class ApplicationController < ActionController::Base
    before_action :set_categories
  
    private
  
    def set_categories
      @categories = current_user.categories.all if current_user
    end
  end
  
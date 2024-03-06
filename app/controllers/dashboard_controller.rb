class DashboardController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @tasks = current_user.tasks
        @categories = current_user.categories.all
        @category = current_user.categories.build
    end
end

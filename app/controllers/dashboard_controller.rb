class DashboardController < ApplicationController
    before_action :authenticate_user!
      
    def index
      @total_tasks_count = current_user.tasks.count
      @most_urgent_task = current_user.tasks.order(:due_date).first
      @tasks = current_user.tasks.order(:due_date)
      @category = current_user.categories.build
    end
  end
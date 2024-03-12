require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @category = categories(:one)
    @task = tasks(:one)
    login
  end
  
  test "visit the mapped category and create a task" do
    visit_mapped_category

    click_on "Add Task"

    fill_in "Title", with: "this is a task"
    fill_in "Description", with: "this is a task description"
    fill_in "Due date", with: 2024-03-12

    click_on "Save"
  end

  test "edit a task" do
    visit_mapped_category

    click_on "Edit"

    fill_in "Title", with: "this is an edited task"
    fill_in "Description", with: "this is an edited task description"
    fill_in "Due date", with: 2024-03-12

    assert_text "Edit Task"

    click_on "Save"
  end

  test "delete a task" do
    visit_mapped_category

    click_on "Edit"

    assert_text "Edit Task"

    click_on "Delete"
  end

  test "visit the task show page" do
    visit_mapped_category

    click_on "this is a task"

  end


  private

  def login
    unless page.has_text?("Dashboard")
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "asdasd"
    click_on "Log in"
    assert_text "Dashboard"
  end
end

  def visit_mapped_category
    new_category = Category.find_by(name: "Hehehehe")
    visit category_path(new_category)
  end

end

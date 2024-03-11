require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @category = categories(:one)
    login
  end

  # private

  # def login
  #   visit root_path
  #   fill_in "Email", with: @user.email
  # end

  test "visiting the dashboard" do
    
    assert_selector "h2", text: "Total Tasks"
  end

  test "create new category and visit the mapped category" do
    visit root_path

    click_on "Create Category"

    fill_in "Name", with: "New Category"
    fill_in "Description", with: "New Description"

    click_on "Create"

    new_category = Category.find_by(name: "New Category")
    visit category_path(new_category)

    assert_text "New Category"
    assert_text "New Description"
  end


  test "edit existing category" do
    visit category_url(@category)

    click_on "Edit Category"

    fill_in "Name", with: "#{@category.name} _edited"
    fill_in "Description", with: "this description is edited"

    click_on "Save"

    assert_text "Dashboard" #assert flash message
  end

  test "deleting category" do
    visit category_url(@category)

    click_on "Edit Category"

    click_on "Delete"
  end

  private

  def login
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "asdasd"
    click_on "Log in"
    assert_text "Dashboard"
  end

end

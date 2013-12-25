require 'spec_helper'

module TestListHelper
  def visit_test_list_path
    visit_list_path(test_list.url)
  end

  def visit_list_path(name)
    visit "/#{name}"
  end

  def test_list
    List.new(url: "static", owner: test_user)
  end

  def test_user
    User.new(email: Faker::Internet.email)
  end
end
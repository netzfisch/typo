Feature: Manage Categories
  As a blog administrator
  In order to organize my thoughts/ blog entries
  I want to be able to add categories to my blog

  Background: blog has been successfully set up
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: successfully create category
    Given I am on the new category page
    When I fill in "category_name" with "linux"
    And I fill in "category_description" with "Everything about Linux!"
    And I press "Save"
    Then I should be on the new category page
    Then I should see "linux" and "Everything about Linux!"

  Scenario: successfully edit category
    Given I am on the new category page
    When I follow "ruby"
    Then the "category_description" field should contain "Everything about Ruby!"
    When I fill in "category_description" with "Everything about Ruby on Rails!"
    And I press "Save"
    Then I should be on the new category page
    Then I should see "Ruby" and "Everything about Ruby on Rails!"


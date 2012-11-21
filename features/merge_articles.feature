Feature: Author cannot merge articles
  As a blog administrator
  In order to organize the blog
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I am on the edit article page for id "1"
    When I fill in "Article_ID" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see a flash "Success, you just merged two aricles!"


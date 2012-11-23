Feature: Adminstrator can merge articles
  As a blog administrator
  In order to organize the blog
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the following articles exist:
    | title     | author | body   | created_at          | published |
    | article-1 | admin  | text-1 | 2012-11-20 17:57:23 | true      |
    | article-2 | user   | text-2 | 2012-11-20 17:58:23 | true      |
    | article-3 | user   | text-3 | 2012-11-20 17:59:23 | true      |

    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I am on the edit article page for id "1"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see a flash "Success, you just merged two articles!"

    When I go to the home page
    Then I should see "article-1"
    When I follow "article-1"
    Then I should see "text-1" and "text-2"


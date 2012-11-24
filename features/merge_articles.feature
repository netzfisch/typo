Feature: Adminstrator can merge articles
  As a blog administrator
  In order to organize the blog
  I want to be able to merge articles

  Background: articles have been added to database
    Given the blog is set up
    And the following articles exist:
    |id|title    |author|body  |published_at       |published|state    |
    |1 |article-1|admin |text-1|2012-11-20 17:57:23|true     |published|
    |2 |article-2|user  |text-2|2012-11-20 17:58:23|true     |published|
    |3 |article-3|user  |text-3|2012-11-20 17:59:23|true     |published|

    And I am logged into the admin panel

  Scenario: successfully merge articles
    Given I am on the edit article page for id "1"
    # better: Given I am the edit page of "article-1"
    When I fill in "other_article_id" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see a flash "Success, you just merged two articles!"

    When I go to the home page
    Then I should see "article-1"
    And I should not see "article-3"
    When I follow "article-1"
    Then I should see "text-1" and "text-3"
    And I should not see "text-2"


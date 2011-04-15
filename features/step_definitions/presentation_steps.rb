# encoding: UTF-8
Given /^(?:|I )want to introduce my self$/ do
  steps %Q{
    Given I am on the homepage
    When I fill in "q" with "Andrzej Śliwa"
    And I press "Szukaj w Google"
    Then I should see "Andrzej Sliwa - blog · andrzejsliwa.com"
    And I follow "Andrzej Sliwa - blog · andrzejsliwa.com"
    And I follow "o mnie"
    And stay on the page
  }
end
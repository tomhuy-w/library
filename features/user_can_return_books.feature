@javascript
Feature: User can return books

  Background:
    Given Library has these books
      | title                | author        | year | edition | publisher      | quantity |
      | C++ Primer Plus      | Stephen Prata | 2011 | 6       | Addison-Wesley | 1       |
      | Clean Code           | Robert Martin | 2008 | 1       | Prentice Hall  | 2       |
      | Domain-Driven Design | Eric J. Evans | 2003 | 1       | Addison Wesley | 0       |
    And there is a user logged in
    And user borrow these books
      | title      | quantity |
      | Clean Code | 1        |

  Scenario: User returns the book
    When I visit "/borrower_records"
    And I return "Clean Code" book
    Then I can see "Returned successfully"
    And I can not see "Clean Code"

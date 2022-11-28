@javascript
Feature: User can borrow books

  Background:
    Given Library has these books
      | title                | author        | year | edition | publisher      | quantity |
      | C++ Primer Plus      | Stephen Prata | 2011 | 6       | Addison-Wesley | 1       |
      | Clean Code           | Robert Martin | 2008 | 1       | Prentice Hall  | 2       |
      | Domain-Driven Design | Eric J. Evans | 2003 | 1       | Addison Wesley | 0       |

  Scenario: User borrow the book
    Given there is a user logged in
    When I open landing page
    And I borrow "Clean Code" book
    Then I can see "borrowed successfully"
    And I can see "Clean Code" remaining amount is 1

@run
Feature: Withdraw money from ATM with background

  Background:
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card

  @simple @background
  Scenario: ATM_5 - User withdraws money from an ATM
      And withdraws $45
    Then the ATM should return $45
      And the account balance should be $55

  @outline @background
  Scenario Outline: ATM_5.1 - User withdraws money from an ATM
      And withdraws <withdrawal>
    Then the ATM should return <return>
      And the account balance should be <balanceAfter>

    Examples:
      | withdrawal | return | balanceAfter |
      | $100       | $100   | $0           |
      | $50        | $50    | $50          |
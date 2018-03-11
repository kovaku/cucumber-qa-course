@run
Feature: Withdraw money from ATM

  Scenario: User withdraw money at an ATM
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws $45
    Then the ATM should return $45
      And the account balance is $55
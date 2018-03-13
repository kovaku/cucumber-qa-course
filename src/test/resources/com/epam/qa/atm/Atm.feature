@run
Feature: Withdraw money from ATM
  As a user with an account at a bank
  I would like to withdraw money from an ATM
  So that I can pay everywhere.

  @simple
  Scenario: ATM_1 - User withdraws money from an ATM
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws $45
    Then the ATM should return $45
      And the account balance should be $55

  @failing_sample
  Scenario: ATM_1.1 - User withdraws more money the account has
    Given the user has a valid Credit card
      And the account balance is $25
    When he inserts his card
      And withdraws $30
    Then the ATM should return $25
      And the account balance should be $-5

  @reusable_steps
  Scenario: ATM_2.1 - User withdraws money from an ATM multiple times
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws $45
      And withdraws $35
    Then the ATM should return $80
      And the account balance should be $20

  @list
  Scenario: ATM_2.2 - User withdraws money from an ATM multiple times
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws the following amounts: $50, $40, $5
    Then the ATM should return $95
      And the account balance should be $5

  @data_table
  Scenario: ATM_2.3 - User withdraws money from an ATM multiple times
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws the following amounts:
        | $50 |
        | $40 |
        | $5  |
    Then the ATM should return $95
      And the account balance should be $5

  @doc_string
  Scenario: ATM_3 - User withdraws money from an ATM multiple times
    Given the user has a valid Credit card
      And the account balance is $0
    When he inserts his card
    Then the ATM displays the following message:
    """
    Your back account is empty!
    """

  @outline
  Scenario Outline: ATM_4 - User withdraws <withdrawal> from an ATM
    Given the user has a valid Credit card
      And the account balance is <balanceBefore>
    When he inserts his card
      And withdraws <withdrawal>
    Then the ATM should return <return>
      And the account balance should be <balanceAfter>

    Examples:
      | balanceBefore | withdrawal | return | balanceAfter |
      | $100          | $100       | $100   | $0           |
      | $100          | $50        | $50    | $50          |

  @outline_with_multiple_examples
  Scenario Outline: ATM_4.1 - User withdraws money from an ATM
    Given the user has a valid Credit card
      And the account balance is <balanceBefore>
    When he inserts his card
      And withdraws <withdrawal>
    Then the ATM should return <return>
      And the account balance should be <balanceAfter>

    Examples:
      | balanceBefore | withdrawal | return | balanceAfter |
      | $101          | $100       | $100   | $1           |
      | $101          | $50        | $50    | $51          |

    Examples:
      | balanceBefore | withdrawal | return | balanceAfter |
      | $200          | $100       | $100   | $100         |

  @data_table+outline
  Scenario Outline: ATM_4.2 - User withdraws money from an ATM multiple times
    Given the user has a valid Credit card
      And the account balance is $100
    When he inserts his card
      And withdraws the following amounts:
        | <first>   |
        | <secound> |
        | <third>   |
    Then the ATM should return $95
      And the account balance should be $5

    Examples:
      | first | secound | third |
      | $50   | $40     | $5    |
      | $5    | $40     | $50   |


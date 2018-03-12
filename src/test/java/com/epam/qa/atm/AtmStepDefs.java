package com.epam.qa.atm;

import java.util.List;

import org.junit.Assert;

import com.sun.org.apache.xpath.internal.SourceTree;
import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class AtmStepDefs {

    private int accountBalance;
    private int withdraw;

    @Before
    public void before() {
        accountBalance = 0;
        withdraw = 0;
    }

    @Given("^the user has a valid Credit card$")
    public void the_user_has_a_valid_Credit_card() {
    }

    @Given("^the account balance is \\$(.*)$")
    public void the_account_balance_is(int accountBalance) {
        this.accountBalance = accountBalance;
    }

    @When("^he (?:reinserts|inserts) his card$")
    public void he_inserts_his_card() {
    }

    @When("^withdraws \\$(.*)(?:more)?$")
    public void withdraws(int withdraw) {
        if (accountBalance > withdraw) {
            this.withdraw += withdraw;
            accountBalance -= withdraw;
        } else {
            withdraw = accountBalance;
            accountBalance -= withdraw;
            this.withdraw += withdraw;
        }
    }

    @When("^withdraws the following amounts: (.*)$")
    public void withdraws_the_following_amounts_$_$_$(List<String> list) {
        for (String item : list) {
            withdraws(Integer.parseInt(item.replace("$","")));
        }
    }

    @When("^withdraws the following amounts:$")
    public void withdraws_the_following_amounts(DataTable list) {
        for (String item : list.asList(String.class)) {
            withdraws(Integer.parseInt(item.replace("$","")));
        }
    }

    @Then("^the ATM displays the following message:$")
    public void the_ATM_displays_the_following_message(String message) {
        System.err.println("***************");
        System.err.println(message);
        System.err.println("***************");
    }

    @Then("^the ATM should return \\$(.*)$")
    public void the_ATM_should_return_$(int withdraw) {
        Assert.assertEquals("The ATM should return: " + withdraw, withdraw, this.withdraw);
    }

    @Then("^the account balance should be \\$(.*)$")
    public void the_account_balance_should_be(int accountBalance) {
        Assert.assertEquals("The account balance should be: " + accountBalance, accountBalance, this.accountBalance);
    }
}

package com.epam.qa.carrier;

import java.util.List;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class EpamCarrierSiteStepDefinitions {

    @Given("^the EPAM career site is opened$")
    public void the_EPAM_career_site_is_opened() {
    }

    @When("^the Find button is clicked$")
    public void the_Find_button_is_clicked() {
    }

    @Then("^the available jobs are displayed$")
    public void the_available_jobs_are_displayed() {
    }

    @When("^the country (.*) is selected$")
    public void the_country_is_selected(String country) {
    }

    @When("^the city (.*) is selected$")
    public void the_city_is_selected(String city) {
    }

    @Then("^an open position should be displayed$")
    public void an_open_position_should_be_displayed() {
    }

    @Then("^the location the position should be (.*)$")
    public void the_location_the_position_should_be(String loc) {
    }

    @Then("^the priority the position should be (.*)$")
    public void the_priority_the_position_should_be(String prio) {
    }

    @When("^the role (.*) is entered$")
    public void the_role_Java_Developer_is_entered(String role) {
    }

    @Then("^the title of the position should be (.*)$")
    public void the_title_of_the_position_should_be_Java_Developer(String pos) {
    }


    @When("^the following skills are selected: (.*)$")
    public void the_following_skills_are_selected(List<String> skills) {
    }

    @Then("^the following positions should be displayed:$")
    public void the_following_positions_should_be_displayed(DataTable arg1) {
    }

    @Then("^the description of the position should start with: (.*)$")
    public void the_description_of_the_position_should_starts_with(String desc)  {
    }
}

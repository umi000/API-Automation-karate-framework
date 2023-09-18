@dashboard
Feature: Dashboard APIs Validation

  Background:
    * url apiBaseURL
    * def headers = read('classpath:resources/headers/headers.json')
#    * def callAuthentication = call read('classpath:features/common/Authentication.feature')

 @stage
  Scenario: Validate Dashboard Overall Stats APIs

    # Set the authentication token
#    * set headers.auth.authorization = callAuthentication.authToken

    #check the dashboard API
    Given path reader.endPoint.dashboard.viewsStatsAfterLogin
    And headers headers.auth
    When method GET
    Then status 200
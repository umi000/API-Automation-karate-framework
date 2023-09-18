@login
Feature: Validate login scenarios

  Background:
    * url apiBaseURL

    @mee
  Scenario: Validate login with valid URL
    Given path reader.endPoint.login.loginWithValidUrl
    And request reader.login.validLoginData
    When method post
    Then status 200
    And response.message == "Login User Successfully"
    And response.isSuccess == true

    * def loginCookie = responseCookies
    * def loginResponse = response
    * def authToken = response.data.idToken

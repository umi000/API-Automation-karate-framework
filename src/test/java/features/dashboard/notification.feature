@notification
Feature: Notification Related APIs

  Background:
    * url apiBaseURL
    * def headers = read('classpath:resources/headers/headers.json')
    * def params = read('classpath:resources/params/params.json')
    * def callAuthentication = call read('classpath:features/common/Authentication.feature')

  @stage @me
  Scenario: Validate Notification APIs with valid Data

#   Set the authentication token
    * set headers.auth.authorization = callAuthentication.authToken

    #check the dashboard
    Given path reader.endPoint.notification.validNotificationUrl
    And headers headers.auth
    And headers headers.contentType
    And print apienv
    And params params.notificationParam
    When method get
    Then status 200
#    And response.message == "Login User Successfully"
#    And response.isSuccess == true
#    * def jsonSchemaExpected = read('classpath:resources/payloads/schemas/loginSchema.json')
#    And response.data == jsonSchemaExpected
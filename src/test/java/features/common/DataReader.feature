Feature: Reading all the data files

  Scenario: Reading files
    # Reading Payload json files
    * def login = read ('classpath:resources/payloads/login/loginData.json');

#
    # Reading Endpoints json file
    * def endPoint = read('classpath:resources/EndPoints.json');

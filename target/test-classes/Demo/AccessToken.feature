Feature: Generar un access token

  Background:
    Given url 'https://restful-booker.herokuapp.com'


  Scenario Outline: Generar access token
    * def headercitos =
  """
  { Accept: <id>,
    Content-Type: '123/json'
  }
  """
    Given path 'auth'
    * print headercitos
    * set headercitos.Accept = 123
    * set headercitos.Content-Type = 'application/json'
    * print headercitos
    And headers headercitos
    And request
      """
        {
          "username" : "admin",
          "password" : "password123"
        }
      """
    When method post
    Then status 200
    And match response.token == '#string'

    * def token = 'token=' + response.token

    Examples:
    | id |
    | 2  |
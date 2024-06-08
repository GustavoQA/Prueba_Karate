Feature: obtener token

  Scenario: Access Token
    Given url urlBook
    And path 'auth'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    And request
    """
    {
      "username" : "#(usuario)",
      "password" : "#(clave)"
    }
    """
    When method POST
    Then status 200
    * print response
    * def token = 'token='+response.token
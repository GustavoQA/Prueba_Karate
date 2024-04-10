Feature: Clase de capacitación

  Background:
    Given url urlDemo

  @demo
  Scenario Outline: caso de prueba 1
    Given path '/api/users/' + <id>
    When method GET
    Then status 200
    And match response.data contains {id: <id>}

    Examples:
      | id |
      | 2  |
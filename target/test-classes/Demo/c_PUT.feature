Feature: Método PUT

  Background:
    Given url urlDemo

  @put
  Scenario: consulta simple
    Given path '/api/users/2'
    And request
    """
      {
        "name": "Dante",
        "job": "QA"
      }
    """
    When method put
    Then status 200

  @put
  Scenario Outline: Consulta con datos dinámicos
    Given path '/api/users/' + <id>
    And request
    """
      {
        "name": "<name>",
        "job": "<job>"
      }
    """
    When method put
    Then status 200

    Examples:
      | id | name   | job           |
      | 2  | Dante  | QA            |
      | 3  | Winter | QA Automation |
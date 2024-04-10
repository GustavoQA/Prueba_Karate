Feature: Método POST

  Background:
    Given url urlDemo

  @post
  Scenario: Consulta simple JSON en una línea
    Given path 'api/users'
    And request {name: "Dante", job: "QA"}
    When method post
    Then status 201

  @post
  Scenario: Consulta simple JSON expandido
    Given path 'api/users'
    And request
    """
      {
        "name": "Dante",
        "job": "QA"
      }
    """
    When method post
    Then status 201

  @post
  Scenario Outline: Consulta con data dinámica
    Given path 'api/users'
    And request
    """
      {
        "name": "<name>",
        "job": "<job>"
      }
    """
    When method post
    Then status 201

    Examples:
      | name   | job           |
      | Dante  | QA            |
      | Winter | QA Automation |
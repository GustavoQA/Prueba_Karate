Feature: Método DELETE

  Background:
    Given url urlDemo

  @delete
  Scenario: delete simple
    Given path 'api/users/2'
    When method delete
    Then status 204

  @delete
  Scenario Outline: delete con data dinámica
    Given path 'api/users/' + <id>
    When method delete
    Then status 204

    Examples:
      | id |
      | 3  |
      | 4  |
      | 5  |
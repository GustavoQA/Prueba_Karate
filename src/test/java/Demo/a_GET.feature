Feature: Método GET

  Background:
    Given url urlDemo

  @get
  Scenario: consulta simple
    Given path '/api/users/2'
    * configure ssl = false
    When method get
    Then status 200

  @get
  Scenario: consulta simple con path dinamico
    Given path 'api', 'users', '3'
    When method get
    Then status 200

  @get
  Scenario Outline: consulta con user dinámico
    Given url 'https://reqres.in'
    And path 'api/users/', <id>
    When method get
    Then status 200
    And match response.data contains any { id: '#notnull', email: 'eve.holt@reqr' }
    Examples:
    | id |
    | 4  |
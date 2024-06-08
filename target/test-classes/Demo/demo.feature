Feature: Demo Karate

  Background:
    Given url urlDemo

  @getSimple
  Scenario: Get simple
    Given path '/api/users/2'
    When method get
    Then status 200

  @getSimple
  Scenario Outline: Get con parametro
    Given path '/api/users/' + <id>
    When method get
    Then status 200

    Examples:
      | id |
      | 2  |
      | 3  |
      | 4  |
      | 5  |

  @postDemo
  Scenario: Post simple
    Given path 'api', 'users'
    And request { name: "Dante", job: "QA" }
    When method post
    Then status 201

  @postDemo
  Scenario: Post con JSON
    Given path '/api/users'
    And request
    """
      {
        "name": "Dante",
        "job": "QA"
      }
    """
    When method post
    Then status 201

  @postDemo
  Scenario Outline: Post con data en tabla
    Given path '/api/users'
    And request
    """
      {
        "name": "<nombre>",
        "job": "<trabajo>"
      }
    """
    When method post
    Then status 201

    Examples:
      | nombre  | trabajo        |
      | Dante   | QA             |
      | Gloria  | Automatizadora |
      | Roberto | QA Engineer    |

  @putSimple
  Scenario: Actualización Simple
    Given path '/api/users/2'
    And request
    """
      {
        "name": "Christian",
        "job": "Ingeniero mecánico"
      }
    """
    When method put
    Then status 200

  @putSimple
  Scenario Outline: Actualización con parámetros
    Given path '/api/users/' + <id>
    And request
    """
      {
        "name": "<nombre>",
        "job": "<trabajo>"
      }
    """
    When method put
    Then status 200

    Examples:
      | id | nombre | trabajo |
      | 2  | Dante  | QA      |
      | 3  | Winter | QA      |
      | 4  | Alex   | QA      |

  @deleteSimple
  Scenario: Método Delete
    Given path 'api', 'users', '2'
    When method delete
    Then status 204

  @deleteSimple
  Scenario Outline: Método Delete con parámetros
    Given path '/api/users/' + <id>
    When method delete
    Then status 400

    Examples:
      | id      |
      | Hola    |
      | Chau    |
      | Que tal |
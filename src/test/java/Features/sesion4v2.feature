Feature: sesion 4

  Background:
    Given url urlBook

  @pruebaS4v1
  Scenario Outline: prueba GET
    Given path 'booking',id
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response

    Examples:
      | read('classpath:req/datacsv1.csv') |
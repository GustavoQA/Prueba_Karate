Feature: API CONSULTA DE LIBROS

  Background:
    Given url urlBook
    * def body = read('classpath:req/dataBook.json')

  @GETBOOK
  Scenario: Prueba GET
    Given path 'booking','42'
    And header Accept = '*/*'
    When method GET
    Then status 200


  @POSTBOOK
  Scenario: Prueba POST
    Given path '/booking'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    * print body
    And request body
    When method POST
    Then status 200


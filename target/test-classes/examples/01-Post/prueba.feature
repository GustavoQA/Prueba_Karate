Feature: prueba con karate reqin

  Background: TTT
    * url baseUrl
    * def body21 = read('classpath:req/user.json')
  @pruebITA
  Scenario: Obtiene <lucas>
    Given path '/api/users'
    * set body21.name = 'Lucas'
    * set body21.job = 'Salazar'
    * configure ssl = false
    And request body21
    When method POST
    Then status 201
    * print response
Feature: Clase de prueba 3

  Background:
    Given url urlBook
    * def data = read('classpath:Demo/Data/data.json')
    * def cabeceras = read('classpath:Demo/Data/cabecerasActualizar.json')
    * def body = read('classpath:Demo/Data/body.json')
    * def getToken = call read('classpath:Features/AuthToken.feature') data
    * def fechaValida = read('classpath:helpers/Funciones.js')
    * def validador2 = read('classpath:req/validador.json')
    * def validador3 = read('classpath:req/validador3.json')

  @pruebaS3
  Scenario: prueba 1
    Given path 'booking','11'
    And params {param1:'valor1', param2:'valor2'}
    And param param3 = 'valor3'
    * set cabeceras.Cookie = getToken.token
    And headers cabeceras
    * set body.firstname = 'WINTER'
    And request body
    When method PUT
    Then status 200
    * print response
    * assert response.firstname == 'WINter'
    * match $.firstname == '#string'
    * match $.firstname == '#string? _.length <= 10 && _.length >= 2'
    * match $.firstname != '#number'
    * match response.lastname == '#string'
    * match $.totalprice == '#number'
    * match $.depositpaid == '#boolean'
    * match response contains any { firstname: 'Winter123', lastname:'Olivera'}
    * match $.bookingdates.checkin == '#? fechaValida(_)'
#    * match response contains validador2
    * match response contains
      """
      {
        firstname: '#regex [A-z]+',
        lastname: '#string',
        totalprice: '#number',
        depositpaid: '#boolean',
        bookingdates: {
          checkin: '#? fechaValida(_)',
          checkout: '#? fechaValida(_)'
        },
        additionalneeds: '#string'
      }
      """

  @pruebaS4
  Scenario: prueba 1
    Given path 'booking','11'
    And params {param1:'valor1', param2:'valor2'}
    And param param3 = 'valor3'
    * set cabeceras.Cookie = getToken.token
    And headers cabeceras
    * set body.firstname = 'WINter'
    * set body.lastname = '0922911'
    * set body.additionalneeds = 'prueba1234'
    And request body
    When method PUT
    Then status 200
    * print response
    * match response contains
      """
      {
        firstname: '#regex [0-9A-z]+',
        lastname: '#regex [0-9]+',
        totalprice: '#number',
        depositpaid: '#boolean',
        bookingdates: {
          checkin: '#? fechaValida(_)',
          checkout: '#? fechaValida(_)'
        },
        additionalneeds: '#regex [0-9A-z]+'
      }
      """

  @pruebaS5
  Scenario: prueba 1
    Given path 'booking','11'
    And params {param1:'valor1', param2:'valor2'}
    And param param3 = 'valor3'
    * set cabeceras.Cookie = getToken.token
    And headers cabeceras
    * set body.firstname = 'abc-1234-bd560'
    * set body.lastname = '0922911'
    * set body.additionalneeds = 'prueba1234'
    And request body
    When method PUT
    Then status 200
    * print response
    * match response contains
      """
      {
        firstname: '#regex [0-9A-z-]+',
        lastname: '#regex [0-9]+',
        totalprice: '#number',
        depositpaid: '#boolean',
        bookingdates: {
          checkin: '#? fechaValida(_)',
          checkout: '#? fechaValida(_)'
        },
        additionalneeds: '#regex [0-9A-z]+'
      }
      """

  @pruebaS6
  Scenario: prueba 1
    Given path 'booking','11'
    And params {param1:'valor1', param2:'valor2'}
    And param param3 = 'valor3'
    * set cabeceras.Cookie = getToken.token
    And headers cabeceras
    * set body.firstname = 'abc-1234-bd560'
    * set body.lastname = '0922911'
    * set body.additionalneeds = 'prueba1234'
    And request body
    When method PUT
    Then status 200
    * print response
    * match response contains validador3


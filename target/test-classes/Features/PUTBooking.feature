Feature: PUT BOOKING

  Background: accestoken
    Given url urlBook
    * def authToken = call read('classpath:Features/AuthToken.feature') { usuario:'admin', clave:'password123'}
    * def body2 = read('classpath:req/dataBook.json')
    * configure headers = { Accept:'*/*', Content-Type:'application/json'}
    * def fechaValida = read('classpath:helpers/Funciones.js')

  @PUTBooking
  Scenario Outline: update a un libro
    Given path 'booking', <id>
    And header Cookie = authToken.token
    * set body2.firstname = 'Lucas'
    * set body2.lastname = 'Salazar'
    * set body2.bookingdates.checkin = 'abcd'
    And request body2
    When method PUT
    Then status 200
    * print response
    * match response contains { firstname: '#string'}
    * match response contains { lastname: '#regex [A-z]+'}
    * match response contains { totalprice: '#number? _ <= 3000'}
    * match $.bookingdates contains {checkin: '#? !fechaValida(_)'}
   # * assert response.bookingdates.checkin == '#? !fechaValida(_)'
    * assert response.bookingdates.checkin == '0NaN-aN-aN'
    #* assert response.firstname == '##string'

    Examples:
      | id |
      | 11 |

  @pruebaSesion4v2
  Scenario Outline: update a un libro
    Given path 'booking', id
    And header Cookie = authToken.token
    * set body2.firstname = firstname
    * set body2.lastname = lastname
    * set body2.bookingdates.checkin = checkin
    * set body2.bookingdates.checkout = checkout
    And request body2
    When method PUT
    Then status 200
    * print response


    Examples:
      | read('classpath:req/data2.csv') |


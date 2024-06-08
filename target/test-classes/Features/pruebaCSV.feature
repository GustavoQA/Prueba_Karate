Feature: prueba csv

  @pruebaconCSV
  Scenario Outline: put 1
    Given path 'booking', 11
    And params { hola:'hola 2', param2:'hola2'}
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    And header Cookie = getToken.token

    * set solicitud.firstname = firstname
    * set solicitud.lastname = lastname
    * set solicitud.totalprice = DataAleatoria.getNumero()
    * set solicitud.depositpaid = depositpaid
    * set solicitud.bookingdates.checkin = checkin
    * set solicitud.bookingdates.checkout = checkout
    * set solicitud.additionalneeds = 'QA'
    And request solicitud
    When method PUT
    Then status 200

    Examples:
      | read('classpath:req/dataEnCSV.csv') |
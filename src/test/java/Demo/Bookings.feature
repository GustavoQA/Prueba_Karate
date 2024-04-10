Feature: Bookings

  Background:
    Given url urlBook
    * configure headers = { Accept: '*/*' }
    * def dataInput = read('classpath:Demo/Data/data.json')
    * def body = read('classpath:Demo/Data/body.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def formatter = read('classpath:helpers/DateFormatter.js')

  @booking
  Scenario: Consultar bookings id
    Given path 'booking'
    When method get
    Then status 200

  @updateB
  Scenario Outline: Update Booking
    * def loginCookie = call read('classpath:Demo/AccessToken.feature') { user: '#(dataInput.username)', pass: '#(dataInput.password)' }
    * configure headers = { Accept: '*/*', Content-Type: 'application/json', Cookie: '#(loginCookie.token)' }
    Given path 'booking/' + <identifier>
    * set body.firstname = dataGenerator.getNombre()
    * set body.lastname = dataGenerator.getApellido()
    * set body.totalprice = dataGenerator.getNumero()
    * set body.bookingdates.checkin = formatter(<yearIn>, <monthIn>, <dayIn>)
    * set body.bookingdates.checkout = formatter(<yearOut>, <monthOut>, <dayOut>)
    And request body
    When method put
    Then status 200
    * print response

    Examples:
      | identifier | yearIn | monthIn | dayIn | yearOut | monthOut | dayOut |
      | 11         | 2023   | 12      | 10    | 2024    | 01       | 10     |
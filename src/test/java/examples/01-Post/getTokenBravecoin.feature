@getTokenBrave
Feature: Generador de Token

  Scenario: Obtencion Token de sesion

    Given url 'https://bravenewcoin.p.rapidapi.com/oauth/token'
    And def  cabeceras =
    """
   {
      X-RapidAPI-Key : 'c8f042a2b0msh5ccc719e499ade9p1d3beejsne55a03735ed0',
      X-RapidAPI-Host : 'bravenewcoin.p.rapidapi.com'
    }
    """
    And headers cabeceras
    And request read('classpath:req/bodyRequest.json')
    When method post
    Then status 401
    And print response




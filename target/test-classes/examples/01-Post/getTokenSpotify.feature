# language:en
@Token
Feature: Obtencion de Token de sesión Spotify

  @uno
  Scenario: Token Sesion Ok-1
    Given url 'https://accounts.spotify.com/'
    And path 'api','token'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field grant_type = 'client_credentials'
    And form field client_id = '98beab865b0a4976bc5c81a0aabbeaa8'
    And form field client_secret = '1a350f35c33b413c849d09c6ae8d38e9'
    When method POST
    * print response
    And match response.token_type == '#string'
    And match response.token_type == 'Bearer'
    * def getToken = 'Bearer '+response.access_token
    * print getToken

 @dos
  Scenario: Token Sesion Ok-2
    Given url 'https://accounts.spotify.com/'
    And path 'api','token'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field grant_type = 'client_credentials'
    And form field client_id = '98beab865b0a4976bc5c81a0aabbeaa8'
    And form field client_secret = '1a350f35c33b413c849d09c6ae8d38e9'
    When method POST
    * print response
    And match response.token_type == '#string'
    And match response.token_type == 'Bearer'
    * def getToken = 'Bearer '+response.access_token
    * print getToken
    

      
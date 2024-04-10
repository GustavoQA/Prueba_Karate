@SPY
Feature: Albunes

  Background:
    * url baseSpotify
    * def Token = call read('classpath:examples/01-Post/getTokenSpotify.feature')

  @uno
  Scenario Outline:  Validaciones de album <Nombre> , direccion <Etiqueta> ,con Popularidad <Popularidad>
    Given path '/v1/albums/4aawyAB9vmqN3uQ7FjRGTy'
    And header Authorization = Token.getToken
    When method GET
    Then status 200
    * def respuesta = response
    * print respuesta
    * match $.id == <ID>
    * match $.label == <Etiqueta>
    * match $.name == <Nombre>
    * match $.popularity == <Popularidad>
    * match $.label == '#string'
    * match $ contains {"type": "album"}
    * def validarNombre = $.name
    * print validarNombre
    * def validarTipoAlbum = $.album_type
    * match validarTipoAlbum == '#regex [a-zA-Z]+'
    * karate.embed(respuesta, 'json')


    Examples:
      | ID                       | Etiqueta                                | Nombre           | Popularidad |
      | '4aawyAB9vmqN3uQ7FjRGTy' | 'Mr.305/Polo Grounds Music/RCA Records' | 'Global Warming' | 58         |
      | '4aawyAB9vmqN3uQ7FjRGTy' | 'Mr.305/Polo Grounds Music/RCA Records' | 'Global Warming' | 58          |

  @dos
  Scenario Outline:  Validacioness de album <Nombre> , direccion <Etiqueta> ,con Popularidad <Popularidad>
    Given path '/v1/albums/4aawyAB9vmqN3uQ7FjRGTy'
    And header Authorization = Token.getToken
    When method GET
    Then status 200
    * def respuesta = response
    * print respuesta
    * match $.id == <ID>
    * match $.label == <Etiqueta>
    * match $.name == <Nombre>
    * match $.popularity == <Popularidad>
    * match $.label == '#string'
    * match $ contains {"type": "album"}
    * def validarNombre = $.name
    * print validarNombre
    * def validarTipoAlbum = $.album_type
    * match validarTipoAlbum == '#regex [a-zA-Z]+'
    * karate.embed(respuesta, 'json')


    Examples:
      | ID                       | Etiqueta                                | Nombre           | Popularidad |
      | '4aawyAB9vmqN3uQ7FjRGTy' | 'Mr.305/Polo Grounds Music/RCA Records' | 'Global Warming' | 58          |








Feature: Proyecto de Karate

  Background:
    # Aquí se pueden definir los pasos que se van a ejecutar antes de cada escenario.
    # Se define la URL base.
    # Se pueden definir variables que se van a usar en los escenarios.

  Scenario: Ejemplo
    Given url 'www.google.com.pe'
    When method get
    Then status 200
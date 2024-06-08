Feature: prueba Encriptar

  Background:
    * def util = Java.type('helpers.Encriptardata')

@pruebaEncriptar
  Scenario: encriptar

  * def encriptar1 = 'usuario:contraseña'
  * def encriptado = util.encodeB64(encriptar1)
  * print 'valor encriptado: '+encriptado
  * assert encriptado == 'dXN1YXJpbzpjb250cmFzZcOxYQ=='

  * def decode1 = util.decodeB64(encriptado)
  * print 'valor desencriptado: '+decode1

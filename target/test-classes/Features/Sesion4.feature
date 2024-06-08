Feature: Java demo

  Background:
#    * def util = Java.type('Utilitario.UtilClass')
    * def base64 = Java.type('java.util.Base64')

  Scenario: read static java method
#    * util.onlyPrint()
    * util.onlyPrint('Hola este es un mensaje es un argumento de entrada.')
#    * util.typeToken('123456')

  Scenario: read java class
    * def valor1 = 'Winter Olivera'
    * def encrip1 = base64.getEncoder().encode(valor1.getBytes());
    * print 'encriptado ', encrip1
    * def decrip1 = base64.getDecoder().decode(encrip1)
    * print 'desencriptar ', decrip1
    * def pass = 'dXN1YXJpbzpwYXNz'
    * def value = base64.getDecoder().decode(pass);
    * print 'value: ',value

  @pruebaEncriptar
  Scenario: encriptar
    * def encriptar1 = 'usuario:contraseña'
    * def encriptado = util.encodeB64(encriptar1)
    * print 'valor encriptado: '+encriptado
    * assert encriptado == 'dXN1YXJpbzpjb250cmFzZcOxYQ=='
    * def decode1 = util.decodeB64(encriptado)
    * print 'valor desencriptado: '+decode1








  Scenario: prueba encriptar
    * def probando = 'pruebaWinter123'
    * print 'ENCRIPTANDOOOOOO'
    * def encriptar = util.encodeB64(probando)
    * print probando
    * print encriptar
    * print 'DESENCRIPTANDOOOOOOOO'
    * def desencriptar = util.decodeB64(encriptar)
    * print desencriptar
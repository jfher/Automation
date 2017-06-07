Feature: Advanced Check Flights Automation Suite

    In order to verify the process to buy tickets
    As an user
    I want to buy tickets with diferent parameters

Background:
  Given estoy en la pagina principal de Mercury Tours
  And ingreso mi usuario y password
  And presiono el enlace "Sign-In"

Scenario: Comprar boleto solo de ida
  And selecciono la opcion One Way
  When completo los detalles de vuelo con la informacion siguiente
      |Passengers: 	    | 2             |
      |Departing From: 	| Acapulco      |
      |Arriving In: 	  | London        |
  And selecciono el servicio de tipo First class
  And presiono la imagen con el enlace "continue"
  Then deberia ver las opciones de vuelo de "Acapulco to London"

Scenario: Verificar el precio total de compra de 3 boletos en first class
  And selecciono la opcion One Way
  And completo los detalles de vuelo con los siguiente datos
      |Passengers: 	    | 3             |
      |Departing From: 	| London        |
      |Arriving In: 	  | Sydney        |
      |Airline: 	      | Unified Airlines |
  And selecciono el servicio de tipo First class
  And presiono la imagen con el enlace "continue"
  When selecciono el vuelo de salida de la aerolinea Unified Airlines
  And selecciono el vuelo de retorno de la aerolinea Unified Airlines
  And presiono el boton "continue" de la vista Select a flight
  Then el valor total del precio debe ser "$1896"

  Scenario: Verificar las fechas de los vuelos de ida y retorno una vez comprados
    And selecciono la opcion One Way
    And completo los detalles de vuelo con los siguiente datos de ida y retorno
        |Passengers: 	    | 2             |
        |Departing From: 	| Sydney        |
        |On: 	            | January        |
        |Depart Day:      | 1             |
        |Arriving In: 	  | Acapulco      |
        |Returning:       | June          |
        |Return Day:      | 6             |
        |Airline: 	      | Unified Airlines |
    And presiono la imagen con el enlace "continue"
    When selecciono el vuelo de salida de la aerolinea Unified Airlines
    And selecciono el vuelo de retorno de la aerolinea Unified Airlines
    And presiono el boton "continue" de la vista Select a flight
    Then la fecha de salida debe ser "1/1/2017"
    And la fecha de retorno debe ser "6/6/2017"


    Scenario: Realizar la compra de boletos y verificar la informacion final
      And completo los detalles de vuelo con los siguiente datos de compra
          |Passengers: 	    | 2             |
          |Departing From: 	| Frankfurt     |
          |On: 	            | January       |
          |Depart Day:      | 6             |
          |Arriving In: 	  | Portland      |
          |Returning:       | October       |
          |Return Day:      | 6             |
          |Airline: 	      | Pangea Airlines |
          And selecciono el servicio de tipo Business class
      And presiono la imagen con el enlace "continue"
      When selecciono el vuelo de salida de la aerolinea Pangea Airlines
      And selecciono el vuelo de retorno de la aerolinea Pangea Airlines
      And presiono el boton "continue" de la vista Select a flight
      And presiono el boton Secure Purchase para confirmar la compra
      Then en la confirmacion del vuelo la cantidad de pasajeros debe ser la correcta
      And la clase de vuelo debe ser Business

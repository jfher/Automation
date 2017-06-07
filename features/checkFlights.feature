Feature: Check Flights Automation Suite

  In order to verify the process to buy tickets
  As an user
  I want to buy tickets with simple parameters

Background:
  Given estoy en la pagina principal de Mercury Tours

Scenario: Consultar ofertas especiales de viajes
  Then deberia ver el destino de "Aruba" como sugerido
  And deberia ver la seccion especiales con vuelos y precios

Scenario: Consultar viajes de ida y vuelta
  And ingreso mi usuario y password
  And presiono el enlace "Sign-In"
	When presiono la imagen con el enlace "continue"
	Then la vista de seleccion de vuelo se despliega con los vuelos disponibles

Scenario: Confirmar un viaje seleccionando los vuelos
  And ingreso mi usuario y password
  And presiono el enlace "Sign-In"
	And presiono la imagen con el enlace "continue"
  When presiono el boton "continue" de la vista Select a flight
	Then la vista de "book a flight" se muestra

Scenario: Comprobar el calculo total del precio de compra del boleto de avión
  And ingreso mi usuario y password
  And presiono el enlace "Sign-In"
	And presiono la imagen con el enlace "continue"
  When presiono el boton "continue" de la vista Select a flight
	Then el valor total del precio debe ser "$584"

Scenario: Comprar boleto ingresando datos del pasajero y facturación
  And ingreso mi usuario y password
  And presiono el enlace "Sign-In"
	And presiono la imagen con el enlace "continue"
  And presiono el boton "continue" de la vista Select a flight
  When completo el formulario con los datos siguientes
          |First Name: 	    | Test             |
          |Last Name: 	    | Bot              |
          |Number: 	        | 123456789        |
          |First Name: 	    | Test             |
          |Middle:          | Jenkins          |
          |Last: 	          | Bot              |
  And presiono el boton "Secure Purchase"
  Then deberia ver el mensaje "Your itinerary has been booked"

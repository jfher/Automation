Feature: Mercury Tours Automation Suite

  In order to verify the main page options
  As an user
  I want to visit links and verify access restrictions

Background:
  Given estoy en la pagina principal de Mercury Tours

Scenario: Acceder al menu de Cars Rentals
	When presiono el boton "Cars Rental" del menu lateral izquierdo
	Then la vista de bajo construcción es mostrada
  And se ve el mensaje "This section of our web site is currently under construction. Sorry for any inconvienece."

Scenario: Editar informacion del perfil de usuario
  And ingreso mi usuario y password
	And presiono el enlace "Sign-In"
  When presiono el boton Profile de la barra superior de navegacion
  Then la vista de Edit profile deberia ser mostrada

Scenario: Cerrar sesion
  And ingreso mi usuario y password
	And presiono el enlace "Sign-In"
	When presiono el boton Sign-off de la barra superior de navegacion
	Then la vista de Sign-on deberia ser mostrada
  And deberia ver el subtitulo "Welcome back to Mercury Tours!"

Scenario: Comprobar restriccion de acceso a vuelos si no esta la sesion iniciada
  And no inicie sesion con la cuenta de usuario
	When presiono el boton "Flights" del menu lateral izquierdo de navegacion
	Then deberia ser redirigido a la pagina principal.

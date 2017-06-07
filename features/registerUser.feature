Feature: Register An User Automation Suite

  In order to verify the process of creation of users
  As an user
  I want to create an account and log-in


Background:
  Given estoy en la pagina principal de Mercury Tours

Scenario: Registrarse en la pagina principal
	And presiono el link "Register"
	When ingreso la informacion siguiente en los campos requeridos
	 |First Name: 	    | Test             |
    |Last Name: 	    | Bot              |
    |Phone: 	        | 123456789        |
    |Email: 	        | testbot@ia.com    |
    |Address:           | Av. Microsystems #123   |
    |City: 	            | Cochabamba         |
    |State/Province:    | Cochabamba         |
    |Postal Code: 	    | 1234               |
    |Country: 	        | BOLIVIA            |
    |User Name: 	    | testbot             |
    |Password:          | TestBot            |
    |Confirm Password:  | TestBot            |
	And envio el contenido del formulario
	Then la vista de confirmacion es mostrada
	And mi usuario es "testbot"

Scenario: Iniciar sesion desde la pagina principal
  And ingreso mi usuario y password
  When presiono el enlace "Sign-In"
	Then la vista del buscador de vuelos es mostrada

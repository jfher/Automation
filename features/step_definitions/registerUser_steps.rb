#Escenario 1
Given(/^estoy en la pagina principal de Mercury Tours$/) do
     #page.driver.browser.manage.window.maximize
     visit('http://newtours.demoaut.com/')
end

Given(/^presiono el link "([^"]*)"/) do |linkText|
  click_link(linkText)
end

When(/^ingreso la informacion siguiente en los campos requeridos$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "First Name:"
    	fill_in 'firstName', :with => value
    	@name = value
	when "Last Name:"
		fill_in 'lastName', :with => value
		@lastName = value
    when "Phone:"
		fill_in 'phone', :with => value
    when "Email:"
		fill_in 'userName', :with => value
	when "Address:"
		fill_in 'address1', :with => value
	when "City:"
		fill_in 'city', :with => value
	when "State/Province:"
		fill_in 'state', :with => value
	when "Postal Code:"
		fill_in 'postalCode', :with => value
	when "Country:"
		select(value, :from => 'country')
	when "User Name:"
		fill_in 'email', :with => value
		@userName = value
	when "Password:"
		fill_in 'password', :with => value
	when "Confirm Password:"
		fill_in 'confirmPassword', :with => value
		@password = value
	end
  end
end

When(/^envio el contenido del formulario$/) do
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[18]/td/input'
  find(:xpath, xpath_base).click
end

Then(/^la vista de confirmacion es mostrada$/) do
  greeting = "Dear"+" "+@name+" "+@lastName
  expect(page).to have_content(greeting)

end

Then(/^mi usuario es "([^"]*)"$/) do |userName|
  text= " Note: Your user name is "+userName+"."
  expect(page).to have_content(text)
end

#Escenario 2

Given(/^ingreso mi usuario y password$/) do
  fill_in 'userName', :with => ENV['USER']
  fill_in 'password', :with => ENV['PSW']
end

When(/^presiono el enlace "([^"]*)"/) do |link|
  xpath = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td[3]/form/table/tbody/tr[4]/td/table/tbody/tr[4]/td[2]/div/input'
  find(:xpath, xpath).click
end

Then(/^la vista del buscador de vuelos es mostrada$/) do
  expect(page).to have_content("Flight
              Details ")
end

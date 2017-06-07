#Escenario 4
Then(/^deberia ver el destino de "([^"]*)" como sugerido$/) do |arg1|
  page.should have_xpath("/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]/p[1]/img")
end

And(/^deberia ver la seccion especiales con vuelos y precios$/) do
  expect(page).to have_content("$398")
end

#Escenario 5

When(/^presiono la imagen con el enlace "([^"]*)"$/) do |image|
  xpath = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[14]/td/input'
  find(:xpath, xpath).click
end

Then(/^la vista de seleccion de vuelo se despliega con los vuelos disponibles$/) do
  expect(page).to have_content("Select your departure
      and return flight from the selections below. Your total price will be higher
      than quoted if you elect to fly on a different airline for both legs of
      your travel.")
end

#Escenario 6

When(/^presiono el boton "([^"]*)" de la vista Select a flight$/) do |title|
  xpath = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/p/input'
  find(:xpath, xpath).click
end

Then(/^la vista de "([^"]*)" se muestra$/) do |message|
  expect(page).to have_content("Please review your
        travel itinerary and make your purchase.")
end

#Escenario 7

Then(/^el valor total del precio debe ser "([^"]*)"$/) do |total|
    expect(page).to have_content(total)
end

#Escenario 8

When(/^completo el formulario con los datos siguientes$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "First Name:"
    	fill_in 'passFirst0', :with => value
	when "Last Name:"
		fill_in 'passLast0', :with => value
  when "Number:"
		fill_in 'creditnumber', :with => value
  when "First Name:"
		fill_in 'cc_frst_name', :with => value
	when "Middle:"
		fill_in 'cc_mid_name', :with => value
	when "Last:"
		fill_in 'cc_last_name', :with => value
	end
  end
end

Then(/^deberia ver el mensaje "([^"]*)"$/) do |arg1|
  expect(page).to have_content("Your
        itinerary has been booked!")
end

When(/^presiono el boton "([^"]*)"$/) do |arg1|
  xpath = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[23]/td/input'
  find(:xpath, xpath).click
end

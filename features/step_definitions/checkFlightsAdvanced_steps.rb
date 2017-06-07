#Escenario 12
Given (/^selecciono la opcion One Way$/) do
  page.find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "One Way"]]').set(true)
end

When (/^completo los detalles de vuelo con la informacion siguiente$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "Passengers:"
      select(value, :from => 'passCount')
	when "Departing From:"
    select(value, :from => 'fromPort')
  when "Arriving In:"
    select(value, :from => 'toPort')
	end
  end
end

When (/^selecciono el servicio de tipo First class$/) do
  page.find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "First class"]]').set(true)
end

Then (/^deberia ver las opciones de vuelo de "([^"]*)"$/) do |type|
  expect(page).to have_content(type)
end

#Escenario 13
When (/^selecciono el vuelo de salida de la aerolinea Unified Airlines$/) do
  page.find(:xpath, '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[1]/tbody/tr[9]/td[1]/input').set(true)
end

When (/^selecciono el vuelo de retorno de la aerolinea Unified Airlines$/) do
  page.find(:xpath, '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[2]/tbody/tr[9]/td[1]/input').set(true)
end

When (/^completo los detalles de vuelo con los siguiente datos$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "Passengers:"
      select(value, :from => 'passCount')
	when "Departing From:"
    select(value, :from => 'fromPort')
  when "Arriving In:"
    select(value, :from => 'toPort')
  when "Airline:"
    select(value, :from => 'airline')
	end
  end
end

#Escenario 14
When (/^completo los detalles de vuelo con los siguiente datos de ida y retorno$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "Passengers:"
      select(value, :from => 'passCount')
	when "Departing From:"
    select(value, :from => 'fromPort')
  when "On:"
    select(value, :from => 'fromMonth')
  when "Depart Day:"
    select(value, :from => 'fromDay')
  when "Arriving In:"
    select(value, :from => 'toPort')
  when "Returning"
    select(value, :from => 'toMonth')
  when "Return Day:"
    select(value, :from => 'toDay')
  when "Airline:"
    select(value, :from => 'airline')
	end
  end
end

Then (/^la fecha de salida debe ser "([^"]*)"$/) do |date|
  expect(page).to have_content(date)
end

Then (/^la fecha de retorno debe ser "([^"]*)"$/) do |date|
  expect(page).to have_content(date)
end
#Escenario 15
When (/^completo los detalles de vuelo con los siguiente datos de compra$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "Passengers:"
      select(value, :from => 'passCount')
	when "Departing From:"
    select(value, :from => 'fromPort')
  when "On:"
    select(value, :from => 'fromMonth')
  when "Depart Day:"
    select(value, :from => 'fromDay')
  when "Arriving In:"
    select(value, :from => 'toPort')
  when "Returning"
    select(value, :from => 'toMonth')
  when "Return Day:"
    select(value, :from => 'toDay')
  when "Airline:"
    select(value, :from => 'airline')
	end
  end
end

When (/^selecciono el servicio de tipo Business class$/) do
  page.find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "Business class"]]').set(true)
end

When (/^selecciono el vuelo de salida de la aerolinea Pangea Airlines$/) do
  page.find(:xpath, '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[1]/tbody/tr[7]/td[1]/input').set(true)
end

When (/^selecciono el vuelo de retorno de la aerolinea Pangea Airlines$/) do
  page.find(:xpath, '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[2]/tbody/tr[7]/td[1]/input').set(true)
end

Then (/^en la confirmacion del vuelo la cantidad de pasajeros debe ser la correcta$/) do
  expect(page).to have_content("
2 passengers")
end

Then (/^la clase de vuelo debe ser Business$/) do
  expect(page).to have_content("Business")
end

When(/^presiono el boton Secure Purchase para confirmar la compra$/) do
  xpath = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[24]/td/input'
  find(:xpath, xpath).click
end

#Escenario 3

When(/^presiono el boton "([^"]*)" del menu lateral izquierdo$/) do |title|
  xpath = '/html/body/div/table/tbody/tr/td[1]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[4]/td[2]/font/a'
  find(:xpath, xpath).click
end

Then(/^la vista de bajo construcción es mostrada$/) do
  expect(page).to have_content("This section of our web site is currently under construction. Sorry for any inconvienece.")
end

Then(/^se ve el mensaje "([^"]*)"$/) do |message|
  expect(page).to have_content(message)
end

#Escenario 9

When(/^presiono el boton Profile de la barra superior de navegacion$/) do
  click_link('PROFILE')
end

Then(/^la vista de Edit Profile deberia ser mostrada$/) do
  expect(page).to have_content("Use this form to review and update your account information.")
end

#Escenario 10

When(/^presiono el boton Sign-off de la barra superior de navegacion$/) do
  click_link('SIGN-OFF')
end

Then(/^la vista de Edit profile deberia ser mostrada$/) do
  expect(page).to have_content("Use this form to review and update your account information.")

end

Then(/^la vista de Sign-on deberia ser mostrada$/) do
  expect(page).to have_content(" Enter your user information to access the member-only
        areas of this site. If you don't have a log-in, please fill out the ")
end

Then(/^deberia ver el subtitulo "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Given(/^no inicie sesion con la cuenta de usuario$/) do

end

#Escenario 11
When(/^presiono el boton "([^"]*)" del menu lateral izquierdo de navegacion$/) do |arg1|
  xpath = '/html/body/div/table/tbody/tr/td[1]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[2]/td[2]/a'
  find(:xpath, xpath).click
end

Then(/^deberia ser redirigido a la pagina principal\.$/) do
  expect(page).to have_content("Always
              carry a travel first aid kit with bandages, antacids, aspirin, bee
              sting wipes, and other basic necessities.")
end

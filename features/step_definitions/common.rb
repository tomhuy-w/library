# frozen_string_literal: true

Given('there is a user logged in') do
  email = 'user@example.com'
  password = '123456+999'

  @user = User.create!(email:,
                       password:)

  visit new_user_session_path
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_on 'commit'
  expect(page).to have_text('Signed in successfully.')
end

When('I visit {string}') do |path|
  visit path
end

When('I open landing page') do
  visit root_path
end

Then('I can see {string}') do |text|
  expect(page).to have_text(text)
end

Then('I can not see {string}') do |text|
  expect(page).not_to have_text(text)
end

When('I click {string}') do |label|
  click_on(label)
end

When('I select {string} as {string}') do |label, option|
  select option, from: label
end

When('I fill {string} form') do |form_name, table|
  table.hashes.each do |row|
    fill_in("#{form_name}_#{row['field']}", with: row['value'])
  end
end

When('I fill {string} with {string}') do |input, text|
  fill_in(input, with: text)
end

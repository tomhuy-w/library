Given('Library has these books') do |table|
  table.hashes.each do |attrs|
    Book.create!(attrs)
  end
end

When('I borrow {string} book') do |name|
  book = Book.find_by(title: name)
  find("div#book_#{book.id}").click_on('borrow')
end

Then('I can see {string} remaining amount is {int}') do |name, quantity|
  book = Book.find_by(title: name)
  expect(find("div#book_#{book.id}")).to have_text("Quntity: #{quantity}")
end

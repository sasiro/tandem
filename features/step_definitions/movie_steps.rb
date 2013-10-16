
Given /the following interests exist/ do |interests_table|
  interests_table.hashes.each do |interest|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Interest.create(interest)
  end
end

Given /the following languages exist/ do |languages_table|
  languages_table.hashes.each do |language|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Language.create(language)
  end
end

Given /the following user exist/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

Given /the following speaks exist/ do |speak_table|
  speak_table.hashes.each do |speak|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Speak.create(speak)
  end
end

Given /the following improve exist/ do |improve_table|
  improve_table.hashes.each do |improve|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Improve.create(improve)
  end
end
Given /the following room exist/ do |room_table|
  room_table.hashes.each do |room|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Room.create(room)
  end
end
Given /^a valid user$/ do
  @user = User.create!({
             :email => "jo@hotmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit user_session
  fill_in "Email", :with => "minikermit@hotmail.com"
  fill_in "Password", :with => "12345678"
  click_button "Login"
end

Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

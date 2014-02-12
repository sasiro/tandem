def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

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
Given /the following available/ do |available_table|
  available_table.hashes.each do |available|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Available.create(available)
  end
end
Given /the following appointment/ do |appointment_table|
  appointment_table.hashes.each do |appointment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Appointment.create(appointment)
  end
end


Given /^a valid user$/ do
  @user = User.create!({
             :email => "example@gmail.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :language_speak_ids =>1,
             :language_improve_ids =>2
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit new_user_session_path
  fill_in "Email", :with => "exemple@gmail.com"
  fill_in "Password", :with => "12345678"
  click_link "Login"
end


Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  unless email.blank?
    visit new_user_session_path
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "Login"
  end
end



Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

When /^I set the "([^"]*)" to "([^"]*)"$/ do |field, date|
  fill_in field, :with=>date
end

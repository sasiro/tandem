
Given /the following interests exist/ do |interests_table|
  interests_table.hashes.each do |interest|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    debugger
    Interest.create(interest)
  end
end

Given /the following languages exist/ do |languages_table|
  languages_table.hashes.each do |language|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    debugger
    Language.create(language)
  end
end

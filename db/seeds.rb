# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Interest.create(name:'Sports') unless Interest.find_by_name('Sports')
Interest.create(name:'Techlology') unless Interest.find_by_name('Techlology')
Interest.create(name:'Arts') unless Interest.find_by_name('Arts')
Interest.create(name:'Health') unless Interest.find_by_name('Health')
Interest.create(name:'Music') unless Interest.find_by_name('Music')
Interest.create(name:'History') unless Interest.find_by_name('History')


common_languages = LanguageList::COMMON_LANGUAGES
common_languages.each do |language| Language.find_or_create_by_name(language.name) end

if  Coupon.first.nil?
  3000.times do
    res = ('a'..'z').to_a.shuffle[0,8].join
    Coupon.find_or_create_by_code(res)
  end
end

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

if Available.first.nil?

   hash = {42=>["monday", "17:00 PM"], 43=>["Monday", "19:00 PM", "Monday", "15:00 PM"], 45=>["Thursday", "16:00 PM", "Monday", "19:00 PM"],  59=>["Sunday", "21:00 PM"], 32=>["Saturday", "18:00 PM", "Saturday", "17:00 PM"], 34=>["Monday", "19:00 PM", "Wednesday", "19:00 PM"], 110=>["Sunday", "08:00 AM", "Saturday", "15:00 PM", "Friday", "07:00 AM", "Thursday", "07:00 AM", "Wednesday", "07:00 AM", "Tuesday", "07:00 AM", "Monday", "07:00 AM"], 64=>["Monday", "20:00 PM"], 62=>["Tuesday", "20:00 PM", "Wednesday", "20:00 PM", "Monday", "20:00 PM"], 65=>["Monday", "16:00 PM"], 53=>["Monday", "17:00 PM"], 82=>["Monday", "21:00 PM"], 86=>["Tuesday", "20:30 PM"], 88=>["Saturday", "14:00 PM"], 93=>["Monday", "23:00 PM", "Friday", "11:00 AM", "Monday", "20:00 PM", "Monday", "18:00 PM", "Friday", "16:00 PM", "Thursday", "20:00 PM", "Thursday", "11:00 AM", "Wednesday", "11:00 AM", "Tuesday", "20:00 PM"], 96=>["Monday", "20:15 PM"], 97=>["Wednesday", "19:00 PM", "Thursday", "20:00 PM", "Tuesday", "20:00 PM"], 99=>["Monday", "13:00 PM"], 100=>["Wednesday", "20:00 PM", "Tuesday", "20:00 PM", "Monday", "21:00 PM"], 101=>["Friday", "20:00 PM", "Thursday", "20:00 PM"], 102=>["Sunday", "20:00 PM", "Wednesday", "09:00 AM", "Monday", "09:00 AM", "Friday", "09:00 AM", "Sunday", "09:00 AM", "Saturday", "13:00 PM", "Thursday", "09:00 AM", "Tuesday", "09:00 AM"], 105=>["Friday", "15:30 PM", "Thursday", "15:30 PM", "Wednesday", "15:30 PM", "Tuesday", "15:30 PM", "Monday", "15:30 PM"], 85=>["Monday", "10:00 AM"], 22=>["Saturday", "16:00 PM", "Saturday", "12:00 PM", "Wednesday", "18:00 PM"], 111=>["Friday", "09:00 AM", "Thursday", "10:00 AM", "Wednesday", "09:00 AM", "Tuesday", "10:00 AM", "Monday", "09:00 AM"], 123=>["Monday", "03:00 AM"], 115=>["Friday", "19:00 PM", "Monday", "19:00 PM"], 114=>["Monday", "18:00 PM", "Wednesday", "18:30 PM"], 76=>["Friday", "16:00 PM", "Wednesday", "19:30 PM"], 126=>["Tuesday", "17:00 PM"], 128=>["Monday", "10:00 AM", "Friday", "10:00 AM", "Tuesday", "10:00 AM"], 117=>["Monday", "20:00 PM"], 118=>["Sunday", "18:00 PM", "Monday", "20:00 PM"], 119=>["Thursday", "02:00 AM", "Wednesday", "02:00 AM", "Monday", "02:00 AM"], 81=>["Thursday", "19:00 PM", "Tuesday", "19:00 PM"], 116=>["Wednesday", "21:00 PM", "Monday", "21:00 PM"], 67=>["Tuesday", "22:00 PM"], 79=>["Sunday", "21:00 PM"], 57=>["Saturday", "10:00 AM", "Saturday", "11:00 AM"], 131=>["Monday", "11:00 AM", "Tuesday", "11:00 AM", "Wednesday", "11:00 AM"], 130=>["Friday", "08:00 AM", "Thursday", "08:00 AM", "Wednesday", "08:00 AM", "Tuesday", "08:00 AM", "Monday", "08:00 AM"], 135=>["Monday", "19:00 PM", "Tuesday", "19:00 PM"], 136=>["Sunday", "15:00 PM", "Saturday", "12:00 PM", "Friday", "15:00 PM", "Thursday", "18:00 PM", "Wednesday", "17:00 PM", "Tuesday", "12:00 PM", "Monday", "06:00 AM"], 122=>["Sunday", "18:00 PM", "Thursday", "19:00 PM"], 124=>["Saturday", "08:00 AM"], 129=>["Saturday", "15:00 PM"], 139=>["Saturday", "18:00 PM", "Tuesday", "01:00 AM", "Tuesday", "00:00 AM"], 95=>["Sunday", "12:00 PM"], 120=>["Sunday", "05:00 AM"], 137=>["Sunday", "20:00 PM"], 141=>["Saturday", "18:00 PM", "Saturday", "17:00 PM"], 109=>["Tuesday", "19:00 PM", "Thursday", "19:00 PM"], 144=>["Sunday", "18:00 PM"], 145=>["Thursday", "17:00 PM", "Tuesday", "17:00 PM", "Monday", "20:00 PM", "Sunday", "17:00 PM", "Saturday", "17:00 PM"], 151=>["Sunday", "15:00 PM"], 152=>["Saturday", "15:00 PM", "Thursday", "19:00 PM", "Monday", "20:00 PM"], 153=>["Wednesday", "20:00 PM"], 155=>["Thursday", "08:00 AM"], 157=>["Monday", "08:00 AM"], 158=>["Friday", "18:00 PM", "Thursday", "18:00 PM", "Wednesday", "20:00 PM", "Tuesday", "18:00 PM", "Monday", "20:00 PM"], 33=>["Sunday", "12:00 PM", "Saturday", "12:00 PM"], 166=>["Thursday", "20:00 PM"], 167=>["Tuesday", "15:00 PM"], 168=>["Saturday", "20:00 PM", "Friday", "19:00 PM"], 165=>["Monday", "09:00 AM"], 169=>["Wednesday", "12:00 PM"], 170=>["Friday", "18:00 PM"], 177=>["Tuesday", "20:00 PM"], 181=>["Monday", "19:00 PM"], 186=>["Sunday", "09:00 AM", "Saturday", "09:00 AM", "Friday", "21:00 PM", "Thursday", "21:00 PM", "Wednesday", "21:00 PM", "Tuesday", "21:00 PM", "Monday", "21:00 PM"], 187=>["Monday", "20:00 PM"], 188=>["Saturday", "18:00 PM"], 189=>["Wednesday", "17:45 PM", "Thursday", "17:30 PM"], 192=>["Saturday", "19:00 PM", "Sunday", "20:00 PM"], 195=>["Friday", "17:00 PM"], 196=>["Wednesday", "08:00 AM", "Monday", "13:00 PM", "Monday", "11:30 AM", "Monday", "08:00 AM"], 197=>["Thursday", "13:00 PM"], 198=>["Monday", "12:00 PM"], 199=>["Sunday", "10:00 AM", "Saturday", "12:00 PM", "Tuesday", "18:00 PM"], 200=>["Thursday", "19:00 PM"], 201=>["Friday", "22:45 PM", "Wednesday", "22:45 PM", "Monday", "22:45 PM"], 202=>["Monday", "18:00 PM"], 36=>["Friday", "20:00 PM"], 203=>["Sunday", "14:00 PM", "Tuesday", "00:00 AM", "Saturday", "09:00 AM"], 104=>["Monday", "15:00 PM"], 190=>["Monday", "20:00 PM"], 205=>["Sunday", "15:00 PM"], 206=>["Saturday", "12:00 PM", "Friday", "12:00 PM", "Thursday", "12:00 PM", "Wednesday", "12:00 PM", "Tuesday", "12:00 PM", "Monday", "19:00 PM"], 208=>["Tuesday", "17:30 PM", "Wednesday", "19:00 PM", "Thursday", "17:45 PM"], 209=>["Thursday", "15:00 PM", "miercoles", "15:00 PM", "viernes", "15:00 PM", "Tuesday", "15:00 PM"], 225=>["Wednesday", "13:00 PM", "Tuesday", "02:00 AM", "Monday", "02:00 AM", "Tuesday", "07:00 AM"], 193=>["Friday", "16:00 PM"], 94=>["any day", "16:00 PM"], 215=>["Monday", "20:00 PM"], 216=>["Wednesday", "18:00 PM", "Monday", "18:00 PM"], 217=>["Monday", "20:00 PM", "Monday", "19:00 PM", "Sunday", "19:00 PM", "Tuesday", "13:00 PM", "Friday", "15:30 PM", "Wednesday", "16:15 PM"], 212=>["Monday", "15:00 PM", "Monday", "08:00 AM"], 219=>["Monday", "08:00 AM", "Monday", "08:00 AM"], 222=>["Thursday", "19:30 PM"], 226=>["Thursday", "18:00 PM"], 228=>["Thursday", "17:00 PM", "Wednesday", "17:00 PM", "Tuesday", "17:00 PM", "Monday", "17:00 PM"], 231=>["Sunday", "12:00 PM", "Saturday", "16:00 PM", "Friday", "16:00 PM", "Tuesday", "22:00 PM", "Tuesday", "15:00 PM"]}

hash.each do |key,value|
     value.each_with_index do |array,index|
       if index % 2 == 0
           Available.new(:day=> value[index], :starts=> value[index+1],:user_id => key).save!
       end
    end
end
end

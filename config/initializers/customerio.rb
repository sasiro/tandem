# config/initializers/customerio.rb
=begin
if Rails.env.development?
  Rails.configuration.customerio = {
    :site_id      =>'f77a207194bb09719221' ,
    :api_key      => '77e603f842bfff7e4abd'
  }
elsif Rails.env.production?
Rails.configuration.customerio = {
  :site_id      => ENV['CIO_SITE_ID'],
  :api_key      => ENV['CIO_API_KEY']
}
end
  
$customerio = Customerio::Client.new(Rails.configuration.customerio[:site_id], Rails.configuration.customerio[:api_key])
=end
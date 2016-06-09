# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'nokogiri'

Annonce.destroy_all

# LOGIC IMMO
# Bordeaux
puts "LOGIC IMMO - Bordeaux"
for i in 1..45
  url = "http://www.logic-immo.com/vente-immobilier-bordeaux-tous-codes-postaux,49_99/options/groupprptypesids=1,2,6,7,12,15/page=#{i}/order=update_date_desc"
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.offer-block .offer-details .offer-details-wrapper').each do |element|
    price = element.search('.offer-price').children.children.text.gsub(/\D/,"").to_i
    surface = element.search('.offer-size-rooms a').children.children.first.text.to_f
    room = element.search('.offer-size-rooms a').children.children.last.text.to_i
    city = element.search('.offer-places-block .offer-city').children.text.gsub(/\d|[^a-zA-Z]/,"")
    zip_code = element.search('.offer-places-block .offer-city').children.text.gsub(/\D/,"").to_i
    sector = element.search('.offer-places-block .offer-sector').children.text
    Annonce.create(price: price, surface: surface, room: room, city: city, zip_code: zip_code, sector: sector)
  end
  puts "Page #{i}/50 completed"
end

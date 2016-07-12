require 'open-uri'
require 'nokogiri'

Annonce.destroy_all

# Villes : Rouen, Bordeaux, Paris
# Sites : paruvendu.fr, seloger.com, explorimmo.com & pap.fr

# LOGIC IMMO
# Bordeaux
puts "LOGIC IMMO - Bordeaux"
for i in 1..15
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
      website = "Logic-Immo"
      prix_metre_carre = price / surface
      maj = html_doc.search('.offer-picture .offer-update').first.children.text.match(/(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}/)[0].to_date
      Annonce.create(price: price, surface: surface, room: room, city: city, zip_code: zip_code, sector: sector, maj: maj, website: website, prix_metre_carre: prix_metre_carre)
    end
  puts "Page #{i}/15 completed"
end

# Paris
puts "LOGIC IMMO - Paris"
for i in 1..15
  url = "http://www.logic-immo.com/vente-immobilier-paris-75,100_1/options/groupprptypesids=1,2,6,7,12,15/page=#{i}/order=update_date_desc"
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.offer-block .offer-details .offer-details-wrapper').each do |element|
      price = element.search('.offer-price').children.children.text.gsub(/\D/,"").to_i
      surface = element.search('.offer-size-rooms a').children.children.first.text.to_f
      room = element.search('.offer-size-rooms a').children.children.last.text.to_i
      city = element.search('.offer-places-block .offer-city').children.text.gsub(/\d|[^a-zA-Z]/,"")
      zip_code = element.search('.offer-places-block .offer-city').children.text.match(/(?<=\().+?(?=\))/)[0]
      sector = element.search('.offer-places-block .offer-block.offer-link').children.text
      website = "Logic-Immo"
      prix_metre_carre = price / surface
      maj = html_doc.search('.offer-picture .offer-update').first.children.text.match(/(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}/)[0].to_date
      Annonce.create(price: price, surface: surface, room: room, city: city, zip_code: zip_code, sector: sector, maj: maj, website: website, prix_metre_carre: prix_metre_carre)
    end
  puts "Page #{i}/15 completed"
end

# PARUVENDU.FR
# Bordeaux
# puts "PARUVENDU.FR - Bordeaux"
# for i in 1..10
#   url = "http://www.paruvendu.fr/immobilier/annonceimmofo/liste/listeAnnonces?tt=1&tbApp=1&tbDup=1&tbChb=1&tbLof=1&tbAtl=1&tbPla=1&tbMai=1&tbVil=1&tbCha=1&tbPro=1&tbHot=1&tbMou=1&tbFer=1&nbp0=99&pa=FR&codeINSEE=33XX0,&i=1467968801&p=#{i}"
#   html_file = open(url)
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search('#bloc_liste .lazyload_bloc.annonce.annonceimmo').each do |element|
#     price = element.search('.price2').children.text.gsub(/\D/,"").to_i
#     surface
#     room
#     city
#     zip_code
#     sector
#     website = "paruvendu.fr"
#     prix_metre_carre = price / surface


#   end
#   puts "Page #{i}/10 completed"
# end

# # Paris
# puts "PARUVENDU.FR - Paris"

# # Rouen
# puts "PARUVENDU.FR - Rouen"


# # SE LOGER
# # Bordeaux
# puts "SE LOGER - Bordeaux"
# for i in 1..15
#   url = "http://www.seloger.com/list.htm?ci=330063&idtt=2&idtypebien=2,13,14,1,9&LISTING-LISTpg=#{i}"
#   html_file = open(url)
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search('.listing.life_annuity.gold').each do |element|
#     price = element.search('.listing_infos .price .amount').text.gsub(/\D|\u0082/,"").to_i
#     surface = element.search('.listing_photo_container .property_list').children[2].text.gsub(/\D/,"").to_i
#     room = element.search('.listing_photo_container .property_list').children[0].text.gsub(/\D/,"").to_i
#     # city =
#     # zip_code =
#     # sector =
#     website = "Se-Loger"
#     prix_metre_carre = price / surface
#     # maj = html_doc.search('.offer-picture .offer-update').first.children.text.match(/(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}/)[0].to_date
#     Annonce.create(price: price, surface: surface, room: room, website: website, prix_metre_carre: prix_metre_carre)
#   end
#   # html_doc.search('.listing.life_annuity.silver').each do |element|
#   #   price =
#   #   surface =
#   #   room =
#   #   city =
#   #   zip_code =
#   #   sector =
#   #   website = "Se-Loger"
#   #   prix_metre_carre = price / surface
#   #   maj = html_doc.search('.offer-picture .offer-update').first.children.text.match(/(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}/)[0].to_date
#   #   Annonce.create(price: price, surface: surface, room: room, city: city, zip_code: zip_code, sector: sector, maj: maj, website: website, prix_metre_carre: prix_metre_carre)
#   # end
#   puts "Page #{i}/15 completed"
# end

require 'nokogiri'
require 'open-uri' 



def crypto_symbol(page)
	array_symbol = []
	page.xpath('//*[@class = "text-left col-symbol"]').each do |momo|
	array_symbol << momo.text
	end
	return array_symbol
end

def crypto_price(page)
	array_price = []
	page.xpath('//*[@class="price"]').each do |price|
	array_price << price.text
	end
	return array_price
end 

def perform
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	array_test = crypto_symbol(page).zip(crypto_price(page))
    hashing = Hash[array_test.map{ |key, value| [key, value] } ]
	puts hashing
end

perform
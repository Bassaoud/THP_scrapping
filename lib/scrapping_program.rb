require 'nokogiri'
require 'open-uri' 



def crypto_symbol
	array_symbol = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.xpath('//*[@class = "text-left col-symbol"]').each do |momo|
	array_symbol << momo.text
	end
	return array_symbol
end

def crypto_price
	array_price = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.xpath('//*[@class="price"]').each do |price|
	array_price << price.text
	end
	return array_price
end 

def concatenate(crypto_symbol, crypto_price)
	full_array = crypto_symbol.zip(crypto_price)
	array_of_hashs = []
	full_array.each {|record| array_of_hashs << {record[0] => record[1]}}
	return array_of_hashs
end

def perform
	crypto_symbol
	crypto_price
	puts concatenate(crypto_symbol, crypto_price)

end

perform
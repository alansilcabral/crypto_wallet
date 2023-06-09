
puts "Cadastrando moedas..."

Coin.create!(
    description: "Bitcon",
    acronym: "BTC",
    url_image: "https://static.vecteezy.com/system/resources/thumbnails/008/505/801/small_2x/bitcoin-logo-color-illustration-png.png"
)

puts "Moedas cadastradas com sucesso..."

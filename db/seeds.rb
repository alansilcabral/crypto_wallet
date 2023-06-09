puts "Cadastrando moedas..."

coins = [
          {
            description: "Bitcon",
            acronym: "BTC",
            url_image: "https://static.vecteezy.com/system/resources/thumbnails/008/505/801/small_2x/bitcoin-logo-color-illustration-png.png"
          },

          {
            description: "Ethereum",
            acronym: "ETC",
            url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
          },

          {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png"
          }
]


coins.each do |coin|
  Coin.find_or_create_by! (coin)
end

puts "Moedas cadastradas com sucesso..."

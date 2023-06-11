namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando Banco de Dados..." ) {%x(rails db:drop)}
      show_spinner("Criando banco de dados...") {%x(rails db:create)}
      show_spinner("Migrando as tabelas...") {%x(rails db:migrate)}
      %x(rails dev:add_mining_types) #chamando a task mining types
      %x(rails dev:add_coins) #chamando a task add coins
    else
      puts "Para executar a task você precisa está em modo de desenvolvimento"  
  end
end

desc "Cadastro de moedas"
task add_coins: :environment do
  show_spinner("Cadastrando moedas..." ) do
    coins = [
      {
        description: "Bitcon",
        acronym: "BTC",
        url_image: "https://static.vecteezy.com/system/resources/thumbnails/008/505/801/small_2x/bitcoin-logo-color-illustration-png.png",
        mining_type: MiningType.find_by(acronym: 'PoW')
      },

      {
        description: "Ethereum",
        acronym: "ETC",
        url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png",
        mining_type: MiningType.all.sample
      },

      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/dash-dash-logo.png",
        mining_type: MiningType.all.sample
      },

      {
        description: "Iota",
        acronym: "IOT",
        url_image: "https://cryptologos.cc/logos/iota-miota-logo.png",
        mining_type: MiningType.all.sample
      },

      {
        description: "ZCash",
        acronym: "ZCash",
        url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png",
        mining_type: MiningType.all.sample
      }

    ]


    coins.each do |coin|
    Coin.find_or_create_by! (coin)
    end
  end
end

desc "Cadastro dos tipos de mineração"
task add_mining_types: :environment do
show_spinner("Cadastrando tipos de mineração..." ) do
  mining_types = [
    {description: "Proof of Work",acronym: "PoW"},
    {description: "Proof of Stake",acronym: "PoS"},
    {description: "Proof of Capacity",acronym: "PoC"}
  ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by! (mining_type)
    end
  end
end
  


  private 

  def show_spinner(msg_star, msg_end = "Tarefa executada!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_star}") 
    spinner.auto_spin 
    yield
    spinner.success("(#{msg_end})")
  end

end

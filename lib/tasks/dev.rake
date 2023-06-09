namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task steup: :environment do
    if Rails.env.development?
      show_spinner("Apagando Banco de Dados..." ) {%x(rails db:drop)}
      show_spinner("Criando banco de dados...") {%x(rails db:create)}
      show_spinner("Migrando as tabelas...") {%x(rails db:migrate)}
      show_spinner("Inserindo informações no banco...") {%x(railsdb:seed)}
    else
      puts "Para executar a task você precisa está em modo de desenvolvimento"  
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

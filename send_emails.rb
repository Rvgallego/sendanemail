require 'bundler'
require 'gmail'
require 'rubygems'

Bundler.require

session = GoogleDrive::Session.from_service_account_key("client_secret.json")
spreadsheet = session.spreadsheet_by_title("jkproject")
worksheet = spreadsheet.worksheets.first

worksheet.rows.each { |row| row.first(2).join(" | ") }

gmail = Gmail.connect('rvgallegotrash', 'pw') do |gmail|

email = gmail.compose do
  to row.first(2).join
  subject "Une formation révolutionnaire"
  body "Bonjour," + "\n" + "\n" + "Je m'appelle Ashe, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite." + "\n" + "\n" + "Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{townhall_name} !" + "\n" + "\n" + "Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
  email = gmail.compose do
end
email.deliver! # or: gmail.deliver(email)

end

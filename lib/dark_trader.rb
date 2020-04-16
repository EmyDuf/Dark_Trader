  # Call gem
require 'dotenv'
Dotenv.load
 require 'twitter'
 require 'nokogiri'
 require 'open-uri'

begin
    #do_something() #Dev
        page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        name = page.xpath('/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a')
        price = page.xpath('/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/a')
    
        puts name
        puts price

    #Other Exemple
    #all_emails_links = page.xpath('/mettre_ici_le_XPath') #Dans ce cas all_emails_links est un array d'éléments HTML.
    #OR
    #all_emails_links.each do |email_link|
    #    puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
    #    end

  rescue => e
    puts "Oups petite erreur, mais c'est pas grave" #log
  end
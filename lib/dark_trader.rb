#Call gem
require 'dotenv'
Dotenv.load
require 'twitter'
require 'nokogiri'
require 'open-uri'

def get_url
  #page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  return Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

def body(get_url)
  begin #Dev useful_loop.rb    
        page = get_url    

        name = page.xpath('/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a')
          puts "name #{name.text}"

        price = page.xpath("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/a")
        puts "price #{price.text}"
        
        #Test boucle
        i = 0
        loop do
          i += 1
          puts i
          price2 = page.xpath("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/a")
          puts "price #{price2.text}"
          if i ==15
            break
          end
        end

        #Test hash
        page.xpath("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/a").each do |i|
          puts "price3 #{i.text}"
        end
        

      break # Exit the loop
    end


    rescue => e
      puts "Oups petite erreur, mais c'est pas grave" #log
    end
  end

  def perform
    body(get_url)
  end



perform

        #name2 = page.xpath('/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a').each do |name0|
        #  puts name0.text
        #end
        
        #each(element, path=nil, namespaces=nil, variables={}, options={}, &block)
        #XPath.each( node ) { |el| ... }
        #XPath.each( node, '/*[@attr='v']' ) { |el| ... }
        #XPath.each( node, 'ancestor::x' ) { |el| ... }
        #XPath.each( node, '/book/publisher/text()=$publisher', {}, {"publisher"=>"O'Reilly"}) \ {|el| ... }

        #puts name0.text
        #arg1 = 3
        #puts arg1
        #name3 = page.xpath('/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{arg1}]/td[2]/div/a')
        #puts "name3 #{name3}"
        #puts "name2 #{name2}"


        #rows = page.css('tr')
        #rows.shift
        #rows.each do |row|

        #  each_row = Nokogiri::HTML(row.to_s).css('td')
        #  if each_row.count > 1
        #    price_bundle = {}
        #    price_bundle[:date] = Date.parse(each_row[0].text)
        #    price_bundle[:open] = each_row[1].text.to_f
        #    price_bundle[:high] = each_row[2].text.to_f
        #    price_bundle[:low] = each_row[3].text.to_f
        #    price_bundle[:close] = each_row[4].text.to_f
        #    price_bundle[:avg] = (price_bundle[:high] + price_bundle[:low]) / 2.0
        #    puts price_bundle
        #  end
        #end

      #Other Exemple
      #all_emails_links = page.xpath('/mettre_ici_le_XPath') #Dans ce cas all_emails_links est un array d'éléments HTML.
      #OR
      #all_emails_links.each do |email_link|
      #    puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
      #    end

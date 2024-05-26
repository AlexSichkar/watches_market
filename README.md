# README


Zadanie:

Napisz Aplikację w Ruby on Rails (API only), Postgresql DB (propozycje gemów: devise, pundit, activeadmin, rspec).
Aplikacja to mini katalog z zegarkami. Zegarki mają 3 kategorie: standard, premium, premium+.
rails new watches_market -d=postgresql
rails db:purge
cd /home/alex/Dev/IdeaProjects/watches_market

rails g model Category title:string

Zegarki posiadają następujące atrybuty: nazwa, opis, kategoria, cena, url zdjęcia.
rails g model Watch name:string description:text category:belongs_to 'price:decimal{6,2}' view_url:text 
rails db:migrate
rails db:seed

Aplikacja powinna pozwalać na rejestrację i logowanie. 
rails generate devise:install
rails g device user
rails db:migrate
rails g devise:views

rspec --init 

rails g pundit:install


Aplikacja powinna 
pozwalać tworzyć, 
edytować (tylko przez twórcę), 
usuwać produkty (tylko przez twórcę) - tylko dla zalogowanych użytkowników. 
Powinna także pozwalać listować wszystkie produkty, 
filtrować po nazwie (nazwa zawiera daną frazę), 
cenie (przedział), 
kategorii, 
sortować po nazwie, cenie i kategorii - dla zalogowanych i niezalogowanych użytkowników. 

Aplikacja powinna zawierać wszystkie niezbędne testy (modeli, requestów, serwisów itd.)

*Zadanie dodatkowe: Stworzyć admin panel (gem activeadmin), który będzie zawierał panel zegarków i panel użytkowników.

Kod powinien zostać udostępniony na GitHubie.

Prosimy o rozwiązanie zadania najpóźniej do czwartku (23.05).


Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"
     
     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
       
     * Not required *


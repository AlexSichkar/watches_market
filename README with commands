# README


Zadanie:

Napisz Aplikację w Ruby on Rails (API only), Postgresql DB (propozycje gemów: devise, pundit, activeadmin, rspec).
Aplikacja to mini katalog z zegarkami. Zegarki mają 3 kategorie: standard, premium, premium+.
rails new watches_market -d=postgresql
rails db:create
rails db:purge
cd /home/alex/Dev/IdeaProjects/watches_market

    gem 'devise', '~> 4.9', '>= 4.9.2'
    gem 'pundit', '~> 2.3', '>= 2.3.2'
    gem 'activeadmin', '~> 3.2', '>= 3.2.1'

    gem 'bcrypt', platforms: :ruby
    gem 'sassc-rails'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  # gem 'rspec-rails', '~> 6.1.0'
  gem 'rspec'
  gem 'rspec-rails'
  # gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'faker'
  
rails generate devise:install
rails g device user
rails db:migrate
rails g devise:views

#rspec --init --this one for rspec, but we need test not only ruby

rails g rspec:install

rails g pundit:install
rails g pundit:policy watch

gem 'bcrypt', platforms: :ruby # to resolve the cannot load such file -- sassc
gem "sassc-rails" # to resolve the cannot load such file -- sassc
bundle install
 rails s
rails g active_admin:install
rails g db:migrate
rails c
in console we should create users
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')

next add to the AdminUser class this method:
 def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

rails g active_admin:resource Watch

class Watch < ApplicationRecord

  # ...

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
    def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "name", "price", "updated_at", "view_url"]
  end

  # ...

end

rails g model User admin:boolean
rails g controller main

Zegarki posiadają następujące atrybuty: nazwa, opis, kategoria, cena, url zdjęcia.

rails g model Watch name:string description:text category:belongs_to user:belongs_to price:number view_url:text --skip-collision-check --skip

rails g model Category title:string
rails g model Watch name:string description:text category:belongs_to users:belongs_to 'price:decimal{6,2}' view_url:text 
rails g model Watch name:string description:text category:belongs_to user:belongs_to price:number view_url:text 
rails db:migrate
rails db:migrate RAILS_ENV=test
rails db:seed 
rails db:seed RAILS_ENV=test

DROP or fill in test/fixtures user and admin_user YML

Aplikacja powinna pozwalać na rejestrację i logowanie. 



Aplikacja powinna pozwalać
    tworzyć (tylko przez twórcę) - new - create, 
    edytować (tylko przez twórcę) - edit, 
    usuwać produkty (tylko przez twórcę) - tylko dla zalogowanych użytkowników. 
    Powinna także pozwalać listować wszystkie produkty - method index, 
    
filtrować po 
    nazwie (nazwa zawiera daną frazę) - watch1, 
    cenie (przedział), 
    kategorii - category show, 
    
sortować po nazwie, cenie i kategorii - dla zalogowanych i niezalogowanych użytkowników. 

Aplikacja powinna zawierać wszystkie niezbędne testy (modeli, requestów, serwisów itd.)

*Zadanie dodatkowe: Stworzyć admin panel (gem activeadmin), który będzie zawierał panel zegarków i panel użytkowników.

Kod powinien zostać udostępniony na GitHubie.


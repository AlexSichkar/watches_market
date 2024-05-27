# README


Zadanie:

Napisz Aplikację w Ruby on Rails (API only), Postgresql DB (propozycje gemów: devise, pundit, activeadmin, rspec).
Aplikacja to mini katalog z zegarkami. Zegarki mają 3 kategorie: standard, premium, premium+.

Zegarki posiadają następujące atrybuty: nazwa, opis, kategoria, cena, url zdjęcia.

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


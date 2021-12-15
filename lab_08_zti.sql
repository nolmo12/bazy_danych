//ZTI zadanie 1
select nazwisko from pracownik order by nazwisko;
select imie, nazwisko, pensja from pracownik where year(data_urodzenia)>1970;
select * from pracownik where pensja between 3500 and 5000;
select * from stan_magazynowy where ilosc>10;
select * from towar where nazwa_towaru like "C%" or nazwa_towaru like "B%" or nazwa_towaru like "A%";
select * from klient where czy_firma=0;
select * from zamowienie order by data_zamowienia desc limit 10;
select * from pracownik order by pensja limit 5;
select * from towar where nazwa_towaru not like "%a%" order by cena_zakupu desc limit 10;
select towar.* from towar join stan_magazynowy on towar.id_towaru=stan_magazynowy.towar join jednostka_miary on stan_magazynowy.jm=jednostka_miary.id_jednostki where jednostka_miary.nazwa="szt" order by nazwa_towaru asc, cena_zakupu desc;
create table towary_powyzej_100 select * from towar where cena_zakupu>100;
create table pracownik_50_plus like pracownik select * from pracownik where GETDATE()-data_urodzenia>50;
//ZTI zadanie 2

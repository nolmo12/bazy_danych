//zadanie2
1. select p.imie, p.nazwisko, d.nazwa from pracownik p join dzial d on p.dzial=d.id_dzialu;
2. select t.nazwa_towaru, k.nazwa_kategori, s.ilosc from towar t join kategoria k on t.kategoria=k.id_kategori join stan_magazynowy s on t.id_towaru=s.towar order by s.ilosc desc;
3. select * from zamowienie z join status_zamowienia s on z.status_zamowienia=s.id_statusu_zamowienia where s.nazwa_statusu_zamowienia="anulowane";
4. select * from klient k join adres_klienta a on k.id_klienta=a.klient where a.miejscowosc="Olsztyn";
5. select * from stan_magazynowy s right join jednostka_miary j on s.jm=j.id_jednostki where towar is null;
6. SELECT z.numer_zamowienia, t.nazwa_towaru, p.ilosc, p.cena from zamowienie z inner join pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie inner join towar t on t.id_towaru=p.towar where year(z.data_zamowienia)='2018';
7. create table towary_full_info as
 select
  towar.nazwa_towaru,
  towar.cena_zakupu,
  kategoria.kategoria,
  stan_magazynowy.ilosc,
  jednostka_miary.nazwa as jednostka_miary
from
  towar
  join kategoria on towar.kategoria = kategoria.id_kategori
  join stan_magazynowy on towar.id_towaru = stan_magazynowy.towar
  join jednostka_miary on stan_magazynowy.jm = jednostka_miary.id_jednostki;
8. select * from pozycja_zamowienia p join zamowienie z on p.zamowienie=z.status_zamowienia limit 5;
9. select
  *
from
  zamowienie z
  join status_zamowienia s
where
  s.nazwa_statusu_zamowienia != 'zrealizowane';
10. select * from adres_klienta where kod not regexp '[0-9]{2}-[0-9]{3}';
//zadanie lab3_1
1. select imie, nazwisko, data_urodzenia from pracownik;
2. select imie, nazwisko, year(CURRENT_DATE())-year(data_urodzenia) as wiek from pracownik;
3. select d.nazwa, count(p.id_pracownika) as liczba_pracownikow from dzial d join pracownik p on d.id_dzialu=p.dzial group by d.id_dzialu;
4. select k.nazwa_kategori, count(t.id_towaru) from kategoria k join towar t on k.id_kategori=t.kategoria group by k.id_kategori;
5. SELECT k.nazwa_kategori, group_concat(t.nazwa_towaru separator ' | ')  from towar t inner join kategoria k on k.id_kategori=t.kategoria group by k.nazwa_kategori;
6. select round(avg(pensja),2) from pracownik;
7. select round(avg(pensja)) from pracownik where (Year(current_date())-year(data_zatrudnienia))>'5';
8. SELECT t.nazwa_towaru, count(p.zamowienie) from pozycja_zamowienia p inner join towar t on p.towar=t.id_towaru group by t.nazwa_towaru order by count(p.zamowienie) desc limit 10;
9. select z.numer_zamowienia, p.ilosc*p.cena from zamowienie z join pozycja_zamowienia p on z.id_zamowienia=p.zamowienie where z.data_zamowienia>=01-01-2017 or z.data_zamowienia<=03-31-2017;
10.SELECT p.imie,p.nazwisko,sum(po.ilosc*po.cena) from pracownik p inner join zamowienie z on z.pracownik_id_pracownika=p.id_pracownika inner join pozycja_zamowienia po on z.id_zamowienia=po.zamowienie group by p.id_pracownika order by sum(po.ilosc*po.cena) desc;

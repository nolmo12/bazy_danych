//zadanie 1
create table kreatura like wikingowie.kreatura;
insert into kreatura select * from wikingowie.kreatura;
create table zasob like wikingowie.zasob;
insert into zasob select * from wikingowie.zasob;
create table ekwipunek like wikingowie.ekwipunek;
insert into ekwipunek select * from wikingowie.ekwipunek;
select * from zasob;
select * from zasob where rodzaj="jedzenie";
select idZasobu, ilosc from zasob join kreatura on zasob.idzasobu=kreatura.idkreatury where kreatura.idkreatury=1 or kreatura.idkreatury=2 or kreatura.idkreatury=3;
//zadanie 2
select * from kreatura where rodzaj!="wiedzma" and udzwig>49;
select * from zasob where waga between 2 and 5;
select * from kreatura where nazwa like '%or%' and udzwig between 30 and 70;
//zadanie 3
select
  *
from
  zasob
where
  month(dataPozyskania) >= 7
  and month(dataPozyskania) <= 8;

select * from zasob where rodzaj is not null order by waga;
select
  *
from
  kreatura
order by
  dataUr
limit
  5;
//zadanie 4;
select distinct rodzaj from zasob;
select concat(nazwa,', ' ,rodzaj) as nazwa_rodzaj from kreatura where rodzaj like "wi%";
select nazwa, ilosc*waga as waga_calkowita from zasob where dataPozyskania between '2000-01-01' and'2007-12-31';
//zadanie 5;
select waga*0,7 as wlasciwe_jedzenie, waga*0,3 as waga_odpadkow from zasob where rodzaj='jedzenie';
select * from zasob where rodzaj is null;
select
  distinct nazwa
from
  zasob
where
  nazwa like "Ba%"
  or nazwa like "%os";

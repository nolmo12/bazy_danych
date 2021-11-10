//zadanie 1
DELETE FROM
  postac
where
  rodzaj = "wiking"
  and nazwa != "Bjorn"
order by
  wiek
limit
  2;

alter table postac modify id_postaci int not null;
ALTER TABLE postac
DROP primary key id_postaci;
//zadanie 2

alter table postac add column pesel varchar(11) not null;
alter table
  postac
add
  primary key (pesel);
  alter table
alter table postac modify rodzaj enum("wiking", "ptak", "kobieta", "syrena");
insert into
  postac(id_postaci, nazwa, rodzaj, data_ur, wiek)
values
  (
    10,
    "Gertruda Nieszczera",
    "syrena",
    "1999-10-12",
    "22"
  );
//zadanie 3
update
  postac
set
  statek = "Esmeralda"
where
  nazwa like "%a%";
  
update statek set max_ladownosc=max_ladownosc*0.7 where data_wodowania between '1901-01-01' and '2000-12-31';

alter table postac add check (wiek>=1000);
// zadanie 4
insert into postac(id_postaci, nazwa, data_ur, wiek) values (11, "Loko", '1997-09-11', 24);
create table marynarz select * from postac; 
delete from marynarz where 1=1;
insert into marynarz select * from postac where statek is not null;
//Zadanie 5
update marynarz set statek=null;
delete from marynarz where rodzaj='wiking' and nazwa !='Bjorn';
delete from statek where 1=1;
create table zwierz(id_zwierza int primary key not null auto_increment, nazwa varchar(50), wiek int);
insert into zwierz select id_postaci, nazwa, wiek from postac where rodzaj!='kobieta' and rodzaj!='wiking';

//Zad1
create table postac(
  id_postaci int primary key not null auto_increment,
  nazwa varchar(40) not null,
  rodzaj enum("wiking", "ptak", "kobieta"),
  data_ur datetime not null,
  wiek int unsigned not null
);
insert into postac values(1, "Bjorn", "wiking", "1993-10-12", 28);
insert into postac values(2, "Drozd", "wiking", "1998-03-09", 23);
insert into postac values(3, "Tesciowa", "wiking", "1967-11-04", 54);
update postac set wiek=88 where nazwa like "tesciowa";
//Zad2
create table walizka(id_walizki int  primary key not null auto_increment, pojemnosc int check (pojemnosc>=0), kolor enum("rozowy", "czerwony", "teczowy", "zolty"), id_wlasciciela int, foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);
alter table walizka alter kolor set default 'rozowy';
insert into walizka values(1, 150,"rozowy",1);
insert into walizka values(2, 250,"teczowy",3);
//Zad3
create table izba(adres_budynku varchar(200) not null, nazwa_izby varchar(200) not null, metraz int check(metraz>=0), wlasciciel int, primary key(adres_budynku, nazwa_izby), foreign key(wlasciciel) references postac(id_postaci) on delete set null);
alter table izba add  column kolor varchar(20) after metraz;
alter table
  izba alter kolor
set
  default 'czarny';

insert into izba(`adres_budynku`, `nazwa_izby`, `metraz`, `wlasciciel`)  values("Wiosenna 27", "Spiżarnia Wikinga", 40, 1);
//Zad4
create table przetwory(
  id_przetworu int primary key not null auto_increment,
  rok_produkcji int default 1654,
  id_wykonawcy int,
  zawartosc varchar(40),
  dodatek varchar(40) default "papryczka chilli",
  id_konsumenta int,
  foreign key(id_wykonawcy) references postac(id_postaci),
  foreign key(id_konsumenta) references postac(id_postaci)
);
insert into przetwory(`id_wykonawcy`, `zawartosc`, `id_konsumenta`) values (1, "Bigos z papryczka chilli", 3);
//Zad5
insert into postac(`nazwa`, `rodzaj`, `data_ur`, `wiek`) values("Gunhild", "wiking", "1987-12-24", 34);
insert into postac(`nazwa`, `rodzaj`, `data_ur`, `wiek`) values("Asa", "wiking", "1995-02-10", 25);
insert into postac(`nazwa`, `rodzaj`, `data_ur`, `wiek`) values("Gunne", "wiking", "1999-11-06", 22);
insert into postac(`nazwa`, `rodzaj`, `data_ur`, `wiek`) values("Reidar", "wiking", "1984-05-14", 37);
insert into postac(`nazwa`, `rodzaj`, `data_ur`, `wiek`) values("Folke", "wiking", "1986-04-15", 35);
create table statek(
  nazwa_statku varchar(20) primary key,
  rodzaj_statku enum("Longboat", "Galera", "Koga"),
  data_wodowania datetime,
  max_ladownosc int not null check(max_ladownosc >= 0)
);
insert into statek values("Esmeralda", "Galera", "1745-09-10", 50);
insert into statek values("Orzel", "Longboat", "1739-07-16", 40);
alter table postac add column funkcja varchar(30);
update postac set funkcja="kapitan" where nazwa="Bjorn";
alter table postac add column statek varchar(20);
alter table postac add foreign key(statek) references statek(nazwa_statku);

update postac set statek="esmeralda" where id_postaci=1 or id_postaci between 4 and 6;
update postac set statek="orze" where id_postaci =2 or id_postaci between 7 and 8;
delete from izba where wlasciciel=1;
drop table izba;

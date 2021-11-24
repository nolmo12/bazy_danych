//zadanie 1
insert into  kreatura select  * from  wikingowie.kreatura;
create table uczestnicy like wikingowie.uczestnicy;
insert into uczestnicy select * from wikingowie.uczestnicy;
create table etapy_wyprawy like wikingowie.etapy_wyprawy;
insert into etapy_wyprawy select * from wikingowie.etapy_wyprawy;
create table sektor like wikingowie.sektor;
insert into sektor select * from wikingowie.sektor;
create table wyprawa like wikingowie.wyprawa;
insert into wyprawa select * from wikingowie.wyprawa;

select nazwa from kreatura where idKreatury not in (select distinct id_uczestnika from uczestnicy);

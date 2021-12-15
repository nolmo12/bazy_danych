Zad 1.

1.
	Create table uczestnicy as select * from wikingowie.uczestnicy;
	Create table etapy_wyprawy as select * from wikingowie.etapy_wyprawy;
	Create table sektor as select * from wikingowie.sektor;
	Create table wyprawa as select * from wikingowie.wyprawa;
2.
	select nazwa, idKreatury from kreatura where idKreatury not in 
	(select distinct id_uczestnika from uczestnicy);
3.
	select w.nazwa, sum(e.ilosc) from wyprawa w
	inner join uczestnicy u 
	on w.id_wyprawy=u.id_wyprawy
	inner join ekwipunek e
	on u.id_uczestnika=e.idKreatury
	group by w.nazwa;

Zad 2.

1.
	Select w.nazwa, count(u.id_uczestnika), group_concat(k.nazwa) from wyprawa w
	inner join uczestnicy u
	on w.id_wyprawy=u.id_wyprawy
	inner join kreatura k 
	on u.id_uczestnika=k.idKreatury
	group by w.nazwa;
2.
	Select et.kolejnosc, s.nazwa, k.nazwa from sektor s
	inner join etapy_wyprawy et
	on et.sektor=s.id_sektora
	inner join wyprawa w
	on et.idwyprawy=w.id_wyprawy
	inner join kreatura k
	on k.idKreatury=w.kierownik
	order by w.data_rozpoczecia, et.kolejnosc;
	
Zad 3.

1.
	Select s.nazwa, count(et.sektor) from sektor s
	left join etapy_wyprawy et on et.sektor=s.id_sektora
	group by s.nazwa;
2.
	Select k.nazwa, if(count(u.id_uczestnika)>0, 'bral udzial w wyprawie', 'nie bral udzialu w wyprawie') 
	from kreatura k
	left join uczestnicy u
	on k.idKreatury=u.id_uczestnika
	group by k.nazwa;
	
Zad 4.

1.
	Select w.nazwa, if(sum(length(et.dziennik))<400, sum(length(et.dziennik)), NULL) from wyprawa w 
	inner join etapy_wyprawy et
	on et.idWyprawy=w.id_wyprawy
	group by w.nazwa;
2.
select u.id_wyprawy, sum(e.ilosc*z.waga)/count(distinct(u.id_uczestnika)) as srednia
 from uczestnicy u
 left join ekwipunek e on u.id_uczestnika=e.idKreatury
 left join zasob z on e.idZasobu=z.idZasobu
 group by u.id_wyprawy;

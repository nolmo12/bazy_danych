//zad1
SELECT d.nazwa, min(p.pensja), max(p.pensja), avg(p.pensja) from dzial d join pracownik p on d.id_dzialu=p.dzial group by d.id_dzialu;
//zad2
SELECT
  k.pelna_nazwa,
  z.numer_zamowienia,
  sum(pz.cena * pz.ilosc)
from
  klient k
  join zamowienie z on k.id_klienta = z.klient
  join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
group by
  z.id_zamowienia
order by
  sum(pz.cena * pz.ilosc) desc
limit
  10;
//zad3
select year(z.data_zamowienia) as rok, sum(pz.ilosc*pz.cena) as przychod from pozycja_zamowienia pz join zamowienie z on pz.zamowienie=z.id_zamowienia group by rok order by przychod desc;
//zad4
select sum(pz.ilosc*pz.cena) as wartosc from pozycja_zamowienia pz join zamowienie z on pz.zamowienie=z.id_zamowienia where z.status_zamowienia=6;
//zad5
select ak.miejscowosc as miasto, count(z.id_zamowienia) as liczba_zamowien, sum(pz.ilosc*pz.cena) as wartosc from zamowienie z join klient k on z.klient=k.id_klienta join adres_klienta ak on k.id_klienta=ak.klient join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie where ak.typ_adresu=1 group by miasto;
//zad6
select sum((pz.cena-t.cena_zakupu)*pz.ilosc) as dochod from pozycja_zamowienia pz join zamowienie z on pz.zamowienie=z.id_zamowienia join towar t on pz.towar=t.id_towaru where z.status_zamowienia=5;
//zad7
select year(z.data_zamowienia) as rok, sum((pz.cena-t.cena_zakupu)*pz.ilosc) as dochod from pozycja_zamowienia pz join zamowienie z on pz.zamowienie=z.id_zamowienia join towar t on pz.towar=t.id_towaru where z.status_zamowienia=5 group by rok;
//zad8
select k.nazwa_kategori, sum(t.cena_zakupu*sm.ilosc) as wartosc from towar t join stan_magazynowy sm on t.id_towaru=sm.towar join kategoria k on t.kategoria=k.id_kategori group by k.nazwa_kategori;
//zad9
select monthname(data_urodzenia) as miesiac, count(id_pracownika) as ilosc from pracownik group by month(data_urodzenia), miesiac order by month(data_urodzenia);
//zad10
select PERIOD_DIFF(date_format(curdate(), '%Y%m'),date_format(p.data_zatrudnienia, '%Y%m'))*pensja as koszt from pracownik p;

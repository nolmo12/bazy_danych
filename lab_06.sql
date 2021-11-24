//zadanie1
select avg(waga) from kreatura where rodzaj='wiking';
select count(rodzaj), avg(waga) from kreatura group by rodzaj;
select avg(year(dataUr)) from kreatura;
// zadanie2
select rodzaj, sum(waga) from zasob group by rodzaj;
select
  avg(waga)
from
  zasob
group by
  rodzaj
having
  ilosc > 3
  and avg(waga)  > 10;
select count(distinct(nazwa)), rodzaj from zasob group by rodzaj having sum(ilosc)>1;
//zadanie3
select k.nazwa, sum(e.ilosc) from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatury group by(nazwa);
select kreatura.nazwa, zasob.nazwa from kreatura inner join ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury inner join zasob on ekwipunek.idZasobu=zasob.idZasobu order by kreatura.nazwa;
select kreatura.nazwa, ekwipunek.idKreatury from kreatura left join ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury where ekwipunek.idKreatury is null;
//zadanie4
select k.nazwa, z.nazwa from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatury inner join zasob z on e.idZasobu=z.idZasobu where k.rodzaj='wiking' and year(k.dataUr) between 1670 and 1679;
select k.nazwa from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatury inner join zasob z on e.idZasobu=z.idZasobu where z.rodzaj='jedzenie' order by kdataUr desc limit 5;
select k1.nazwa, k2.nazwa from kreatura k1  inner join kreatura k2 on k1.idKreatury+5=k2.idKreatury;
//zadanie5
select k.rodzaj, avg(z.waga) from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatury inner join zasob z on e.idZasobu=z.idZasobu where k.rodzaj!='malpa' or k.rodzaj!='waz' group by k.rodzaj having sum(e.ilosc)<30;
select k.nazwa, k.rodzaj, k.dataUr from kreatura k, (select rodzaj, min(dataUr)as min, max(dataur) as max from kreatura group by rodzaj) as pod where k.dataUr=pod.min or k.dataUr=pod.max;

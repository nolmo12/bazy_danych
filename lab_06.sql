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
select nazwa from kreatura where rodzaj='wiking' and where dataUr>1670.12.31;

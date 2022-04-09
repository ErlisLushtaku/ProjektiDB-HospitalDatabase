


-- View per paraqitjen e pacientav qe kane anuluar gjate vitit 2019 (numrin se sa termine ka anuluar
-- ai pacient)
CREATE VIEW Terminet_e_Anuluara1 as
SELECT p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', count(t.tKoha) as 'Terminet e anuluara'
FROM Pacienti p
inner join Terminet t on p.SSN=t.tSSN
WHERE t.tAnuluar=TRUE and t.tKoha in (
                                       select t.tKoha from Terminet t
                                       where t.tKoha BETWEEN '2019-01-01 00:00' AND '2019-12-31 23:59:59' AND t.tAnuluar=TRUE)
group by t.tSSN;
select * from Terminet_e_Anuluara1;



-- View paraqitjen e te dhenave lidhur me intervenimet e kryera (Koha kur eshte kryer intervenimi
-- emri dhe mbiemri i pacientit, emri dhe mbiemri i shoferit, modeli i mjetit te ambulances dhe qyteti ku eshte kryer intervenimi
create view Perdorja_e_automjetiti as
(select i.iDataKoha as "Data e Perdorimit",concat(p.pEmri,' ',p.pMbiemri)as Pacienti,
concat(s.sEmri,' ',s.sMbiemri)as Shoferi,a.amModeli as Modeli, ab.qQyteti as 'Qyteti'
from intervenimet i 
inner join ambulanca a on i.iAmID=a.AmID
inner join stafi s on i.iShoferi=s.SID
inner join pacienti p on i.iSSN=p.SSN
inner join adresa ab on i.iAID=ab.AID
where a.amModeli='VW'
union
select i.iDataKoha as "Data e Perdorimit",concat(p.pEmri,' ',p.pMbiemri)as Pacienti,
concat(s.sEmri,' ',s.sMbiemri)as Shoferi,a.amModeli as Modeli, ab.qQyteti as 'Qyteti'
from intervenimet i 
inner join ambulanca a on i.iAmID=a.AmID
inner join stafi s on i.iShoferi=s.SID
inner join pacienti p on i.iSSN=p.SSN
inner join adresa ab on i.iAID=ab.AID
where a.amModeli='Mercedes'
union
select i.iDataKoha as "Data e Perdorimit",concat(p.pEmri,' ',p.pMbiemri)as Pacienti,
concat(s.sEmri,' ',s.sMbiemri)as Shoferi,a.amModeli as Modeli, ab.qQyteti as 'Qyteti'
from intervenimet i 
inner join ambulanca a on i.iAmID=a.AmID
inner join stafi s on i.iShoferi=s.SID
inner join pacienti p on i.iSSN=p.SSN
inner join adresa ab on i.iAID=ab.AID
where a.amModeli='Toyota');
select * from Perdorja_e_automjetiti;

 
 create table intervenimet_audit(
 IID integer auto_increment primary key,
 iAmID integer,
 iShoferi integer,
 iSSN integer,
 iDataKoha date,
 iAID integer,
 InsertDatetime datetime,
 InsertUser varchar(200),
 Action varchar(20));

 delimiter $$
 create trigger intervenimeauditInsert before insert on intervenimet
 for each row 
 begin 
 insert  into intervenimet_audit()
 values(new.IID,new.iAmID,new.iShoferi,new.iSSN,new.iDataKoha,new.iAID,now(),current_user(),'Insert');
 end$$
 delimiter $$ 
 
 select* from intervenimet_audit;
 INSERT INTO Intervenimet(iAmID,iShoferi,iSSN,iDataKoha,iAID)
 VALUES (3,5,10,'2021-9-10',3);
 
 
 delimiter $$
create function mosha(date1 date) 
returns int 
deterministic
begin
declare date2 date;
select current_date()into date2;
return year(date2)-year(date1);
end $$
delimiter $$
 -- query per gjetjen e (emri dhe mbiemri) renditur sipas gjatesis, qe fillojn me shkronjen A
 -- diagnozen dhe terapin e pacientit ne fjale
 select p.SSN,concat(p.pEmri,' ',p.pMbiemri) as "Emri dhe Mbimri",length(concat(p.pEmri,' ',p.pMbiemri)) as Length,
 v.vDiagnoza "Diagnoza",v.vTerapia as "Terapia",mosha(pDataLindjes) as Mosha
 from pacienti p
 left join vizitat v
 on p.SSN=v.SSN
 where p.pEmri like "A%"
 order by Length desc;




select SSN as ID, pEmri as Emri,pMbiemri as Mbiemri,mosha(pDataLindjes) as Mosha
from pacienti
order by pEmri;
select *from kategoritesociale;

delimiter $$
create function rritja(paga int) 
returns decimal
begin
declare perqindja decimal;
declare rritja decimal;
set perqindja=0.2;
set rritja=paga*perqindja;
return rritja+paga;
end $$
delimiter $$



delimiter $$
create function rritja(paga int) 
returns decimal 
deterministic
begin
if paga<700
then
return 0.1*paga+paga;
elseif paga>=700 and paga<1400
then
return 0.2*paga+paga;
else
 return 0.3*paga+paga;
end if;
end $$
delimiter $$
select d.DID as 'DID', d.dEmri as 'Emri', d.dMbiemri as 'Mbiemri', g.gPaga as 'Paga normale', rritja(g.gPaga) as 'Paga pas rritjes'
from Doktori d
inner join grada g on d.dTitulli=g.gTitulli
inner join vizitat v on d.DID=v.DID
where v.vKoha between '2020-03-01' and '2021-03-01'
group by d.DID;




delimiter $$
create trigger ValidateEmailBeforInsert before insert on pacienti
for each row
begin 
if new.pEmail not like '%_@__%.__%' 
then signal sqlstate '45000'
set message_text='Email duhet të ketë këtë format example@gmail.com';
end if;
end $$
delimiter $$

INSERT INTO Pacienti (pEmri,pMbiemri,pEmriPrindit,pDataLindjes,pGjinia,pNrPersonal,
pRruga,AID,KID,pTelMobil,pTelFix,pEmail,pGrupiGjakut,pAlergjite,pSemundjetKronike)
VALUES ('Bardhaa', 'Aliui', 'Agimi', '2018-2-15', 'F', '1396557468', 'Kruja', 1, 4, 
'044198436',NULL,'bardhaliuhotmail.com' , 'A+', null,null);


delimiter $$
create function shteti(pagesa integer)
returns varchar(50)
deterministic
begin 
declare pshteti varchar(50);
if pagesa=7 THEN 
set pshteti='E paguar nga shteti';
elseif pagesa is null THEN
set pshteti='E papaguar';
else 
set pshteti='E paguar nga pacienti';
end if;
return (pshteti);
end $$
delimiter $$
drop function shteti;
drop view Faturat_e_paguara;
create view Faturat_e_paguara as
select f.fVID as 'Numri i vizites', p.pEmri as 'Emri' , p.pMbiemri as 'Mbiemri' , f.fData as 'Data e vizites',
		k.kKategoria as 'Kategoria sociale',
	    shteti(f.fPagesa) as 'Pagesa'
from Faturat f
inner join Pacienti p on p.SSN=f.fSSN
inner join kategoritesociale k on p.KID=k.KID;

select * from Faturat_e_paguara;





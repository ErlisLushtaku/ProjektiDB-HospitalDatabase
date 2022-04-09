-- QUERY-t --
-- 1. Listoni të gjithë pacientët që janë nga qyteti i Prishtinës
-- --------------------- --
SELECT SSN, pEmri, pMbiemri 
FROM Pacienti 
WHERE AID=1;
-- ------------------------------------- --
SELECT SSN, pEmri, pMbiemri 
FROM Pacienti p 
INNER JOIN Adresa a ON p.AID=a.AID 
WHERE a.qQyteti='Prishtina';

-- 2.	Cilët pacientë (SSN-të dhe emrat e tyre) kanë paguar fatura në vlerë mbi 150 Euro? 
-- ------------------------------- --
select p.SSN, p.pEmri from Pacienti p
inner join Faturat f on p.SSN=f.fSSN
where FCmimiMeTVSH>150 and f.ePaguar=true;
-- per te pare saktesisht faturat e paguara nga pacientet ( jo ato te paguara nga shteti )
select distinct p.SSN, p.pEmri from Pacienti p
inner join Faturat f on p.SSN=f.fSSN
where fCmimiMeTVSH>150 and (p.KID=1 or p.KID=2) and f.ePaguar=true;



-- 3.	Paraqitni të gjitha terminet e vizitave që janë caktuar për nesër për radiologji. 
select * from Terminet
where tKoha=adddate(curdate(),1) and tReparti=120 and tAnuluar=FALSE;

select * from Terminet t
inner join Repartet r on r.RID=t.tReparti
where t.tKoha=adddate(curdate(),1) and r.rEmriRepartit='Radiologji' and t.tAnuluar=FALSE;

-- 4.	Listoni ID-të e doktorëve të cilët dje kanë pasur dy ose më shumë vizita ndërsa sot nuk kanë pasur asnjë vizitë. 

select v.DID from Vizitat v
			where date(v.vKoha)=date(adddate(curdate(),-1))
			group by v.DID
			having count(*)>=2
            and v.DID not in ( select DID from Vizitat
                                where date(vKoha)=current_date());

-- Listoni top 5 doktorët me numër maksimal të vizitave në 3 muajt e fundit. Lista të paraqes të dhënat e doktorit duke përfshirë edhe
-- emrin e repartit ku punon dhe numrin e vizitave që ka realizuar

select d.DID as 'ID',d.dEmri as 'Emri', d.dMbiemri as 'Mbiemri', d.dTelMobil as 'Numri i telefonit' ,r.rEmriRepartit as 'Emri Repartit', count(v.DID) as 'Numri i vizitav'
from Doktori d, Repartet r, Vizitat v
where d.dReparti=r.RID and d.DID=v.DID and v.vKoha>=now()-interval 3 month 
group by v.DID
limit 5;

-- 6. Për secilin repart paraqitni (në një listë të vetme):
--  numrin e doktorëve që punojnë në atë repart,
--  pagën mesatare,
--  numrin e vizitave të realizuara në këtë vit
--  shumën e faturuar (vlerën pa TVSH dhe me TVSH) nga vizitat
-- e realizuara në këtë vit
--  shumën e pagesave të realizuara në këtë vit
       
select r.rEmriRepartit as "Emri i repartit", count(v.DID) as 'Nr i vizitav', avg(g.gPaga) as 'Paga mesatare', count(distinct d.DID) as 'Nr i doktoreve', 
		sum(f.fCmimiPaTVSH) as 'Cmimi total i faturuar pa TVSH', sum(f.fCmimiMeTVSH) as 'Cmimi total i faturuar me TVSH', 
		sum(case when f.ePaguar=true then f.fCmimiMeTVSH end) as 'Cmimi total i paguar me TVSH'
	from Doktori d
    inner join Repartet r on r.RID=d.dReparti
    inner join Grada g on g.gTitulli=d.dTitulli
    left join Vizitat v on d.DID=v.DID
    left join Faturat f on f.fSSN=v.SSN and f.fData=v.vKoha
    group by r.rEmriRepartit;



-- Triggers dhe Stored Procedure per insertim dhe update te te dhenave ne tabelen Doktori --
delimiter $$
create procedure Repartet_trigger(Reparti integer)
begin
set @max_r=(select max(RID) from Repartet);
set @min_r=(select min(RID) from Repartet);
set @mesazhi=concat('RID e repartit duhet të jetë më e madhe ose e barabartë me ', @min_r, ' dhe më e vogël ose e barabartë me ', @max_r);
if Reparti not between @min_r and @max_r
then signal sqlstate '45000'
set message_text= @mesazhi;
end if;
end $$
delimiter $$

delimiter $$
create trigger NrRepartit1 before update on Doktori 
for each row
begin
Call Repartet_trigger(new.dReparti);
end $$
delimiter $$

delimiter $$
create trigger NrRepartit2 before insert on Doktori 
for each row
begin
Call Repartet_trigger(new.dReparti);
end $$
delimiter $$

-- Procedure per te gjetur pacientat qe mund t'i japin gjak nje grupi te caktuar te gjakut
delimiter $$
create procedure Dhuruesit_e_gjakut (Gr_gjakut varchar(3))
begin
declare grgjakut varchar(3);
set grgjakut=Gr_gjakut;
IF grgjakut='0-'
THEN 
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where p.pGrupiGjakut='0-' and p.pSemundjetKronike is null;
ELSEIF grgjakut='0+'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='0+') and p.pSemundjetKronike is null;
ELSEIF grgjakut='A-'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='A-') and p.pSemundjetKronike is null;
ELSEIF grgjakut='A+'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='0+' or p.pGrupiGjakut='A-' or p.pGrupiGjakut='A+') and p.pSemundjetKronike is null;
ELSEIF grgjakut='B-'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='B-') and p.pSemundjetKronike is null;
ELSEIF grgjakut='B+'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='0+' or p.pGrupiGjakut='B-' or p.pGrupiGjakut='B+') and p.pSemundjetKronike is null;
ELSEIF grgjakut='AB-'
THEN
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='A-' or p.pGrupiGjakut='B-' or p.pGrupiGjakut='AB-') and p.pSemundjetKronike is null;
ELSE 
select p.pEmri as 'Emri', p.pMbiemri as 'Mbiemri', p.pRruga as 'Rruga', a.qQyteti as 'Qyteti', p.pTelMobil as 'Numri i telefonit', p.pGrupiGjakut as 'Grupi Gjakut'
from Pacienti p
inner join Adresa a on p.AID=a.AID
where (p.pGrupiGjakut='0-' or p.pGrupiGjakut='0+' or p.pGrupiGjakut='A-' or p.pGrupiGjakut='A+' or p.pGrupiGjakut='B-' or p.pGrupiGjakut='B+' or p.pGrupiGjakut='AB-' 
or p.pGrupiGjakut='AB+') and p.pSemundjetKronike is null;
END IF;
end $$
delimiter $$
CALL Dhuruesit_e_gjakut('AB+');
-- ???




         update Terminet set tAnuluar=TRUE where tSSN=2 and tKoha='2018-7-20 19:35';
         create table terminet_audit(
 tid integer auto_increment primary key,
 tSSN integer,
 tKoha datetime,
 tReparti integer NOT NULL,
 tAnuluar boolean,
 tDataeInsertimit date,
 DeleteDatetime datetime,
 DeleteUser varchar(200),
 DeleteAction varchar(20));
 delimiter $$
 create trigger terminetauditDelte before update on terminet
 for each row 
 begin 
 if new.tAnuluar=true then
 insert  into terminet_audit()
 values(old.tSSN,old.tKoha,old.tReparti,old.tAnuluar,old.tDataeInsertimit,now(),current_user(),'Update');
 end if;
 end$$
 delimiter $$ 







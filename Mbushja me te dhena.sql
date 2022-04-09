-- Insertimi i te dhenave tek tabela Adresa --
INSERT INTO Adresa (qQyteti,qKodiPostal,qShteti)
     VALUES ('Prishtina','10000','Kosovë'),
			('Mitrovica','40000','Kosovë'),
			('Peja','30000','Kosovë'),
			('Prizereni','20000','Kosovë'),
			('Ferizaj','70000','Kosovë'),
			('Gjilani','60000','Kosovë'),
			('Gjakova','50000','Kosovë');
select * from Adresa;


-- Inserimi i te dhenave tek tabela Grada --
INSERT INTO Grada (gTitulli,gPaga)
     VALUES ("Doktor i praktikes se pergjithshme", 550),
			("Specializant", 550),
			("Specialist", 700),
			("Subspecializant", 1400);
select * from Grada;

-- Insertimi i te dhenave tek tabela Repartet --
INSERT INTO Repartet(rEmriRepartit)
     VALUES ('Pediatri'),
			('Gjinokologji'),
			('Kirurgji'),
			('Ortopedi'),
			('Urologji'),
			('Oftalmologji'),
			('Otorinolaringologji'),
			('Internisti'),
			('Dermatologji'),
			('Infektiv'),
			('Pneumologji'),
			('Neurologji'),
			('Psikiatria'),
			('Gastronterologji'),
			('Interno'),
			('Fiziatri'),
			('Reumatologji'),
			('Vaksinim'),
			('Kartoteka'),
			('Radiologji');
select * from Repartet;



-- Insertimi i te dhenave tek tabela Kategorite Sociale --
INSERT INTO KategoriteSociale (kKategoria)
     VALUES ("I/e punesuar"),
			("I/e papunesuar"),
			("Veteran/e"),
			("I/e mitur"),
			("Student/e"),
			("Pensioner/e"),
			("Rast Social"),
			("Invalid/e");
select * from KategoriteSociale;

-- Insertimi i te dhenave per tabelen Pacienti --
INSERT INTO Pacienti (pEmri,pMbiemri,pEmriPrindit,pDataLindjes,pGjinia,pNrPersonal,pRruga,AID,KID,pTelMobil,pTelFix,pEmail,pGrupiGjakut,pAlergjite,pSemundjetKronike)
VALUES ('Bardha', 'Aliu', 'Agim', '2008-2-15', 'F', '1396087468', 'Kruja', 1, 4, '044198436',NULL,'bardhaliu@hotmail.com' , 'A+', null,null),
		('Rron', 'Bejta' ,'Ilir' ,'1954-12-10', 'M', '1846021597' ,'Naum Veçilharxhi' ,7,6, '049111444' ,'+38138117110' ,NULL,'0-',NULL,'Diabeti'),
		('Vesa', 'Kryeziu' ,'Admir' ,'2019-1-1', 'F',NULL,'Qemal Stafa',4,4,NULL,NULL,NULL,NULL,'Veze',NULL),
		('Nart', 'Krasniqi' ,'Gazmend','1976-9-15','M','2030494397','Rexhep Terpeza',1,8,'046329654','+38138968574','nart1krasniqi@gmail.com','B-','Urtikaria',NULL),
		('Dielleza', 'Gashi','Lutfi','1997-7-18','F','7369852194','24 Maji',4,1,'049850369','+38138446655','diellezagashi12@hotmail.com','A+',NULL,NULL),
		('Rinesa', 'Berisha','Besnik','2003-9-3','F','8734015974','1 Tetori',6,4,'043176528',NULL,'esaberisha@hotmail.com','AB-',NULL,NULL),
		('Drin','Shkodra','Berat','1981-5-30','M','7172793658','Ahmet Gashi',2,8,'049864325','+38138506298','drin1shkodra@gmail.com','A-','Ekzema',NULL),
		('Era', 'Hoti', 'Gani','1981-11-26','F','4698201218','Trepça',1,3,'049021468','+38138669977','erahoti1@gmail.com','AB+',NULL,'Astma'),
		('Bardha', 'Aliu','Ylber','1995-3-2','F','1247931846','Vellezerit Gervalla',1,1,'043298671','+38138669574','bardhaliu12@gmail.com','B+',NULL,NULL),
		('Vanesa','Hashani','Avni','1991-2-2','F','1247900846','Avni Rrustemi',3,2,'046932700',NULL,'vanesahashani@hotmail.com','A-',NULL,NULL),
		('Albion','Ajeti','Korab','1972-10-21','M','9068482157','Abdyl Dura',1,1,'044111222','+38138465213','albionajeti@gmail.com','B+',NULL,'Hipertensioni'),
		('Vesa','Krasniqi','Avni','1962-1-14','F','9478302157','Agim Ramadani',6,3,'049142536','+38138954784','vesaakrasniqi@hotmail.com','AB-',NULL,NULL),
		('Era','Haziri','Avni','1982-11-5','F','4653297318','Bedri Gjini',3,1,'048732844','+38138469825','erahaziri2@gmail.com','0-',NULL,NULL),
		('Driton','Osmani','Bujar','2002-2-22','M','2417462657','Zagrebi',5,5,'043018620',NULL,'drtnosmani@gmail.com','A+','Riniti alergjik',NULL),
		('Lis','Mehmetaj','Labeat','2013-11-13','M','7032793058','Pashtriku',4,4,NULL,NULL,NULL,'A+',NULL,NULL),
		('Art','Iljazi','Alban','2001-1-20','M','3296587431','Ulqini',5,5,'044765328',NULL,'artiljazi5@gmail.com','AB-',NULL,NULL),
		('Ardi','Gashi','Urim','2013-9-16','M',NULL,'Mark Dizdari',3,5,'049225588',NULL,'gashiardi@gmail.com','0+',NULL,NULL),
		('Lis','Sylejmani','Mentor','2000-6-20','M','1456080468','Kuvendi I Junikut',7,5,'044357951',NULL,'sylejmanilis@hotmail.com','B-',NULL,NULL),
		('Vesa','Lleshi','Albert','1976-9-17','F', '3469587011','Selman Riza',5,1,'044856985','+38138197520','vesaalleshi@gmail.com','A-',NULL,NULL),
		('Art','Mehmeti','Urim','1964-5-25','M','1173896541','Sali Matoshi',3,2,'049332244','+38138469211','art25mehmeti@gmail.com','AB+',NULL,NULL),
		('Gjin','Vetima','Tom','2020-1-5','M',NULL,'Rame Bllaca',2,4,NULL,NULL,NULL,NULL,NULL,NULL),
		('Sinan','Dobreva','Ali','1970-9-6','M','1173696321','Faruk Zjermi',6,3,'044369666',NULL,'sinanloqka@gmail.com','0-',NULL,NULL);
   
      select * from Pacienti;
	
            
            
INSERT INTO Doktori (dEmri,dMbiemri,dNrPersonal,dTitulli,dRruga,AID,dTelMobil,dTelFix,dEmail,dReparti)
     VALUES ( 'Haki','Rexhepi', '1174585921', 'Subspecializant', 'Ahmet Krasniqi', 1, '049876653', '+38138489762', 'haki.rexhepi@gmail.com', 103),
			( 'Agim' ,'Bytyci', '1175558111', 'Specialist', 'Driton Islami', 5, '049588432', '+38138788988', 'agimbytyci1@gmail.com', 113),
			( 'Blerta' ,'Sylejmani', '1174786554', 'Doktor i praktikes se pergjithshme', 'Tirana 4',4, '049999808', '+38138998877' , 'blerta_sylejmani@gmail.com',102),
			( 'Gani',' Gashi', '1172345821','Specializant', 'Femi Agani', 7, "044111232", "+38138673422", "ganigashi@outlook.com", 110),
			('Arjeta', 'Balaj', '1172345869', "Subspecializant", "Ibri", 2, "044755556", "+38138223333", "arjetabalaj@gmail.com", 111),
			('Hajdin ','Lata', "1174489551", "Subspecializant", "12 Qershori", 5, "045604444", "+38138985555", "hajdinlata@gmail.com", 106),
			('Sevdije',' Malaj', "1179832566", "Subspecializant", "Rruga B", 1, "049565678", "+38138121212", "sevdije.malaj@hotmail.com", 115),
			( 'Jeta ','Rexhaj', "1177298312", "Specialist", "Rruga e Birrarisë", 3, "049200100", "+38138777434", "jeta.rexhaj@hotmail.com", 112),
			('Adem ','Hyseni', "1179133847", "Specialist", "Iliria", 6, "044604504", "+38138868909", "ademhyseni@gmail.com", 101),
			('Sami',' Hajdari', "1179841244", "Subspecializant", "1 Tetori", 1, "049787888", "+38138236235", "samihajdari@gmail.com", 104),
			('Mirlinda',' Abazi', "1176543219", "Specializant", "7 Shtatori", 3, "049001001", "+38138405909", "mirlindaabazi@gmail.com", 114),
			('Fatime ','Tahiri', "1179221734", "Specialist", "Rruga Preshevë", 6, "044667222", "+38138848332", "fatime.tahiri@hotmail.com", 117),
			('Art','Mustafa', "1170289128", "Doktor i praktikes se pergjithshme", "UÇK", 2, "049090807", "+38138840909", "artmustafa@gmail.com", 109),
			('Adriatik ','Demaku', "1174536810", "Doktor i praktikes se pergjithshme", "Epopeja e Jezercit", 5, '045678678', '+38138125674', 'adriatik.demaku@hotmail.com', 107),
			('Vlora',' Hoxha', "1179375430", "Specialist", "Bekim Berisha", 3, "049888909", "+38138565463", "vlora.hoxha@hotmail.com", 116),
			('Blend', 'Ademi', "1175671829", "Specialist", "Dëshmorët e Rugovës", 7, "044565676", "+38138489762", "blend.ademi@hotmail.com", 108),
			('Lirim ','Ahmeti', "1176723011", "Specializant", "Vëllezërit Baftiu", 6, "044122223", "+38138844667", "lirim.ahmeti@hotmail.com", 105),
			('Riga ','Dibrani', "1172642512", "Subspecializant", "Vëllezërit Gërvalla", 1, "044513695", "+38138846452", "riga.dibrani11@hotmail.com", 120),
			('Valëza ','Grainca', "1172642222", "Specialist", "Agim Ramadani", 1, "044555699", "+38138846655", "valezagrainca@hotmail.com", 111);

            select * from Doktori;

-- Insertimi i te dhenave tek tabela Terminet --
INSERT INTO Terminet(tSSN,tKoha,tReparti,tAnuluar,tDataeInsertimit)
     VALUES (2,'2018-7-20 19:35', 114, FALSE, '2018-7-18'),
			(12, '2018-8-7 16:00', 106, FALSE, '2018-7-22'),
			(9,'2018-9-20 17:00', 112, FALSE, '2018-7-22'),
			(10,'2018-8-5 15:15', 110, FALSE, '2018-8-1'),
			(7, '2019-12-20 16:10', 105, TRUE, '2019-12-1'),
			(16, '2019-12-8 21:20', 104, FALSE, '2019-12-1'),
			(6, '2019-12-22 18:50', 103, FALSE, '2019-12-15'),
			(13, '2019-12-19 13:10', 109, FALSE, '2019-12-15'),
			(8, '2020-1-5 13:00', 102, FALSE, '2020-12-29'),
			(11, '2020-1-5 13:00', 116, FALSE, '2020-12-30'),
			(3, '2020-1-2 20:25', 118, FALSE, '2020-1-1'),
			(15, '2020-2-20 12:40', 101, FALSE,'2020-2-2'),
			(5, '2020-2-15 18:50', 111, TRUE, '2020-2-2'),
			(2, '2020-2-5 17:20', 113, FALSE, '2020-2-3'),
			(4, '2020-3-10 15:30', 111, FALSE, '2020-2-27'),
			(19, '2020-3-5 15:15', 117, FALSE, '2020-2-27'),
			(14, '2020-3-15 13:05', 118, FALSE, '2020-3-3'),
			(1, '2020-4-22 17:40', 103, TRUE, '2020-4-10'),
			(12, '2020-4-12 18.35', 111, FALSE, '2020-4-11'),
			(20, '2020-4-15 21:30', 104, TRUE, '2020-4-13'),
			(22, '2020-5-7 15:55', 111, FALSE, '2020-5-1'),
			(20, '2020-5-2 15:45', 108, FALSE, '2020-5-1'),
			(17, '2020-8-27 8:15', 118, FALSE, '2020-8-24'),
			(18, '2020-8-30 10:30', 107, FALSE, '2020-8-25'),
			(12, '2020-12-18 16:20', 111, FALSE, '2020-12-1'),
			(1, '2020-12-22 16:20', 104, FALSE, '2020-12-3'),
			(6, '2020-12-20 15:25', 111, FALSE, '2020-12-19'),
			(14, '2020-12-20 0:00', 111, FALSE, '2020-12-19'),
			(13, curdate()+1, 120, FALSE, '2020-12-21'),
            (14, date_add(curdate()+1, interval 15 minute), 120, FALSE, '2020-12-21');
            select * from Terminet;
            
            
delimiter $$
create procedure Add_Data (atSSN integer, atKoha datetime, atReparti integer, atAnuluar boolean, atDataeInsertimit date)
begin
Insert into Terminet(tSSN,tKoha,tReparti,tAnuluar,tDataeInsertimit)
values (atSSN, atKoha, atReparti, atAnuluar, atDataeInsertimit);
end $$
delimiter $$

DROP PROCEDURE IF EXISTS TableDatas;
delimiter $$
CREATE PROCEDURE TableDatas (tab_name varchar(100)) 
begin
SET @table_name1 =CONCAT('SELECT * FROM ',tab_name);
 PREPARE stmt3 FROM @table_name1;
 EXECUTE stmt3;
end $$
delimiter $$
CALL TableDatas('Pacienti');

CALL Add_Data(15,date_add(curdate()-1, interval 15 minute), 111, FALSE, '2020-12-29');
CALL Add_Data(16,curdate()-1, 111, FALSE, '2020-12-30');
CALL Add_Data(17,date_add(curdate()-1, interval 45 minute), 111, FALSE, '2020-12-31');
CALL Add_Data(2,date_add(curdate()-1, interval 15 minute), 103, FALSE, '2020-12-29');
CALL Add_Data(3,curdate()-1, 103, FALSE, '2020-12-30');
CALL Add_Data(5,date_add(curdate()-1, interval 45 minute), 103, FALSE, '2020-12-31');
CALL Add_Data(5,date_add(curdate(), interval 45 minute), 103, FALSE, '2020-12-31');
CALL TableDatas('Pacienti');

-- Insertimi i te dhenave ne tabelen Vizitat --
INSERT INTO Vizitat(SSN,DID,vDiagnoza,vTerapia,vKoha)
     VALUES (2, 11, "IBS", "Rifaximin", '2018-7-20 19:35'),
			(10, 4, "Hepatit C", "Tableta DAA",'2018-8-5 15:15'),
			(12, 6, "Glaukome", "Pika per sy",'2018-8-7 16:00'),
			(9, 8, "Alzheimer", "Razadyne", '2018-9-20 17:00'),
			(16, 10, "Thyerje e dores", "Operacion ortopedik",'2019-12-8 21:20'),
			(13, 13, "Ekzema", "Kreme per lekure", '2019-12-19 13:10'),
			(6, 1, "Aritmia", "Monitorim i vazhdueshem", '2019-12-22 18:50'),
			(8, 3, "Shtatzeni", "Tableta" , '2020-1-5 13:00'),
			(11, 15, "Çrregullim neuromuskular", "Afereza",'2020-1-5 13:00'),
			(2, 2, "Depresion klinik", "Antidepresant",'2020-2-5 17:20'),
			(15, 9, "Bronkit", "Ibuprofen",'2020-2-20 12:40'),
			(19, 12, "Artriti", "DMARD", '2020-3-5 15:15'),
			(4, 5, "COVID 19", "Veklury", '2020-3-10 15:30'),
			(12, 5, "COVID 19", "Veklury", '2020-4-12 18:35'),
			(20, 16, "Diabet", "Insulin", '2020-5-2 15:45'),
			(22, 5, "COVID 19", "Veklury", '2020-5-7 15:55'),
			(18, 14, "Sinuset", "Sprej Nasal", '2020-8-30 10:30'),
			(12, 5, "COVID 19", "Veklury" , '2020-12-18 16:20'),
			(1, 10, "Skolioze", "Operacion ortopedik", '2020-12-22 16:20');
           
           select * from Vizitat;  
           
DROP PROCEDURE IF EXISTS Add_Data1;
delimiter $$
create procedure Add_Data1 (avSSN integer, avDID integer, avDiagnoza varchar(50), avTerapia varchar(60), avKoha datetime)
begin
Insert into Vizitat(SSN,DID,vDiagnoza,vTerapia,vKoha)
values (avSSN, avDID, avDiagnoza, avTerapia, avKoha);
end $$
delimiter $$


call Add_Data1(16,5, "COVID 19", "Veklury", curdate()-1);
call Add_Data1(15,5, "COVID 19", "Veklury", date_add(curdate()-1, interval 15 minute));
call Add_Data1(17,5, "COVID 19", "Veklury", date_add(curdate()-1, interval 45 minute));
call Add_Data1(2,1, "Aritmia", "Monitorim i vazhdueshem",date_add(curdate()-1, interval 15 minute));
call Add_Data1(3,1, "Aritmia", "Monitorim i vazhdueshem", curdate()-1);
call Add_Data1(5,1, "Aritmia", "Monitorim i vazhdueshem", date_add(curdate()-1, interval 45 minute));
call Add_Data1(5,1, "Aritmia", "Monitorim i vazhdueshem", date_add(curdate(), interval 45 minute));      


     
CALL TableDatas('Pacienti');
             
-- Insertimi i te dhenave tek tabela Menyra e Pageses --
INSERT INTO MenyraePageses(mMenyra)
     VALUES ('Kesh'),
            ('ProCredit'),
            ('Raiffeisen'),
            ('TEB'),
            ('NLB'),
            ('BE'),
            ('KategoriSociale');
            
            
            select * from MenyraePageses;
            
            
-- Insertimi i te dhenave ne tabelen Faturat --
INSERT INTO Faturat(fSSN,fCmimiPaTVSH,fData,ePaguar,fDataPageses,fPagesa)
VALUES  ( 2, 20, '2018-7-20 19:35', TRUE, '2018-7-20', 7),
		( 10, 25.60, '2018-8-5 15:15', TRUE, '2018-8-5',1),
		( 12, 15.2, '2018-8-7 16:00', TRUE, '2018-9-25',7),
		( 9, 195.2, '2018-9-20 17:00', TRUE, '2018-9-20', 2),
		( 16, 35, '2019-12-8 21:20', TRUE, '2019-12-8', 7),
		( 13, 120.3, '2019-12-19 13:10', TRUE,'2019-12-19',3),
		( 6, 87.1, '2019-12-22 18:50', TRUE,'2019-12-22',7),
		( 8, 10.5, '2020-1-5 13:00', TRUE,'2020-1-5', 7),
		( 11, 68.36, '2020-1-5 13:00', FALSE, NULL, NULL),
		( 2, 20, '2020-2-5 17:20', TRUE,'2020-2-5',7),
        ( 15, 260.78, '2020-2-20 12:40', TRUE,'2020-3-25', 7),
		( 19, 149.25, '2020-3-5 15:15', FALSE,NULL,NULL),
		( 4, 56.98, '2020-3-10 15:30', TRUE,'2020-3-10',7),
		( 12, 20, '2020-4-12 18:35', TRUE,'2020-4-12',7),
		( 20, 100, '2020-5-2 15:45', TRUE, '2020-5-2', 5),
		( 22, 330.5, '2020-5-7 15:55', TRUE,'2020-5-7',7),
		( 18, 55.5, '2020-8-30 10:30', TRUE,'2020-8-30',7),
		( 12, 19.3, '2020-12-18 16:20', TRUE,'2020-12-18',7),
		( 1, 87.1, '2020-12-22 16:20', TRUE,'2020-12-22',7);
        
        select * from Faturat;
        -- (21, 16, 107.1, date_add(curdate()-1), TRUE, NULL, NULL),
        -- (22, 3, 7.5, date_add(curdate()-1), TRUE, NULL, NULL),
        -- (23, 15, 57.1, date_add(curdate()-1, interval 15 minute)), TRUE, NULL, NULL),
        -- (24, 2, 37.1, date_add(curdate()-1, interval 15 minute)), TRUE, NULL, NULL),
        -- (25, 17, 37.1, date_add(curdate()-1, interval 15 minute)), TRUE, NULL, NULL)
        -- (26, 5, 37.1, date_add(curdate()-1, interval 45 minute)), FALSE, NULL, NULL),
        -- (27, 5, 37.1, date_add(curdate(), interval 15 minute)), FALSE, NULL, NULL);
		 select * from Faturat;
 
         
 
-- Insertimi i te dhenave tek tabela Infermieret --
INSERT INTO Infermieret(InEmri,InMbiemri,InNrPersonal,InReparti,InAID,InRruga,InTelMobil,InTelFix,InEmail)
     VALUES ('Antigonë', 'Pirku' ,'1170894062' ,118, 4,'Fadil Kabashi','049568233','+38138232366','antigona.pirku@gmail.com'),
			('Arlinda','Binaku','1270896352',103,5, 'Skenderbeu','049214789','+38138636969','arlinda.binaku@gmail.com'),
			('Kol','Mirdita', '1370898547' ,111,3, 'Flamuri', '044562333',NULL,'kol.mirdita@gmail.com'),
			('Aulona','Hamzaj','1170891256',103,3, '28 Nëntori','045265413','+38138159753','aulona.hamzaj01@gmail.com'),
			('Nikoll', 'Berisha','1170893669',118,1,'Brigada 123','044696564','+38138486624','nikoll.berisha01@hotmail.com'),
			('Bal' ,'Kajzogaj','1170893666',110,2, 'Dardania', '049552211','+38138426789','bal.kajzogaj@gmail.com'),
			('Syl', 'Kabashi', '1170892589',113,2,'Nëna Terezë','044654789',NULL,'syl.kabashi@gmail.com'),
			('Ema','Dodaj','1170894512',115,1,'Remzi Ademaj','049283971','+38138486123','ema.dodaj@gmail.com'),
			('Fisnik','Malaj','1170891436',101,1, '11 Marsi','049232666','+38138238945','fisnik.malaj01@gmail.com'),
			('Margarita', 'Palushi', '1170892793', 103,1,'Anton Pashku','044398992','+38138785612','margarita.palushi@gmail.com'),
			('Monika','Sakica','1170891793',119,6,'Rruga e Muhagjirëve','049431314',NULL,'monika.sakica@gmail.com'),
			('Shpend', 'Karavidaj','1170894862',108,7,'Beteja e Kosharës','044003006','+38138364188','shpend.karavidaj@gmail.com'),
			('Shpresë','Zeka','1170895528',105,4,'Jeni Mahalla','045646632','+38138561266','shpresa.zeka@gmail.com'),
			('Orges','Kuçi','1170894935',107,4,'Arbana','045965472','+38138994355','orges.kuci@gmail.com'),
			('Yll','Guraziu','1170899346',106,1,'Pushkatarët','049623003','+38138899621','yll.guraziu@gmail.com');
            select * from Infermieret;
            
            
-- Insertimi i te dhenave tek tabela Vaksinat--
INSERT INTO Vaksinat(v_lloji)
     VALUES ('BSZH'),
			('Eupenta,Polio'),
			('MMR,Polio,DTP'),
			('DT,Polio'),
			('TD-Pro Adult, Polio'),
			('TT');
            select * from Vaksinat;
            
            
-- Insertimi i te dhenave tek tabela Vaksinimi --
INSERT INTO Vaksinimi(InNrPersonal,vaSSN,vaLindja,vaVaksina1,vaAktuale,vaDataAktuale,vaAlergjia1,vaAlergjia2)
     VALUES ( 1170894062, 3, 'Normale','2020-1-4', 5,'2020-1-2',TRUE,FALSE),
		    ( 1170894062, 21, 'Normale','2020-1-5', 1,'2020-1-5',NULL,NULL),
			(1170894062, 14,  'Operim','2002-2-22', 3,'2020-3-15',NULL,NULL),
			(1170894062, 17,  'Normale','2013-9-18', 6,'2020-8-27', NULL, NULL);
			   select * from Vaksinimi;
               
-- Insertimi i te dhenave tek tabela Stafi --
INSERT INTO Stafi(sEmri,sMbiemri,sPozita,sAID,sRruga,sTelMobil,sTelFix,sEmail)
     VALUES ('Sinan','Llugaxhiu','Punetor teknik',1,'Iliria','049369369','+38138632156','sinan.llugaxhiu@hotmail.com'),
			('Lul','Baralija','Shofer',6,'Beteja e Llapushnikut','045787863','+38138639852','luliluli@gmail.com'),
			('Elsa','Tershani','Pastruese',6,'Lagjja e Terzinjeve','045874512',NULL,'elsa.tershani01@yahoo.com'),
			('Zef','Tarashaj','Pastrues',4,'Edit Durham','049895623',NULL,'zeftarashaj@yahoo.com'),
			('Haxhi','Sadikaj','Shofer',1,'17 Shkurti','045235689',NULL,'haxhi.sadikaj@hotmail.com'),
			('Merita','Lipovica','Punetore teknike',5,'Fan Noli','044718293',NULL,'merita.lipovica@gmail.com'),
			('Veli','Kryeziu','Punetor teknik',5,'Asdreni','044936521',NULL,'veli.kryeziu.0@hotmail.com'),
			('Jeta','Krasniqi','Pastruese',3,'Jakup Ferri','049875236',NULL,'jetakrasniqi@gmail.com'),
			('Shefket','Gashi','Shofer',3,'Jul Variboba','044563178','+38138256647','shefketgashi01@hotmail.com'),
			('Lazër','Bullakaj','Shofer',4,'Komandant Drini','049563287','+38138633258','lazer.bullaki@yahoo.com'),
			('Veprim','Berisha','Menaxher',4,'Besim Ndrenca','045645236','+38138655478','veprim.berisha@gmail.com'),
			('Bujar','Sahitaj','Sigurim',2,'Lidhja e Prizrenit','049876512',NULL,'bujar.sahitaj@hotmail.com'),
			('Marta','Prenaj','Sigurim',1,'Leka i Madh','044563538',NULL,'marteprenaj@gmail.com'),
			('Aziz','Gashi','Shofer',7,'Justiniani','045336554',NULL,'aziz.gashi.3@gmail.com'),
			('Nazife','Rexhaj','Punetore teknike',3,'Tabakhane','049555974','+38138621489','xifjaxifja123@gmail.com');
            
            
            select * from Stafi;
            
-- Insertimi i te dhenave tek tabela Ambulanca --
INSERT INTO Ambulanca(amModeli,amAktive)
     VALUES ('Mercedes',TRUE),
			('VW',TRUE),
			('VW',TRUE),
			('VW',FALSE),
			('VW',TRUE),
			('Mercedes',FALSE),
			('Toyota',FALSE),
			('VW',TRUE),
			('Toyota',FALSE);
            
            select * from Ambulanca;
            
            
-- Insertimi i te dhenave tek tabela Intervenimet --
INSERT INTO Intervenimet(iAmID,iShoferi,iSSN,iDataKoha,iAID)
 VALUES (2,2,10,'2020-8-20',3),
		(8,10,19,'2020-8-25',5),
		(1,5,12,'2020-12-20',6),
		(2,14,20,'2020-12-20',3),
		(1,9,22,'2020-12-22',6);
        
        
        
		select * from Intervenimet;







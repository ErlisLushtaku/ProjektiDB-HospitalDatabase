create database DB_Projekt20_21;
use DB_Projekt20_21;

create table Grada(
gTitulli varchar(50) primary key,
gPaga real NOT NULL,
check(gPaga>500));

create table Adresa(
AID integer auto_increment primary key,
qQyteti varchar(30) NOT NULL,
qKodiPostal integer NOT NULL,
qShteti varchar(40) NOT NULL,
unique (qQyteti),
unique(qKodiPostal));

 create table KategoriteSociale(
KID integer auto_increment primary key,
kKategoria varchar(20) NOT NULL,
unique(kKategoria));
 
create table Repartet(
RID integer auto_increment primary key,
rEmriRepartit varchar(50) NOT NULL unique) auto_increment=101 ;

create table Pacienti (
SSN integer auto_increment,
pEmri varchar(30) NOT NULL,
pMbiemri varchar(30) NOT NULL,
pEmriPrindit varchar(30),
pDataLindjes date,
pGjinia char(1),
pNrPersonal char(10),
pRruga varchar(60),
AID integer NOT NULL,     
KID integer NOT NULL,
pTelMobil char(9),
pTelFix char(12),
pEmail varchar(64),
pGrupiGjakut varchar(3),
pAlergjite varchar(50),
pSemundjetKronike varchar(80),
primary key(SSN),
foreign key(AID) references Adresa(AID),
foreign key(KID) references KategoriteSociale(KID),
unique(pNrPersonal),
unique(pEmail));
 
create table Doktori(
DID integer auto_increment,
dEmri varchar(30) NOT NULL,
dMbiemri varchar(30) NOT NULL,
dNrPersonal char(10) NOT NULL,
dTitulli varchar(50) NOT NULL,
dRruga varchar(30),
AID integer NOT NULL,
dTelMobil char(9),
dTelFix char(12),
dEmail varchar(64),
dReparti integer,
primary key (DID),
unique (dNrPersonal),
unique(dEmail),
foreign key (dTitulli) references Grada(gTitulli),
foreign key (AID) references Adresa(AID),
foreign key (dReparti) references Repartet(RID));


create table Terminet (
tSSN integer,
tKoha datetime,
tReparti integer NOT NULL,
tAnuluar boolean,
tDataeInsertimit date,
foreign key(tSSN) references Pacienti(SSN) on delete cascade,
primary key(tSSN,tKoha),
foreign key(tReparti) references Repartet(RID));


create table Vizitat(
SSN integer ,
DID integer NOT NULL,
vDiagnoza varchar(50),
vTerapia varchar(60),
vKoha datetime,
primary key (SSN,vKoha),
foreign key (SSN,vKoha) references Terminet(tSSN,tKoha) on delete cascade,
foreign key(DID) references Doktori(DID),                            
unique (DID,vKoha));

create table MenyraePageses(
MID integer auto_increment primary key,
mMenyra varchar(30) unique NOT NULL);
 select * from MenyraePageses;
 
create table Faturat(
fVID integer auto_increment,
fSSN integer,
fCmimiPaTVSH decimal(10,2),
fTVSH decimal(10,2) AS (fCmimiPaTVSH*0.18),
fCmimiMeTVSH decimal(10,2) AS (fCmimiPaTVSH+fTVSH),
fData datetime,
ePaguar boolean,
fDataPageses date,
fPagesa integer,
unique(fVID),
foreign key(fSSN,fData) references Vizitat(SSN,vKoha),   
primary key(fSSN,fData),
foreign key(fPagesa) references MenyraePageses(MID));


create table Infermieret (
InEmri varchar(30) NOT NULL,
InMbiemri varchar(30) NOT NULL,
InNrPersonal char(10) ,
InReparti integer,
InAID integer NOT NULL,
InRruga varchar(60),
InTelMobil char(9),
InTelFix char(12),
InEmail varchar(64),
primary key(InNrPersonal),
foreign key(InReparti) references Repartet(RID),
foreign key(InAID) references Adresa(AID),
unique(InEmail));
 
create table Vaksinat (
V_ID integer auto_increment primary key,
v_lloji varchar(50) unique);
 
 
create table Vaksinimi (
InNrPersonal char(10),
vaSSN integer NOT NULL,
vaLindja varchar(7) NOT NULL,
vaVaksina1 date NOT NULL,
vaAktuale integer NOT NULL,
vaDataAktuale date NOT NULL,
vaAlergjia1 boolean,
vaAlergjia2 boolean,
primary key(vaSSN,vaAktuale,vaDataAktuale),
foreign key(InNrPersonal) references Infermieret(InNrPersonal) on delete set null,
foreign key(vaSSN) references Pacienti(SSN),
foreign key(vaAktuale) references Vaksinat(V_ID));
 
 
create table Stafi(
SID integer auto_increment,
sEmri varchar(30) NOT NULL,
sMbiemri varchar(30) NOT NULL,
sPozita varchar(30) NOT NULL,
sAID integer NOT NULL,
sRruga varchar(40),
sTelMobil char(9),
sTelFix char(12),
sEmail varchar(64),
primary key(SID),
foreign key(sAID) references Adresa(AID),
unique(sEmail));
 
create table Ambulanca(
AmID integer auto_increment primary key,
amModeli varchar(20),
amAktive boolean);
 
create table Intervenimet(
IID integer auto_increment,
iAmID integer,
iShoferi integer,
iSSN integer,
iDataKoha date,
iAID integer,
primary key(IID),
foreign key(iAmID) references Ambulanca(AmID),
foreign key(iShoferi) references Stafi(SID) on delete set null,
foreign key(iSSN) references Pacienti(SSN),
foreign key(iAID) references Adresa(AID),
unique(iSSN,iDataKoha));
 
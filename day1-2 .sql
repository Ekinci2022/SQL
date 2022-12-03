

create table notlar
as
select isim,not_ort From ogrenciler3

--Insert-- tablo icine veri ekleme
select * from ogrenciler1;

insert INTO notlar values('Ekinci',85.5);
insert INTO notlar values('Leyla',70);
insert INTO notlar values('Mecnun',88);
insert INTO notlar values('ismail',81);
insert INTO notlar values('iskender',90);
CREATE TABLE ogrenciler5
(
ogrenci_no char(7),-- Uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20), -- Uzunluğunu bilmediğimiz stringler için VARCHAR kullanırız
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date);
-- VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;
select * from notlar;
--INSERT- TABLO İÇİNE VERİ EKLEME
INSERT INTO notlar VALUES ('Osman',95.5);
INSERT INTO notlar VALUES ('Sumeyye',95.5);
INSERT INTO notlar VALUES ('Salih',95.5);
INSERT INTO notlar VALUES ('Hakan',95.5);
INSERT INTO notlar VALUES ('Adem',95.5);
select * from notlar;
select isim from notlar;
-- CONSTRAINT
--UNIQEU
--NOT NULL
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler7;
INSERT INTO ogrenciler7 VALUES ('123467','Er','Eren',75.5,now());
INSERT INTO ogrenciler7 VALUES ('1234567','Ali','veli',75.5,now());

--PRIMARY KEY atamasi
CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

--PRIMARY KEY atamasi 2.yol
CREATE TABLE ogrenciler9
(
ogrenci_no char(7) ,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarih date,
constraint ogr primary key (ogrenci_no)
);
CREATE TABLE ogrenciler10
(
ogrenci_no char(7) ,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
	)
	
	
	--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun
	--ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“0tedarikci_id” yi Foreign Key yapin.

CREATE TABLE tedarikciler3(

	tedarikci_id char(10) primary key,
	tedarikci_ismi varchar(20),
	ilitisim_ismi varchar (20)
);
create table urunler(
tedarikci_id char(5),
urun_id char(5),
	foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)

);

select * from tedarikciler3

create table calisanlar
(
id char(5) primary key,
isim varchar(20) unique ,
maas int not null,
ise_baslama date
);

create table adresler
(
adres_id char(30),
sokak varchar (30),
cadde varchar(30),
sehir varchar(30),
	foreign key (adres_id) references calisanlar(id) 
 );
 INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- NOT NULL cons. kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- NOT NULL cons. kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- NOT NULL cons. kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --Primary key 
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --Primary key 
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select *from calisanlar;
select * from adresler;
 
 create table calisanlar1
(
id char(5) primary key,
isim varchar(20) unique ,
maas int check(maas>10000) not null,
ise_baslama date
);
insert into calisanlar1 values('10002','Mehmet Yilmaz',9000,'2018-04-14');
select *from calisanlar1;
--DQL --  WHERE KULLANIMI
select *from calisanlar;
select isim from calisanlar;

--calisanlar tablosundan maasi 5000den buyuk olanlari listeleyiniz

select isim from calisanlar where maas>5000;


--calisanlar tablosundan ismi veli han olan tum veriyi listeleyiniz

select * from calisanlar Where isim='Veli Han';


--calisanlar tablosundan maasi 5000 olan tum veriyi listeleyiniz
select * from calisanlar Where maas=5000;

--Dml-- DELETE KOMUTU

delete from calisanlar; --eger parent table baska bir child tablo ile iliskiliyse once child tablo silinmelidir.

delete from adresler;
select * from adresler;


--adresler tablosundan sehri antep olan verileri silelim.

delete from adresler  where sehir= 'Antep';

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi mustafa bak ve nesibe yilmaz olan ogrencileri sil

select *from ogrenciler6

delete from ogrenciler6 where isim='Mustafa Bak' or isim = 'Nesibe Yilmaz';

--veli ismi hasan olan datayi silelim
delete from ogrenciler6 where veli_isim='Hasan';


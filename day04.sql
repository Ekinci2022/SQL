create table day04calisanlar (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO day04calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO day04calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO day04calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from day04calisanlar

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
select calisan_id as id, calisan_isim || calisan_dogdugu_sehir as calisan_bilgisi from day04calisanlar

--2.YOL:
select calisan_id as id, concat (calisan_isim,calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar--ayni sonucu verir
--isim ve sehir arasina bosluk birakmak icin
select calisan_id as id, calisan_isim ||'  '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar
-- ---IS NULL CONDITION ---
--Arama yapilan field’da NULL degeri almis kayitlari getirir
drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar
--SORU: name sutununda null olan degerleri cagiralim
select isim from insanlar where isim is null--isim kismi null olanlari getirir
--soru :insanlar tablosunda sadece null olmayan degerleri listeleyelim
select isim from insanlar where isim is not null--isim sutunundaki null olmayan verileri getirir
--soru:Insanlar tablosunda null deger almis verileri no name olarak degistiriniz
update insanlar
set
-- 								ORDER BY CLAUSE
/*	
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

drop table if exists calisanlar1
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
--soru:Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar1 ORDER BY adres;--adresler alfabetik siraya koyar
--soru:Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar1 where isim='Mine' ORDER BY ssn
--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar1 where soyisim='Bulut' ORDER BY 4 --satir numarasini kullandik yani 4. satir demek istedik adresler satiri
--soru:Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanla1r ORDER BY ssn DESC--SSN NUMARALARINI BUYUKTEN KUCUGE GORE SIRALAR
--SORU:Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar1 order by isim ASC, soyisim DESC
--SORU:İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim from insanlar1 order by LENGTH (soyisim);--soy isim uzunluguna gore kucukten buyuge dogru siralar
SELECT isim,soyisim from insanlar1 order by LENGTH (soyisim) DESC;--burdaki "DESC" soy isimleri buyukten kucuge gore siralar
--soru:Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' '||soyisim as isim_soyisim from insanlar1 ORDER BY  LENGTH (isim||soyisim)
select isim||' '||soyisim as isim_soyisim from insanlar1 ORDER BY  LENGTH (isim)+LENGTH (soyisim)
select CONCAT(isim,' ',soyisim) as isim_soyisim from insanlar1 ORDER BY  LENGTH (isim)+LENGTH (soyisim)
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (concat(isim, soyisim));
--GROUP BY
-- komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
--komutuyla birlikte kullanılır
drop table if exists manav
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
)
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
select * from manav
--SORU:Isme gore alinan toplam urunleri bulun
SELECT isim,sum(urun_miktar) FROM manav--kisiye gore aldiklari urunleri yazar ama sutunun adi "sum" olur
GROUP BY isim;
SELECT isim,sum(urun_miktar) as aldigi_toplam_urun FROM manav--sum yazmasini istemiyoruz biz isim verdik
GROUP BY isim;
--soru:isme gore alinan toplam urunleri bulun ve urunlerin sayisini buyukten kucuge listeleyin
SELECT isim,sum(urun_miktar) as aldigi_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldigi_toplam_urun DESC;--ORDER BY kucukten buyuge siralar "desc" ise bunun tersini yapar buyukten kucuge dogru siralar
--soru:Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi,count(isim) from manav
group by urun_adi;



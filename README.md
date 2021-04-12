Primer zadatka sa ispita iz predmeta "Razvoj poslovnih internet rešenja" sa Eknomskog Fakulteta u Subotici.

U nastavku sledi opis zadatka.

Za potrebe aviokompanije „PINair“ kreirati web aplikaciju za online rezervaciju aviokarata.
Aplikacija treba da obuhvati minimalno dve stranice, od kojih na jednoj treba omogućiti korisniku da 
odabere let za koji želi da rezerviše kartu, a na drugoj mu omogućiti da unese svoje lične podatke i 
izvrši rezervaciju.
Na stranici izbor leta, korisniku je potrebno ponuditi izbor države polaska, države dolaska, polaznog 
aerodroma i dolaznog aerodroma pomoću DropDownList kontrola. Po izboru države polaska, u 
DropDownList kontroli za izbor polaznog aerodroma treba kao opcije ponuditi samo aerodrome koji 
se nalaze u odabranoj zemlji polaska. Na isti način, po izboru države dolaska, u DropDownList kontroli 
za izbor dolaznog aerodroma treba kao opcije ponuditi samo aerodrome koji se nalaze u odabranoj 
zemlji polaska.
Korisniku treba omogućiti izbor datuma leta pomoću Calendar kontrole.
Pod uslovom da su prikazani odabrani polazni i dolazni aerodrom, po izboru datuma leta u ListBox
ili GridView kontroli korisniku treba prokazati izbor svih letova koji zadovoljavaju kriterijum 
pretrage (polazni aerodrom, dolazni aerodrom, datum leta), a na kojima ima preostalih mesta.
Nakon izbora leta, korisniku treba omogućiti da klikom na dugme „Dalje“ bude preusmeren na 
stranicu na kojoj će uneti svoje lične podatke.
Od ličnih podataka korisnika potrebno je prikupiti ime, prezime, datum rođenja (putem Calendar
kontrole), mesto boravka, državu (putem DropDownList kontrole) i broj pasoša.
Po kliku na dugme „Rezerviši kartu“, neophodno je u bazi podataka evidentirati novog putnika
unosom novog reda u tabelu Korisnik, kao i rezervaciju karte, unosom novog reda u tabelu Karta

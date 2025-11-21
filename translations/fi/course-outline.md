<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-21T15:27:39+00:00",
  "source_file": "course-outline.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Kurssin Rakenne ja Oppimiskehys

## Kurssin Yleiskatsaus

Hallitse Azure Developer CLI (azd) vaiheittain etenevien lukujen avulla. **Erityinen painotus tekoälysovellusten käyttöönotossa Microsoft Foundry -integraation avulla.**

### Miksi Tämä Kurssi on Tärkeä Nykyaikaisille Kehittäjille

Microsoft Foundry Discord -yhteisön havaintojen mukaan **45 % kehittäjistä haluaa käyttää AZD:tä tekoälytyökuormiin**, mutta he kohtaavat haasteita, kuten:
- Monimutkaiset monipalveluarkkitehtuurit tekoälylle
- Parhaat käytännöt tekoälyn tuotantokäyttöönotossa  
- Azure AI -palveluiden integrointi ja konfigurointi
- Tekoälytyökuormien kustannusten optimointi
- Tekoälyyn liittyvien käyttöönotto-ongelmien vianmääritys

### Keskeiset Oppimistavoitteet

Kun suoritat tämän rakenteellisen kurssin, opit:
- **AZD:n Perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Tekoälysovellusten Käyttöönotto**: AZD:n käyttö Microsoft Foundry -palveluiden kanssa
- **Infrastructure as Code**: Azure-resurssien hallinta Bicep-mallien avulla
- **Vianmääritys Käyttöönotossa**: Yleisimpien ongelmien ratkaisu ja virheiden korjaus
- **Tuotantokäyttöön Optimointi**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Moniagenttiratkaisujen Rakentaminen**: Monimutkaisten tekoälyarkkitehtuurien käyttöönotto

## 🎓 Työpajan Oppimiskokemus

### Joustavat Oppimisen Toteutustavat
Tämä kurssi tukee sekä **itsenäistä oppimista omaan tahtiin** että **ohjattuja työpajasessioita**, jolloin osallistujat saavat käytännön kokemusta AZD:stä ja kehittävät taitojaan interaktiivisten harjoitusten avulla.

#### 🚀 Itsenäinen Oppimismoodi
**Täydellinen yksittäisille kehittäjille ja jatkuvaan oppimiseen**

**Ominaisuudet:**
- **Selaimen Kautta Käytettävä Alusta**: MkDocs-pohjainen työpaja, joka on käytettävissä millä tahansa selaimella
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristö valmiiksi konfiguroiduilla työkaluilla
- **Interaktiivinen DevContainer-ympäristö**: Ei vaadi paikallista asennusta - aloita koodaus heti
- **Edistymisen Seuranta**: Sisäänrakennetut tarkistuspisteet ja validointiharjoitukset
- **Yhteisön Tuki**: Pääsy Azure Discord -kanaviin kysymyksiä ja yhteistyötä varten

**Oppimisrakenne:**
- **Joustava Aikataulu**: Suorita luvut omaan tahtiin päivien tai viikkojen aikana
- **Tarkistuspistejärjestelmä**: Vahvista oppiminen ennen siirtymistä monimutkaisempiin aiheisiin
- **Resurssikirjasto**: Kattava dokumentaatio, esimerkit ja vianmääritysoppaat
- **Portfolion Kehittäminen**: Rakenna käyttöön otettavia projekteja ammatillisiin portfolioihin

**Aloittaminen (Itsenäinen Oppiminen):**
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Siirry arkistoon ja napsauta "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```

#### 🏛️ Ohjatut Työpajasessiot
**Ihanteellinen yrityskoulutukseen, bootcampeihin ja oppilaitoksille**

**Työpajan Muotoiluvaihtoehdot:**

**📚 Akateeminen Kurssi (8-12 viikkoa)**
- **Yliopisto-ohjelmat**: Lukukauden mittainen kurssi, jossa viikoittain 2 tunnin sessiot
- **Bootcamp-muoto**: Intensiivinen 3-5 päivän ohjelma, jossa päivittäin 6-8 tunnin sessiot
- **Yrityskoulutus**: Kuukausittaiset tiimisessiot käytännön projektien toteutuksella
- **Arviointikehys**: Arvioidut tehtävät, vertaisarvioinnit ja lopputyöt

**🚀 Intensiivinen Työpaja (1-3 päivää)**
- **Päivä 1**: Perusteet + Tekoälykehitys (Luvut 1-2) - 6 tuntia
- **Päivä 2**: Konfigurointi + Infrastruktuuri (Luvut 3-4) - 6 tuntia  
- **Päivä 3**: Edistyneet Kuviot + Tuotanto (Luvut 5-8) - 8 tuntia
- **Seuranta**: Valinnainen 2 viikon mentorointi projektin loppuun saattamiseksi

**⚡ Johtajille Suunnattu Katsaus (4-6 tuntia)**
- **Strateginen Yleiskatsaus**: AZD:n arvo ja liiketoimintavaikutus (1 tunti)
- **Käytännön Demo**: Tekoälysovelluksen käyttöönotto alusta loppuun (2 tuntia)
- **Arkkitehtuurin Tarkastelu**: Yrityskuvioiden ja hallintamallien tarkastelu (1 tunti)
- **Toteutussuunnittelu**: Organisaation käyttöönoton strategia (1-2 tuntia)

#### 🛠️ Työpajan Oppimismetodologia
**Tutkiminen → Käyttöönotto → Mukauttaminen -lähestymistapa käytännön taitojen kehittämiseen**

**Vaihe 1: Tutkiminen (45 minuuttia)**
- **Mallien Tutkiminen**: Arvioi Azure AI Foundry -mallit ja palvelut
- **Arkkitehtuurin Analyysi**: Ymmärrä moniagenttikuviot ja käyttöönoton strategiat
- **Tarpeiden Arviointi**: Tunnista organisaation tarpeet ja rajoitteet
- **Ympäristön Asetus**: Konfiguroi kehitysympäristö ja Azure-resurssit

**Vaihe 2: Käyttöönotto (2 tuntia)**
- **Ohjattu Toteutus**: Tekoälysovellusten vaiheittainen käyttöönotto AZD:n avulla
- **Palveluiden Konfigurointi**: Konfiguroi Azure AI -palvelut, päätepisteet ja autentikointi
- **Turvallisuuden Toteutus**: Käytä yritystason turvallisuuskuvioita ja käyttöoikeuksia
- **Validointitestaus**: Vahvista käyttöönotot ja ratkaise yleisiä ongelmia

**Vaihe 3: Mukauttaminen (45 minuuttia)**
- **Sovelluksen Muokkaus**: Mukauta malleja erityisiin käyttötapauksiin ja tarpeisiin
- **Tuotannon Optimointi**: Toteuta valvonta-, kustannustenhallinta- ja skaalausstrategioita
- **Edistyneet Kuviot**: Tutki moniagenttien koordinointia ja monimutkaisia arkkitehtuureja
- **Seuraavien Askeleiden Suunnittelu**: Määritä oppimispolku jatkuvaan taitojen kehittämiseen

#### 🎯 Työpajan Oppimistulokset
**Mitattavat taidot, jotka kehittyvät käytännön harjoittelun kautta**

**Tekniset Kompetenssit:**
- **Tuotantotason Tekoälysovellusten Käyttöönotto**: Onnistunut tekoälyratkaisujen käyttöönotto ja konfigurointi
- **Infrastructure as Code -osaaminen**: Luo ja hallitse mukautettuja Bicep-malleja
- **Moniagenttiarkkitehtuuri**: Toteuta koordinoituja tekoälyagenttiratkaisuja
- **Tuotantovalmius**: Käytä turvallisuus-, valvonta- ja hallintakuvioita
- **Vianmääritystaito**: Ratkaise itsenäisesti käyttöönotto- ja konfigurointiongelmia

**Ammatilliset Taidot:**
- **Projektijohtaminen**: Johda teknisiä tiimejä pilvikäyttöönottohankkeissa
- **Arkkitehtuurisuunnittelu**: Suunnittele skaalautuvia ja kustannustehokkaita Azure-ratkaisuja
- **Tiedon Siirto**: Kouluta ja mentoroi kollegoita AZD:n parhaissa käytännöissä
- **Strateginen Suunnittelu**: Vaikuta organisaation pilvikäyttöönoton strategioihin

#### 📋 Työpajan Resurssit ja Materiaalit
**Kattava työkalupakki ohjaajille ja oppijoille**

**Ohjaajille:**
- **Ohjaajan Opas**: [Työpajan Ohjausopas](workshop/docs/instructor-guide.md) - Sessioiden suunnittelu ja toteutusvinkit
- **Esitysmateriaalit**: Diaesitykset, arkkitehtuurikaaviot ja demokäsikirjoitukset
- **Arviointityökalut**: Käytännön harjoitukset, tietotarkistukset ja arviointirubriikit
- **Tekninen Asetus**: Ympäristön konfigurointi, vianmääritysoppaat ja varasuunnitelmat

**Oppijoille:**
- **Interaktiivinen Työpajaympäristö**: [Työpajan Materiaalit](workshop/README.md) - Selaimen kautta käytettävä oppimisalusta
- **Vaiheittaiset Ohjeet**: [Ohjatut Harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset toteutusohjeet  
- **Viitedokumentaatio**: [AI Työpajalaboratorio](docs/ai-foundry/ai-workshop-lab.md) - Tekoälyyn keskittyvät syventävät oppaat
- **Yhteisön Resurssit**: Azure Discord -kanavat, GitHub-keskustelut ja asiantuntijatuki

#### 🏢 Yritystyöpajan Toteutus
**Organisaation käyttöönotto- ja koulutusstrategiat**

**Yrityskoulutusohjelmat:**
- **Kehittäjien Perehdytys**: Uusien työntekijöiden orientaatio AZD:n perusteilla (2-4 viikkoa)
- **Tiimien Taitojen Kehittäminen**: Kvartaaleittain järjestettävät työpajat nykyisille kehitystiimeille (1-2 päivää)
- **Arkkitehtuurin Tarkastelu**: Kuukausittaiset sessiot vanhemmille insinööreille ja arkkitehdeille (4 tuntia)
- **Johtajien Katsaukset**: Puolen päivän työpajat teknisille päätöksentekijöille

**Toteutustuki:**
- **Mukautettu Työpajasuunnittelu**: Räätälöity sisältö organisaation erityistarpeisiin
- **Pilottiohjelman Hallinta**: Rakenteellinen käyttöönotto menestysmittareilla ja palautesilmukoilla  
- **Jatkuva Mentorointi**: Työpajan jälkeinen tuki projektin toteutukseen
- **Yhteisön Rakentaminen**: Sisäiset Azure AI -kehittäjäyhteisöt ja tiedon jakaminen

**Menestysmittarit:**
- **Taitojen Hankinta**: Ennen/jälkeen arvioinnit teknisen osaamisen kasvun mittaamiseksi
- **Käyttöönoton Onnistuminen**: Osallistujien prosenttiosuus, jotka onnistuvat tuotantotason sovellusten käyttöönotossa
- **Tuottavuuden Nopeus**: Lyhentynyt perehdytysaika uusille Azure AI -projekteille
- **Tiedon Säilyvyys**: Jälkiarvioinnit 3-6 kuukautta työpajan jälkeen

## 8-luvun Oppimisrakenne

### Luku 1: Perusteet & Nopea Aloitus (30-45 minuuttia) 🌱
**Edellytykset**: Azure-tilaus, peruskomentoriviosaaminen  
**Vaikeustaso**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi  
- Ensimmäinen onnistunut käyttöönotto
- Keskeiset käsitteet ja termit

#### Oppimisresurssit
- [AZD:n Perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet
- [Asennus & Asetus](docs/getting-started/installation.md) - Alustakohtaiset oppaat
- [Ensimmäinen Projektisi](docs/getting-started/first-project.md) - Käytännön opas
- [Komentojen Pikaopas](resources/cheat-sheet.md) - Nopea viite

#### Käytännön Lopputulos
Onnistunut yksinkertaisen verkkosovelluksen käyttöönotto Azureen AZD:n avulla

---

### Luku 2: Tekoälykeskeinen Kehitys (1-2 tuntia) 🤖
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Microsoft Foundry -integraatio AZD:n kanssa
- Tekoälypohjaisten sovellusten käyttöönotto
- Tekoälypalveluiden konfiguroinnin ymmärtäminen
- RAG (Retrieval-Augmented Generation) -kuviot

#### Oppimisresurssit
- [Microsoft Foundry -integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Tekoälymallin Käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Työpajalaboratorio](docs/microsoft-foundry/ai-workshop-lab.md) - **UUSI**: Kattava 2-3 tunnin käytännön laboratorio
- [Interaktiivinen Työpajaopas](workshop/README.md) - **UUSI**: Selaimen kautta käytettävä työpaja MkDocs-esikatselulla
- [Microsoft Foundry -mallit](README.md#featured-microsoft-foundry-templates)
- [Työpajan Ohjeet](../../workshop/docs/instructions) - **UUSI**: Vaiheittaiset ohjatut harjoitukset

#### Käytännön Lopputulos
Ota käyttöön ja konfiguroi tekoälypohjainen chat-sovellus RAG-ominaisuuksilla

#### Työpajan Oppimispolku (Valinnainen Parannus)
**UUSI Interaktiivinen Kokemus**: [Täydellinen Työpajaopas](workshop/README.md)
1. **Tutkiminen** (30 min): Mallien valinta ja arviointi
2. **Käyttöönotto** (45 min): Tekoälymallin toiminnallisuuden käyttöönotto ja validointi  
3. **Purkaminen** (30 min): Mallin arkkitehtuurin ja komponenttien ymmärtäminen
4. **Konfigurointi** (30 min): Asetusten ja parametrien mukauttaminen
5. **Mukauttaminen** (45 min): Muokkaa ja iteroi tehdäksesi siitä omasi
6. **Purkaminen** (15 min): Resurssien siivous ja elinkaaren ymmärtäminen
7. **Yhteenveto** (15 min): Seuraavat askeleet ja edistyneet oppimispolut

---

### Luku 3: Konfigurointi & Autentikointi (45-60 minuuttia) ⚙️
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Autentikoinnin ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi
- Moniympäristön käyttöönotot

#### Oppimisresurssit
- [Konfigurointiopas](docs/getting-started/configuration.md) - Ympäristön asetus
- [Autentikointi & Turvallisuuskuviot](docs/getting-started/authsecurity.md) - Hallittu identiteetti ja Key Vault -integraatio
- Moniympäristöesimerkit

#### Käytännön Lopputulos
Hallinnoi useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### Luku 4: Infrastructure as Code & Käyttöönotto (1-1.5 tuntia) 🏗️
**Edellytykset**: Luvut 1-3 suoritettu  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönoton kuviot
- Infrastructure as Code Bicepillä
- Resurssien provisiointistrategiat
- Mukautettujen mallien luominen

- Konttien käyttöön otto Azure Container Appsilla ja AZD:llä

#### Oppimisresurssit
- [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Tä
Vahvista ja optimoi käyttöönotot ennen toteutusta

---

### Luku 7: Vianetsintä ja virheenkorjaus (1-1,5 tuntia) 🔧
**Edellytykset**: Mikä tahansa käyttöönottoon liittyvä luku suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- AI:n erityiset vianetsintämenetelmät
- Suorituskyvyn optimointi

#### Oppimateriaalit
- [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - FAQ ja ratkaisut
- [Virheenkorjausopas](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- [AI:n erityinen vianetsintä](docs/troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön tulos
Diagnosoi ja ratkaise itsenäisesti yleisiä käyttöönottoon liittyviä ongelmia

---

### Luku 8: Tuotanto- ja yrityskäytännöt (2-3 tuntia) 🏢
**Edellytykset**: Luvut 1-4 suoritettu  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason tietoturvakäytännöt
- Seuranta ja kustannusten optimointi
- Skaalautuvuus ja hallintakäytännöt

- Parhaat käytännöt tuotantokonttisovellusten käyttöönottoon (tietoturva, seuranta, kustannukset, CI/CD)

#### Oppimateriaalit
- [Tuotannon AI:n parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yrityskäytännöt
- Mikropalvelut ja yritysesimerkit
- Seuranta- ja hallintakehykset
- [Mikropalveluarkkitehtuurin esimerkki](../../examples/container-app/microservices) - Blue-green/canary-käyttöönotto, hajautettu jäljitys ja kustannusten optimointi

#### Käytännön tulos
Ota käyttöön yritysvalmiita sovelluksia, joissa on täydet tuotantokyvyt

---

## Oppimisen eteneminen ja vaikeustaso

### Taitojen progressiivinen kehittäminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusteet) → Luku 2 (AI-kehitys)
- **🔧 Keskitaso**: Luvut 3-4 (Konfigurointi ja infrastruktuuri) → Luku 6 (Vahvistus)
- **🚀 Edistynyt**: Luku 5 (Moniagenttiratkaisut) → Luku 7 (Vianetsintä)
- **🏢 Yritystaso**: Suorita kaikki luvut, keskity lukuun 8 (Tuotantokäytännöt)

- **Konttisovellusten polku**: Luvut 4 (Konttikäyttöönotto), 5 (Mikropalveluiden integrointi), 8 (Tuotannon parhaat käytännöt)

### Vaikeustason indikaattorit

- **⭐ Perustaso**: Yksittäiset konseptit, ohjatut tutoriaalit, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita konsepteja, käytännön harjoituksia, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, räätälöidyt ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Asiantuntija**: Tuotantojärjestelmät, yrityskäytännöt, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusteet ja nopea aloitus (45 min)
2. **Luku 2**: AI-ensimmäinen kehitys (2 tuntia)  
3. **Luku 5**: Moniagenttiset AI-ratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon AI:n parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusteet ja nopea aloitus (45 min)
2. **Luku 3**: Konfigurointi ja autentikointi (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina ja käyttöönotto (1,5 tuntia)
4. **Luku 6**: Esikäyttöönoton vahvistus ja suunnittelu (1 tunti)
5. **Luku 7**: Vianetsintä ja virheenkorjaus (1,5 tuntia)
6. **Luku 8**: Tuotanto- ja yrityskäytännöt (2 tuntia)

#### 🎓 Täydellinen oppimismatka (8-12 tuntia)
Kaikkien 8 luvun suorittaminen järjestyksessä käytännön harjoituksilla ja vahvistuksilla

## Kurssin suorittamisen kehys

### Tiedon vahvistaminen
- **Lukukohtaiset tarkistuspisteet**: Käytännön harjoituksia mitattavilla tuloksilla
- **Käytännön vahvistus**: Toimivien ratkaisujen käyttöönotto jokaisessa luvussa
- **Edistymisen seuranta**: Visuaaliset indikaattorit ja suoritusmerkit
- **Yhteisön vahvistus**: Kokemusten jakaminen Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Luvut 1-2 (Perusteet + AI)
- ✅ Ota käyttöön yksinkertainen verkkosovellus AZD:llä
- ✅ Ota käyttöön AI-pohjainen chat-sovellus RAG:lla
- ✅ Ymmärrä AZD:n ydinkonseptit ja AI-integraatio

#### Luvut 3-4 (Konfigurointi + Infrastruktuuri)  
- ✅ Hallitse monen ympäristön käyttöönottoja
- ✅ Luo räätälöityjä Bicep-infrastruktuurimalleja
- ✅ Toteuta turvalliset autentikointikäytännöt

#### Luvut 5-6 (Moniagentti + Vahvistus)
- ✅ Ota käyttöön monimutkainen moniagenttinen AI-ratkaisu
- ✅ Suorita kapasiteettisuunnittelu ja kustannusten optimointi
- ✅ Toteuta automatisoitu esikäyttöönoton vahvistus

#### Luvut 7-8 (Vianetsintä + Tuotanto)
- ✅ Korjaa ja ratkaise käyttöönottoon liittyvät ongelmat itsenäisesti  
- ✅ Toteuta yritystason seuranta ja tietoturva
- ✅ Ota käyttöön tuotantovalmiita sovelluksia hallintakäytännöillä

### Sertifiointi ja tunnustus
- **Kurssin suoritusmerkki**: Suorita kaikki 8 lukua käytännön vahvistuksilla
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Microsoft Foundry Discordissa
- **Ammatillinen kehitys**: Teollisuudessa relevantit AZD- ja AI-käyttöönoton taidot
- **Urapolku**: Yritysvalmiit pilvikäyttöönoton kyvyt

## 🎓 Kattavat oppimistulokset

### Perustaso (Luvut 1-2)
Perustason lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset taidot:**
- Ota käyttöön yksinkertaisia verkkosovelluksia Azureen AZD-komentojen avulla
- Konfiguroi ja ota käyttöön AI-pohjaisia chat-sovelluksia RAG-ominaisuuksilla
- Ymmärrä AZD:n ydinkonseptit: mallit, ympäristöt, provisiointityönkulut
- Integroi Microsoft Foundry -palvelut AZD-käyttöönottoihin
- Navigoi Azure AI -palveluiden konfiguraatioissa ja API-päätepisteissä

**Ammatilliset taidot:**
- Noudata jäsenneltyjä käyttöönoton työnkulkuja johdonmukaisten tulosten saavuttamiseksi
- Ratkaise peruskäyttöönoton ongelmia lokien ja dokumentaation avulla
- Kommunikoi tehokkaasti pilvikäyttöönoton prosesseista
- Sovella parhaita käytäntöjä turvalliseen AI-palveluiden integrointiin

**Oppimisen vahvistus:**
- ✅ Ota onnistuneesti käyttöön `todo-nodejs-mongo`-malli
- ✅ Ota käyttöön ja konfiguroi `azure-search-openai-demo` RAG:lla
- ✅ Suorita interaktiiviset työpajaharjoitukset (Tutkimusvaihe)
- ✅ Osallistu Azure Discord -yhteisön keskusteluihin

### Keskitaso (Luvut 3-4)
Keskitasoisten lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset taidot:**
- Hallitse monen ympäristön käyttöönottoja (kehitys, testaus, tuotanto)
- Luo räätälöityjä Bicep-malleja infrastruktuuri koodina -periaatteella
- Toteuta turvalliset autentikointikäytännöt hallitulla identiteetillä
- Ota käyttöön monimutkaisia monipalvelusovelluksia räätälöidyillä konfiguraatioilla
- Optimoi resurssien provisiointistrategiat kustannusten ja suorituskyvyn kannalta

**Ammatilliset taidot:**
- Suunnittele skaalautuvia infrastruktuuriarkkitehtuureja
- Toteuta tietoturvan parhaat käytännöt pilvikäyttöönottoihin
- Dokumentoi infrastruktuurikäytännöt tiimityöskentelyä varten
- Arvioi ja valitse sopivat Azure-palvelut vaatimusten mukaan

**Oppimisen vahvistus:**
- ✅ Konfiguroi erilliset ympäristöt ympäristökohtaisilla asetuksilla
- ✅ Luo ja ota käyttöön räätälöity Bicep-malli monipalvelusovellukselle
- ✅ Toteuta hallitun identiteetin autentikointi turvallista pääsyä varten
- ✅ Suorita konfiguraationhallinnan harjoituksia todellisilla skenaarioilla

### Edistynyt taso (Luvut 5-6)
Edistyneiden lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset taidot:**
- Ota käyttöön ja orkestroi moniagenttisia AI-ratkaisuja koordinoiduilla työnkuluilla
- Toteuta asiakas- ja varastoagenttiarkkitehtuurit vähittäiskaupan skenaarioihin
- Suorita kattava kapasiteettisuunnittelu ja resurssien vahvistus
- Toteuta automatisoitu esikäyttöönoton vahvistus ja optimointi
- Suunnittele kustannustehokkaita SKU-valintoja työkuormavaatimusten perusteella

**Ammatilliset taidot:**
- Arkkitehtoi monimutkaisia AI-ratkaisuja tuotantoympäristöihin
- Johda teknisiä keskusteluja AI-käyttöönoton strategioista
- Mentoroi juniorikehittäjiä AZD- ja AI-käyttöönoton parhaissa käytännöissä
- Arvioi ja suosittele AI-arkkitehtuurimalleja liiketoiminnan tarpeisiin

**Oppimisen vahvistus:**
- ✅ Ota käyttöön täydellinen vähittäiskaupan moniagenttiratkaisu ARM-malleilla
- ✅ Demonstroi agenttien koordinointi ja työnkulkujen orkestrointi
- ✅ Suorita kapasiteettisuunnitteluharjoituksia todellisilla resurssirajoituksilla
- ✅ Vahvista käyttöönoton valmius automatisoiduilla tarkistuksilla

### Asiantuntijataso (Luvut 7-8)
Asiantuntijatason lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset taidot:**
- Diagnosoi ja ratkaise monimutkaisia käyttöönottoon liittyviä ongelmia itsenäisesti
- Toteuta yritystason tietoturvakäytännöt ja hallintakehykset
- Suunnittele kattavat seuranta- ja hälytysstrategiat
- Optimoi tuotantokäyttöönotot skaalautuvuuden, kustannusten ja suorituskyvyn kannalta
- Perusta CI/CD-putkia asianmukaisella testauksella ja vahvistuksella

**Ammatilliset taidot:**
- Johda yrityksen pilvitransformaatioprojekteja
- Suunnittele ja toteuta organisaation käyttöönoton standardeja
- Kouluta ja mentoroi kehitystiimejä edistyneissä AZD-käytännöissä
- Vaikuta teknisiin päätöksiin yrityksen AI-käyttöönottojen osalta

**Oppimisen vahvistus:**
- ✅ Ratkaise monimutkaisia monipalvelukäyttöönoton virheitä
- ✅ Toteuta yritystason tietoturvakäytännöt vaatimustenmukaisuusvaatimuksilla
- ✅ Suunnittele ja ota käyttöön tuotannon seuranta Application Insightsilla
- ✅ Suorita yrityksen hallintakehyksen toteutus

## 🎯 Kurssin suorittamisen sertifiointi

### Edistymisen seurantakehys
Seuraa oppimisen etenemistä jäsenneltyjen tarkistuspisteiden avulla:

- [ ] **Luku 1**: Perusteet ja nopea aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi ja autentikointi ✅
- [ ] **Luku 4**: Infrastruktuuri koodina ja käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Esikäyttöönoton vahvistus ja suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä ja virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto- ja yrityskäytännöt ✅

### Vahvistusprosessi
Jokaisen luvun suorittamisen jälkeen vahvista tietosi seuraavasti:

1. **Käytännön harjoitusten suorittaminen**: Ota käyttöön toimivia ratkaisuja jokaisessa luvussa
2. **Tiedon arviointi**: Tarkista FAQ-osat ja suorita itsearvioinnit
3. **Yhteisön osallistuminen**: Jaa kokemuksia ja saa palautetta Azure Discordissa
4. **Portfolion kehittäminen**: Dokumentoi käyttöönotot ja opitut asiat
5. **Vertaisarviointi**: Tee yhteistyötä muiden oppijoiden kanssa monimutkaisissa skenaarioissa

### Kurssin suorittamisen hyödyt
Kaikkien lukujen suorittamisen ja vahvistuksen jälkeen valmistuneet saavat:

**Tekninen asiantuntemus:**
- **Tuotantokokemus**: Käyttöönotettu todellisia AI-sovelluksia Azure-ympäristöihin
- **Ammatilliset taidot**: Yritysvalmiit käyttöönotto- ja vianetsintäkyvyt  
- **Arkkitehtuuriosaaminen**: Moniagenttiset AI-ratkaisut ja monimutkaiset infrastruktuurimallit
- **Vianetsintämestaruus**: Itsenäinen käyttöönotto- ja konfigurointiongelmien ratkaisu

**Ammatillinen kehitys:**
- **Teollisuuden tunnustus**: Todistettavat taidot korkean kysynnän AZD- ja AI-käyttöönottoalueilla
- **Urapolku**: Pätevyys pilviarkkitehdin ja AI-käyttöönoton asiantuntijan rooleihin
- **Yhteisön johtajuus**: Aktiivinen jäsenyys Azure-kehittäjä- ja AI-yhteisöissä
- **Jatkuva oppiminen**: Perusta Microsoft Foundry -erikoistumisen jatkamiselle

**Portfolio-omaisuudet:**
- **Käyttöönotetut ratkaisut**: Toimivia esimerkkejä AI-sovelluksista ja infrastruktuurimalleista
- **Dokumentaatio**: Kattavat käyttöönotto-oppaat ja vianetsintämenettelyt  
- **Yhteisön panokset**: Keskustelut, esimerkit ja parannukset jaettu Azure-yhteisössä
- **Ammatillinen verkosto**: Yhteydet Azure-asiantuntijoihin ja AI-käyttöönoton ammattilaisiin

### Jatkokurssin oppimispolku
Valmistuneet ovat valmiita edistyneeseen erikoistumiseen:
- **Microsoft Foundry -asiantuntija**: Syvä erikoistuminen AI-mallien käyttöönottoon ja orkestrointiin
- **Pilviarkkitehtuurin johtajuus**: Yritystason käyttöönoton suunnittelu ja hallinta
- **Kehittäjäyhteisön johtajuus

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
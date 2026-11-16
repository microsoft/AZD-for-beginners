# AZD Aloittelijoille: Kurssin rakenne ja oppimiskehys

## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen kautta, jotka on suunniteltu vaiheittaiseen oppimiseen. **Erityinen painopiste AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on välttämätön nykyaikaisille kehittäjille

Kehittäjät, jotka ottavat käyttöön AI-kuormituksia, tarvitsevat usein ohjausta seuraavissa asioissa:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien suunnittelu
- Tuotannon AI-käytön parhaat käytännöt  
- Azure AI -palvelujen integrointi ja konfigurointi
- Kustannusten optimointi AI-kuormituksille
- AI-kohtaisiin käyttöönotto-ongelmiin liittyvä vianetsintä

### Keskeiset oppimistavoitteet

Tämän rakenteellisen kurssin suorittamalla:
- **Hallitse AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Ota käyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuta infrastruktuuri koodina**: Hallitse Azuren resursseja Bicep-mallipohjilla
- **Vianetsintä käyttöönotossa**: Ratkaise yleiset ongelmat ja buggaa
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna moniagenttiratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 🎓 Työpajan oppimiskokemus

### Joustavat oppimisen tarjontavaihtoehdot
Tämä kurssi on suunniteltu tukemaan sekä **itseopiskelua että ohjattuja työpajaistuntoja**, jolloin oppijat saavat käytännön kokemusta AZD:stä samalla kun kehittävät taitojaan interaktiivisten harjoitusten kautta.

#### 🚀 Itseopiskelutila
**Täydellinen yksittäisille kehittäjille ja jatkuvalle oppimiselle**

**Ominaisuudet:**
- **Selaimella käytettävä käyttöliittymä**: Täysin MkDocs-ohjattu työpaja, johon pääsee mistä tahansa verkkoselaimesta
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristö valmiiksi konfiguroiduilla työkaluilla
- **Interaktiivinen DevContainer-ympäristö**: Ei paikallista asennusta – aloita koodaus heti
- **Edistymisen seuranta**: Sisäänrakennetut tarkistuspisteet ja validointiharjoitukset
- **Yhteisön tuki**: Pääsy Azure Discord -kanaville kysymyksiä ja yhteistyötä varten

**Oppimisrakenne:**
- **Joustava aikataulu**: Suorita luvut omaan tahtiisi päivien tai viikkojen aikana
- **Tarkistuspistejärjestelmä**: Validioi oppiminen ennen siirtymistä monimutkaisiin aiheisiin
- **Resurssikirjasto**: Laaja dokumentaatio, esimerkit ja vianetsintäohjeet
- **Portfolion kehittäminen**: Rakenna julkaistavia projekteja ammatillista portfolioa varten

**Aloittaminen (itseopiskelu):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Ohjatut työpajasessiot
**Ihanteellinen yrityskoulutuksiin, bootcampeihin ja oppilaitoksiin**

**Työpajan muotovaihtoehdot:**

**📚 Akateeminen kurssi (8-12 viikkoa)**
- **Yliopisto-ohjelmat**: Koko lukukauden kurssi, viikoittain 2 tunnin tauot
- **Bootcamp-muoto**: Tehokas 3-5 päivän ohjelma, päivittäin 6-8 tuntia istuntoja
- **Yrityskoulutus**: Kuukausittaiset tiimisessiot käytännön projektin toteutukseen
- **Arviointikehys**: Arvioidut tehtävät, vertaisarviot ja loppuprojektit

**🚀 Tehokas työpaja (1-3 päivää)**
- **Päivä 1**: Perusta + AI-kehitys (luvut 1-2) - 6 tuntia
- **Päivä 2**: Konfigurointi + infrastruktuuri (luvut 3-4) - 6 tuntia  
- **Päivä 3**: Edistyneet mallit + tuotanto (luvut 5-8) - 8 tuntia
- **Seuranta**: Valinnainen 2 viikon mentorointi projektin loppuunsaattamiseksi

**⚡ Johtajan tiivistys (4-6 tuntia)**
- **Strateginen yleiskatsaus**: AZD:n arvon ja liiketoiminnan vaikutus (1 tunti)
- **Käytännön demo**: AI-sovelluksen käyttöönotto päästä päähän (2 tuntia)
- **Arkkitehtuurikatsaus**: Yritysmallit ja hallinto (1 tunti)
- **Toteutussuunnittelu**: Organisaation omaksumisstrategia (1-2 tuntia)

#### 🛠️ Työpajan oppimismetodologia
**Löytö → käyttöönotto → räätälöinti -lähestymistapa käytännön taitojen kehittämiseen**

**Vaihe 1: Löytö (45 minuuttia)**
- **Mallipohjien tutkiminen**: Arvioi Microsoft Foundry -malleja ja palveluita
- **Arkkitehtuurianalyysi**: Ymmärrä moniagenttimallit ja käyttöönotto-strategiat
- **Vaadittavien tarpeiden arviointi**: Tunnista organisaation tarpeet ja rajoitteet
- **Ympäristön valmistelu**: Konfiguroi kehitysympäristö ja Azure-resurssit

**Vaihe 2: Käyttöönotto (2 tuntia)**
- **Ohjattu toteutus**: Vaiheittainen AI-sovellusten käyttöönotto AZD:llä
- **Palvelujen konfigurointi**: Määritä Azure AI -palvelut, käyttörajapinnat ja autentikointi
- **Turvallisuuden toteutus**: Sovella yritystason turvallisuusmalleja ja pääsynhallintaa
- **Validointitestit**: Varmista käyttöönotot ja ratko yleiset ongelmat

**Vaihe 3: Räätälöinti (45 minuuttia)**
- **Sovelluksen muokkaus**: Mukauta mallipohjia erityisiä käyttötapauksia ja vaatimuksia varten
- **Tuotannon optimointi**: Ota käyttöön valvonta, kustannusten hallinta ja skaalastrategiat
- **Edistyneet mallit**: Tutki moniagenttien koordinointia ja monimutkaisia arkkitehtuureja
- **Seuraavien vaiheiden suunnittelu**: Määritä oppimispolku taitojen jatkokehitykseen

#### 🎯 Työpajan oppimistulokset
**Mitatut taidot, jotka kehittyvät käytännön harjoittelussa**

**Tekniset pätevyydet:**
- **Tuotantovalmiiden AI-sovellusten käyttöönotto**: Käytä onnistuneesti AI-voimalla toimivia ratkaisuja
- **Infrastruktuuri koodina -hallinta**: Luo ja hallitse räätälöityjä Bicep-malleja
- **Moniagenttinen arkkitehtuuri**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Tuotantovalmius**: Sovella turvallisuus-, valvonta- ja hallintomalleja
- **Vianetsintäosaaminen**: Ratkaise itsenäisesti käyttöönotto- ja konfigurointiongelmia

**Ammatilliset taidot:**
- **Projektijohtajuus**: Johda teknisiä tiimejä pilvikäyttöönottohankkeissa
- **Arkkitehtuurin suunnittelu**: Suunnittele skaalautuvia ja kustannustehokkaita Azure-ratkaisuja
- **Tietämyksen siirto**: Kouluta ja mentoroi kollegoita AZD:n parhaissa käytännöissä
- **Strateginen suunnittelu**: Vaikuta organisaation pilviomaksustrategioihin

#### 📋 Työpajan resurssit ja materiaalit
**Kattava työkalupakki fasilitaattoreille ja oppijoille**

**Fasilitaattoreille:**
- **Opettajan opas**: [Työpajan yleiskatsaus](workshop/README.md) - Istunnon suunnittelu ja ohjeistus
- **Esitysmateriaalit**: Kalvot, arkkitehtuurikaaviot ja demo-käsikirjoitukset
- **Arviointityökalut**: Käytännön harjoitukset, tietojen tarkastus ja arviointikriteerit
- **Tekninen valmius**: Ympäristön konfigurointi, vianetsintäopas ja varmistussuunnitelmat

**Oppijoille:**
- **Interaktiivinen työpaja-ympäristö**: [Työpajan materiaalit](workshop/README.md) - Selaimella käytettävä oppimisalusta
- **Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset toteutusläpikäynnit  
- **Viitedokumentaatio**: [AI-työpajalaboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-keskeiset syväluotaukset
- **Yhteisön resurssit**: Azure Discord -kanavat, GitHub-keskustelut ja asiantuntijatuki

#### 🏢 Yritystyöpajan toteutus
**Organisaation käyttöönotto- ja koulutusstrategiat**

**Yrityskoulutusohjelmat:**
- **Kehittäjien perehdytys**: Uuden henkilöstön orientaatio AZD:n perusteisiin (2-4 viikkoa)
- **Tiimien taitojen kehittäminen**: Neljännesvuosittaiset työpajat nykyisille kehitystiimeille (1-2 päivää)
- **Arkkitehtuurikatsaus**: Kuukausittaiset sessiot vanhemmille insinööreille ja arkkitehdeille (4 tuntia)
- **Johtoryhmän infotilaisuudet**: Johtajatyöpajat teknisille päättäjille (puolipäivä)

**Toteutustuki:**
- **Räätälöity työpajasuuntaus**: Sisällön mukautus organisaation erityistarpeisiin
- **Pilottiohjelman hallinta**: Rakenteellinen käyttöönotto onnistumismittareilla ja palautekierroksilla  
- **Jatkuva mentorointi**: Työpajan jälkeinen tuki projektin toteutukselle
- **Yhteisön rakentaminen**: Sisäiset Azure AI -kehittäjäyhteisöt ja tiedon jakaminen

**Onnistumisen mittarit:**
- **Taitojen hankinta**: Ennen/jälkeen arvioinnit teknisen pätevyyden kasvun mittaamiseksi
- **Käyttöönoton onnistuminen**: Osallistujien prosenttiosuus, jotka onnistuvat tuotantosovellusten käyttöönotossa
- **Tuottavuuteen pääsyn aika**: Lyhennetty perehdytysaika uusissa Azure AI -projekteissa
- **Tiedon säilyminen**: Seuranta-arvioinnit 3-6 kuukautta työpajan jälkeen

## 8-luvun oppimisrakenne

### Luku 1: Perusta ja pika-aloitus (30-45 minuuttia) 🌱
**Esivaatimukset**: Azure-tilaus, peruskäskurivin tuntemus  
**Vaikeustaso**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteet
- AZD:n asentaminen alustallesi  
- Ensimmäinen onnistunut käyttöönotto
- Keskeiset käsitteet ja terminologia

#### Oppimateriaalit
- [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) - Keskeiset käsitteet
- [Asennus & käyttöönotto](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Käytännön opastus
- [Komentojen pikaohje](resources/cheat-sheet.md) - Nopea viite

#### Käytännön tulos
Onnistunut yksinkertaisen verkkosovelluksen käyttöönotto Azureen AZD:llä

---

### Luku 2: AI-ensimmäinen kehitys (1-2 tuntia) 🤖
**Esivaatimukset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integraatio AZD:n kanssa
- AI-voimaisten sovellusten käyttöönotto
- AI-palvelujen konfiguroinnin ymmärtäminen
- RAG (Retrieval-Augmented Generation) -mallit

#### Oppimateriaalit
- [Microsoft Foundryn integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI-mallin käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI-työpajalaboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) - **UUSI**: Kattava 2-3 tunnin käytännön laboratorio
- [Interaktiivinen työpajaopas](workshop/README.md) - **UUSI**: MkDocs-esikatselun avulla selainpohjainen työpaja
- [Microsoft Foundryn mallipohjat](README.md#featured-microsoft-foundry-templates)
- [Työpajaohjeet](../../workshop/docs/instructions) - **UUSI**: Vaiheittain ohjatut harjoitukset

#### Käytännön tulos
Ota käyttöön ja konfiguroi AI-voimainen chat-sovellus RAG-ominaisuuksilla

#### Työpajan oppimispolku (valinnainen lisäys)
**UUSI interaktiivinen kokemus**: [Täydellinen työpajaopas](workshop/README.md)
1. **Löytö** (30 min): Mallipohjan valinta ja arviointi
2. **Käyttöönotto** (45 min): AI-mallipohjan toiminnallisuuden käyttöönotto ja validointi  
3. **Purkautuminen** (30 min): Ymmärrä mallipohjan arkkitehtuuri ja komponentit
4. **Konfigurointi** (30 min): Mukauta asetuksia ja parametreja
5. **Räätälöinti** (45 min): Muokkaa ja toista muuttaaksesi oman näköiseksi
6. **Purkaminen** (15 min): Siivoa resurssit ja ymmärrä elinkaari
7. **Yhteenveto** (15 min): Seuraavat askeleet ja edistyneet oppimispolut

---

### Luku 3: Konfigurointi ja autentikointi (45-60 minuuttia) ⚙️
**Esivaatimukset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Autentikoinnin ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi
- Moniympäristöiset käyttöönotot

#### Oppimateriaalit
- [Konfigurointiohje](docs/chapter-03-configuration/configuration.md) - Ympäristön valmistelu
- [Autentikointi ja turvallisuusmallit](docs/chapter-03-configuration/authsecurity.md) - Hallinnoitu identiteetti ja Key Vault -integraatio
- Moniympäristöiset esimerkit

#### Käytännön tulos
Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### Luku 4: Infrastruktuuri koodina ja käyttöönotto (1-1,5 tuntia) 🏗️
**Esivaatimukset**: Luvut 1-3 suoritetu
**Vaikeustaso**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto-mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat
- Räätälöityjen mallipohjien luominen

- Säilöttyjen sovellusten käyttöönotto Azure Container Appsilla ja AZD:llä

#### Oppimateriaalit
- [Käyttöönottoguide](docs/chapter-04-infrastructure/deployment-guide.md) - Koko työnkulut
- [Resurssien provisiointi](docs/chapter-04-infrastructure/provisioning.md) - Resurssihallinta
- Säilötettyjen sovellusten ja mikropalveluesimerkit
- [Container App -esimerkit](examples/container-app/README.md) - Pika-aloitus, tuotanto ja edistyneet käyttöönotto-mallit

#### Käytännön tulos
Ota käyttöön monipalveluisia sovelluksia räätälöityjen infrastruktuurimallien avulla

---

### Luku 5: Moniagenttiset AI-ratkaisut (2-3 tuntia) 🤖🤖
**Esivaatimukset**: Luvut 1-2 suoritetu
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttiset arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot
- Asiakas- ja varastoagenttien toteutukset

- Säilöttyjen mikropalveluiden integrointi agenttipohjaisiin ratkaisuihin

#### Oppimateriaalit
- [Vähittäiskaupan moniagenttiratkaisu](examples/retail-scenario.md) - Arkkitehtuurin pohjapiirustus, ei täydellinen sovellus
- [ARM-mallipaketit](../../examples/retail-multiagent-arm-template) - Infrastruktuurin runko ja toteutusedellytykset
- Moniagentin koordinointimallit
- [Mikropalveluarkkitehtuurin esimerkki](../../examples/container-app/microservices) - Palvelu-palvelu -viestintä, asynkroninen viestintä ja tuotantokäyttöönotto

#### Käytännön tulos
Suunnittele moniagenttinen AI-ratkaisu ja tunnista sovelluksen toteutus-, validointi- ja operatiiviset työt, jotka vaativat infrastruktuurin provisioinnin lisäksi

---

### Luku 6: Käyttöönottoa edeltävä validointi ja suunnittelu (1 tunti) 🔍
**Esivaatimukset**: Luku 4 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esilento-tarkastukset ja automaatio
- Kustannusten optimointisuunnittelu

#### Oppimateriaalit
- [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- [Esilento-tarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit
- [Application Insights -integraatio](docs/chapter-06-pre-deployment/application-insights.md) - Valvonta ja havaittavuus
- [Moniagentin koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Agenttien orkestrointistrategiat

#### Käytännön tulos
Validioi ja optimoi käyttöönotot ennen toteutusta

---

### Luku 7: Vianetsintä ja virheenkorjaus (1-1,5 tuntia) 🔧
**Esivaatimukset**: Mikä tahansa käyttöönotto-osio suoritettu  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenetsintämenetelmät
- Yleisimmät ongelmat ja ratkaisut
- AI-spesifinen vianmääritys
- Suorituskyvyn optimointi

#### Oppimateriaalit
- [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ja ratkaisut
- [Virheenetsintäopas](docs/chapter-07-troubleshooting/debugging.md) - Askel askeleelta -strategiat
- [AI-spesifinen vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön tulos
Diagnoosi ja ratkaisu yleisiin käyttöönotto-ongelmiin itsenäisesti

---

### Luku 8: Tuotanto- ja yrityskäytännöt (2-3 tuntia) 🏢
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritysturvallisuusmallit
- Valvonta ja kustannusoptimointi
- Skaalautuvuus ja hallinnointi

- Parhaat käytännöt tuotantokonttisovellusten käyttöönotossa (turvallisuus, valvonta, kustannukset, CI/CD)

#### Oppimateriaalit
- [Tuotannon AI-parhaat käytännöt](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- Mikropalvelut ja yritysesimerkit
- Valvonta- ja hallintakehykset
- [Mikropalveluarkkitehtuurin esimerkki](../../examples/container-app/microservices) - Blue-green/canary-käyttöönotto, hajautettu jäljitys ja kustannusoptimointi

#### Käytännön tulos
Käyttöönotto yritysvalmiilla sovelluksilla täysillä tuotantotoiminnoilla

---

## Oppimisen eteneminen ja monimutkaisuus

### Taitojen progressiivinen rakentaminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusteet) → luku 2 (AI-kehitys)
- **🔧 Keskitaso**: Luvut 3-4 (Konfigurointi & infrastruktuuri) → luku 6 (Validointi)
- **🚀 Edistynyt**: Luku 5 (Moni-agenttiset ratkaisut) → luku 7 (Vianmääritys)
- **🏢 Yritys**: Suorita kaikki luvut, keskity lukuun 8 (Tuotantokäytännöt)

- **Konttisovelluspolku**: Luvut 4 (Konttikäyttöönotto), 5 (Mikropalveluinsinööri), 8 (Tuotannon parhaat käytännöt)

### Monimutkaisuuden indikaattorit

- **⭐ Perustaso**: Yksittäiset käsitteet, ohjatut opastukset, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita käsitteitä, käytännön harjoittelu, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, räätälöidyt ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Asiantuntija**: Tuotantojärjestelmät, yritysmallit, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusteet & pika-aloitus (45 min)
2. **Luku 2**: AI-Ennen Kehitys (2 tuntia)  
3. **Luku 5**: Moni-agenttiset AI-ratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon AI-parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusteet & pika-aloitus (45 min)
2. **Luku 3**: Konfigurointi & tunnistus (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina & käyttöönotto (1,5 tuntia)
4. **Luku 6**: Ennen käyttöönottoa validointi & suunnittelu (1 tunti)
5. **Luku 7**: Vianmääritys & virheenetsintä (1,5 tuntia)
6. **Luku 8**: Tuotanto & yritysmallit (2 tuntia)

#### 🎓 Täydellinen oppimispolku (8-12 tuntia)
Kaikkien kahdeksan luvun suorittaminen järjestyksessä käytännön harjoituksineen ja validoinline

## Kurssin suorituskehys

### Tiedon validointi
- **Luvun tarkastuspisteet**: Käytännön harjoitukset mitattavilla tuloksilla
- **Käytännön tarkistus**: Toimivien ratkaisujen käyttöönotto jokaisessa luvussa
- **Edistymisen seuranta**: Visuaaliset indikaattorit ja suoritustodistukset
- **Yhteisön validointi**: Kokemusten jakaminen Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Luvut 1-2 suoritus (Perusteet + AI)
- ✅ Perus web-sovelluksen käyttöönotto AZD:llä
- ✅ AI-pohjaisen chat-sovelluksen käyttöönotto RAG:lla
- ✅ AZD:n ydinkäsitteiden ja AI-integraation ymmärrys

#### Luvut 3-4 suoritus (Konfigurointi + infrastruktuuri)  
- ✅ Moniympäristön käyttöönoton hallinta
- ✅ Räätälöityjen Bicep-infrastruktuurimallien luonti
- ✅ Turvallisten tunnistautumismallien toteutus

#### Luvut 5-6 suoritus (Moni-agentti + validointi)
- ✅ Monimutkaisen moni-agentin AI-ratkaisun käyttöönotto
- ✅ Kapasiteetin suunnittelu ja kustannusoptimointi
- ✅ Automaattisen ennen käyttöönottoa tehtävän validoinnin toteutus

#### Luvut 7-8 suoritus (Vianmääritys + tuotanto)
- ✅ Vianmääritys ja käyttöönotto-ongelmien ratkaisu itsenäisesti  
- ✅ Yritysluokan valvonnan ja turvallisuuden toteutus
- ✅ Tuotantovalmiiden sovellusten käyttöönotto hallinnoidusti

### Sertifiointi ja tunnustus
- **Kurssin suoritusmerkki**: Kaikkien 8 luvun suorittaminen käytännön validoinnilla
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Microsoft Foundryn Discordissa
- **Ammatillinen kehitys**: Alan kannalta merkittävät AZD- ja AI-käyttöönoton taidot
- **Uramahdollisuudet**: Yritysvalmiudet pilvikäyttöönottotehtäviin

## 🎓 Kattavat oppimistulokset

### Perustaso (Luvut 1-2)
Perustaitojen lukujen suorituksen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Ottaa käyttöön yksinkertaisia web-sovelluksia Azureen AZD-komentojen avulla
- Konfiguroida ja ottaa käyttöön AI-pohjaisia chat-sovelluksia RAG-ominaisuuksilla
- Ymmärtää AZD:n ydinkäsitteet: mallit, ympäristöt, käyttöönoton työnkulut
- Integratoida Microsoft Foundryn palvelut AZD-käyttöönottoihin
- Navigoida Azure AI -palvelun asetuksissa ja API-päätepisteissä

**Ammatilliset taidot:**
- Noudattaa jäsenneltyjä käyttöönoton työnkulkuja tasalaatuisten tulosten saavuttamiseksi
- Selvittää perustason käyttöönotto-ongelmia lokien ja dokumentaation avulla
- Kommunikoida tehokkaasti pilvikäyttöönoton prosesseista
- Soveltaa parhaita käytäntöjä turvallisessa AI-palvelun integroinnissa

**Oppimisen varmistus:**
- ✅ Onnistuneesti ottaa käyttöön `todo-nodejs-mongo` -malli
- ✅ Ottaa käyttöön ja konfiguroida `azure-search-openai-demo` RAG:llä
- ✅ Suorittaa vuorovaikutteisia työpajaharjoituksia (Discovery-vaihe)
- ✅ Osallistua Azure Discord -yhteisö keskusteluihin

### Keskitaso (Luvut 3-4)
Keskitasotaitojen lukujen suorituksen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Hallita moniympäristön käyttöönotot (kehitys, testaus, tuotanto)
- Luoda räätälöityjä Bicep-malleja infrastruktuurina koodina
- Toteuttaa turvalliset tunnistusmallit hallinnoidulla identiteetillä
- Ottaa käyttöön monimutkaisia monipalvelusovelluksia räätälöidyillä kokoonpanoilla
- Optimoida resurssien provisiointistrategioita kustannusten ja suorituskyvyn osalta

**Ammatilliset taidot:**
- Suunnitella skaalautuvia infrastruktuuriarkkitehtuureja
- Toteuttaa turvallisuuden parhaita käytäntöjä pilvikäyttöönotossa
- Dokumentoida infrastruktuurimalleja tiimiyhteistyötä varten
- Arvioida ja valita sopivia Azure-palveluita vaatimuksien perusteella

**Oppimisen varmistus:**
- ✅ Konfiguroida erilliset ympäristöt ympäristökohtaisilla asetuksilla
- ✅ Luoda ja ottaa käyttöön räätälöity Bicep-malli monipalvelusovellukselle
- ✅ Toteuttaa hallinnoidun identiteetin tunnistus turvalliseen käyttöön
- ✅ Suorittaa konfiguroinnin hallintaharjoituksia reaalimaailman skenaarioilla

### Edistynyt taso (Luvut 5-6)
Edistynyt taso suoritettuna oppijat osaavat:

**Tekniset taidot:**
- Ottaa käyttöön ja orkestroida moni-agenttisia AI-ratkaisuja koordinoiduilla työnkuluilla
- Toteuttaa asiakas- ja varastoagenttiarkkitehtuureja vähittäiskaupan skenaarioihin
- Suorittaa kattava kapasiteetin suunnittelu ja resurssien validointi
- Tehdä automaattinen ennen käyttöönottoa tehtävä validointi ja optimointi
- Suunnitella kustannustehokkaita SKU-valintoja työkuorman vaatimusten mukaan

**Ammatilliset taidot:**
- Arkkitehtuurintaa monimutkaisia AI-ratkaisuja tuotantoympäristöihin
- Johtaa teknisiä keskusteluja AI-käyttöönoton strategioista
- Ohjata nuorempia kehittäjiä AZD:n ja AI-käyttöönoton parhaissa käytännöissä
- Arvioida ja suositella AI-arkkitehtuurimalleja liiketoiminnan tarpeisiin

**Oppimisen varmistus:**
- ✅ Tarkistaa vähittäiskaupan moni-agenttinen pohjapiirros ja erottaa provisionointi-infrastruktuurin puuttuvasta sovellusimplementaatiosta
- ✅ Havainnollistaa agenttien koordinointia ja työnkulkujen orkestrointia
- ✅ Suorittaa kapasiteetin suunnitteluharjoituksia todellisilla resurssirajoituksilla
- ✅ Validioida käyttöönoton valmius automaattisten tarkistusten avulla

### Asiantuntijataso (Luvut 7-8)
Asiantuntijataso suoritettaessa oppijat osaavat:

**Tekniset taidot:**
- Diagnosoida ja ratkaista monimutkaiset käyttöönotto-ongelmat itsenäisesti
- Toteuttaa yritysluokan turvallisuusmallit ja hallintakehykset
- Suunnitella kattavia valvonta- ja hälytysstrategioita
- Optimoida tuotantokäyttöönottoja skaala, kustannukset ja suorituskyky huomioiden
- Rakentaa CI/CD-putkia asianmukaisella testauksella ja validoinnilla

**Ammatilliset taidot:**
- Johtaa yrityksen pilvitransformaatioprojekteja
- Suunnitella ja toteuttaa organisaation käyttöönotto-standardeja
- Kouluttaa ja ohjata kehitystiimejä edistyneissä AZD-käytännöissä
- Vaikuttaa teknisiin päätöksiin yrityksen AI-käyttöönotossa

**Oppimisen varmistus:**
- ✅ Ratkaista monimutkaiset monipalvelusovellusten käyttöönotto-ongelmat
- ✅ Toteuttaa yritystason turvallisuusmallit vaatimusten mukaisesti
- ✅ Suunnitella ja ottaa käyttöön tuotannon valvonta Application Insightsin avulla
- ✅ Saavuttaa yrityksen hallintakehyksen toteutus

## 🎯 Kurssin suoritustodistus

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jäsenneltyjen tarkastuspisteiden avulla:

- [ ] **Luku 1**: Perusteet & pika-aloitus ✅
- [ ] **Luku 2**: AI-Ennen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & tunnistus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moni-agenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen käyttöönottoa validointi & suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & virheenetsintä ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Varmistusprosessi
Jokaisen luvun suorituksen jälkeen varmista osaamisesi:

1. **Käytännön harjoitusten suoritus**: Toteuta toimivat ratkaisut jokaisessa luvussa
2. **Tiedon arviointi**: Tarkastele FAQ-osioita ja suorita itsearvioinnin tehtävät
3. **Yhteisön osallistuminen**: Jaa kokemuksia ja saa palautetta Azure Discordissa
4. **Portfolioiden kehitys**: Dokumentoi käyttöönotot ja opitut asiat
5. **Vertaisarviointi**: Tee yhteistyötä muiden oppijoiden kanssa monimutkaisissa skenaarioissa

### Kurssin suorittamisen edut
Kurssin kaikkien lukujen suorittamisen ja validoinnin jälkeen valmistuneilla on:

**Tekninen asiantuntemus:**
- **Tuotantokokemus**: Toteuttanut todellisia AI-sovelluksia Azure-ympäristöihin
- **Ammatilliset taidot**: Yritysvalmiit käyttöönotto- ja vianmäärityskyvyt  
- **Arkkitehtuurin tuntemus**: Moni-agenttiset AI-ratkaisut ja monimutkaiset infrastruktuurimallit
- **Vianmäärityksen mestaruus**: Käyttöönotto- ja konfigurointi-ongelmien itsenäinen ratkaisu

**Ammatillinen kehitys:**
- **Alan tunnustus**: Todistettava osaaminen kysytyillä AZD- ja AI-käyttöönoton alueilla
- **Uramahdollisuudet**: Kelpoisuus pilviarkkitehdin ja AI-käyttöönottoasiantuntijan tehtäviin
- **Yhteisöjohtajuus**: Aktiivinen jäsenyys Azure-kehittäjä- ja AI-yhteisöissä
- **Jatkuva oppiminen**: Perusta edistyneelle Microsoft Foundry -erikoistumiselle

**Portfolio-omaisuudet:**
- **Käyttöönotetut ratkaisut**: Toimivat AI-sovellus- ja infrastruktuuriesimerkit
- **Dokumentaatio**: Kattavat käyttöönotto-oppaat ja vianmääritysmenettelyt  
- **Yhteisön panokset**: Keskustelut, esimerkit ja parannukset jaettuna Azure-yhteisöön
- **Ammatillinen verkosto**: Yhteydet Azure-asiantuntijoihin ja AI-käyttöönoton ammattilaisiin

### Kurssin jälkeinen oppimispolku
Valmistuneet ovat valmiita syvälliseen erikoistumiseen:
- **Microsoft Foundry Expert**: Syvällinen erikoistuminen AI-mallien käyttöönottoon ja orkestrointiin
- **Pilviarkkitehtuurin johtajuus**: Yritystason käyttöönottojen suunnittelu ja hallinnointi
- **Kehittäjäyhteisön johtajuus**: Osallistuminen Azure-esimerkkien ja yhteisöresurssien kehittämiseen
- **Yrityskoulutus**: AZD:n ja AI-käyttöönoton taitojen opettaminen organisaatioissa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
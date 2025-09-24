<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-24T22:32:19+00:00",
  "source_file": "course-outline.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Kurssin Rakenne ja Oppimiskehys

## Kurssin Yleiskatsaus

Hallitse Azure Developer CLI (azd) vaiheittain etenevien lukujen avulla. **Erityinen painotus AI-sovellusten käyttöönotossa Azure AI Foundry -integraation avulla.**

### Miksi Tämä Kurssi on Tärkeä Nykyaikaisille Kehittäjille

Azure AI Foundry Discord-yhteisön havaintojen perusteella **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin**, mutta he kohtaavat haasteita, kuten:
- Monimutkaiset monipalvelu-AI-arkkitehtuurit
- Parhaat käytännöt tuotantotason AI:n käyttöönotossa  
- Azure AI -palveluiden integrointi ja konfigurointi
- AI-työkuormien kustannusten optimointi
- AI-spesifisten käyttöönotto-ongelmien ratkaiseminen

### Keskeiset Oppimistavoitteet

Kurssin suorittamalla opit:
- **AZD:n Perusteet**: Ydinkonseptit, asennus ja konfigurointi
- **AI-sovellusten Käyttöönotto**: AZD:n käyttö Azure AI Foundry -palveluiden kanssa
- **Infrastructure as Code**: Azure-resurssien hallinta Bicep-mallien avulla
- **Käyttöönoton Vianetsintä**: Yleisimpien ongelmien ratkaisu ja virheiden korjaus
- **Tuotantotason Optimointi**: Turvallisuus, skaalautuvuus, valvonta ja kustannusten hallinta
- **Moniagenttiratkaisujen Rakentaminen**: Monimutkaisten AI-arkkitehtuurien käyttöönotto

## 🎓 Työpajan Oppimiskokemus

### Joustavat Oppimisen Toteutustavat
Kurssi tukee sekä **itsenäistä oppimista omaan tahtiin** että **ohjattuja työpajasessioita**, jolloin osallistujat saavat käytännön kokemusta AZD:stä ja kehittävät taitojaan interaktiivisten harjoitusten avulla.

#### 🚀 Itsenäinen Oppimismoodi
**Täydellinen yksittäisille kehittäjille ja jatkuvaan oppimiseen**

**Ominaisuudet:**
- **Selaimen Käyttöliittymä**: MkDocs-pohjainen työpaja, joka on käytettävissä millä tahansa selaimella
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristö valmiiksi konfiguroiduilla työkaluilla
- **Interaktiivinen DevContainer-ympäristö**: Ei paikallista asennusta - aloita koodaus heti
- **Edistymisen Seuranta**: Sisäänrakennetut tarkistuspisteet ja validointiharjoitukset
- **Yhteisön Tuki**: Pääsy Azure Discord-kanaviin kysymyksiä ja yhteistyötä varten

**Oppimisrakenne:**
- **Joustava Aikataulu**: Suorita luvut omaan tahtiin päivien tai viikkojen aikana
- **Tarkistuspistejärjestelmä**: Vahvista oppiminen ennen siirtymistä monimutkaisempiin aiheisiin
- **Resurssikirjasto**: Kattava dokumentaatio, esimerkit ja vianetsintäoppaat
- **Portfolion Kehittäminen**: Rakenna käyttövalmiita projekteja ammatilliseen portfolioon

**Aloittaminen (Itsenäinen):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Ohjatut Työpajasessiot
**Ihanteellinen yrityskoulutukseen, bootcamp-tapahtumiin ja oppilaitoksille**

**Työpajan Muotoiluvaihtoehdot:**

**📚 Akateeminen Kurssi (8-12 viikkoa)**
- **Yliopisto-ohjelmat**: Lukukauden mittainen kurssi, jossa viikoittain 2 tunnin sessiot
- **Bootcamp-muoto**: Intensiivinen 3-5 päivän ohjelma, jossa päivittäin 6-8 tunnin sessiot
- **Yrityskoulutus**: Kuukausittaiset tiimisessiot käytännön projektien toteutuksella
- **Arviointikehys**: Arvioidut tehtävät, vertaisarvioinnit ja lopputyöt

**🚀 Intensiivinen Työpaja (1-3 päivää)**
- **Päivä 1**: Perusteet + AI-kehitys (Luvut 1-2) - 6 tuntia
- **Päivä 2**: Konfigurointi + Infrastruktuuri (Luvut 3-4) - 6 tuntia  
- **Päivä 3**: Edistyneet Kuviot + Tuotanto (Luvut 5-8) - 8 tuntia
- **Seuranta**: Valinnainen 2 viikon mentorointi projektin loppuun saattamiseksi

**⚡ Johtotason Katsaus (4-6 tuntia)**
- **Strateginen Yleiskatsaus**: AZD:n arvo ja liiketoimintavaikutus (1 tunti)
- **Käytännön Demo**: AI-sovelluksen käyttöönotto alusta loppuun (2 tuntia)
- **Arkkitehtuurin Tarkastelu**: Yrityskuvioiden ja hallinnan tarkastelu (1 tunti)
- **Toteutussuunnittelu**: Organisaation käyttöönoton strategia (1-2 tuntia)

#### 🛠️ Työpajan Oppimismetodologia
**Tutkiminen → Käyttöönotto → Mukauttaminen -lähestymistapa käytännön taitojen kehittämiseksi**

**Vaihe 1: Tutkiminen (45 minuuttia)**
- **Mallien Tutkiminen**: Arvioi Azure AI Foundry -mallit ja palvelut
- **Arkkitehtuurin Analyysi**: Ymmärrä moniagenttikuviot ja käyttöönoton strategiat
- **Tarpeiden Arviointi**: Tunnista organisaation tarpeet ja rajoitteet
- **Ympäristön Asetus**: Konfiguroi kehitysympäristö ja Azure-resurssit

**Vaihe 2: Käyttöönotto (2 tuntia)**
- **Ohjattu Toteutus**: Vaiheittainen AI-sovellusten käyttöönotto AZD:llä
- **Palveluiden Konfigurointi**: Konfiguroi Azure AI -palvelut, päätepisteet ja autentikointi
- **Turvallisuuden Toteutus**: Käytä yritystason turvallisuuskuvioita ja käyttöoikeuksia
- **Validointitestaus**: Vahvista käyttöönotot ja ratkaise yleiset ongelmat

**Vaihe 3: Mukauttaminen (45 minuuttia)**
- **Sovelluksen Muokkaus**: Mukauta malleja erityisiin käyttötapauksiin ja tarpeisiin
- **Tuotannon Optimointi**: Toteuta valvonta-, kustannustenhallinta- ja skaalautuvuusstrategiat
- **Edistyneet Kuviot**: Tutki moniagenttikoordinaatiota ja monimutkaisia arkkitehtuureja
- **Seuraavien Askeleiden Suunnittelu**: Määritä oppimispolku taitojen jatkuvaan kehittämiseen

#### 🎯 Työpajan Oppimistulokset
**Mitattavat taidot, jotka kehittyvät käytännön harjoittelun kautta**

**Tekniset Kompetenssit:**
- **Tuotantotason AI-sovellusten Käyttöönotto**: Onnistunut AI-pohjaisten ratkaisujen käyttöönotto ja konfigurointi
- **Infrastructure as Code -osaaminen**: Luo ja hallitse mukautettuja Bicep-malleja
- **Moniagenttiarkkitehtuuri**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Tuotantovalmius**: Käytä turvallisuus-, valvonta- ja hallintakuvioita
- **Vianetsintäosaaminen**: Ratkaise itsenäisesti käyttöönotto- ja konfigurointiongelmia

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
- **Tekninen Asetus**: Ympäristön konfigurointi, vianetsintäoppaat ja varasuunnitelmat

**Oppijoille:**
- **Interaktiivinen Työpajaympäristö**: [Työpajamateriaalit](workshop/README.md) - Selaimen kautta käytettävä oppimisalusta
- **Vaiheittaiset Ohjeet**: [Ohjatut Harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset toteutusohjeet  
- **Viitedokumentaatio**: [AI Työpajalaboratorio](docs/ai-foundry/ai-workshop-lab.md) - AI-painotteiset syventävät oppimateriaalit
- **Yhteisöresurssit**: Azure Discord-kanavat, GitHub-keskustelut ja asiantuntijatuki

#### 🏢 Yritystyöpajan Toteutus
**Organisaation käyttöönotto- ja koulutusstrategiat**

**Yrityskoulutusohjelmat:**
- **Kehittäjien Perehdytys**: Uusien työntekijöiden orientaatio AZD:n perusteilla (2-4 viikkoa)
- **Tiimien Taitojen Kehittäminen**: Kvartaaleittain järjestettävät työpajat nykyisille kehitystiimeille (1-2 päivää)
- **Arkkitehtuurin Tarkastelu**: Kuukausittaiset sessiot vanhemmille insinööreille ja arkkitehdeille (4 tuntia)
- **Johtotason Katsaukset**: Puolen päivän työpajat teknisille päättäjille

**Toteutustuki:**
- **Mukautettu Työpajasuunnittelu**: Räätälöity sisältö organisaation erityistarpeisiin
- **Pilottiohjelman Hallinta**: Rakenteellinen käyttöönotto onnistumismittareilla ja palautesilmukoilla  
- **Jatkuva Mentorointi**: Työpajan jälkeinen tuki projektin toteutukselle
- **Yhteisön Rakentaminen**: Sisäiset Azure AI -kehittäjäyhteisöt ja tiedon jakaminen

**Onnistumismittarit:**
- **Taitojen Hankinta**: Ennen/jälkeen arvioinnit teknisen osaamisen kasvun mittaamiseksi
- **Käyttöönoton Onnistuminen**: Osallistujien prosenttiosuus, jotka onnistuvat tuotantotason sovellusten käyttöönotossa
- **Tuottavuuden Nopeus**: Lyhentynyt perehdytysaika uusille Azure AI -projekteille
- **Tiedon Säilyvyys**: Jälkiarvioinnit 3-6 kuukautta työpajan jälkeen

## 8-luvun Oppimisrakenne

### Luku 1: Perusteet ja Pika-aloitus (30-45 minuuttia) 🌱
**Edellytykset**: Azure-tilaus, peruskomentoriviosaaminen  
**Vaikeustaso**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi  
- Ensimmäinen onnistunut käyttöönotto
- Ydinkonseptit ja terminologia

#### Oppimisresurssit
- [AZD:n Perusteet](docs/getting-started/azd-basics.md) - Ydinkonseptit
- [Asennus ja Asetus](docs/getting-started/installation.md) - Alustakohtaiset oppaat
- [Ensimmäinen Projektisi](docs/getting-started/first-project.md) - Käytännön opas
- [Komento Pikaopas](resources/cheat-sheet.md) - Nopea viite

#### Käytännön Lopputulos
Onnistunut yksinkertaisen verkkosovelluksen käyttöönotto Azureen AZD:n avulla

---

### Luku 2: AI-Ensisijainen Kehitys (1-2 tuntia) 🤖
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Azure AI Foundry -integraatio AZD:n kanssa
- AI-pohjaisten sovellusten käyttöönotto
- AI-palveluiden konfiguroinnin ymmärtäminen
- RAG (Retrieval-Augmented Generation) -kuviot

#### Oppimisresurssit
- [Azure AI Foundry -integraatio](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI-mallin Käyttöönotto](docs/ai-foundry/ai-model-deployment.md)
- [AI Työpajalaboratorio](docs/ai-foundry/ai-workshop-lab.md) - **UUSI**: Kattava 2-3 tunnin käytännön laboratorio
- [Interaktiivinen Työpajaopas](workshop/README.md) - **UUSI**: Selaimen kautta käytettävä työpaja MkDocs-esikatselulla
- [Azure AI Foundry -mallit](README.md#featured-azure-ai-foundry-templates)
- [Työpajan Ohjeet](../../workshop/docs/instructions) - **UUSI**: Vaiheittaiset ohjatut harjoitukset

#### Käytännön Lopputulos
Ota käyttöön ja konfiguroi AI-pohjainen chat-sovellus RAG-ominaisuuksilla

#### Työpajan Oppimispolku (Valinnainen Parannus)
**UUSI Interaktiivinen Kokemus**: [Täydellinen Työpajaopas](workshop/README.md)
1. **Tutkiminen** (30 min): Mallin valinta ja arviointi
2. **Käyttöönotto** (45 min): AI-mallin toiminnallisuuden käyttöönotto ja validointi  
3. **Purkaminen** (30 min): Mallin arkkitehtuurin ja komponenttien ymmärtäminen
4. **Konfigurointi** (30 min): Asetusten ja parametrien mukauttaminen
5. **Mukauttaminen** (45 min): Muokkaa ja iteroi tehdäksesi siitä omasi
6. **Purkaminen** (15 min): Resurssien siivous ja elinkaaren ymmärtäminen
7. **Yhteenveto** (15 min): Seuraavat askeleet ja edistyneet oppimispolut

---

### Luku 3: Konfigurointi ja Autentikointi (45-60 minuuttia) ⚙️
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Autentikoinnin ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi
- Moniympäristön käyttöönotot

#### Oppimisresurssit
- [Konfigurointiopas](docs/getting-started/configuration.md) - Ympäristön asetus
- Turvallisuuskuviot ja hallittu identiteetti
- Moniympäristön esimerkit

#### Käytännön Lopputulos
Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### Luku 4: Infrastructure as Code ja Käyttöönotto (1-1.5 tuntia) 🏗️
**Edellytykset**: Luvut 1-3 suoritettu  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönoton kuviot
- Infrastructure as Code Bicepillä
- Resurssien provisiointistrategiat
- Mukautettujen mallien luominen

#### Oppimisresurssit
- [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Täydelliset työnkulut
- [Resurssien Provisiointi](docs/deployment/provisioning.md) - Resurssien hallinta
- Kontti- ja mikropalveluesimerkit

#### Käytännön Lopputulos
Ota käyttöön monimutkaisia monipalvelusovelluksia mukautettujen infrastruktuurimallien avulla


- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI-palvelun ongelmat

#### Käytännön Tavoite
Itsenäinen diagnosointi ja yleisten käyttöönotto-ongelmien ratkaisu

---

### Luku 8: Tuotanto- ja yritysmallit (2-3 tuntia) 🏢
**Edellytykset**: Luvut 1-4 suoritettu  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä Opit
- Tuotantokäyttöönoton strategiat
- Yritystason turvallisuusmallit
- Seuranta ja kustannusten optimointi
- Skaalautuvuus ja hallintamallit

#### Oppimateriaalit
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Yritysmallit
- Mikropalvelut ja yritysesimerkit
- Seuranta- ja hallintakehykset

#### Käytännön Tavoite
Ota käyttöön yritysvalmiita sovelluksia, joissa on täydet tuotantokyvyt

---

## Oppimisen eteneminen ja vaikeustaso

### Taitojen progressiivinen kehittäminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusteet) → Luku 2 (AI-kehitys)
- **🔧 Keskitaso**: Luvut 3-4 (Konfigurointi & infrastruktuuri) → Luku 6 (Validointi)
- **🚀 Edistynyt**: Luku 5 (Moniagenttiratkaisut) → Luku 7 (Vianetsintä)
- **🏢 Yritystaso**: Suorita kaikki luvut, keskity lukuun 8 (Tuotantomallit)

### Vaikeustason indikaattorit

- **⭐ Perustaso**: Yksinkertaiset konseptit, ohjatut harjoitukset, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita konsepteja, käytännön harjoituksia, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, räätälöidyt ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Asiantuntija**: Tuotantojärjestelmät, yritysmallit, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusteet & Nopea aloitus (45 min)
2. **Luku 2**: AI-ensimmäinen kehitys (2 tuntia)  
3. **Luku 5**: Moniagenttiratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusteet & Nopea aloitus (45 min)
2. **Luku 3**: Konfigurointi & Autentikointi (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina & käyttöönotto (1,5 tuntia)
4. **Luku 6**: Ennakkovalidointi & suunnittelu (1 tunti)
5. **Luku 7**: Vianetsintä & virheenkorjaus (1,5 tuntia)
6. **Luku 8**: Tuotanto- ja yritysmallit (2 tuntia)

#### 🎓 Täydellinen oppimismatka (8-12 tuntia)
Kaikkien 8 luvun suorittaminen järjestyksessä käytännön harjoituksilla ja validoinnilla

## Kurssin suorittamisen kehys

### Tiedon validointi
- **Lukukohtaiset tarkistuspisteet**: Käytännön harjoituksia mitattavilla tuloksilla
- **Käytännön vahvistus**: Toimivien ratkaisujen käyttöönotto jokaisessa luvussa
- **Edistymisen seuranta**: Visuaaliset indikaattorit ja suoritusmerkit
- **Yhteisön validointi**: Kokemusten jakaminen Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Luvut 1-2 (Perusteet + AI)
- ✅ Ota käyttöön yksinkertainen verkkosovellus AZD:llä
- ✅ Ota käyttöön AI-pohjainen chat-sovellus RAG:lla
- ✅ Ymmärrä AZD:n peruskäsitteet ja AI-integraatio

#### Luvut 3-4 (Konfigurointi + Infrastruktuuri)  
- ✅ Hallitse monen ympäristön käyttöönottoja
- ✅ Luo räätälöityjä Bicep-infrastruktuurimalleja
- ✅ Toteuta turvalliset autentikointimallit

#### Luvut 5-6 (Moniagentti + Validointi)
- ✅ Ota käyttöön monimutkainen moniagenttiratkaisu
- ✅ Suorita kapasiteettisuunnittelu ja kustannusten optimointi
- ✅ Toteuta automatisoitu ennakkovalidointi

#### Luvut 7-8 (Vianetsintä + Tuotanto)
- ✅ Korjaa ja ratkaise käyttöönotto-ongelmat itsenäisesti  
- ✅ Toteuta yritystason seuranta ja turvallisuus
- ✅ Ota käyttöön tuotantovalmiit sovellukset hallintamalleilla

### Sertifiointi ja tunnustus
- **Kurssin suoritusmerkki**: Suorita kaikki 8 lukua käytännön validoinnilla
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure AI Foundry Discordissa
- **Ammatillinen kehitys**: Teollisuudessa relevantit AZD- ja AI-käyttöönotto-taidot
- **Uramahdollisuudet**: Yritysvalmiit pilvikäyttöönotto-kyvykkyydet

## 🎓 Kattavat oppimistulokset

### Perustaso (Luvut 1-2)
Perustason lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset kyvyt:**
- Ota käyttöön yksinkertaisia verkkosovelluksia Azureen AZD-komentojen avulla
- Konfiguroi ja ota käyttöön AI-pohjaisia chat-sovelluksia RAG-ominaisuuksilla
- Ymmärrä AZD:n ydinkäsitteet: mallit, ympäristöt, provisiointityönkulut
- Integroi Azure AI Foundry -palvelut AZD-käyttöönottoihin
- Navigoi Azure AI -palvelujen konfiguraatioissa ja API-päätepisteissä

**Ammatilliset taidot:**
- Noudata jäsenneltyjä käyttöönotto-työnkulkuja johdonmukaisten tulosten saavuttamiseksi
- Ratkaise peruskäyttöönotto-ongelmia lokien ja dokumentaation avulla
- Kommunikoi tehokkaasti pilvikäyttöönotto-prosesseista
- Sovella parhaita käytäntöjä turvalliseen AI-palvelujen integrointiin

**Oppimisen validointi:**
- ✅ Ota onnistuneesti käyttöön `todo-nodejs-mongo`-malli
- ✅ Ota käyttöön ja konfiguroi `azure-search-openai-demo` RAG:lla
- ✅ Suorita interaktiiviset työpajaharjoitukset (Tutkimusvaihe)
- ✅ Osallistu Azure Discord -yhteisökeskusteluihin

### Keskitaso (Luvut 3-4)
Keskitasoisten lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset kyvyt:**
- Hallitse monen ympäristön käyttöönottoja (kehitys, testaus, tuotanto)
- Luo räätälöityjä Bicep-malleja infrastruktuuri koodina -ratkaisuihin
- Toteuta turvalliset autentikointimallit hallitulla identiteetillä
- Ota käyttöön monimutkaisia monipalvelusovelluksia räätälöidyillä konfiguraatioilla
- Optimoi resurssien provisiointistrategiat kustannusten ja suorituskyvyn kannalta

**Ammatilliset taidot:**
- Suunnittele skaalautuvia infrastruktuuriarkkitehtuureja
- Toteuta turvallisuuden parhaat käytännöt pilvikäyttöönottoihin
- Dokumentoi infrastruktuurimallit tiimiyhteistyötä varten
- Arvioi ja valitse sopivat Azure-palvelut vaatimusten perusteella

**Oppimisen validointi:**
- ✅ Konfiguroi erilliset ympäristöt ympäristökohtaisilla asetuksilla
- ✅ Luo ja ota käyttöön räätälöity Bicep-malli monipalvelusovellukselle
- ✅ Toteuta hallitun identiteetin autentikointi turvalliseen pääsyyn
- ✅ Suorita konfiguraationhallinnan harjoituksia todellisilla skenaarioilla

### Edistynyt taso (Luvut 5-6)
Edistyneiden lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset kyvyt:**
- Ota käyttöön ja orkestroi moniagenttiratkaisuja koordinoiduilla työnkuluilla
- Toteuta asiakas- ja varastoagenttiarkkitehtuurit vähittäiskaupan skenaarioihin
- Suorita kattava kapasiteettisuunnittelu ja resurssien validointi
- Toteuta automatisoitu ennakkovalidointi ja optimointi
- Suunnittele kustannustehokkaita SKU-valintoja työkuormavaatimusten perusteella

**Ammatilliset taidot:**
- Arkkitehtoi monimutkaisia AI-ratkaisuja tuotantoympäristöihin
- Johda teknisiä keskusteluja AI-käyttöönotto-strategioista
- Mentoroi juniorikehittäjiä AZD- ja AI-käyttöönoton parhaissa käytännöissä
- Arvioi ja suosittele AI-arkkitehtuurimalleja liiketoiminnan tarpeisiin

**Oppimisen validointi:**
- ✅ Ota käyttöön täydellinen vähittäiskaupan moniagenttiratkaisu ARM-malleilla
- ✅ Näytä agenttien koordinointi ja työnkulkujen orkestrointi
- ✅ Suorita kapasiteettisuunnitteluharjoituksia todellisilla resurssirajoitteilla
- ✅ Vahvista käyttöönoton valmius automatisoiduilla tarkistuksilla

### Asiantuntijataso (Luvut 7-8)
Asiantuntijatasoisten lukujen suorittamisen jälkeen oppijat osoittavat:

**Tekniset kyvyt:**
- Diagnosoi ja ratkaise monimutkaisia käyttöönotto-ongelmia itsenäisesti
- Toteuta yritystason turvallisuusmallit ja hallintakehykset
- Suunnittele kattavat seuranta- ja hälytysstrategiat
- Optimoi tuotantokäyttöönotot skaalautuvuuden, kustannusten ja suorituskyvyn kannalta
- Perusta CI/CD-putkia asianmukaisella testauksella ja validoinnilla

**Ammatilliset taidot:**
- Johda yrityksen pilvitransformaatioprojekteja
- Suunnittele ja toteuta organisaation käyttöönotto-standardeja
- Kouluta ja mentoroi kehitystiimejä edistyneissä AZD-käytännöissä
- Vaikuta teknisiin päätöksiin yrityksen AI-käyttöönottojen osalta

**Oppimisen validointi:**
- ✅ Ratkaise monimutkaisia monipalvelukäyttöönotto-ongelmia
- ✅ Toteuta yritystason turvallisuusmallit vaatimustenmukaisuusvaatimuksilla
- ✅ Suunnittele ja ota käyttöön tuotannon seuranta Application Insightsilla
- ✅ Suorita yrityksen hallintakehyksen toteutus

## 🎯 Kurssin suorittamisen sertifiointi

### Edistymisen seurantakehys
Seuraa oppimisen etenemistä jäsenneltyjen tarkistuspisteiden avulla:

- [ ] **Luku 1**: Perusteet & Nopea aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Autentikointi ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiratkaisut ✅
- [ ] **Luku 6**: Ennakkovalidointi & suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto- ja yritysmallit ✅

### Validointiprosessi
Jokaisen luvun suorittamisen jälkeen vahvista tietosi seuraavasti:

1. **Käytännön harjoitusten suorittaminen**: Ota käyttöön toimivia ratkaisuja jokaisessa luvussa
2. **Tiedon arviointi**: Tarkista FAQ-osat ja suorita itsearvioinnit
3. **Yhteisön osallistuminen**: Jaa kokemuksia ja saa palautetta Azure Discordissa
4. **Portfolion kehittäminen**: Dokumentoi käyttöönotot ja opitut asiat
5. **Vertaisarviointi**: Tee yhteistyötä muiden oppijoiden kanssa monimutkaisissa skenaarioissa

### Kurssin suorittamisen hyödyt
Kaikkien lukujen suorittamisen ja validoinnin jälkeen valmistuneet saavat:

**Tekninen asiantuntemus:**
- **Tuotantokokemus**: Käyttöönotettu todellisia AI-sovelluksia Azure-ympäristöihin
- **Ammatilliset taidot**: Yritysvalmiit käyttöönotto- ja vianetsintäkyvyt  
- **Arkkitehtuuriosaaminen**: Moniagenttiratkaisut ja monimutkaiset infrastruktuurimallit
- **Vianetsintämestaruus**: Itsenäinen käyttöönotto- ja konfiguraatio-ongelmien ratkaisu

**Ammatillinen kehitys:**
- **Teollisuuden tunnustus**: Todistettavat taidot korkean kysynnän AZD- ja AI-käyttöönottoalueilla
- **Uramahdollisuudet**: Pätevyys pilviarkkitehdin ja AI-käyttöönottoasiantuntijan rooleihin
- **Yhteisön johtajuus**: Aktiivinen jäsenyys Azure-kehittäjä- ja AI-yhteisöissä
- **Jatkuva oppiminen**: Perusta edistyneelle Azure AI Foundry -erikoistumiselle

**Portfolio-omaisuudet:**
- **Käyttöönotetut ratkaisut**: Toimivia esimerkkejä AI-sovelluksista ja infrastruktuurimalleista
- **Dokumentaatio**: Kattavat käyttöönotto-oppaat ja vianetsintämenettelyt  
- **Yhteisön panokset**: Keskustelut, esimerkit ja parannukset jaettu Azure-yhteisössä
- **Ammatillinen verkosto**: Yhteydet Azure-asiantuntijoihin ja AI-käyttöönoton ammattilaisiin

### Jatkokurssin oppimispolku
Valmistuneet ovat valmiita edistyneeseen erikoistumiseen:
- **Azure AI Foundry Expert**: Syvä erikoistuminen AI-mallien käyttöönottoon ja orkestrointiin
- **Pilviarkkitehtuurin johtajuus**: Yritystason käyttöönottojen suunnittelu ja hallinta
- **Kehittäjäyhteisön johtajuus**: Osallistuminen Azure-esimerkkeihin ja yhteisöresursseihin
- **Yrityskoulutus**: AZD- ja AI-käyttöönotto-taitojen opettaminen organisaatioissa

---


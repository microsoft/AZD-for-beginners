# AZD Aloittelijoille: Kurssin Rakenne & Oppimisrunko

## Kurssin Yleiskuvaus

Hallinnoi Azure Developer CLI:tä (azd) rakenteellisten lukujen kautta, jotka on suunniteltu etenevään oppimiseen. **Erityinen painopiste AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi Tämä Kurssi On Välttämätön Nykykehittäjille

Perustuu Microsoft Foundry Discord -yhteisön näkemyksiin, **45 % kehittäjistä haluaa käyttää AZD:tä AI-kuormien kanssa**, mutta kohtaa haasteita:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien mallit
- Tuotannon AI-käyttöönoton parhaat käytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-kuormille
- AI-spesifisten käyttöönotto-ongelmien vianetsintä

### Keskeiset Oppimistavoitteet

Suorittamalla tämän rakenteellisen kurssin:
- **Hallinnoi AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Ota käyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundryn palveluiden kanssa
- **Toteuta infrastruktuuri koodina**: Hallinnoi Azure-resursseja Bicep-mallien avulla
- **Vianetsintä käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa ongelmia
- **Optimoi tuotantoa varten**: Tietoturva, skaalaus, seuranta ja kustannusten hallinta
- **Rakenna moni-agenttiratkaisuja**: Käyttöönotto monimutkaisille AI-arkkitehtuureille

## 🎓 Työpajojen Oppimiskokemus

### Joustavat Oppimisen Toimitustavat
Tämä kurssi on suunniteltu tukemaan sekä **itseopiskelua** että **ohjattuja työpajasessioita**, jotta oppijat saavat käytännön kokemusta AZD:stä samalla, kun kehittävät käytännön taitoja interaktiivisten harjoitusten kautta.

#### 🚀 Itsenäinen Oppimismoodi
**Täydellinen yksittäisille kehittäjille ja jatkuvalle oppimiselle**

**Ominaisuudet:**
- **Selaimessa toimiva käyttöliittymä**: Täysin MkDocs-pohjainen työpaja, johon pääsee mistä tahansa verkkoselaimesta
- **GitHub Codespaces -integraatio**: Yhden napsautuksen kehitysympäristö esiasennetuilla työkaluilla
- **Interaktiivinen DevContainer-ympäristö**: Ei paikallista asennusta – aloita koodaus heti
- **Edistymisen seuranta**: Sisäänrakennetut tarkistuspisteet ja validointiharjoitukset
- **Yhteisön tuki**: Pääsy Azure Discord -kanaville kysymyksiä ja yhteistyötä varten

**Oppimisen Rakenne:**
- **Joustava aikataulu**: Suorita luvut omaan tahtiin päivissä tai viikkoina
- **Tarkistuspistesysteemi**: Vahvista oppimasi ennen siirtymistä vaativampiin aiheisiin
- **Resurssikirjasto**: Kattava dokumentaatio, esimerkit ja vianetsintäoppaat
- **Portfolion kehitys**: Rakenna käyttöön otettavia projekteja ammatillisia portfolioita varten

**Aloittaminen (Itseopiskelu):**
```bash
# Vaihtoehto 1: GitHub Codespaces (suositeltu)
# Siirry repositorioon ja klikkaa "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata asennusohjeita workshop/README.md-tiedostossa
```

#### 🏛️ Ohjatut Työpajasessiot
**Ihanteelliset yrityskoulutukseen, bootcampeihin ja oppilaitoksiin**

**Työpajan formaattivaihtoehdot:**

**📚 Akateeminen kurssi-integraatio (8-12 viikkoa)**
- **Yliopisto-ohjelmat**: Lukukauden mittainen kurssi, viikoittaiset 2 tunnin sessiot
- **Bootcamp-formaatti**: Tehokas 3-5 päivän ohjelma, päivittäiset 6-8 tunnin sessiot
- **Yrityskoulutus**: Kuukausittaiset tiimisessiot käytännön projektien toteutuksella
- **Arviointikehys**: Pisteytetyt tehtävät, vertaisarvostelut ja loppuprojektit

**🚀 Intenssiivinen Työpaja (1-3 päivää)**
- **Päivä 1**: Perusta + AI-kehitys (luvut 1-2) - 6 tuntia
- **Päivä 2**: Konfigurointi + Infrastruktuuri (luvut 3-4) - 6 tuntia  
- **Päivä 3**: Edistyneet mallit + Tuotanto (luvut 5-8) - 8 tuntia
- **Seuranta**: Valinnainen 2 viikon mentorointi projektin loppuunsaattamiseen

**⚡ Johtoryhmän Katsaus (4-6 tuntia)**
- **Strateginen yleiskuva**: AZD:n arvolupaus ja liiketoiminnan vaikutus (1 tunti)
- **Käytännön demo**: Koko AI-sovelluksen käyttöönotto (2 tuntia)
- **Arkkitehtuuriarviointi**: Yritystason mallit ja hallinta (1 tunti)
- **Toteutussuunnittelu**: Organisaation käyttöönoton strategia (1-2 tuntia)

#### 🛠️ Työpajan Oppimismetodologia
**Löytö → Käyttöönotto → Räätälöinti – lähestymistapa käytännön taitojen kehittämiseen**

**Vaihe 1: Löytö (45 minuuttia)**
- **Mallipohjien tutkiskelu**: Arvioi Microsoft Foundryn mallipohjia ja palveluita
- **Arkkitehtuurianalyysi**: Ymmärrä moni-agenttimallit ja käyttöönoton strategiat
- **Vaatimusten arviointi**: Tunnista organisaation tarpeet ja rajoitteet
- **Ympäristön valmistelu**: Konfiguroi kehitysympäristö ja Azure-resurssit

**Vaihe 2: Käyttöönotto (2 tuntia)**
- **Ohjattu toteutus**: Vaiheittainen AI-sovellusten käyttöönotto AZD:llä
- **Palveluiden konfigurointi**: Aseta Azure AI -palvelut, päätelaitteet ja todentaminen
- **Tietoturvan toteutus**: Käytä yritystason tietoturvamalleja ja pääsynhallintaa
- **Validointitestaus**: Vahvista käyttöönotto ja korjaa yleiset ongelmat

**Vaihe 3: Räätälöinti (45 minuuttia)**
- **Sovelluksen muokkaus**: Mukauta mallipohjia erityistarkoituksiin ja vaatimuksiin
- **Tuotannon optimointi**: Toteuta seuranta, kustannusten hallinta ja skaalausstrategiat
- **Edistyneet mallit**: Tutki moni-agenttien koordinointia ja monimutkaisia arkkitehtuureja
- **Seuraavien askeleiden suunnittelu**: Määrittele oppimispolku taitojen jatkokehitykseen

#### 🎯 Työpajan Oppimistulokset
**Mitattavat taidot käytännön harjoituksen kautta**

**Tekniset kyvykkyydet:**
- **Ota käyttöön tuotantotason AI-sovelluksia**: Onnistuneesti otetut käyttöön ja konfiguroidut AI-ratkaisut
- **Infrastruktuuri koodina -osaaminen**: Luo ja hallinnoi mukautettuja Bicep-malleja
- **Moni-agentti-arkkitehtuuri**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Tuotantovalmius**: Käytä tietoturva-, seuranta- ja hallintamalleja
- **Vianetsintäosaaminen**: Ratkaise itsenäisesti käyttöönotto- ja konfiguraatio-ongelmia

**Ammatilliset taidot:**
- **Projektijohtaminen**: Johtaa teknisiä tiimejä pilvikäyttöönottohankkeissa
- **Arkkitehtuurisuunnittelu**: Suunnittele skaalautuvia, kustannustehokkaita Azure-ratkaisuja
- **Tiedon jakaminen**: Kouluta ja mentoroi kollegoita AZD:n parhaiden käytäntöjen suhteen
- **Strateginen suunnittelu**: Vaikuta organisaation pilvien omaksumisstrategioihin

#### 📋 Työpajan Resurssit ja Materiaalit
**Kattava työkaluvalikoima vetäjille ja oppijoille**

**Vetäjille:**
- **Ohjaajan opas**: [Workshop Overview](workshop/README.md) - Sessioiden suunnittelu ja toteutusohjeet
- **Esitysmateriaalit**: Kalvot, arkkitehtuurikaaviot ja demon skriptit
- **Arviointivälineet**: Käytännön harjoitukset, tietotarkistukset ja arviointikriteerit
- **Tekninen valmistelu**: Ympäristön konfigurointi, vianetsintäoppaat ja varasuunnitelmat

**Oppijoille:**
- **Interaktiivinen työpaja-ympäristö**: [Workshop Materials](workshop/README.md) - Selaimessa toimiva oppimisalusta
- **Vaiheittaiset ohjeet**: [Guided Exercises](../../workshop/docs/instructions) - Yksityiskohtaiset toteutusohjeet  
- **Viitedokumentaatio**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-painotteiset syväoppimiset
- **Yhteisön resurssit**: Azure Discord -kanavat, GitHub-keskustelut ja asiantuntijatuki

#### 🏢 Yritys Työpajan Toteutus
**Organisaation käyttöönotto- ja koulutusstrategiat**

**Yrityskoulutusohjelmat:**
- **Kehittäjien perehdytys**: Uusien työntekijöiden orientaatio AZD:n perusteisiin (2-4 viikkoa)
- **Tiimien osaamisen kehittäminen**: Neljännesvuositason työpajat olemassa oleville tiimeille (1-2 päivää)
- **Arkkitehtuurin tarkastus**: Kuukausittaiset sessiot vanhemmille insinööreille ja arkkitehdeille (4 tuntia)
- **Johtoryhmän briiffaukset**: Johtajuustyöpajat teknisille päätöksentekijöille (puolipäivä)

**Toteutustuki:**
- **Räätälöity työpajasuunnittelu**: Sisältö organisaation tarpeiden mukaisesti
- **Pilottiohjelman hallinta**: Rakenteellinen käyttöönotto menestysmittareiden ja palautteen keruun kanssa  
- **Jatkuva mentorointi**: Työpajan jälkeinen tuki projektin toteutukseen
- **Yhteisön rakentaminen**: Sisäiset Azure AI -kehittäjäyhteisöt ja tiedon jakaminen

**Menestysmittarit:**
- **Taitojen hankinta**: Ennakoiva ja jälkikäteen tehtävä arviointi teknisen osaamisen kehittymisestä
- **Käyttöönoton onnistuminen**: Osallistujien prosenttiosuus, jotka onnistuneesti ottavat tuotantosovellukset käyttöön
- **Tuottavuuteen pääsy**: Ohjattu aikaa lyhennetty uusissa Azure AI -projekteissa
- **Tietämyksen säilyttäminen**: Jälkiseurantatestit 3–6 kuukautta työpajan jälkeen

## 8 Luvun Oppimisrakenne

### Luku 1: Perusta & Nopeasti Käyntiin (30-45 minuuttia) 🌱
**Esivaatimukset**: Azure-tilaus, perustiedot komentorivistä  
**Vaikeustaso**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asennus alustallesi  
- Ensimmäinen onnistunut käyttöönotto
- Keskeiset käsitteet ja termit

#### Oppimateriaalit
- [AZD Perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet
- [Asennus & Asetukset](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- [Ensimmäinen Projekti](docs/getting-started/first-project.md) - Käytännön opas
- [Komentojen Pikaopas](resources/cheat-sheet.md) - Nopeakatsaus

#### Käytännön Tulos
Ota käyttöön yksinkertainen web-sovellus Azureen AZD:llä

---

### Luku 2: AI-Ensimmäinen Kehitys (1-2 tuntia) 🤖
**Esivaatimukset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Microsoft Foundry -integraatio AZD:n kanssa
- AI-pohjaisten sovellusten käyttöönotto
- AI-palveluiden konfiguroinnin ymmärtäminen
- RAG (Retrieval-Augmented Generation) -mallit

#### Oppimateriaalit
- [Microsoft Foundry -integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI-mallin käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Työpajalaki](docs/microsoft-foundry/ai-workshop-lab.md) - **UUSI**: Kattava 2-3 tunnin käytännön laboratorio
- [Interaktiivinen Työpajaopas](workshop/README.md) - **UUSI**: Selaimessa toimiva työpaja MkDocs-esikatselulla
- [Microsoft Foundry -mallipohjat](README.md#featured-microsoft-foundry-templates)
- [Työpajaohjeet](../../workshop/docs/instructions) - **UUSI**: Vaiheittaiset ohjatut harjoitukset

#### Käytännön Tulos
Ota käyttöön ja konfiguroi AI-pohjainen chat-sovellus RAG-ominaisuuksilla

#### Työpajan Oppimispolku (Valinnainen Parannus)
**UUSI Interaktiivinen Kokemus**: [Täydellinen Työpajaopas](workshop/README.md)
1. **Löytö** (30 min): Mallipohjan valinta ja arviointi
2. **Käyttöönotto** (45 min): AI-mallipohjan käyttöönotto ja validointi  
3. **Purku** (30 min): Mallipohjan arkkitehtuurin ja komponenttien ymmärtäminen
4. **Konfigurointi** (30 min): Asetuksien ja parametrien räätälöinti
5. **Räätälöinti** (45 min): Muokkaa ja iteroi omaksesi
6. **Purkutoimet** (15 min): Resurssien siivous ja elinkaaren ymmärtäminen
7. **Yhteenveto** (15 min): Seuraavat askeleet ja edistyneet oppimispolut

---

### Luku 3: Konfigurointi & Todentaminen (45-60 minuuttia) ⚙️
**Esivaatimukset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Todentaminen ja tietoturvan parhaat käytännöt
- Resurssien nimeäminen ja järjestäminen
- Moni-ympäristön käyttöönotot

#### Oppimateriaalit
- [Konfigurointiopas](docs/getting-started/configuration.md) - Ympäristön valmistelu
- [Todentaminen & Tietoturvamallit](docs/getting-started/authsecurity.md) - Hallittu identiteetti ja Key Vault -integraatio
- Moni-ympäristö-esimerkit

#### Käytännön Tulos
Hallinnoi useita ympäristöjä oikeilla todentamis- ja tietoturvakäytännöillä

---

### Luku 4: Infrastruktuuri Koodina & Käyttöönotto (1-1.5 tuntia) 🏗️
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat
- Räätälöityjen mallipohjien luominen

- Konttien käyttöönotto Azure Container Appsilla ja AZD:llä

#### Oppimateriaalit
- [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Täydelliset työnkulut
- [Resurssien provisiointi](docs/deployment/provisioning.md) - Resurssien hallinta
- Kontti- ja mikropalveluesimerkit
- [Container App -esimerkit](examples/container-app/README.md) - Nopeaan käyntiin, tuotantoon ja edistyneisiin käyttöönottoihin

#### Käytännön Tulos
Ota käyttöön monimutkaisia monipalvelusovelluksia räätälöidyllä infrastruktuurimallipohjalla

---

### Luku 5: Moni-Agenttinen AI-ratkaisu (2-3 tuntia) 🤖🤖
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä Opit
- Moni-agentti-arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot
- Asiakas- ja varastoagenttien toteutukset

- Konttipohjaisten mikropalveluiden integrointi agenttipohjaisiin ratkaisuihin

#### Oppimateriaalit
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden napsautuksen käyttöönotto
- Moni-agentin koordinointimallit
- [Mikropalveluarkkitehtuurin Esimerkki](../../examples/container-app/microservices) - Palvelu palvelulle -viestintä, asynkroninen viestintä ja tuotantokäyttöönotto

#### Käytännön Tulos
Ota käyttöön ja hallinnoi tuotantovalmiita moni-agenttisia AI-ratkaisuja

---

### Luku 6: Ennakkoarviointi & Suunnittelu (1 tunti) 🔍
**Esivaatimukset**: Luku 4 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Lentotarkastukset ja automaatio
- Kustannusten optimointisuunnittelu

#### Oppimateriaalit
- [Kapasiteettisuunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien validointi
- [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- [Lentotarkastukset](docs/pre-deployment/preflight-checks.md) - Automatisoidut skriptit
- [Application Insights -integraatio](docs/pre-deployment/application-insights.md) - Seuranta ja havaittavuus
- [Moni-Agenttikoordinointimallit](docs/pre-deployment/coordination-patterns.md) - Agentin orkestrointistrategiat

#### Käytännön Tulos
Validoi ja optimoi käyttöönotot ennen toteutusta
---

### Luku 7: Vianetsintä ja virheenkorjaus (1-1,5 tuntia) 🔧
**Esivaatimukset**: Jokainen käyttöönotto-luku suoritettu  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenkorjauksen menetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianetsintä
- Suorituskyvyn optimointi

#### Oppimateriaalit
- [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - Usein kysytyt kysymykset ja ratkaisut
- [Virheenkorjausopas](docs/troubleshooting/debugging.md) - Askeleittaiset strategiat
- [AI-spesifinen vianetsintä](docs/troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön tulos
Itsenäinen yleisten käyttöönottoon liittyvien ongelmien diagnosointi ja ratkaisu

---

### Luku 8: Tuotanto- ja yritysmallit (2-3 tuntia) 🏢
**Esivaatimukset**: Luvut 1-4 suoritetut  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritysturvallisuuden mallit
- Seuranta ja kustannusoptimointi
- Skaalautuvuus ja hallinnointi

- Parhaat käytännöt tuotantokonttiapplikaatioiden käyttöönottoon (turvallisuus, seuranta, kustannukset, CI/CD)

#### Oppimateriaalit
- [Tuotannon AI parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yritysmallit
- Mikropalvelut ja yritysesimerkit
- Seuranta- ja hallintakehykset
- [Mikropalveluarkkitehtuuriesimerkki](../../examples/container-app/microservices) - Blue-green/canary-käyttöönotto, hajautettu seuranta ja kustannusoptimointi

#### Käytännön tulos
Ota käyttöön yritystason sovelluksia täysillä tuotantomahdollisuuksilla

---

## Oppimisen eteneminen ja vaativuustaso

### Progressiivinen taitojen rakentaminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusta) → lukuun 2 (AI-kehitys)
- **🔧 Keskitaso**: Luvut 3-4 (Konfigurointi & infrastruktuuri) → luku 6 (Vahvistus)
- **🚀 Edistynyt**: Luku 5 (Moniagenttiratkaisut) → luku 7 (Vianetsintä)
- **🏢 Yritys**: Suorita kaikki luvut, keskity lukuun 8 (Tuotantomallit)

- **Container App -polku**: Luvut 4 (Konttien käyttöönotto), 5 (Mikropalvelujen integrointi), 8 (Tuotannon parhaat käytännöt)

### Vaativuustasojen kuvaajat

- **⭐ Perustaso**: Yksittäiset käsitteet, ohjatut harjoitukset, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita konsepteja, käytännön harjoituksia, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, räätälöidyt ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Asiantuntija**: Tuotantojärjestelmät, yritysmallit, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusta & pika-aloitus (45 min)
2. **Luku 2**: AI-ensimmäinen kehitys (2 tuntia)  
3. **Luku 5**: Moni-agenttisen AI-ratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon AI parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusta & pika-aloitus (45 min)
2. **Luku 3**: Konfigurointi & todennus (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina & käyttöönotto (1,5 tuntia)
4. **Luku 6**: Ennakkovalidointi & suunnittelu (1 tunti)
5. **Luku 7**: Vianetsintä & virheenkorjaus (1,5 tuntia)
6. **Luku 8**: Tuotanto & yritysmallit (2 tuntia)

#### 🎓 Kokonaisvaltainen oppimismatka (8-12 tuntia)
Suorita kaikki 8 lukua järjestyksessä käytännön harjoitusten ja validoinnin kanssa

## Kurssin suorittamisen kehys

### Tiedon vahvistus
- **Lukujen tarkistuspisteet**: Käytännön tehtäviä mitattavilla tuloksilla
- **Käytännön varmistus**: Ota käyttöön toimivia ratkaisuja kussakin luvussa
- **Etenemisen seuranta**: Visuaaliset indikaattorit ja suoritustunnukset
- **Yhteisön validointi**: Jaa kokemuksia Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Lukujen 1-2 suoritus (Perusta + AI)
- ✅ Ota käyttöön perussovellus AZD:n avulla
- ✅ Ota käyttöön AI-chat-sovellus RAG:lla
- ✅ Ymmärrä AZD:n ydinkäsitteet ja AI-integraatio

#### Lukujen 3-4 suoritus (Konfigurointi + infrastruktuuri)  
- ✅ Hallitse monen ympäristön käyttöönotot
- ✅ Luo räätälöityjä Bicep-malleja infrastruktuuriin
- ✅ Toteuta turvalliset todennusmallit

#### Lukujen 5-6 suoritus (Moni-agentti + validointi)
- ✅ Ota käyttöön monimutkainen moni-agenttinen AI-ratkaisu
- ✅ Suorita kapasiteettisuunnittelua ja kustannusoptimointia
- ✅ Toteuta automatisoitu ennakkovalidointi

#### Lukujen 7-8 suoritus (Vianetsintä + tuotanto)
- ✅ Virheenkorjaa ja ratkaise käyttöönottovirheet itsenäisesti  
- ✅ Toteuta yritystason seuranta ja turvallisuus
- ✅ Ota käyttöön tuotantovalmiit sovellukset hallinnalla

### Sertifiointi ja tunnustus
- **Kurssin suorittamistunnus**: Suorita kaikki 8 lukua käytännöllisellä validoinnilla
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Microsoft Foundry Discordissa
- **Ammatillinen kehitys**: Alan kannalta merkittävät AZD- ja AI-käyttöönotto-taidot
- **Urapolun eteneminen**: Yritystason pilvikäyttöönottovalmiudet

## 🎓 Kattavat oppimistulokset

### Perustaso (Luvut 1-2)
Perustason lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset kyvyt:**
- Ota käyttöön yksinkertaisia web-sovelluksia Azureen AZD-komentojen avulla
- Konfiguroi ja ota käyttöön AI-chat-sovelluksia RAG-ominaisuuksin
- Ymmärrä AZD:n ydinkäsitteet: mallit, ympäristöt, käyttöönoton työnkulut
- Integroi Microsoft Foundryn palvelut AZD-käyttöönottoihin
- Navigoi Azure AI -palveluiden asetuksissa ja API-päätepisteissä

**Ammatilliset taidot:**
- Noudata rakenteellisia käyttöönoton työnkulkuja johdonmukaisiin tuloksiin
- Tee perustason vianetsintää lokien ja dokumentaation avulla
- Viesti tehokkaasti pilvikäyttöönoton prosesseista
- Käytä parhaita käytäntöjä turvalliseen AI-palveluiden integraatioon

**Oppimisen varmennus:**
- ✅ Ota käyttöön `todo-nodejs-mongo`-malli onnistuneesti
- ✅ Ota käyttöön ja konfiguroi `azure-search-openai-demo` RAG:n kanssa
- ✅ Suorita interaktiiviset työpajaharjoitukset (Discovery-vaihe)
- ✅ Osallistu Azure Discord -yhteisön keskusteluihin

### Keskitaso (Luvut 3-4)
Keskitasoisten lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset kyvyt:**
- Hallitse monen ympäristön käyttöönotot (dev, staging, tuotanto)
- Luo räätälöityjä Bicep-malleja infrastruktuurille koodina
- Toteuta turvallisia todennusmalleja hallituilla identiteeteillä
- Ota käyttöön monimutkaisia monipalvelusovelluksia räätälöidyillä asetuksilla
- Optimoi resurssien provisiointistrategioita kustannusten ja suorituskyvyn suhteen

**Ammatilliset taidot:**
- Suunnittele skaalautuvia infrastruktuuriarkkitehtuureja
- Toteuta pilvikäyttöönoton turvallisuuden parhaat käytännöt
- Dokumentoi infrastruktuurimalleja tiimityötä varten
- Arvioi ja valitse sopivat Azure-palvelut tarpeiden mukaan

**Oppimisen varmennus:**
- ✅ Konfiguroi erilliset ympäristöt ympäristökohtaisilla asetuksilla
- ✅ Luo ja ota käyttöön räätälöity Bicep-malli monipalvelusovellukseen
- ✅ Toteuta hallitun identiteetin todennus turvalliseen pääsyyn
- ✅ Suorita konfiguraationhallinnan harjoituksia todellisilla skenaarioilla

### Edistynyt taso (Luvut 5-6)
Edistyneiden lukujen jälkeen oppijat osaavat:

**Tekniset kyvyt:**
- Ota käyttöön ja orkestroi moniagenttisia AI-ratkaisuja koordinoiduilla työnkuluilla
- Toteuta asiakas- ja varastoagenttien arkkitehtuuri vähittäiskauppaskenaarioihin
- Tee kattavaa kapasiteettisuunnittelua ja resurssivarmistuksia
- Suorita automatisoitu ennakkovalidointi ja optimointi ennen käyttöönottoa
- Suunnittele kustannustehokkaita SKU-valintoja työkuorman mukaan

**Ammatilliset taidot:**
- Arkkitehtuuroi monimutkaisia AI-ratkaisuja tuotantoympäristöihin
- Johda teknisiä keskusteluja AI-käyttöönottostrategioista
- Mentoroi juniorikehittäjiä AZD- ja AI-käyttöönoton parhaissa käytännöissä
- Arvioi ja suosittele AI-arkkitehtuurimalleja liiketoimintavaatimuksiin

**Oppimisen varmennus:**
- ✅ Ota käyttöön kokonainen vähittäiskaupan moniagenttiratkaisu ARM-malleilla
- ✅ Havainnollista agenttien koordinointia ja työnkulun orkestrointia
- ✅ Suorita kapasiteettisuunnitteluharjoituksia todellisilla resurssirajoituksilla
- ✅ Vahvista käyttöönoton valmiutta automatisoiduilla ennakko-tarkistuksilla

### Asiantuntijataso (Luvut 7-8)
Asiantuntijatason lukujen jälkeen oppijat osaavat:

**Tekniset kyvyt:**
- Diagnosoi ja ratkaise monimutkaisia käyttöönoton ongelmia itsenäisesti
- Toteuta yritystason turvallisuusmalleja ja hallintakehyksiä
- Suunnittele kattavat seuranta- ja hälytysstrategiat
- Optimoi tuotantokäyttöönotot skaalautuvuuden, kustannusten ja suorituskyvyn näkökulmasta
- Perusta CI/CD-putkia asianmukaisilla testeillä ja validoinnilla

**Ammatilliset taidot:**
- Johda yrityksen pilvisiirtymäprojekteja
- Suunnittele ja toteuta organisaation käyttöönoton standardeja
- Kouluta ja mentoroi kehitystiimejä edistyneissä AZD-käytännöissä
- Vaikuta teknisiin päätöksiin yrityksen AI-käyttöönotossa

**Oppimisen varmennus:**
- ✅ Ratkaise monipalvelujen vikatilanteet monimutkaisissa käyttöönotossa
- ✅ Toteuta yritystason turvallisuusmallit ja vaatimustenmukaisuus
- ✅ Suunnittele ja ota käyttöön tuotannon seuranta Application Insightsilla
- ✅ Toteuta yrityksen hallintakehys onnistuneesti

## 🎯 Kurssin suoritustodistus

### Etenemisen seurannan kehys
Seuraa oppimisesi etenemistä rakenteellisten tarkastuspisteiden avulla:

- [ ] **Luku 1**: Perusta & pika-aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennakkovalidointi & suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Varmistusprosessi
Suoritettuasi kunkin luvun varmista osaamisesi seuraavasti:

1. **Käytännön tehtävän suoritus**: Ota käyttöön toimivat ratkaisut kussakin luvussa
2. **Tiedon arviointi**: Tarkastele FAQ-osioita ja tee itsearvioinnit
3. **Yhteisön osallistuminen**: Jaa kokemuksia ja saa palautetta Azure Discordissa
4. **Portfolion kehitys**: Dokumentoi käyttöönotot ja opit
5. **Vertaisarviointi**: Tee yhteistyötä muiden oppijoiden kanssa monimutkaisissa tilanteissa

### Kurssin suorittamisen hyödyt
Suoritettuasi kaikki luvut ja varmennukset sinulla on:

**Tekninen asiantuntemus:**
- **Tuotantokokemus**: Otonut käyttöön todellisia AI-sovelluksia Azure-ympäristöissä
- **Ammatilliset taidot**: Yritystason käyttöönotto- ja virheenkorjausvalmiudet  
- **Arkkitehtuuriosaaminen**: Moniagenttiset AI-ratkaisut ja monimutkaiset infrastruktuurimallit
- **Vianetsintäosaaminen**: Käyttöönotto- ja konfigurointiongelmien itsenäinen ratkaisu

**Ammatillinen kehittyminen:**
- **Alan tunnustus**: Vahvistetut taidot kysytyissä AZD- ja AI-käyttöönoton osa-alueissa
- **Urapolun edistyminen**: Pätevyyksiä pilviarkkitehdin ja AI-käyttöönottoasiantuntijan rooleihin
- **Yhteisöjohtajuus**: Aktiivinen jäsenyys Azure-kehittäjä- ja AI-yhteisöissä
- **Jatkuva oppiminen**: Perusta edistyneemmille Microsoft Foundry -spesialisoinneille

**Portfolion sisältö:**
- **Käyttöönotetut ratkaisut**: Toimivat AI-sovellusesimerkit ja infrastruktuurimallit
- **Dokumentaatio**: Kattavat käyttöönotto-oppaat ja vianetsintäohjeet  
- **Yhteisöpanokset**: Keskustelut, esimerkit ja parannukset Azure-yhteisölle
- **Ammatillinen verkosto**: Yhteydet Azure-asiantuntijoihin ja AI-käyttöönoton harjoittajiin

### Kurssin jälkeinen oppimispolku
Valmistuneet ovat valmiita edistyneisiin erikoistumisiin liittyen:
- **Microsoft Foundry Expert**: Syvä erikoistuminen AI-mallien käyttöönottoon ja orkestrointiin
- **Pilviarkkitehtuurin johtajuus**: Yritystason käyttöönoton suunnittelu ja hallinnointi
- **Kehittäjäyhteisön johtajuus**: Azure-esimerkkien ja yhteisöresurssien tuottaminen
- **Yrityskoulutus**: AZD- ja AI-käyttöönotto-osaamisen kouluttaminen organisaatioissa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattikäännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen omalla kielellä on virallinen lähde. Tärkeiden tietojen kohdalla suosittelemme ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai tulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
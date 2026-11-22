# AZD Aloittelijoille: Kurssin rakenne ja oppimiskehys

## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen avulla, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on välttämätön nykyaikaisille kehittäjille

Kehittäjät, jotka ottavat käyttöön AI-kuormituksia, tarvitsevat usein opastusta seuraavissa:
- Monimutkaiset monipalveluinen AI-arkkitehtuurit
- Tuotannollisen AI-käyttöönoton parhaat käytännöt
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-kuormituksille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Keskeiset oppimistavoitteet

Suoritettuasi tämän rakenteellisen kurssin, osaat:
- **Hallita AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Otta AI-sovellukset käyttöön**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuttaa infrastruktuuri koodina**: Hallitse Azure-resursseja Bicep-templaten avulla
- **Ratkaista käyttöönotto-ongelmia**: Korjaa yleiset ongelmat ja vianmääritys
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, monitorointi ja kustannusten hallinta
- **Rakenna moniedustaja-ratkaisut**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 🎓 Työpajan oppimiskokemus

### Joustavat oppimisen toteutusvaihtoehdot
Tämä kurssi on suunniteltu tukemaan sekä **itseopiskelua omaan tahtiin** että **ohjattuja työpajasessioita**, mahdollistaen oppijoille käytännön AZD-kokemuksen ja taitojen kehittämisen interaktiivisten harjoitusten avulla.

#### 🚀 Itseopiskelu-tila
**Täydellinen yksittäisille kehittäjille ja jatkuvaan oppimiseen**

**Ominaisuudet:**
- **Selainpohjainen käyttöliittymä**: Täysin MkDocsin voimalla toimiva työpaja, johon pääsee käsiksi millä tahansa selaimella  
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristö esikonfiguroiduilla työkaluilla
- **Interaktiivinen DevContainer-ympäristö**: Ei paikallista asennusta – aloita koodaus heti
- **Edistymisen seuranta**: Sisäänrakennetut tarkistuspisteet ja validointiharjoitukset
- **Yhteisön tuki**: Pääsy Azure Discord -kanaville kysymyksiä ja yhteistyötä varten

**Oppimisen rakenne:**
- **Joustava aikataulu**: Suorita luvut omaan tahtiisi päivissä tai viikoissa
- **Tarkistuspistejärjestelmä**: Vahvista oppiminen ennen siirtymistä monimutkaisempiin aiheisiin
- **Resurssikirjasto**: Monipuolinen dokumentaatio, esimerkit ja vianmääritysohjeet
- **Portfolion kehittäminen**: Rakenna käyttöön otettavia projekteja ammatillisiin portfoliosi

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

**📚 Akateeminen kurssisovellus (8–12 viikkoa)**
- **Yliopisto-ohjelmat**: Lukukauden mittainen kurssi, jossa viikoittain 2 tunnin sessiot
- **Bootcamp-muoto**: Intenssiivinen 3–5 päivän ohjelma päivittäisillä 6–8 tunnin sessioilla
- **Yrityskoulutus**: Kuukausittaiset tiimisessiot käytännön projektin toteutuksella
- **Arviointikehys**: Arvioidut tehtävät, vertaisarvioinnit ja lopputyöt

**🚀 Intenssiivinen työpaja (1–3 päivää)**
- **Päivä 1**: Perusteet + AI-kehitys (luvut 1–2) - 6 tuntia  
- **Päivä 2**: Konfigurointi + infrastruktuuri (luvut 3–4) - 6 tuntia  
- **Päivä 3**: Edistyneet mallit + tuotanto (luvut 5–8) - 8 tuntia
- **Seuranta**: Valinnainen 2 viikon mentorointi projektin loppuun saattamiseksi

**⚡ Johtoryhmän tiedotustilaisuus (4–6 tuntia)**
- **Strateginen yleiskuva**: AZD:n arvolupaus ja liiketoiminnan vaikutus (1 tunti)
- **Käytännön demo**: AI-sovelluksen käyttöönotto alusta loppuun (2 tuntia)
- **Arkkitehtuurin tarkastus**: Yritysmallit ja hallinta (1 tunti)
- **Toteutussuunnitelma**: Organisaation käyttöönotto strategia (1–2 tuntia)

#### 🛠️ Työpajan oppimismetodologia
**Löytäminen → Käyttöönotto → Mukauttaminen käsillä olevan taitojen kehittämisen lähestymistapa**

**Vaihe 1: Löytäminen (45 minuuttia)**
- **Templaten tutkiminen**: Arvioi Microsoft Foundryn templatet ja palvelut
- **Arkkitehtuurin analyysi**: Ymmärrä moniedustajamallit ja käyttöönoton strategiat
- **Vaatimusten arviointi**: Tunnista organisaation tarpeet ja rajoitteet
- **Ympäristön valmistelu**: Konfiguroi kehitysympäristö ja Azure-resurssit

**Vaihe 2: Käyttöönotto (2 tuntia)**
- **Opastettu toteutus**: AI-sovellusten käyttöönotto vaihe vaiheelta AZD:n avulla
- **Palvelukonfigurointi**: Konfiguroi Azure AI -palvelut, päätepisteet ja autentikointi
- **Turvallisuuden toteutus**: Käytä yrityksen turvallisuusmalleja ja käyttöoikeuksia
- **Validointitestit**: Vahvista käyttöönotot ja korjaa yleiset ongelmat

**Vaihe 3: Mukauttaminen (45 minuuttia)**
- **Sovelluksen muokkaaminen**: Sovita templatet erityistilanteisiin ja vaatimuksiin
- **Tuotannon optimointi**: Toteuta monitorointi, kustannusten hallinta ja skaalausstrategiat
- **Edistyneet mallit**: Tutki moniedustajien koordinointia ja monimutkaisia arkkitehtuureja
- **Seuraavien askeleiden suunnittelu**: Määritä oppimispolku taitojen jatkokehitykselle

#### 🎯 Työpajan oppimistulokset
**Mitattavat taidot, jotka kehittyvät käytännön harjoittelun kautta**

**Tekniset pätevyydet:**
- **Ota tuotantotason AI-sovellukset käyttöön**: Onnistuneesti ota käyttöön ja konfiguroi AI-pohjaiset ratkaisut
- **Infrastruktuuri koodina -osaaminen**: Luo ja hallitse omia Bicep-templaten luomuksia
- **Moniedustaja-arkkitehtuuri**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Tuotantovalmius**: Käytä turvallisuus-, monitorointi- ja hallintamalleja
- **Vianmääritystaito**: Ratkaise itsenäisesti käyttöönotto- ja konfigurointiongelmia

**Ammatilliset taidot:**
- **Projektijohtaminen**: Johtaa teknisiä tiimejä pilvikäyttöönottoihin liittyvissä hankkeissa
- **Arkkitehtuurin suunnittelu**: Suunnittele skaalautuvia, kustannustehokkaita Azure-ratkaisuja
- **Tiedon siirto**: Kouluta ja mentoroi kollegoita AZD:n parhaissa käytännöissä
- **Strateginen suunnittelu**: Vaikuta organisaation pilvien käyttöönotto-strategioihin

#### 📋 Työpajan resurssit ja materiaalit
**Monipuolinen työkalupakki ohjaajille ja oppijoille**

**Ohjaajille:**
- **Opettajan opas**: [Työpajan yleiskatsaus](workshop/README.md) – Istuntojen suunnittelu ja toteutusohjeet
- **Esitysmateriaalit**: Kalvosarjat, arkkitehtuurikaaviot ja demo-käsikirjoitukset
- **Arviointityökalut**: Käytännön harjoituksia, tietämyksen tarkistuksia ja arviointikriteerejä
- **Tekninen valmistelu**: Ympäristön konfigurointi, vianmääritysohjeet ja varasuunnitelmat

**Oppijoille:**
- **Interaktiivinen työpaja-ympäristö**: [Työpajan materiaalit](workshop/README.md) – Selainpohjainen oppimisalusta
- **Vaihe vaiheelta ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) – Yksityiskohtaiset toteutusohjeet
- **Viitedokumentaatio**: [AI Työpajat Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) – AI-keskeiset syväanalyysit
- **Yhteisöresurssit**: Azure Discord -kanavat, GitHub-keskustelut ja asiantuntijatuki

#### 🏢 Yritystyöpajan toteutus
**Organisaation käyttöönotto- ja koulutusstrategiat**

**Yrityskoulutusohjelmat:**
- **Kehittäjien perehdytys**: Uusien työntekijöiden orientaatio AZD:n perusteisiin (2–4 viikkoa)
- **Tiimien osaamisen kehitys**: Neljännesvuosittaiset työpajat nykyisille kehitystiimeille (1–2 päivää)
- **Arkkitehtuurin tarkastus**: Kuukausittaiset sessiot vanhemmille insinööreille ja arkkitehdeille (4 tuntia)
- **Johtamisen tiedotustilaisuudet**: Johtoryhmän työpajat teknisille päätöksentekijöille (puolipäivä)

**Toteutustuki:**
- **Räätälöity työpajasuunnittelu**: Sisältö mukautettu organisaation tarpeisiin
- **Pilottiohjelman hallinta**: Järjestelmällinen käyttöönotto onnistumismittareilla ja palautekierroksilla
- **Jatkuva mentorointi**: Työpajan jälkeinen tuki projektin toteutukselle
- **Yhteisön rakentaminen**: Sisäiset Azure AI -kehittäjäyhteisöt ja tiedon jakaminen

**Onnistumisen mittarit:**
- **Taitojen hankinta**: Ennen/jälkeen arvioinnit teknisen osaamisen kasvun mittaamiseksi
- **Käyttöönoton onnistuminen**: Osallistujien prosenttiosuus, jotka onnistuvat ottamaan tuotantosovelluksia käyttöön
- **Tuottavuuteen siirtyminen**: Uusien Azure AI -projektien perehdytysajan lyhentyminen
- **Tiedon säilyminen**: Seurantaarvioinnit 3–6 kuukautta työpajan jälkeen

## 8 luvun oppimisrakenne

### Luku 1: Perusteet & nopea aloitus (30–45 minuuttia) 🌱
**Esivaatimukset**: Azure-tilaus, peruskäsitys komentorivistä
**Monimutkaisuus**: ⭐

#### Mitä opit
- Ymmärtää Azure Developer CLI:n perusteet
- Asentaa AZD omalle alustallesi
- Ensimmäinen onnistunut käyttöönotto
- Keskeiset käsitteet ja terminologia

#### Oppimateriaalit
- [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) – Keskeiset käsitteet
- [Asennus ja käyttöönotto](docs/chapter-01-foundation/installation.md) – Alustakohtaiset ohjeet
- [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) – Käytännön opastus
- [Komentojen pikaopas](resources/cheat-sheet.md) – Nopeasti käyttöön

#### Käytännön tulos
Onnistuneesti ota käyttöön yksinkertainen web-sovellus Azureen AZD:n avulla

---

### Luku 2: AI-ensimmäinen kehitys (4–5 tuntia, mukaan lukien työpaja) 🤖
**Esivaatimukset**: Luku 1 suoritettu
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integraatio AZD:n kanssa
- GA `microsoft.foundry` paketin asennus ja isännöidyn agentin koodin käyttöönotto
- Paikallinen Agent Inspector -testaus ja erilliset arviointidatasetit/arviointikriteerit
- AI-pohjaisten sovellusten käyttöönotto
- Ymmärrys AI-palvelukonfiguraatioista
- RAG (hakuun yhdistetty generointi) -mallit

#### Oppimateriaalit
- [Microsoft Foundryn integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Isännöidyn agentin opastus (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) – Alustus, tarkistus `azure.yaml`, resurssien provisiointi, paikallinen testaus, käyttöönotto, arviointi ja siivous
- [AI-agenttien opas](docs/chapter-02-ai-development/agents.md)
- [AI-mallin käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI Työpajat Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) – **UUTTA**: Kattava 2–3 tunnin käytännön labra
- [Interaktiivinen työpajaopas](workshop/README.md) – **UUTTA**: Selainpohjainen työpaja MkDocs-esikatselulla
- [Microsoft Foundryn templatet](README.md#featured-microsoft-foundry-templates)
- [Työpajaohjeet](../../workshop/docs/instructions) – **UUTTA**: Vaihe vaiheelta ohjatut harjoitukset

#### Käytännön tulos
Testaa isännöity agentti paikallisesti ja Foundryssä GA-paketin avulla, tarkista arviointitulos ja erottele uusien ja uudelleenkäytettyjen projektien siivous. Erillinen RAG/työpajapolku kattaa AI-pohjaisen chat-sovelluksen konfiguroinnin.

#### Työpajan oppimispolku (valinnainen laajennus)
**UUSI interaktiivinen kokemus**: [Täydellinen työpajaopas](workshop/README.md)
1. **Löytäminen** (30 min): Templatessa valinta ja arviointi
2. **Käyttöönotto** (45 min): AI-templaten toiminnot käyttöön ja vahvistetaan
3. **Purkaminen** (30 min): Ymmärrä templaten arkkitehtuuri ja komponentit
4. **Konfigurointi** (30 min): Mukauta asetuksia ja parametreja
5. **Mukauttaminen** (45 min): Muokkaa ja tee omaksesi
6. **Purkutoimet** (15 min): Siivoa resurssit ja ymmärrä elinkaari
7. **Yhteenveto** (15 min): Seuraavat askelet ja edistyneet oppimispolut

---

### Luku 3: Konfigurointi & autentikointi (45–60 minuuttia) ⚙️
**Esivaatimukset**: Luku 1 suoritettu
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Autentikointi ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi
- Moniympäristökäyttöönotot

#### Oppimateriaalit
- [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) – Ympäristön valmistelu
- [Autentikointi & turvallisuusmallit](docs/chapter-03-configuration/authsecurity.md) – Hallittu identiteetti ja Key Vault -integraatio
- Esimerkit moniympäristökäytöstä

#### Käytännön tulos
Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### Luku 4: Infrastruktuuri koodina & käyttöönotto (1–1,5 tuntia) 🏗️
**Esivaatimukset**: Lukujen 1–3 suoritukset
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat
- Oman templatet luonti

- Konttien käyttöönotto Azure Container Appsin ja AZD:n avulla

#### Oppimateriaalit
- [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) – Täydelliset työnkulut
- [Resurssien provisiointi](docs/chapter-04-infrastructure/provisioning.md) – Resurssien hallinta
- Kontti- ja mikropalveluesimerkit
- [Container App -esimerkit](examples/container-app/README.md) – Pikakäynnistys, tuotanto ja edistyneet käyttöönoton mallit

#### Käytännön tulos
Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen omia infrastruktuuritemplatiasi

---

### Luku 5: Moniedustaja-AI-ratkaisut (2–3 tuntia) 🤖🤖
**Esivaatimukset**: Luvut 1–2 suoritettu
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moniedustaja-arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot
- Asiakas- ja varastoagenttien toteutukset

- Konttien integroituminen mikropalveluina osana agenttipohjaisia ratkaisuja

#### Oppimateriaalit
- [Vähittäiskaupan moniedustajarakenne](examples/retail-scenario.md) – Arkkitehtuurin luonnos, ei täydellinen sovellus
- [ARM-templatepaketti](../../examples/retail-multiagent-arm-template) – Infrastruktuurin runko toteutusvaatimuksilla
- Moniedustajien koordinointimallit
- [Mikropalveluarkkitehtuuri-esimerkki](../../examples/container-app/microservices) – Palvelu-palvelu -viestintä, asynkroninen viestintä ja tuotantokäyttö

#### Käytännön tulos
Suunnittele moniedustaja AI-ratkaisu ja tunnista sovelluksen toteutus, validointi ja käyttöönottotyöt infrastruktuurin provisioinnin lisäksi

---

### Luku 6: Ennen käyttöönottoa validointi & suunnittelu (1 tunti) 🔍
**Esivaatimukset**: Luku 4 suoritettu
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esilennon tarkistukset ja automaatio
- Kustannusten optimointisuunnitelmat

#### Oppimateriaalit
- [Kapasiteetin suunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) – Resurssien validointi
- [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- [Ennen lentoa tehtävät tarkistukset](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit
- [Application Insights -integraatio](docs/chapter-06-pre-deployment/application-insights.md) - Seuranta ja havaittavuus
- [Moniagenttien koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Agenttien orkestrointistrategiat

#### Käytännön tulos
Vahvista ja optimoi käyttöönotot ennen suoritusta

---

### Luku 7: Vianetsintä ja virheenkorjaus (1-1,5 tuntia) 🔧
**Esivaatimukset**: Mikä tahansa käyttöönotto luku valmis  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianetsintä
- Suorituskyvyn optimointi

#### Oppimateriaalit
- [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) - UKK ja ratkaisut
- [Virheenkorjausopas](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- [AI-spesifinen vianetsintä](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palvelujen ongelmat

#### Käytännön tulos
Diagnosoi ja ratkaise itsenäisesti yleiset käyttöönotto-ongelmat

---

### Luku 8: Tuotanto- ja yritysmallit (2-3 tuntia) 🏢
**Esivaatimukset**: Lukujen 1-4 valmistuminen  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritysturvallisuusmallit
- Seuranta ja kustannusten optimointi
- Skaalautuvuus ja hallinnointi

- Parhaat käytännöt tuotantokonttisovellusten käyttöönotossa (turvallisuus, seuranta, kustannukset, CI/CD)

#### Oppimateriaalit
- [Tuotannon AI parhaat käytännöt](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- Mikroservicet ja yritysesimerkit
- Seuranta- ja hallintokehyksiä
- [Mikroservice-arkkitehtuurin esimerkki](../../examples/container-app/microservices) - Blue-green/canary -käyttöönotto, hajautettu jäljitys ja kustannusten optimointi

#### Käytännön tulos
Ota käyttöön yritystason sovelluksia täysillä tuotantotoiminnoilla

---

## Oppimisen eteneminen ja monimutkaisuus

### Taidollinen eteneminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusteet) → luku 2 (AI-kehitys)
- **🔧 Keskitaso**: Lukujen 3-4 (Konfigurointi & infrastruktuuri) → luku 6 (Vahvistus)
- **🚀 Edistynyt**: Luku 5 (Moniagenttiratkaisut) → luku 7 (Vianetsintä)
- **🏢 Yritys**: Valmis kaikki luvut, keskity lukuun 8 (Tuotantomallit)

- **Konttisovellusten polku**: Lukujen 4 (Konttien käyttöönotto), 5 (Mikropalveluintegratio), 8 (Tuotannon parhaat käytännöt)

### Monimutkaisuuden indikaattorit

- **⭐ Perus**: Yksittäiset käsitteet, ohjatut tutoriaalit, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita käsitteitä, käytännön harjoituksia, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, räätälöidyt ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Ekspertti**: Tuotantojärjestelmät, yritysmallit, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusteet & Pikakäynnistys (45 min)
2. **Luku 2**: AI-Ensimmäinen kehitys (2 tuntia)  
3. **Luku 5**: Moniagenttiset AI-ratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon AI parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusteet & Pikakäynnistys (45 min)
2. **Luku 3**: Konfigurointi & autentikointi (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina & käyttöönotto (1,5 tuntia)
4. **Luku 6**: Ennen käyttöönottoa tehtävät vahvistukset & suunnittelu (1 tunti)
5. **Luku 7**: Vianetsintä & virheenkorjaus (1,5 tuntia)
6. **Luku 8**: Tuotanto & yritysmallit (2 tuntia)

#### 🎓 Täydellinen oppimismatka (8-12 tuntia)
Järjestelmällinen kaikkien 8 luvun suoritus käytännön harjoituksin ja vahvistuksin

## Kurssin suorittamisen kehys

### Tiedon vahvistus
- **Lukujen tarkistuspisteet**: Käytännön tehtäviä mitattavilla tuloksilla
- **Käytännön todennus**: Käyttöönotto toimiviksi ratkaisuiksi joka luvussa
- **Edistymisen seuranta**: Visuaaliset merkit ja suoritusmerkit
- **Yhteisön vahvistus**: Jaa kokemuksia Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Lukujen 1-2 suoritus (Perusteet + AI)
- ✅ Ota käyttöön peruswebsovellus AZD:llä
- ✅ Ota käyttöön AI-vetoinen chat-sovellus RAGilla
- ✅ Ymmärrä AZD:n ydinkäsitteet ja AI-integraatio

#### Lukujen 3-4 suoritus (Konfigurointi + Infrastruktuuri)  
- ✅ Hallitse moni-ympäristön käyttöönottoja
- ✅ Luo räätälöityjä Bicep-infrastruktuurimalleja
- ✅ Toteuta turvalliset autentikointimallit

#### Lukujen 5-6 suoritus (Moniagentti + vahvistus)
- ✅ Ota käyttöön monimutkainen moniagenttipohjainen AI-ratkaisu
- ✅ Suorita kapasiteettisuunnittelu ja kustannusten optimointi
- ✅ Toteuta automatisoitu ennen käyttöönottoa tehtävä varmennus

#### Lukujen 7-8 suoritus (Vianetsintä + Tuotanto)
- ✅ Virheenkorjaa ja ratkaise käyttöönotto-ongelmia itsenäisesti  
- ✅ Toteuta yritystason seuranta ja turvallisuus
- ✅ Ota käyttöön tuotantovalmiit sovellukset hallinnoidusti

### Sertifiointi ja tunnustus
- **Kurssin suoritusmerkki**: Suorita kaikki 8 lukua käytännön vahvistuksin
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Microsoft Foundry Discordissa
- **Ammatillinen kehitys**: Alan kannalta merkittävät AZD- ja AI-käyttöönoton taidot
- **Uraedistys**: Yritystason pilvikäyttöönoton valmiudet

## 🎓 Laajat oppimistulokset

### Perustaso (Luvut 1-2)
Perustason lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Ota käyttöön yksinkertaisia web-sovelluksia Azureen AZD-komennoilla
- Konfiguroi ja ota käyttöön AI-vetoisia chat-sovelluksia RAG-ominaisuuksilla
- Ymmärrä AZD:n ydinkäsitteet: mallit, ympäristöt, provisiointityönkulut
- Integroi Microsoft Foundry -palvelut AZD-käyttöönottoihin
- Navigoi Azure AI -palveluiden konfiguraatioissa ja API-päätepisteissä

**Ammatilliset taidot:**
- Noudata strukturoituja käyttöönoton työnkulkuja johdonmukaisiin tuloksiin
- Vianetsintä peruskäyttöönotto-ongelmissa lokien ja dokumentaation avulla
- Viesti tehokkaasti pilvikäyttöönoton prosesseista
- Sovella parhaita käytäntöjä turvalliseen AI-palvelun integraatioon

**Oppimisen varmentaminen:**
- ✅ Onnistuneesti ota käyttöön `todo-nodejs-mongo` -malli
- ✅ Ota käyttöön ja konfiguroi `azure-search-openai-demo` RAGilla
- ✅ Suorita vuorovaikutteisia työpajaharjoituksia (Discovery-vaihe)
- ✅ Osallistu Azure Discord -yhteisön keskusteluihin

### Keskitaso (Luvut 3-4)
Välitasojen lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Hallitse moni-ympäristön käyttöönottoja (kehitys, testaus, tuotanto)
- Luo räätälöityjä Bicep-malleja infrastruktuurina koodina
- Toteuta turvalliset autentikointimallit hallitulla identiteetillä
- Ota käyttöön monimutkaisia monipalvelusovelluksia räätälöidyillä asetuksilla
- Optimoi resurssien provisiointistrategiat kustannusten ja suorituskyvyn kannalta

**Ammatilliset taidot:**
- Suunnittele skaalautuvia infrastruktuuriarkkitehtuureja
- Toteuta turvallisuuden parhaat käytännöt pilvikäyttöönotossa
- Dokumentoi infrastruktuurimallit tiimiyhteistyötä varten
- Arvioi ja valitse sopivat Azure-palvelut vaatimuksiin

**Oppimisen varmentaminen:**
- ✅ Konfiguroi erilliset ympäristöt ympäristökohtaisilla asetuksilla
- ✅ Luo ja ota käyttöön räätälöity Bicep-malli moni-palvelusovellukselle
- ✅ Toteuta hallitun identiteetin autentikointi turvalliseen pääsyyn
- ✅ Suorita konfiguroinnin hallinnan harjoitukset todellisilla skenaarioilla

### Edistynyt taso (Luvut 5-6)
Edistyneiden lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Ota käyttöön ja orkestroi moniagenttisia AI-ratkaisuja koordinoiduilla työnkuluilla
- Toteuta Asiakas- ja Varastointianturien arkkitehtuurit vähittäiskaupan skenaarioissa
- Suorita kattava kapasiteettisuunnittelu ja resurssien validointi
- Suorita automatisoitu ennen käyttöönottoa tehtävä validointi ja optimointi
- Suunnittele kustannustehokkaat SKU-valinnat työkuorman vaatimusten perusteella

**Ammatilliset taidot:**
- Arkkitehtuurisuunnitelma monimutkaisille AI-ratkaisuille tuotantoympäristöissä
- Johda teknisiä keskusteluja AI:n käyttöönotto-strategioista
- Mentoi nuorempia kehittäjiä AZD- ja AI-käyttöönoton parhaissa käytännöissä
- Arvioi ja suosittele AI-arkkitehtuurimalleja liiketoiminnan tarpeisiin

**Oppimisen varmentaminen:**
- ✅ Tarkastele vähittäiskaupan moniagenttipohjaista suunnitelmaa ja erota provisioitu infrastruktuuri puuttuvasta sovelluksen toteutuksesta
- ✅ Havainnollista agenttien koordinointi ja työnkulun orkestrointi
- ✅ Suorita kapasiteettisuunnitteluharjoitukset todellisten resurssirajoitusten kanssa
- ✅ Vahvista käyttöönoton valmius automatisoitujen ennen lennon tarkistusten avulla

### Eksperttitaso (Luvut 7-8)
Eksperttitasojen lukujen suorittamisen jälkeen oppijat osaavat:

**Tekniset taidot:**
- Diagnosoi ja ratkaise monimutkaiset käyttöönotto-ongelmat itsenäisesti
- Toteuta yritystason turvallisuusmallit ja hallintakehykset
- Suunnittele kattavat valvonta- ja hälytysjärjestelmät
- Optimoi tuotantokäyttöönotot skaalautuvuuden, kustannusten ja suorituskyvyn kannalta
- Perusta CI/CD-putket asianmukaisella testaus- ja validointivaiheella

**Ammatilliset taidot:**
- Johda yrityspilven muutoshankkeita
- Suunnittele ja toteuta organisaation käyttöönotto-standardit
- Kouluta ja mentoi kehitystiimejä edistyneissä AZD-käytännöissä
- Vaikuta teknisiin päätöksiin yrityksen AI-käyttöönotossa

**Oppimisen varmentaminen:**
- ✅ Ratkaise monipalveluisten käyttöönottojen epäonnistumiset
- ✅ Toteuta yritysturvallisuusmallit vaatimustenmukaisuuden kanssa
- ✅ Suunnittele ja ota käyttöön tuotannon valvonta Application Insightsilla
- ✅ Suorita yrityksen hallintakehyksen toteutus

## 🎯 Kurssin suorittamisen sertifikaatti

### Edistymisen seurannan kehys
Seuraa oppimisesi etenemistä rakenteellisten tarkistuspisteiden kautta:

- [ ] **Luku 1**: Perusteet & Pikakäynnistys ✅
- [ ] **Luku 2**: AI-Ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Autentikointi ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & Käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen käyttöönottoa tehtävä varmistus & suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & Virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto & Yritysmallit ✅

### Vahvistusprosessi
Jokaisen luvun suorittamisen jälkeen vahvista tietosi näillä menetelmillä:

1. **Käytännön tehtävien suoritus**: Ota käyttöön toimivat ratkaisut jokaisessa luvussa
2. **Tiedon arviointi**: Tarkista UKK-osiot ja suorita itsearvioinnit
3. **Yhteisön osallistuminen**: Jaa kokemuksia ja saa palautetta Azure Discordissa
4. **Portfolio kehitys**: Dokumentoi käyttöönotot ja opitut asiat
5. **Vertaisarviointi**: Yhteistyö muiden oppijoiden kanssa monimutkaisissa skenaarioissa

### Kurssin suorittamisen hyödyt
Kurssin täydellisen suorituksen ja vahvistusten jälkeen valmistuneilla on:

**Tekninen asiantuntemus:**
- **Tuotantokokemus**: Ota käyttöön todellisia AI-sovelluksia Azure-ympäristöihin
- **Ammatilliset taidot**: Yritystason käyttöönotto ja vianetsintäkyvykkyys  
- **Arkkitehtuurin tuntemus**: Moniagenttiset AI-ratkaisut ja monimutkaiset infrastruktuurimallit
- **Vianetsinnän hallinta**: Itsenäinen ongelmien ratkaisu käyttöönotossa ja konfiguroinnissa

**Ammatillinen kehitys:**
- **Alan tunnustus**: Todistettavat taidot kysytyillä AZD- ja AI-käyttöönoton alueilla
- **Uramahdollisuudet**: Pätevyys pilviarkkitehdin ja AI-käyttöönoton asiantuntijan tehtäviin
- **Yhteisön johtajuus**: Aktiivinen jäsenyys Azure-kehittäjä- ja AI-yhteisöissä
- **Jatkuva oppiminen**: Perusta edistyneelle Microsoft Foundry erikoistumiselle

**Portfolion aineistot:**
- **Käyttöönotetut ratkaisut**: Toimivia esimerkkejä AI-sovelluksista ja infrastruktuurimalleista
- **Dokumentaatio**: Kattavat käyttöönotto-oppaat ja vianetsintäohjeet  
- **Yhteisön panokset**: Keskustelut, esimerkit ja parannukset jaettu Azure-yhteisölle
- **Ammatillinen verkosto**: Yhteydet Azure-asiantuntijoihin ja AI-käyttöönoton ammattilaisiin

### Kurssin jälkeinen oppimispolku
Valmistuneet ovat valmiita edistyneeseen erikoistumiseen:
- **Microsoft Foundry Ekspertti**: Syvällinen erikoistuminen AI-mallien käyttöönottoon ja orkestrointiin
- **Pilviarkkitehtuurin johtajuus**: Yritystason käyttöönottojen suunnittelu ja hallinta
- **Kehittäjäyhteisön johtajuus**: Panos Azure-esimerkkien ja yhteisöresurssien kehittämiseen
- **Yrityskoulutus**: AZD- ja AI-käyttöönoton taitojen opettaminen organisaatioissa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
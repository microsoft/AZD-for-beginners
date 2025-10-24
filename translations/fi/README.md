<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a47510110edbcc33ad1ab7e8d234f7c3",
  "translation_date": "2025-10-24T09:32:02+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Jäsennelty Oppimispolku

![AZD-aloittelijoille](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Kurssin Aloittaminen

Seuraa näitä vaiheita aloittaaksesi AZD-oppimispolkusi:

1. **Haarauta Repositorio**: Klikkaa [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa Repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity Yhteisöön**: [Azure Discord -yhteisöt](https://discord.com/invite/ByRwuEEgH4) saadaksesi asiantuntijatukea
4. **Valitse Oppimispolkusi**: Valitse alla oleva luku, joka vastaa kokemustasoasi

### Monikielinen Tuki

#### Automaattiset Käännökset (Aina Ajantasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin Yleiskatsaus

Hallitse Azure Developer CLI (azd) jäsenneltyjen lukujen avulla, jotka on suunniteltu edistämään oppimistasi. **Erityinen painotus tekoälysovellusten käyttöönotossa Azure AI Foundry -integraation avulla.**

### Miksi Tämä Kurssi on Tärkeä Nykyaikaisille Kehittäjille

Azure AI Foundry Discord -yhteisön havaintojen mukaan **45 % kehittäjistä haluaa käyttää AZD:tä tekoälytyökuormiin**, mutta he kohtaavat haasteita, kuten:
- Monimutkaiset monipalveluarkkitehtuurit tekoälylle
- Parhaat käytännöt tekoälyn tuotantokäyttöönotossa  
- Azure AI -palveluiden integrointi ja konfigurointi
- Tekoälytyökuormien kustannusoptimointi
- Tekoälyyn liittyvien käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Tämän jäsennellyn kurssin suorittamisen jälkeen osaat:
- **Hallitse AZD:n Perusteet**: Ydinkonseptit, asennus ja konfigurointi
- **Ota Tekoälysovelluksia Käyttöön**: Käytä AZD:tä Azure AI Foundry -palveluiden kanssa
- **Toteuta Infrastructure as Code**: Hallitse Azure-resursseja Bicep-mallien avulla
- **Ratkaise Käyttöönotto-ongelmia**: Selvitä yleisiä ongelmia ja debugaa
- **Optimoi Tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna Moniagenttiratkaisuja**: Ota käyttöön monimutkaisia tekoälyarkkitehtuureja

## 📚 Oppimislukujen Sisältö

*Valitse oppimispolkusi kokemustasosi ja tavoitteidesi mukaan*

### 🚀 Luku 1: Perusteet & Pika-aloitus
**Esitiedot**: Azure-tilaus, perustiedot komentorivistä  
**Kesto**: 30-45 minuuttia  
**Vaikeustaso**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD:n Perusteet](docs/getting-started/azd-basics.md) - Ydinkonseptit ja termit
- **⚙️ Asennus**: [Asennus & Konfigurointi](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön Harjoitus**: [Ensimmäinen Projektisi](docs/getting-started/first-project.md) - Vaiheittainen opas
- **📋 Pikaopas**: [Komento-opas](resources/cheat-sheet.md)

#### Käytännön Harjoitukset
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun Tulos**: Onnistunut yksinkertaisen verkkosovelluksen käyttöönotto Azureen AZD:n avulla

---

### 🤖 Luku 2: Tekoälykeskeinen Kehitys (Suositellaan Tekoälykehittäjille)
**Esitiedot**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Azure AI Foundry -integraatio AZD:n kanssa
- Tekoälypohjaisten sovellusten käyttöönotto
- Tekoälypalveluiden konfiguroinnin ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Azure AI Foundry -integraatio](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mallit**: [Tekoälymallien Käyttöönotto](docs/ai-foundry/ai-model-deployment.md) - Tekoälymallien hallinta
- **🛠️ Työpaja**: [Tekoälytyöpaja](docs/ai-foundry/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-yhteensopivia
- **🎥 Interaktiivinen Opas**: [Työpajamateriaalit](workshop/README.md) - Selaimessa toimiva oppimisympäristö MkDocs * DevContainer -ympäristössä
- **📋 Mallit**: [Azure AI Foundry -mallit](../..)

#### Käytännön Harjoitukset
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun Tulos**: Ota käyttöön ja konfiguroi tekoälypohjainen chat-sovellus RAG-ominaisuuksilla

---

### ⚙️ Luku 3: Konfigurointi & Autentikointi
**Esitiedot**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Autentikoinnin ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/getting-started/configuration.md) - Ympäristön asennus
- **🔐 Turvallisuus**: Autentikointimallit ja hallitut identiteetit
- **📝 Esimerkit**: [Tietokantasovelluksen Esimerkki](../../examples/database-app) - Konfigurointimallit

#### Käytännön Harjoitukset
- Konfiguroi useita ympäristöjä (kehitys, testaus, tuotanto)
- Määritä hallittu identiteettiautentikointi
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun Tulos**: Hallitse useita ympäristöjä oikeilla autentikointi- ja turvallisuuskäytännöillä

---

### 🏗️ Luku 4: Infrastructure as Code & Käyttöönotto
**Esitiedot**: Luvut 1-3 suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä Opit
- Kehittyneet käyttöönoton mallit
- Infrastructure as Code Bicepilla
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisiointi**: [Resurssien Provisiointi](docs/deployment/provisioning.md) - Azuren resurssien hallinta
- **📝 Esimerkit**: [Konttisovelluksen Esimerkki](../../examples/container-app) - Konttien käyttöönotto

#### Käytännön Harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green-käyttöönoton strategioita

**💡 Luvun Tulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia mukautettujen infrastruktuurimallien avulla

---

### 🎯 Luku 5: Moniagenttiset Tekoälyratkaisut (Edistynyt)
**Esitiedot**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä Opit
- Moniagenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälyn käyttöönotot

#### Oppimateriaalit
- **🤖 Esimerkkiprojekti**: [Moniagenttinen Vähittäiskaupparatkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: Moniagenttien koordinointimallit

#### Käytännön Harjoitukset
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun Tulos**: Ota käyttöön ja hallitse tuotantovalmiita moniagenttisia tekoälyratkaisuja asiakas- ja varastoagenttien avulla

---

### 🔍 Luku 6: Esikäyttöönoton Validointi & Suunnittelu
**Esitiedot**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Ennakkotarkistukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Ennakkotarkistukset](docs/pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön Harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automaattiset ennakkotarkistukset

**💡 Luvun Tulos**: Validoi ja optimoi käyttöönotot ennen niiden suorittamista

---

### 🚨 Luku 7: Vianmääritys & Debuggaus
**Esitiedot**: Mikä tahansa käyttöönottoon liittyvä luku suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä Opit
- Järjestelmälliset debuggausmenetelmät
- Yleiset ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianmääritys

#### Oppimateriaalit
- **🔧 Yleiset Ongelmat**: [Yleiset Ongelmat](docs/troubleshooting/common-issues.md) - FAQ ja ratkaisut
- **🕵️ Debuggaus**: [Debuggausopas](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [Tekoälyyn Liittyvä Vianmääritys](docs/troubleshooting/ai-troubleshooting.md) - Tekoälypalveluiden ongelmat

#### Käytännön Harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Ratkaise autentikointiongelmat
- Debuggaa tekoälypalveluiden yhteysongelmat

**💡 Luvun Tulos**: Diagnosoi ja ratkaise yleiset käyttöönotto-ongelmat itsenäisesti

---

### 🏢 Luku 8: Tuotanto & Yritysmallit
**Esitiedot**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönottostrategiat
- Yritystason tietoturvamallit
- Seuranta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Tuotannon AI parhaat käytännöt](docs/ai-foundry/production-ai-practices.md) - Yritystason mallit
- **📝 Esimerkit**: [Mikropalveluesimerkki](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Seuranta**: Application Insights -integraatio

#### Käytännön harjoitukset
- Toteuta yritystason tietoturvamalleja
- Määritä kattava seuranta
- Ota käyttöön tuotantoympäristö asianmukaisella hallinnalla

**💡 Luvun tavoite**: Ota käyttöön yritystason sovelluksia täydellä tuotantokapasiteetilla

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajamateriaalimme tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuohjelmaa. Työpaja on suunniteltu sekä omaehtoiseen oppimiseen että ohjattuihin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja hakutoiminnolla, kopioinnilla ja teemaominaisuuksilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön asennus
- **Jäsennelty oppimispolku**: 7 vaihetta ohjattuja harjoituksia (yhteensä 3,5 tuntia)
- **Tutkimus → Käyttöönotto → Mukauttaminen**: Progressiivinen metodologia
- **Interaktiivinen DevContainer-ympäristö**: Esiasennetut työkalut ja riippuvuudet

#### 📚 Työpajan rakenne
Työpaja noudattaa **Tutkimus → Käyttöönotto → Mukauttaminen** -metodologiaa:

1. **Tutkimusvaihe** (45 min)
   - Tutustu Azure AI Foundryn malleihin ja palveluihin
   - Ymmärrä monen agentin arkkitehtuurimallit
   - Tarkista käyttöönoton vaatimukset ja edellytykset

2. **Käyttöönotto** (2 tuntia)
   - Käytännön AI-sovellusten käyttöönotto AZD:llä
   - Määritä Azure AI -palvelut ja päätepisteet
   - Toteuta tietoturva- ja todennusmallit

3. **Mukauttamisvaihe** (45 min)
   - Muokkaa sovelluksia erityisiin käyttötarkoituksiin
   - Optimoi tuotantokäyttöön
   - Toteuta seuranta ja kustannusten hallinta

#### 🚀 Työpajan aloitus
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittamalla osallistujat oppivat:
- **Ottamaan käyttöön tuotannon AI-sovelluksia**: Käyttämällä AZD:tä ja Azure AI Foundryn palveluita
- **Hallitsemaan monen agentin arkkitehtuurit**: Toteuttamaan koordinoituja AI-agenttiratkaisuja
- **Toteuttamaan tietoturvan parhaat käytännöt**: Määrittämään todennuksen ja käyttöoikeuksien hallinnan
- **Optimoimaan skaalautuvuutta varten**: Suunnittelemaan kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Ratkaisemaan käyttöönottoon liittyviä ongelmia**: Selvittämään yleisiä haasteita itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset läpikäynnit
- **🛠️ AI-työpajalaboratorio**: [AI-työpajalaboratorio](docs/ai-foundry/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Pika-aloitus**: [Työpajan asennusopas](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Sopii erinomaisesti**: Yrityskoulutuksiin, yliopistokursseihin, omaehtoiseen oppimiseen ja kehittäjäbootcampeihin.

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjäkeskeinen komentoriviliittymä, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen. Se tarjoaa:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastructure as Code** - Hallitse Azuren resursseja Bicepin tai Terraformin avulla  
- **Integroitu työnkulku** - Resurssien provisiointi, käyttöönotto ja seuranta saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuudelle ja käyttökokemukselle

### **AZD + Azure AI Foundry: Täydellinen AI-käyttöönottoihin**

**Miksi AZD AI-ratkaisuihin?** AZD vastaa AI-kehittäjien suurimpiin haasteisiin:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja ML-työkuormille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut tietoturvamallit AI-palveluille, API-avaimille ja mallipäätepisteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuville ja kustannustehokkaille AI-sovellusten käyttöönotolle
- **Päästä-päähän AI-työnkulut** - Mallin kehittämisestä tuotantokäyttöön oikealla seurannalla
- **Kustannusten optimointi** - Älykkäät resurssien allokointi- ja skaalausstrategiat AI-työkuormille
- **Azure AI Foundry -integraatio** - Saumaton yhteys AI Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Esittelyssä: Azure AI Foundry -mallit
**Aloita tästä, jos otat käyttöön AI-sovelluksia!**

| Malli | Luku | Monimutkaisuus | Palvelut |
|-------|------|----------------|----------|
| [**Aloita AI-chatilla**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Monen agentin työnkulkuautomaatio**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Luo dokumentteja datastasi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Paranna asiakastapaamisia agenttien avulla**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernisoi koodisi agenttien avulla**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Rakenna keskusteleva agenttisi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Avaa oivalluksia keskusteludatasta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Monimuotoinen sisällön käsittely**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Esittelyssä: Täydelliset oppimisskenaariot
**Tuotantovalmiit sovellusmallit oppimislukuihin yhdistettynä**

| Malli | Oppimisluku | Monimutkaisuus | Keskeinen oppiminen |
|-------|-------------|----------------|---------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus AI-käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchilla |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttiälyn integrointi |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Monen agentin arkkitehtuuri asiakas- ja varastoagenttien kanssa |

### Oppiminen esimerkkityypin mukaan

#### Yksinkertaiset sovellukset (Luvut 1-2)
- [Yksinkertainen verkkosovellus](../../examples/simple-web-app) - Peruskäyttöönoton mallit
- [Staattinen verkkosivusto](../../examples/static-site) - Staattisen sisällön käyttöönotto
- [Perus API](../../examples/basic-api) - REST API:n käyttöönotto

#### Tietokantaintegraatio (Luvut 3-4)  
- [Tietokantasovellus](../../examples/database-app) - Tietokantayhteysmallit
- [Datankäsittely](../../examples/data-processing) - ETL-työnkulun käyttöönotto

#### Edistyneet mallit (Luvut 4-8)
- [Container Apps](../../examples/container-app) - Konttien käyttöönotto
- [Mikropalvelut](../../examples/microservices) - Monipalveluarkkitehtuurit  
- [Yritysratkaisut](../../examples/enterprise) - Tuotantovalmiit mallit

### Ulkoiset mallikokoelmat
- [**Virallinen AZD-malligalleria**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisia ja yhteisön malleja
- [**Azure Developer CLI -mallit**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Esimerkkihakemisto**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit ja viitteet

### Pikaoppaat
- [**Komento-opas**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettynä luvun mukaan
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**Usein kysytyt kysymykset**](resources/faq.md) - Yleiset kysymykset järjestettynä oppimislukujen mukaan
- [**Opintosuunnitelma**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajalaboratorio**](docs/ai-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-yhteensopivia (2-3 tuntia)
- [**Interaktiivinen työpajaopas**](workshop/README.md) - Selainpohjainen työpaja MkDocsilla ja DevContainer-ympäristöllä
- [**Jäsennelty oppimispolku**](../../workshop/docs/instructions) - 7 vaihetta ohjattuja harjoituksia (Tutkimus → Käyttöönotto → Mukauttaminen)
- [**AZD aloittelijoille -työpaja**](workshop/README.md) - Täydelliset käytännön työpajamateriaalit GitHub Codespaces -integraatiolla

### Ulkoiset oppimisresurssit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Kurssin suorittaminen ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisen luvun kautta:

- [ ] **Luku 1**: Perusteet ja pika-aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi ja todennus ✅
- [ ] **Luku 4**: Infrastructure as Code & käyttöönotto ✅
- [ ] **Luku 5**: Monen agentin AI-ratkaisut ✅
- [ ] **Luku 6**: Käyttöönoton validointi ja suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä ja virheiden korjaus ✅
- [ ] **Luku 8**: Tuotanto- ja yritysmallit ✅

### Oppimisen varmistaminen
Kun olet suorittanut jokaisen luvun, varmista tietosi:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietotarkistus**: Tarkista luvun FAQ-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavalle monimutkaisuustasolle

### Kurssin suorittamisen hyödyt
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Käyttöönotettu todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritystason käyttöönoton valmiudet  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Uramahdollisuudet**: Kysytyt AZD- ja AI-käyttöönoton taidot

---

## 🤝 Yhteisö ja tuki

### Apua ja tukea
- **Tekniset ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure)
- **AI-spesifinen apu**: Liity [#Azure-kanavalle](https://discord.gg/microsoft-azure) AZD + AI Foundry -keskusteluihin
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Azure AI Foundry Discordista

**Viimeisimmät kyselytulokset #Azure-kanavalta:**
- **45 %** kehittäjistä haluaa käyttää AZD:tä AI-työkuormille
- **Suurimmat haasteet**: Monipalvelukäyttöönotot, tunnusten hallinta, tuotantovalmius  
- **Eniten toivottu**: AI-spesifiset mallit, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme:**
- Jaa AZD + AI-kokemuksesi ja saa apua
- P
- **Uudet esimerkit**: Lisää tosielämän skenaarioita ja malleja  
- **Käännös**: Auta ylläpitämään monikielistä tukea  
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä  
- **Yhteisön standardit**: Noudata osallistavia yhteisön ohjeitamme  

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä – katso [LICENSE](../../LICENSE)-tiedosto saadaksesi lisätietoja.

### Liittyvät Microsoftin oppimisresurssit

Tiimimme tuottaa muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agentit
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20aloittelijoille-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20aloittelijoille-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20aloittelijoille-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agentit aloittelijoille](https://img.shields.io/badge/AI%20agentit%20aloittelijoille-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivisen AI:n sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generatiivinen%20AI%20aloittelijoille-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generatiivinen%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generatiivinen%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generatiivinen%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusoppiminen
[![ML aloittelijoille](https://img.shields.io/badge/ML%20aloittelijoille-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science aloittelijoille](https://img.shields.io/badge/Data%20Science%20aloittelijoille-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI aloittelijoille](https://img.shields.io/badge/AI%20aloittelijoille-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Kyberturvallisuus%20aloittelijoille-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-kehitys aloittelijoille](https://img.shields.io/badge/Web%20kehitys%20aloittelijoille-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20aloittelijoille-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20kehitys%20aloittelijoille-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI-pariohjelmointiin](https://img.shields.io/badge/Copilot%20AI-pariohjelmointiin-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET:lle](https://img.shields.io/badge/Copilot%20C%23/.NET:lle-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20seikkailu-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan oppimisen?**

**Aloittelijat**: Aloita [Luku 1: Perusteet ja pika-aloitus](../..)  
**AI-kehittäjät**: Siirry [Lukuun 2: AI-ensimmäinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita [Luku 3: Konfigurointi ja autentikointi](../..)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD perusteet](docs/getting-started/azd-basics.md) →

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi katsoa ensisijaiseksi lähteeksi. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
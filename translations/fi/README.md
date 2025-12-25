<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "05c30c9e5ed7951c72855108c6788034",
  "translation_date": "2025-12-25T05:13:15+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Jäsennelty Oppimispolku

![AZD aloittelijoille](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fi.png) 

[![GitHub-tarkkailijat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Aloittaminen tällä kurssilla

Seuraa näitä vaiheita aloittaaksesi AZD-oppimismatkasi:

1. **Forkkaa repositorio**: Klikkaa [![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity yhteisöön**: [Azure Discord -yhteisöt](https://discord.com/invite/ByRwuEEgH4) asiantuntijatukea varten
4. **Valitse oppimispolkusi**: Valitse alla oleva luku, joka vastaa kokemustasoasi

### Monikielinen tuki

#### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabia](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaria](../bg/README.md) | [Burma (Myanmar)](../my/README.md) | [Kiina (yksinkertaistettu)](../zh/README.md) | [Kiina (perinteinen, Hongkong)](../hk/README.md) | [Kiina (perinteinen, Makao)](../mo/README.md) | [Kiina (perinteinen, Taiwan)](../tw/README.md) | [Kroatia](../hr/README.md) | [Tšekki](../cs/README.md) | [Tanska](../da/README.md) | [Hollanti](../nl/README.md) | [Viro](../et/README.md) | [Suomi](./README.md) | [Ranska](../fr/README.md) | [Saksa](../de/README.md) | [Kreikka](../el/README.md) | [Heprea](../he/README.md) | [Hindi](../hi/README.md) | [Unkari](../hu/README.md) | [Indonesia](../id/README.md) | [Italia](../it/README.md) | [Japani](../ja/README.md) | [Kannada](../kn/README.md) | [Korea](../ko/README.md) | [Liettua](../lt/README.md) | [Malaiji](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norja](../no/README.md) | [Persia (farsi)](../fa/README.md) | [Puola](../pl/README.md) | [Portugali (Brasilia)](../br/README.md) | [Portugali (Portugali)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romania](../ro/README.md) | [Venäjä](../ru/README.md) | [Serbia (kyrillinen)](../sr/README.md) | [Slovakia](../sk/README.md) | [Slovenia](../sl/README.md) | [Espanja](../es/README.md) | [Swahili](../sw/README.md) | [Ruotsi](../sv/README.md) | [Tagalog (filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkki](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin yleiskatsaus

Hallinnoi Azure Developer CLI:tä (azd) jäsenneltyjen lukujen kautta, jotka on suunniteltu vaiheittaiseen oppimiseen. **Erityinen painotus tekoälysovellusten käyttöönotolle Microsoft Foundry -integraation avulla.**

### Miksi tämä kurssi on tärkeä nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:ta tekoäytyökuormiin**, mutta kohtaa haasteita:
- Monimutkaiset monipalveluisten tekoälyarkkitehtuurien vaatimukset
- Parhaat käytännöt tuotantotason tekoälyn käyttöönotossa  
- Azure AI -palvelujen integrointi ja konfigurointi
- Kustannusten optimointi tekoälykuormille
- Tekoälykohtaiset käyttöönoton vianmääritysongelmat

### Oppimistavoitteet

Suoritettuasi tämän jäsennellyn kurssin:
- **Hallitse AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Ota käyttöön tekoälysovelluksia**: Käytä AZD:ta Microsoft Foundry -palveluiden kanssa
- **Ota käyttöön Infrastructure as Code**: Hallinnoi Azure-resursseja Bicep-malleilla
- **Vianmääritys käyttöönotoissa**: Ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantokäyttöä varten**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna moni-agenttisia ratkaisuja**: Ota käyttöön monimutkaisia tekoälyarkkitehtuureja

## 📚 Oppimisluvut

*Valitse oppimispolkusi kokemustasosi ja tavoitteidesi mukaan*

### 🚀 Luku 1: Perusteet & Pikakäynnistys
**Edellytykset**: Azure-tilaus, perustason komentorivitaidot  
**Kesto**: 30–45 minuuttia  
**Vaikeustaso**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD:n perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet ja terminologia
- **⚙️ Asetus**: [Asennus & käyttöönotto](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/getting-started/first-project.md) - Askeltaiaskelelta-opas
- **📋 Pikaviite**: [Komentojen pikaopas](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun lopputulos**: Ota onnistuneesti käyttöön yksinkertainen web-sovellus Azureen käyttäen AZD:ta

**✅ Onnistumisen toteaminen:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Arvioitu aika:** 30–45 minuuttia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

**✅ Onnistumisen toteaminen:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Arvioitu aika:** 30–45 minuuttia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-ensimmäinen kehitys (suositellaan tekoälykehittäjille)
**Edellytykset**: Luku 1 suoritettuna  
**Kesto**: 1–2 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- Tekoälyllä varustettujen sovellusten käyttöönotto
- AI-palvelujen konfiguraatioiden ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry -integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md) - Ota käyttöön ja hallitse tekoälymalleja
- **🛠️ Työpaja**: [AI-työpajalab](docs/microsoft-foundry/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajamateriaali](workshop/README.md) - Selainpohjainen oppiminen MkDocs * DevContainer -ympäristössä
- **📋 Mallit**: [Microsoft Foundry -mallit](../..)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota ensimmäinen tekoälysovelluksesi käyttöön
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälymalleja
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi tekoälyllä varustettu chat-sovellus, jossa on RAG-ominaisuudet

**✅ Onnistumisen toteaminen:**
```bash
# Luku 2:n jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälykeskustelukäyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa, että haun integraatio toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriaa
azd down --force --purge
```

**📊 Arvioitu aika:** 1–2 tuntia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita tekoälysovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä kehityskustannukset noin $80–150/kk, tuotantokustannukset $300–3500/kk

#### 💰 Kustannusnäkökohdat AI-käyttöönotossa

**Kehitysympäristö (arvio $80–150/kk):**
- Azure OpenAI (Pay-as-you-go): $0–50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0–20/kk
- Tallennustila (Standard): $1–5/kk

**Tuotantoympäristö (arvio $300–3,500+/kk):**
- Azure OpenAI (PTU johdonmukaiseen suorituskykyyn): $3,000+/kk TAI Pay-as-you-go suurilla volyymeilla
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50–100/kk
- Application Insights: $5–50/kk
- Tallennustila (Premium): $10–50/kk

**💡 Kustannusten optimointivinkkejä:**
- Käytä **ilmaista tasoa** Azure OpenAI:sta oppimista varten (sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutusperusteisella laskutuksella, päivitä PTU:hun vain tuotantokäyttöä varten
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota automaattinen skaalaus käyttöön: maksa vain todellisesta käytöstä

**Kustannusseuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi & Autentikointi
**Edellytykset**: Luku 1 suoritettuna  
**Kesto**: 45–60 minuuttia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Ympäristöjen konfigurointi ja hallinta
- Autentikointi ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiohje](docs/getting-started/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Autentikointimallit ja hallitun identiteetin käytännöt](docs/getting-started/authsecurity.md) - Autentikointimallit
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallitun identiteetin autentikointi
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina & Käyttöönotto
**Edellytykset**: Luvut 1–3 suoritettuna  
**Kesto**: 1–1.5 tuntia  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto-mallit
- Infrastructure as Code Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Kattavat työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/deployment/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green -käyttöönotto-strategioita

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moni-agenttiset tekoälyratkaisut (Edistynyt)
**Edellytykset**: Luvut 1–2 suoritettuna  
**Kesto**: 2–3 tuntia  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Moni-agenttiarkkitehtuurien mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälyn käyttöönotot

#### Oppimateriaalit
- **🤖 Esitelty projekti**: [Vähittäiskaupan moni-agenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM Templates**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhdellä napsautuksella käyttöönotto
- **📖 Arkkitehtuuri**: [Moni-agentin koordinointimallit](/docs/pre-deployment/coordination-patterns.md) - Mallit

#### Practical Exercises
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttijärjestelmä
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun tulos**: Ota käyttöön ja hallinnoi tuotantovalmista moni-agentti AI-ratkaisua, jossa on Asiakas- ja Varasto-agentit

---

### 🔍 Luku 6: Ennen käyttöönottoa tehtävä validointi ja suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaikeus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkistukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Esitarkistukset](docs/pre-deployment/preflight-checks.md) - Automatisoidut skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten minimoimiseksi
- Ota käyttöön automatisoidut esitarkistukset

**💡 Luvun tulos**: Vahvista ja optimoi käyttöönotot ennen niiden toteutusta

---

### 🚨 Luku 7: Vianetsintä ja virheenkorjaus
**Esivaatimukset**: Minkä tahansa käyttöönottoon liittyvän luvun suorittaminen  
**Kesto**: 1–1,5 tuntia  
**Vaikeus**: ⭐⭐

#### Mitä opit
- Systemaattiset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianetsintä

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Vianetsintä**: [Vianetsinnän opas](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 AI-ongelmat**: [AI-kohtainen vianetsintä](docs/troubleshooting/ai-troubleshooting.md) - AI-palveluihin liittyvät ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumisia
- Ratkaise todennukseen liittyviä ongelmia
- Debuggaa AI-palveluiden yhteyksiä

**💡 Luvun tulos**: Diagnosoi ja ratkaise itsenäisesti yleisiä käyttöönotto-ongelmia

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Esivaatimukset**: Luvut 1–4 suoritettu  
**Kesto**: 2–3 tuntia  
**Vaikeus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason tietoturvamallit
- Valvonta ja kustannusoptimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Tuotanto-AI:n parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Mikropalveluesimerkki](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights -integraatio](docs/pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Ota käyttöön yritystason tietoturvamallit
- Määritä laaja valvonta
- Julkaise tuotantoon asianmukaisen hallinnon kera

**💡 Luvun tulos**: Julkaise yritystason sovelluksia, joissa on kaikki tuotantokelpoiset ominaisuudet

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitysvaiheessa**  
> Työpajan materiaalit ovat parhaillaan kehitteillä ja viimeistelyvaiheessa. Ydinmoduulit toimivat, mutta jotkin edistyneemmät osiot ovat keskeneräisiä. Työskentelemme aktiivisesti kaikkien sisältöjen saattamiseksi valmiiksi. [Seuraa etenemistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppimiskokemus selaimessa toimivilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä esiteltävää luku- ja moduuliperustaista opetussuunnitelmaa. Työpaja on suunniteltu sekä itseopiskelua että ohjattuja istuntoja varten.

#### 🛠️ Työpajan ominaisuudet
- **Selaimessa toimiva käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa on haku-, kopiointi- ja teemaominaisuudet
- **GitHub Codespaces -integraatio**: Yhden napsautuksen kehitysympäristön asennus
- **Jäsennelty oppimispolku**: 7-vaiheiset ohjatut harjoitukset (yhteensä 3,5 tuntia)
- **Etsintä → Käyttöönotto → Mukauttaminen**: Järjestelmällinen etenemismetodologia
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan rakenne
Työpaja seuraa **Etsintä → Käyttöönotto → Mukauttaminen** -menetelmää:

1. **Etsintävaihe** (45 min)
   - Tutustu Microsoft Foundry -malleihin ja palveluihin
   - Ymmärrä moni-agenttiarkkitehtuurimallit
   - Käy läpi käyttöönoton vaatimukset ja esivaatimukset

2. **Käyttöönotto-vaihe** (2 tuntia)
   - Käytännön käyttöönotto AI-sovelluksille AZD:n avulla
   - Määritä Azure AI -palvelut ja päätepisteet
   - Ota käyttöön tietoturva- ja tunnistautumismallit

3. **Mukautusvaihe** (45 min)
   - Muokkaa sovelluksia tiettyihin käyttötapauksiin
   - Optimoi tuotantokäyttöä varten
   - Ota käyttöön valvonta ja kustannusten hallinta

#### 🚀 Aloittaminen työpajan kanssa
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta "Code" → "Create codespace on main" repositoriossa

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittaneet osallistujat:
- **Ota tuotantokäyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundry -palvelujen kanssa
- **Hallitse moni-agenttiarkkitehtuurit**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Ota käyttöön tietoturvan parhaat käytännöt**: Määritä tunnistautuminen ja käyttöoikeuksien hallinta
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaat, suorituskykyiset käyttöönotot
- **Vianetsintä käyttöönotossa**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan materiaalit
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selaimessa toimiva oppimisympäristö
- **📋 Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset läpikäynnit
- **🛠️ AI-työpajalaboratorio**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Nopea aloitus**: [Työpajan asennusohje](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen kohde**: Yrityskoulutuksiin, yliopistokursseille, itseopiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjälähtöinen komentorivityökalu, joka nopeuttaa sovellusten rakentamisen ja Azureen julkaisemisen prosessia. Se tarjoaa:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulku** - Provisionoi, ota käyttöön ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Ihanteellinen AI-käyttöönottoihin**

**Miksi AZD AI-ratkaisuille?** AZD vastaa AI-kehittäjien yleisimpiin haasteisiin:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja ML-kuormituksille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut tietoturvamallit AI-palveluille, API-avaimille ja mallipäätepisteille  
- **Tuotanto-AI-mallit** - Parhaat käytännöt skaalautuviin ja kustannustehokkaisiin AI-sovellusten käyttöönottoihin
- **End-to-End AI -työnkulut** - Mallin kehityksestä tuotantokäyttöön asianmukaisella valvonnalla
- **Kustannusoptimointi** - Älykkäät resurssien jakamis- ja skaalautumisstrategiat AI-kuormituksille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundry -mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita täältä, jos otat AI-sovelluksia käyttöön!**

> **Huom:** Nämä mallit demonstroivat erilaisia AI-kuvioita. Osa on ulkoisia Azure Samples -projekteja, osa paikallisia toteutuksia.

| Malli | Luku | Vaikeus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Aloita AI-chatin kanssa**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI -demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App - pikaopas**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimistilanteet
**Tuotantovalmiit sovellusmallit oppituntikohtaisesti**

| Malli | Oppimisluku | Vaikeus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perustason AI-käyttöönottojen mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-implementaatio Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttien älykäs käsittely |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritys-AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri (Asiakas ja Varasto) |

### Oppiminen esimerkkien avulla

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiit käytettäväksi heti  
> **Ulkoiset esimerkit** (Azure Samples) = Kloonaa linkatuista arkistoista

#### Paikalliset esimerkit (valmiit käytettäväksi)
- [**Retail-monagenttiratkaisu**](examples/retail-scenario.md) - Täydellinen tuotantovalmis toteutus ARM-malleilla
  - Moni-agenttiarkkitehtuuri (Asiakas- ja Varastoagentit)
  - Kattava valvonta ja arviointi
  - Yhdellä napsautuksella käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Konttisovellukset (luvut 2–5)
**Kattavat konttipohjaisten käyttöönottojen esimerkit tässä arkistossa:**
- [**Konttisovellus-esimerkit**](examples/container-app/README.md) - Täydellinen opas konttipohjaisiin käyttöönottoihin
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api) - Perustason REST-API skaalaus nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmis monipalveluinen käyttöönotto
  - Nopea aloitus, tuotantokäytännöt ja edistyneet käyttöönotot
  - Ohjeet valvontaan, tietoturvaan ja kustannusoptimointiin

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1–2)
**Kloonaa nämä Azure Samples -arkistot aloittaaksesi:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perustason käyttöönotot
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön julkaisu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API:n käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3–4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantaliitännät ja mallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-tietotyönkulku

#### Ulkoiset esimerkit - Edistyneet mallit (luvut 4–8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppiesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit ja viitteet

### Pikaohjeet
- [**Komentohuijauslista**](resources/cheat-sheet.md) - Tärkeimmät azd-komennot järjestettyinä lukujen mukaan
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**UKK**](resources/faq.md) - Yleisimmät kysymykset järjestettyinä oppimislukujen mukaan
- [**Opintovihko**](resources/study-guide.md) - Kattavat käytännön harjoitukset

### Käytännön työpajat
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD:llä käyttöön otettavia (2–3 tuntia)
- [**Interactive Workshop Guide**](workshop/README.md) - Selaimessa suoritettava työpaja MkDocs- ja DevContainer-ympäristöllä
- [**Structured Learning Path**](../../workshop/docs/instructions) -7-step ohjatut harjoitukset (Tutkimus → Käyttöönotto → Mukauttaminen)
- [**AZD For Beginners Workshop**](workshop/README.md) - Täydelliset käytännön työpajan materiaalit GitHub Codespaces -integraatiolla

### Ulkoiset oppimateriaalit
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Pikavianmääritysopas

**Yleisimmät aloittelijoiden kohtaamat ongelmat ja nopeat ratkaisut:**

### ❌ "azd: command not found"

```bash
# Asenna ensin AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Varmista asennus
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# Luettele saatavilla olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Tarkista
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä kehityksessä pienempiä SKUja
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista yksityiskohtaiset lokit
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Autentikoi uudelleen
az logout
az login

azd auth logout
azd auth login

# Vahvista todennus
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos syntyy ristiriita:
azd down --force --purge

# Sitten yritä uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Normaali odotusaika:**
- Yksinkertainen web-sovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- AI-sovellukset: 15–25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumittaa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolien myöntämiseen)
```

### ❌ Can't find deployed application URL

```bash
# Näytä kaikki palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```

### 📚 Täydelliset vianmääritysresurssit

- **Yleisimmät ongelmat -opas:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Pikavianmääritysopas

**Yleisimmät aloittelijoiden kohtaamat ongelmat ja nopeat ratkaisut:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Asenna AZD ensin
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Varmista asennus
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Listaa käytettävissä olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vahvista
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä kehityksessä pienempiä SKUja
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista yksityiskohtaiset lokit
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Tunnistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Varmista tunnistautuminen
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos syntyy ristiriita:
azd down --force --purge

# Sitten yritä uudelleen käyttäen uutta ympäristöä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normaali odotusaika:**
- Yksinkertainen web-sovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- AI-sovellukset: 15–25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista eteneminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolien myöntämistä varten)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Näytä kaikki palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Täydelliset vianmääritysresurssit

- **Yleisimmät ongelmat -opas:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suorittaminen ja sertifiointi

### Edistymisen seuranta
Seuraa oppimistasi luvun läpi:

- [ ] **Luku 1**: Perusteet & Nopeasti alkuun ✅
- [ ] **Luku 2**: AI-lähtöinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & Käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen käyttöönottoa tehtävä validointi & Suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & Debuggaus ✅
- [ ] **Luku 8**: Tuotanto- & Yritysmallit ✅

### Oppimisen varmistus
Lukujen suorittamisen jälkeen varmista osaamisesi:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietotarkastus**: Kertaa luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan haastavuustasoon

### Kurssin suorittamisen hyödyt
Kun olet suorittanut kaikki luvut, saat:
- **Käytännön kokemus**: Olet ottanut tuotantoon AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritysvalmiit käyttöönotto-osaamiset  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Urapolun edistäminen**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö & Tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:ta AI-työkuormissa
- **Suurimmat haasteet**: Monipalveluiden käyttöönotot, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten toivottua**: AI-kohtaiset mallipohjat, vianmääritysoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jakaa AZD + AI -kokemuksiasi ja saada apua
- Saada varhaisia ennakkoversioita uusista AI-mallipohjista
- Osallistua AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuttaa tuleviin AI + AZD -ominaisuuksiin

### Osallistuminen kurssin kehitykseen
Otamme mielellämme vastaan kontribuutioita! Lue [Contributing Guide](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää käytännönläheisiä skenaarioita ja mallipohjia  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheilmoitukset**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön käytännöt**: Noudata osallistavaa yhteisökäyttäytymistä

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedostosta lisätiedot.

### Liittyvät Microsoftin oppimisresurssit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agentit
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivinen AI -sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusoppiminen
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datatiede aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tekoäly aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Verkkokehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI-pariohjelmointiin](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET -kehitykseen](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan oppimisen?**

**Aloittelijat**: Aloita tästä [Luku 1: Perusteet & pika-aloitus](../..)  
**Tekoälykehittäjät**: Siirry kohtaan [Luku 2: Tekoälylähtöinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita kohdasta [Luku 3: Konfigurointi & todennus](../..)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD-perusteet](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä voi olla virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä on pidettävä määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä mahdollisesti aiheutuvista väärinymmärryksistä tai tulkintavirheistä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
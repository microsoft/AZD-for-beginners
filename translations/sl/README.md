<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T12:55:08+00:00",
  "source_file": "README.md",
  "language_code": "sl"
}
-->
# AZD Za Začetnike: Strukturirano Učno Potovanje

![AZD-za-začetnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sl.png) 

## Začetek s tem tečajem

Sledite tem korakom, da začnete svoje učno potovanje z AZD:

1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte repozitorij**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pridružite se skupnosti**: [Azure Discord skupnosti](https://discord.com/invite/ByRwuEEgH4) za strokovno podporo
4. **Izberite svojo učno pot**: Izberite poglavje spodaj, ki ustreza vaši ravni izkušenj

### Podpora za več jezikov

#### Samodejni prevodi (vedno posodobljeni)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](./README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Pregled tečaja

Obvladajte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na uvajanju AI aplikacij z integracijo Azure AI Foundry.**

### Zakaj je ta tečaj pomemben za sodobne razvijalce

Na podlagi vpogledov iz skupnosti Azure AI Foundry Discord **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, vendar se soočajo z izzivi, kot so:
- Zapletene večstoritevne AI arhitekture
- Najboljše prakse za uvajanje AI v produkcijo  
- Integracija in konfiguracija storitev Azure AI
- Optimizacija stroškov za AI delovne obremenitve
- Odpravljanje težav pri uvajanju AI

### Cilji učenja

Z zaključkom tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Temeljni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: Uporaba AZD z Azure AI Foundry storitvami
- **Implementirali infrastrukturo kot kodo**: Upravljanje Azure virov z Bicep predlogami
- **Odpravljali težave pri uvajanju**: Reševanje pogostih težav in odpravljanje napak
- **Optimizirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Gradili rešitve z več agenti**: Uvajanje kompleksnih AI arhitektur

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Osnove & Hitri začetek
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi
- Vaša prva uspešna uvedba

#### Učni viri
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](../..)
- **📖 Teorija**: [Osnove AZD](docs/getting-started/azd-basics.md) - Temeljni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev & Nastavitev](docs/getting-started/installation.md) - Vodniki za specifične platforme
- **🛠️ Praktično delo**: [Vaš prvi projekt](docs/getting-started/first-project.md) - Korak za korakom
- **📋 Hiter referenčni vodič**: [Ukazna tabela](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat poglavja**: Uspešno uvedite preprosto spletno aplikacijo na Azure z uporabo AZD

---

### 🤖 Poglavje 2: Razvoj z AI v ospredju (Priporočeno za AI razvijalce)
**Predpogoji**: Zaključeno poglavje 1  
**Trajanje**: 1-2 uri  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Azure AI Foundry z AZD
- Uvajanje aplikacij, ki temeljijo na AI
- Razumevanje konfiguracij AI storitev

#### Učni viri
- **🎯 Začnite tukaj**: [Integracija Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Vzorci**: [Uvajanje AI modelov](docs/ai-foundry/ai-model-deployment.md) - Upravljanje AI modelov
- **🛠️ Delavnica**: [AI delavnica](docs/ai-foundry/ai-workshop-lab.md) - Priprava AI rešitev za AZD
- **📋 Predloge**: [Predloge Azure AI Foundry](../..)

#### Praktične vaje
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultat poglavja**: Uvedite in konfigurirajte AI aplikacijo za klepet z RAG funkcionalnostmi

---

### ⚙️ Poglavje 3: Konfiguracija & Avtentikacija
**Predpogoji**: Zaključeno poglavje 1  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Upravljanje konfiguracije okolja
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje virov in organizacija

#### Učni viri
- **📖 Konfiguracija**: [Vodič za konfiguracijo](docs/getting-started/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: Vzorci avtentikacije in upravljane identitete
- **📝 Primeri**: [Primer aplikacije z bazo podatkov](../../examples/database-app) - Vzorci konfiguracije

#### Praktične vaje
- Konfigurirajte več okolij (razvoj, testiranje, produkcija)
- Nastavite avtentikacijo z upravljano identiteto
- Implementirajte konfiguracije specifične za okolje

**💡 Rezultat poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda & Uvajanje
**Predpogoji**: Zaključena poglavja 1-3  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije za upravljanje virov

#### Učni viri
- **📖 Uvajanje**: [Vodič za uvajanje](docs/deployment/deployment-guide.md) - Celotni delovni tokovi
- **🏗️ Upravljanje virov**: [Upravljanje virov](docs/deployment/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer aplikacije v kontejnerju](../../examples/container-app) - Uvajanje kontejneriziranih aplikacij

#### Praktične vaje
- Ustvarite prilagojene Bicep predloge
- Uvedite aplikacije z več storitvami
- Implementirajte strategije uvajanja modro-zelene

**💡 Rezultat poglavja**: Uvedite kompleksne aplikacije z več storitvami z uporabo prilagojenih infrastrukturnih predlog

---

### 🎯 Poglavje 5: Rešitve z več agenti (Napredno)
**Predpogoji**: Zaključena poglavja 1-2  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorci arhitekture z več agenti
- Orkestracija in koordinacija agentov
- Uvajanje AI rešitev, pripravljenih za produkcijo

#### Učni viri
- **🤖 Izpostavljen projekt**: [Rešitev za maloprodajo z več agenti](examples/retail-scenario.md) - Celotna implementacija
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Uvajanje z enim klikom
- **📖 Arhitektura**: Vzorci koordinacije z več agenti

#### Praktične vaje
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultat poglavja**: Uvedite in upravljajte produkcijsko rešitev z več agenti, vključno z agenti za stranke in zaloge

---

### 🔍 Poglavje 6: Validacija & Načrtovanje pred uvajanjem
**Predpogoji**: Zaključeno poglavje 4  
**Trajanje**: 1 ura  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje kapacitet in validacija virov
- Strategije izbire SKU
- Preverjanje pred uvajanjem in avtomatizacija

#### Učni viri
- **📊 Načrtovanje**: [Načrtovanje kapacitet](docs/pre-deployment/capacity-planning.md) - Validacija virov
- **💰 Izbira**: [Izbira SKU](docs/pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- **✅ Validacija**: [Preverjanje pred uvajanjem](docs/pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za validacijo kapacitet
- Optimizirajte izbire SKU za stroške
- Implementirajte avtomatizirana preverjanja pred uvajanjem

**💡 Rezultat poglavja**: Validirajte in optimizirajte uvajanja pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav & Debugging
**Predpogoji**: Zaključeno katerokoli poglavje o uvajanju  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k odpravljanju težav
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Učni viri
- **🔧 Pogoste težave**: [Pogoste težave](docs/troubleshooting/common-issues.md) - FAQ in rešitve
- **🕵️ Debugging**: [Vodič za debugging](docs/troubleshooting/debugging.md) - Korak za korakom strategije
- **🤖 AI težave**: [Odpravljanje težav specifičnih za AI](docs/troubleshooting/ai-troubleshooting.md) - Težave s storitvami AI

#### Praktične vaje
- Diagnosticirajte napake pri uvajanju
- Rešite težave z avtentikacijo
- Debugging povezljivosti storitev AI

**💡 Rezultat poglavja**: Samostojno diagnosticirajte in rešite pogoste težave pri uvajanju

---

### 🏢 Poglavje 8: Produkcija & Vzorci za podjetja
**Predpogoji**: Zaključena poglavja 1-4  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije uvajanja v produkcijo
- Vzorci varnosti za podjetja
- Spremljanje in optimizacija stroškov

#### Učni viri
- **🏭 Produkcija**: [Najboljše prakse za produkcijo AI](docs/ai-foundry/production-ai-practices.md) - Vzorci za podjetja
- **📝 Primeri**: [Primer mikrostoritev](../../examples/microservices) - Kompleksne arhitekture
- **📊 Spremljanje**: Integracija Application Insights

#### Praktične vaje
- Uvedite varnostne vzorce za podjetja
- Nastavite celovito spremljanje
- Uvedite v produkcijo z ustreznim upravljanjem

**💡 Cilj poglavja**: Uvedite aplikacije, pripravljene za podjetja, z vsemi produkcijskimi zmogljivostmi

---

## 📖 Kaj je Azure Developer CLI?

Azure Developer CLI (azd) je ukazna vrstica, osredotočena na razvijalce, ki pospeši proces gradnje in uvajanja aplikacij v Azure. Ponuja:

- **Uvajanja na osnovi predlog** - Uporabite vnaprej pripravljene predloge za pogoste vzorce aplikacij
- **Infrastruktura kot koda** - Upravljajte Azure vire z Bicep ali Terraform  
- **Integrirani delovni tokovi** - Brezhibno zagotavljanje, uvajanje in spremljanje aplikacij
- **Prijazno za razvijalce** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Azure AI Foundry: Popolno za uvajanje AI**

**Zakaj AZD za AI rešitve?** AZD rešuje glavne izzive, s katerimi se soočajo razvijalci AI:

- **Predloge, pripravljene za AI** - Vnaprej konfigurirane predloge za Azure OpenAI, Cognitive Services in ML delovne obremenitve
- **Varne AI uvedbe** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke modelov  
- **Produkcijski AI vzorci** - Najboljše prakse za skalabilne in stroškovno učinkovite AI aplikacije
- **Celoviti AI delovni tokovi** - Od razvoja modela do produkcijske uvedbe z ustreznim spremljanjem
- **Optimizacija stroškov** - Pametne strategije dodeljevanja virov in skaliranja za AI delovne obremenitve
- **Integracija Azure AI Foundry** - Brezhibna povezava s katalogom modelov AI Foundry in končnimi točkami

---

## 🎯 Knjižnica predlog in primerov

### Priporočeno: Predloge Azure AI Foundry
**Začnite tukaj, če uvajate AI aplikacije!**

| Predloga | Poglavje | Kompleksnost | Storitve |
|----------|----------|-------------|----------|
| [**Začnite z AI klepetom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Začnite z AI agenti**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Avtomatizacija delovnih tokov z več agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generiranje dokumentov iz vaših podatkov**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Izboljšajte sestanke s strankami z agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Posodobite svojo kodo z agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Zgradite svoj pogovorni agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Odklenite vpoglede iz pogovornih podatkov**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Večmodalna obdelava vsebine**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Priporočeno: Celoviti učni scenariji
**Predloge aplikacij, pripravljene za produkcijo, povezane z učnimi poglavji**

| Predloga | Učno poglavje | Kompleksnost | Ključna znanja |
|----------|---------------|-------------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci uvajanja AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Implementacija RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija inteligence dokumentov |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klicanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Orkestracija AI za podjetja |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Arhitektura z več agenti za stranke in zaloge |

### Učenje po vrsti primerov

#### Enostavne aplikacije (Poglavja 1-2)
- [Enostavna spletna aplikacija](../../examples/simple-web-app) - Osnovni vzorci uvajanja
- [Statična spletna stran](../../examples/static-site) - Uvajanje statične vsebine
- [Osnovni API](../../examples/basic-api) - Uvajanje REST API

#### Integracija podatkovnih baz (Poglavje 3-4)  
- [Aplikacija s podatkovno bazo](../../examples/database-app) - Vzorci povezljivosti podatkovnih baz
- [Obdelava podatkov](../../examples/data-processing) - Uvajanje ETL delovnih tokov

#### Napredni vzorci (Poglavja 4-8)
- [Aplikacije v kontejnerjih](../../examples/container-app) - Uvajanje kontejneriziranih aplikacij
- [Mikrostoritve](../../examples/microservices) - Arhitekture z več storitvami  
- [Rešitve za podjetja](../../examples/enterprise) - Vzorci, pripravljeni za produkcijo

### Zbirke zunanjih predlog
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Uradni Microsoftovi primeri
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Predloge, ki jih prispeva skupnost
- [**Direktorij primerov**](examples/README.md) - Lokalni učni primeri z podrobnimi razlagami

---

## 📚 Učni viri in reference

### Hitre reference
- [**Ukazna kartica**](resources/cheat-sheet.md) - Ključni azd ukazi, organizirani po poglavjih
- [**Slovar**](resources/glossary.md) - Terminologija Azure in azd  
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja, organizirana po učnih poglavjih
- [**Učni vodič**](resources/study-guide.md) - Celovite praktične vaje

### Praktične delavnice
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Naredite svoje AI rešitve pripravljene za AZD
- [**Delavnica AZD za začetnike**](workshop/README.md) - Celoviti materiali za praktično delavnico

### Zunanji učni viri
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulator cen](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Zaključek tečaja in certifikacija

### Sledenje napredku
Sledite svojemu učnemu napredku skozi vsako poglavje:

- [ ] **Poglavje 1**: Osnove in hitri začetek ✅
- [ ] **Poglavje 2**: Razvoj, osredotočen na AI ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Rešitve AI z več agenti ✅
- [ ] **Poglavje 6**: Validacija in načrtovanje pred uvedbo ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcijski in podjetniški vzorci ✅

### Preverjanje znanja
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Zaključite praktično uvajanje poglavja
2. **Preverjanje znanja**: Preglejte razdelek FAQ za svoje poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v Azure Discord
4. **Naslednje poglavje**: Premaknite se na naslednjo stopnjo kompleksnosti

### Prednosti zaključka tečaja
Po zaključku vseh poglavij boste pridobili:
- **Produkcijske izkušnje**: Uvedli resnične AI aplikacije v Azure
- **Profesionalne veščine**: Zmožnosti uvajanja, pripravljene za podjetja  
- **Priznanje skupnosti**: Aktivni član skupnosti razvijalcev Azure
- **Napredovanje v karieri**: Iskane veščine za AZD in uvajanje AI

---

## 🤝 Skupnost in podpora

### Pridobite pomoč in podporo
- **Tehnične težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Učna vprašanja**: [Microsoft Azure Discord skupnost](https://discord.gg/microsoft-azure)
- **Pomoč, specifična za AI**: Pridružite se [#Azure kanalu](https://discord.gg/microsoft-azure) za razprave o AZD + AI Foundry
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Vpogledi skupnosti iz Discorda Azure AI Foundry

**Nedavni rezultati ankete iz #Azure kanala:**
- **45%** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavni izzivi**: Uvajanje več storitev, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zaželeno**: Predloge, specifične za AI, vodiči za odpravljanje težav, najboljše prakse

**Pridružite se naši skupnosti za:**
- Deljenje svojih izkušenj z AZD + AI in pridobivanje pomoči
- Dostop do zgodnjih predogledov novih AI predlog
- Prispevanje k najboljšim praksam za uvajanje AI
- Vplivanje na prihodnji razvoj funkcij AI + AZD

### Prispevanje k tečaju
Veseli smo prispevkov! Prosimo, preberite naš [Vodnik za prispevanje](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšanju vsebine**: Izboljšajte obstoječa poglavja in primere
- **Novih primerih**: Dodajte scenarije iz resničnega sveta in predloge  
- **Prevajanju**: Pomagajte ohranjati podporo za več jezikov
- **Prijavi napak**: Izboljšajte natančnost in jasnost
- **Standardi skupnosti**: Upoštevajte naše vključujoče smernice skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - glejte datoteko [LICENSE](../../LICENSE) za podrobnosti.

### Povezani Microsoftovi učni viri

Naša ekipa ustvarja druge celovite učne tečaje:

- [**NOVO** Model Context Protocol (MCP) za začetnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI agenti za začetnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativni AI za začetnike z uporabo .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativni AI za začetnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativni AI za začetnike z uporabo Jave](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML za začetnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Podatkovna znanost za začetnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI za začetnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kibernetska varnost za začetnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Spletni razvoj za začetnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT za začetnike](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR razvoj za začetnike](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Obvladovanje GitHub Copilot za AI programiranje v paru](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Obvladovanje GitHub Copilot za C#/.NET razvijalce](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Izberite svojo Copilot pustolovščino](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigacija po tečaju

**🚀 Pripravljeni na začetek učenja?**

**Začetniki**: Začnite z [Poglavjem 1: Osnove in hitri začetek](../..)  
**AI razvijalci**: Preskočite na [Poglavje 2: Razvoj, osredotočen na AI](../..)
**Izkušeni razvijalci**: Začnite z [Poglavje 3: Konfiguracija in avtentikacija](../..)

**Naslednji koraki**: [Začnite Poglavje 1 - Osnove AZD](docs/getting-started/azd-basics.md) →

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-25T01:22:36+00:00",
  "source_file": "README.md",
  "language_code": "hr"
}
-->
# AZD za početnike: Strukturirani put učenja

![AZD-za-početnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Početak s ovim tečajem

Slijedite ove korake kako biste započeli svoje AZD putovanje učenja:

1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte repozitorij**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pridružite se zajednici**: [Azure Discord zajednice](https://discord.com/invite/ByRwuEEgH4) za stručnu podršku
4. **Odaberite svoj put učenja**: Odaberite poglavlje u nastavku koje odgovara vašem iskustvu

### Podrška za više jezika

#### Automatski prijevodi (uvijek ažurirani)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](./README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Pregled tečaja

Savladajte Azure Developer CLI (azd) kroz strukturirana poglavlja osmišljena za progresivno učenje. **Poseban fokus na implementaciju AI aplikacija uz integraciju Azure AI Foundry.**

### Zašto je ovaj tečaj važan za moderne developere

Na temelju uvida iz Azure AI Foundry Discord zajednice, **45% developera želi koristiti AZD za AI radne zadatke**, ali nailaze na izazove s:
- Složenim AI arhitekturama koje uključuju više usluga
- Najboljim praksama za implementaciju AI u produkciji  
- Integracijom i konfiguracijom Azure AI usluga
- Optimizacijom troškova za AI radne zadatke
- Rješavanjem problema specifičnih za AI implementaciju

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja, naučit ćete:
- **Savladati osnove AZD-a**: Ključni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: Koristite AZD s Azure AI Foundry uslugama
- **Primijeniti Infrastructure as Code**: Upravljajte Azure resursima pomoću Bicep predložaka
- **Rješavati probleme implementacije**: Rješavanje uobičajenih problema i otklanjanje grešaka
- **Optimizirati za produkciju**: Sigurnost, skaliranje, praćenje i upravljanje troškovima
- **Izgraditi rješenja s više agenata**: Implementirati složene AI arhitekture

## 📚 Poglavlja učenja

*Odaberite svoj put učenja na temelju razine iskustva i ciljeva*

### 🚀 Poglavlje 1: Osnove i brzi početak
**Preduvjeti**: Azure pretplata, osnovno znanje naredbenog retka  
**Trajanje**: 30-45 minuta  
**Složenost**: ⭐

#### Što ćete naučiti
- Razumijevanje osnova Azure Developer CLI-a
- Instalacija AZD-a na vašoj platformi
- Vaša prva uspješna implementacija

#### Resursi za učenje
- **🎯 Početak**: [Što je Azure Developer CLI?](../..)
- **📖 Teorija**: [Osnove AZD-a](docs/getting-started/azd-basics.md) - Ključni koncepti i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/getting-started/installation.md) - Vodiči za specifične platforme
- **🛠️ Praktično**: [Vaš prvi projekt](docs/getting-started/first-project.md) - Korak-po-korak vodič
- **📋 Brzi pregled**: [Popis naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat poglavlja**: Uspješno implementirajte jednostavnu web aplikaciju na Azure koristeći AZD

---

### 🤖 Poglavlje 2: Razvoj usmjeren na AI (preporučeno za AI developere)
**Preduvjeti**: Završeno poglavlje 1  
**Trajanje**: 1-2 sata  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Integracija Azure AI Foundry s AZD-om
- Implementacija aplikacija temeljenih na AI-u
- Razumijevanje konfiguracija AI usluga

#### Resursi za učenje
- **🎯 Početak**: [Integracija Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Obrasci**: [Implementacija AI modela](docs/ai-foundry/ai-model-deployment.md) - Upravljanje AI modelima
- **🛠️ Radionica**: [AI radionica](docs/ai-foundry/ai-workshop-lab.md) - Pripremite svoje AI rješenje za AZD
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje putem preglednika s MkDocs * DevContainer okruženjem
- **📋 Predlošci**: [Predlošci Azure AI Foundry](../..)

#### Praktične vježbe
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultat poglavlja**: Implementirajte i konfigurirajte AI aplikaciju za chat s RAG funkcionalnostima

---

### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija
**Preduvjeti**: Završeno poglavlje 1  
**Trajanje**: 45-60 minuta  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Upravljanje konfiguracijom i okruženjima
- Najbolje prakse za autentifikaciju i sigurnost
- Organizacija i imenovanje resursa

#### Resursi za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/getting-started/configuration.md) - Postavljanje okruženja
- **🔐 Sigurnost**: Obrasci autentifikacije i upravljani identitet
- **📝 Primjeri**: [Primjer aplikacije za bazu podataka](../../examples/database-app) - Obrasci konfiguracije

#### Praktične vježbe
- Konfigurirajte više okruženja (razvoj, testiranje, produkcija)
- Postavite autentifikaciju upravljanim identitetom
- Implementirajte konfiguracije specifične za okruženje

**💡 Rezultat poglavlja**: Upravljajte više okruženja uz pravilnu autentifikaciju i sigurnost

---

### 🏗️ Poglavlje 4: Infrastructure as Code i implementacija
**Preduvjeti**: Završena poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastructure as Code s Bicep-om
- Strategije za upravljanje resursima

#### Resursi za učenje
- **📖 Implementacija**: [Vodič za implementaciju](docs/deployment/deployment-guide.md) - Kompletni tijekovi rada
- **🏗️ Upravljanje resursima**: [Upravljanje resursima](docs/deployment/provisioning.md) - Upravljanje Azure resursima
- **📝 Primjeri**: [Primjer aplikacije u kontejneru](../../examples/container-app) - Implementacija u kontejnerima

#### Praktične vježbe
- Izradite prilagođene Bicep predloške
- Implementirajte aplikacije koje koriste više usluga
- Primijenite strategije implementacije plavo-zeleno

**💡 Rezultat poglavlja**: Implementirajte složene aplikacije koje koriste više usluga koristeći prilagođene infrastrukturne predloške

---

### 🎯 Poglavlje 5: Rješenja s više agenata (napredno)
**Preduvjeti**: Završena poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture s više agenata
- Orkestracija i koordinacija agenata
- Implementacija AI rješenja spremnih za produkciju

#### Resursi za učenje
- **🤖 Istaknuti projekt**: [Rješenje za maloprodaju s više agenata](examples/retail-scenario.md) - Kompletna implementacija
- **🛠️ ARM predlošci**: [ARM paket predložaka](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- **📖 Arhitektura**: Obrasci koordinacije agenata

#### Praktične vježbe
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultat poglavlja**: Implementirajte i upravljajte produkcijskim AI rješenjem s više agenata, uključujući agenta za korisnike i agenta za inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: Završeno poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije odabira SKU-a
- Provjere prije implementacije i automatizacija

#### Resursi za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Odabir**: [Odabir SKU-a](docs/pre-deployment/sku-selection.md) - Isplative opcije
- **✅ Validacija**: [Provjere prije implementacije](docs/pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenite skripte za validaciju kapaciteta
- Optimizirajte odabir SKU-a za troškove
- Implementirajte automatizirane provjere prije implementacije

**💡 Rezultat poglavlja**: Validirajte i optimizirajte implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Rješavanje problema i otklanjanje grešaka
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi otklanjanju grešaka
- Uobičajeni problemi i rješenja
- Rješavanje problema specifičnih za AI

#### Resursi za učenje
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi](docs/troubleshooting/common-issues.md) - FAQ i rješenja
- **🕵️ Otklanjanje grešaka**: [Vodič za otklanjanje grešaka](docs/troubleshooting/debugging.md) - Strategije korak-po-korak
- **🤖 AI problemi**: [Rješavanje problema specifičnih za AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi s AI uslugama

#### Praktične vježbe
- Dijagnosticirajte neuspjehe implementacije
- Riješite probleme s autentifikacijom
- Otklonite probleme s povezivanjem AI usluga

**💡 Rezultat poglavlja**: Samostalno dijagnosticirajte i riješite uobičajene probleme implementacije

---

### 🏢 Poglavlje 8: Produkcija i obrasci za poduzeća
**Preduvjeti**: Završena poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije u produkciji
- Obrasci sigurnosti za poduzeća
- Praćenje i optimizacija troškova

#### Resursi za učenje
- **🏭 Produkcija**: [Najbolje prakse za AI u produkciji](docs/ai-foundry/production-ai-practices.md) - Obrasci za poduzeća
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Složene arhitekture  
- **📊 Praćenje**: Integracija s Application Insights  

#### Praktične vježbe  
- Implementirajte sigurnosne obrasce za poduzeća  
- Postavite sveobuhvatno praćenje  
- Implementirajte aplikacije u produkciju uz odgovarajuće upravljanje  

**💡 Ishod poglavlja**: Implementacija aplikacija spremnih za produkciju s punim kapacitetima  

---

## 🎓 Pregled radionice: Praktično iskustvo učenja  

### Interaktivni materijali za radionicu  
**Sveobuhvatno praktično učenje uz alate u pregledniku i vođene vježbe**  

Materijali za radionicu pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje kurikulum temeljen na poglavljima. Radionica je dizajnirana za samostalno učenje i sesije vođene instruktorom.  

#### 🛠️ Značajke radionice  
- **Sučelje u pregledniku**: Kompletna radionica temeljena na MkDocs-u s funkcijama pretraživanja, kopiranja i prilagodbe teme  
- **Integracija s GitHub Codespaces**: Postavljanje razvojnog okruženja jednim klikom  
- **Strukturirani put učenja**: 7 koraka vođenih vježbi (ukupno 3,5 sata)  
- **Otkrivanje → Implementacija → Prilagodba**: Progresivna metodologija  
- **Interaktivno DevContainer okruženje**: Unaprijed konfigurirani alati i ovisnosti  

#### 📚 Struktura radionice  
Radionica slijedi metodologiju **Otkrivanje → Implementacija → Prilagodba**:  

1. **Faza otkrivanja** (45 min)  
   - Istražite predloške i usluge Azure AI Foundry  
   - Razumite obrasce arhitekture s više agenata  
   - Pregledajte zahtjeve i preduvjete za implementaciju  

2. **Faza implementacije** (2 sata)  
   - Praktična implementacija AI aplikacija s AZD-om  
   - Konfigurirajte Azure AI usluge i krajnje točke  
   - Implementirajte sigurnosne obrasce i autentifikaciju  

3. **Faza prilagodbe** (45 min)  
   - Prilagodite aplikacije za specifične slučajeve korištenja  
   - Optimizirajte za produkcijsku implementaciju  
   - Implementirajte praćenje i upravljanje troškovima  

#### 🚀 Početak rada s radionicom  
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```
  
#### 🎯 Ishodi učenja radionice  
Nakon završetka radionice, sudionici će:  
- **Implementirati AI aplikacije za produkciju**: Koristiti AZD s Azure AI Foundry uslugama  
- **Savladati arhitekture s više agenata**: Implementirati koordinirana AI rješenja s agentima  
- **Primijeniti najbolje sigurnosne prakse**: Konfigurirati autentifikaciju i kontrolu pristupa  
- **Optimizirati za skaliranje**: Dizajnirati isplative i učinkovite implementacije  
- **Rješavati probleme pri implementaciji**: Samostalno otklanjati uobičajene poteškoće  

#### 📖 Resursi radionice  
- **🎥 Interaktivni vodič**: [Materijali za radionicu](workshop/README.md) - Okruženje za učenje u pregledniku  
- **📋 Upute korak po korak**: [Vođene vježbe](../../workshop/docs/instructions) - Detaljni vodiči  
- **🛠️ AI laboratorij radionice**: [AI laboratorij radionice](docs/ai-foundry/ai-workshop-lab.md) - Vježbe usmjerene na AI  
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okruženja  

**Idealno za**: Korporativne treninge, sveučilišne tečajeve, samostalno učenje i bootcampove za programere.  

---

## 📖 Što je Azure Developer CLI?  

Azure Developer CLI (azd) je sučelje naredbenog retka usmjereno na programere koje ubrzava proces izrade i implementacije aplikacija na Azure. Pruža:  

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene obrasce aplikacija  
- **Infrastruktura kao kod** - Upravljajte Azure resursima pomoću Bicep-a ili Terraform-a  
- **Integrirani tijekovi rada** - Besprijekorno osigurajte, implementirajte i pratite aplikacije  
- **Prilagođeno programerima** - Optimizirano za produktivnost i iskustvo programera  

### **AZD + Azure AI Foundry: Idealno za AI implementacije**  

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se suočavaju AI programeri:  

- **Predlošci spremni za AI** - Unaprijed konfigurirani predlošci za Azure OpenAI, Cognitive Services i ML radne opterećenja  
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i krajnje točke modela  
- **Obrasci za produkcijski AI** - Najbolje prakse za skalabilne i isplative implementacije AI aplikacija  
- **Tijekovi rada od kraja do kraja za AI** - Od razvoja modela do produkcijske implementacije uz odgovarajuće praćenje  
- **Optimizacija troškova** - Pametne strategije za dodjelu resursa i skaliranje AI radnih opterećenja  
- **Integracija s Azure AI Foundry** - Besprijekorna povezanost s katalogom modela i krajnjim točkama AI Foundry  

---

## 🎯 Biblioteka predložaka i primjera  

### Istaknuto: Predlošci Azure AI Foundry  
**Započnite ovdje ako implementirate AI aplikacije!**  

| Predložak | Poglavlje | Složenost | Usluge |  
|----------|---------|------------|----------|  
| [**Započnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Započnite s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Automatizacija tijeka rada s više agenata**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Generirajte dokumente iz svojih podataka**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Poboljšajte sastanke s klijentima uz agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Modernizirajte svoj kod uz agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Izgradite svog konverzacijskog agenta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Otključajte uvide iz konverzacijskih podataka**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Obrada sadržaja s više modaliteta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Istaknuto: Kompletni scenariji učenja  
**Predlošci aplikacija spremni za produkciju povezani s poglavljima učenja**  

| Predložak | Poglavlje učenja | Složenost | Ključna učenja |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci implementacije AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Implementacija RAG-a s Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija inteligencije dokumenata |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Okvir za agente i pozivanje funkcija |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI za poduzeća |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Arhitektura s više agenata za korisnike i inventar |  

### Učenje prema vrsti primjera  

#### Jednostavne aplikacije (Poglavlja 1-2)  
- [Jednostavna web aplikacija](../../examples/simple-web-app) - Osnovni obrasci implementacije  
- [Statistička web stranica](../../examples/static-site) - Implementacija statičnog sadržaja  
- [Osnovni API](../../examples/basic-api) - Implementacija REST API-ja  

#### Integracija baze podataka (Poglavlja 3-4)  
- [Aplikacija za bazu podataka](../../examples/database-app) - Obrasci povezivanja s bazom podataka  
- [Obrada podataka](../../examples/data-processing) - Implementacija ETL tijeka rada  

#### Napredni obrasci (Poglavlja 4-8)  
- [Aplikacije u kontejnerima](../../examples/container-app) - Implementacije u kontejnerima  
- [Mikroservisi](../../examples/microservices) - Arhitekture s više servisa  
- [Rješenja za poduzeća](../../examples/enterprise) - Obrasci spremni za produkciju  

### Vanjske kolekcije predložaka  
- [**Azure-Samples AZD predlošci**](https://github.com/Azure-Samples/azd-templates) - Službeni Microsoft primjeri  
- [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) - Predlošci koje je doprinijela zajednica  
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri učenja s detaljnim objašnjenjima  

---

## 📚 Resursi za učenje i reference  

### Brze reference  
- [**Popis naredbi**](resources/cheat-sheet.md) - Ključne azd naredbe organizirane po poglavljima  
- [**Pojmovnik**](resources/glossary.md) - Terminologija Azure-a i azd-a  
- [**Česta pitanja**](resources/faq.md) - Uobičajena pitanja organizirana po poglavljima učenja  
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatne praktične vježbe  

### Praktične radionice  
- [**AI laboratorij radionice**](docs/ai-foundry/ai-workshop-lab.md) - Učinite svoja AI rješenja spremnima za AZD implementaciju (2-3 sata)  
- [**Interaktivni vodič radionice**](workshop/README.md) - Radionica temeljena na pregledniku s MkDocs-om i DevContainer okruženjem  
- [**Strukturirani put učenja**](../../workshop/docs/instructions) - 7 koraka vođenih vježbi (Otkrivanje → Implementacija → Prilagodba)  
- [**Radionica za početnike s AZD-om**](workshop/README.md) - Kompletni materijali za radionicu s integracijom GitHub Codespaces-a  

### Vanjski resursi za učenje  
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centar za arhitekturu Azure-a](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kalkulator cijena Azure-a](https://azure.microsoft.com/pricing/calculator/)  
- [Status Azure-a](https://status.azure.com/)  

---

## 🎓 Završetak tečaja i certifikacija  

### Praćenje napretka  
Pratite svoj napredak kroz svako poglavlje:  

- [ ] **Poglavlje 1**: Osnove i brzi početak ✅  
- [ ] **Poglavlje 2**: Razvoj usmjeren na AI ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentifikacija ✅  
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅  
- [ ] **Poglavlje 5**: AI rješenja s više agenata ✅  
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅  
- [ ] **Poglavlje 7**: Rješavanje problema i otklanjanje grešaka ✅  
- [ ] **Poglavlje 8**: Obrasci za produkciju i poduzeća ✅  

### Verifikacija učenja  
Nakon završetka svakog poglavlja, provjerite svoje znanje:  
1. **Praktična vježba**: Završite praktičnu implementaciju poglavlja  
2. **Provjera znanja**: Pregledajte odjeljak Česta pitanja za svoje poglavlje  
3. **Diskusija u zajednici**: Podijelite svoje iskustvo na Azure Discord-u  
4. **Sljedeće poglavlje**: Prijeđite na sljedeću razinu složenosti  

### Prednosti završetka tečaja  
Nakon završetka svih poglavlja, imat ćete:  
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije na Azure  
- **Profesionalne vještine**: Sposobnosti implementacije spremne za poduzeća  
- **Prepoznatljivost u zajednici**: Aktivni član Azure zajednice programera  
- **Napredak u karijeri**: Tražene vještine za AZD i AI implementaciju  

---

## 🤝 Zajednica i podrška  

### Dobivanje pomoći i podrške  
- **Tehnički problemi**: [Prijavite greške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)  
- **Pitanja o učenju**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure)  
- **Pomoć specifična za AI**: Pridružite se [#Azure kanalu](https://discord.gg/microsoft-azure) za diskusije o AZD + AI Foundry  
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Uvidi iz zajednice na Azure AI Foundry Discord-u  

**Nedavni rezultati ankete iz #Azure kanala:**  
- **45%** programera želi koristiti AZD za AI radne opterećenja  
- **Glavni izazovi**: Implementacije s više servisa, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: Predlošci specifični za AI, vodiči za rješavanje problema, najbolje prakse  

**Pridružite se našoj zajednici kako biste:**  
- Podijelili svoja iskustva s AZD + AI i dobili pomoć  
- Pristupili ranim pregledima novih AI predložaka  
- Doprinijeli najboljim praksama za AI implementaciju  
- Utjecali na budući razvoj značajki za AI + AZD  

### Doprinos tečaju  
Pozdravljamo doprinose! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:  
- **Poboljšanjima sadržaja**: Unaprijedite postojeća poglavlja i primjere  
- **Novim primjerima**: Dodajte scenarije iz stvarnog svijeta i predloške  
- **Prijevodu**: Pomozite u održavanju podrške za više jezika  
- **Prijavi grešaka**: Poboljšajte točnost i jasnoću  
- **Standardima zajednice**: Slijedite naše inkluzivne smjernice zajednice  

---

## 📄 Informacije o tečaju  

### Lic
### Povezani Microsoftovi resursi za učenje

Naš tim nudi i druge sveobuhvatne tečajeve za učenje:

- [Model Context Protocol (MCP) za početnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI agenti za početnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativna umjetna inteligencija za početnike koristeći .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativna umjetna inteligencija za početnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativna umjetna inteligencija za početnike koristeći Javu](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [Strojno učenje za početnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science za početnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [Umjetna inteligencija za početnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kibernetička sigurnost za početnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web razvoj za početnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT za početnike](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR razvoj za početnike](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Savladavanje GitHub Copilota za AI programiranje u paru](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Savladavanje GitHub Copilota za C#/.NET programere](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Odaberi svoju vlastitu Copilot avanturu](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigacija kroz tečaj

**🚀 Spremni za početak učenja?**

**Početnici**: Započnite s [Poglavlje 1: Osnove i brzi početak](../..)  
**AI programeri**: Preskočite na [Poglavlje 2: Razvoj s fokusom na AI](../..)  
**Iskusni programeri**: Započnite s [Poglavlje 3: Konfiguracija i autentifikacija](../..)

**Sljedeći koraci**: [Započnite Poglavlje 1 - Osnove AZD-a](docs/getting-started/azd-basics.md) →

---


<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T22:38:07+00:00",
  "source_file": "README.md",
  "language_code": "hr"
}
-->
# AZD Za Početnike

![AZD-za-početnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

Slijedite ove korake kako biste započeli s korištenjem ovih resursa:
1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte repozitorij**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Pridružite se Azure Discord zajednicama i upoznajte stručnjake i kolege developere**](https://discord.com/invite/ByRwuEEgH4)

### Podrška za više jezika

#### Podržano putem GitHub Action (Automatizirano i uvijek ažurirano)

[Francuski](../fr/README.md) | [Španjolski](../es/README.md) | [Njemački](../de/README.md) | [Ruski](../ru/README.md) | [Arapski](../ar/README.md) | [Perzijski (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kineski (pojednostavljeni)](../zh/README.md) | [Kineski (tradicionalni, Macau)](../mo/README.md) | [Kineski (tradicionalni, Hong Kong)](../hk/README.md) | [Kineski (tradicionalni, Tajvan)](../tw/README.md) | [Japanski](../ja/README.md) | [Korejski](../ko/README.md) | [Hindski](../hi/README.md) | [Bengalski](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugalski (Portugal)](../pt/README.md) | [Portugalski (Brazil)](../br/README.md) | [Talijanski](../it/README.md) | [Poljski](../pl/README.md) | [Turski](../tr/README.md) | [Grčki](../el/README.md) | [Tajlandski](../th/README.md) | [Švedski](../sv/README.md) | [Danski](../da/README.md) | [Norveški](../no/README.md) | [Finski](../fi/README.md) | [Nizozemski](../nl/README.md) | [Hebrejski](../he/README.md) | [Vijetnamski](../vi/README.md) | [Indonezijski](../id/README.md) | [Malajski](../ms/README.md) | [Tagalog (Filipinski)](../tl/README.md) | [Svahili](../sw/README.md) | [Mađarski](../hu/README.md) | [Češki](../cs/README.md) | [Slovački](../sk/README.md) | [Rumunjski](../ro/README.md) | [Bugarski](../bg/README.md) | [Srpski (ćirilica)](../sr/README.md) | [Hrvatski](./README.md) | [Slovenski](../sl/README.md) | [Ukrajinski](../uk/README.md) | [Burmanski (Myanmar)](../my/README.md)

**Ako želite dodati dodatne jezike, podržani jezici navedeni su [ovdje](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Uvod

Dobrodošli u sveobuhvatan vodič za Azure Developer CLI (azd). Ovaj repozitorij osmišljen je kako bi pomogao developerima svih razina, od studenata do profesionalaca, da nauče i usavrše Azure Developer CLI za učinkovite implementacije u oblaku, **s posebnim naglaskom na implementaciju AI aplikacija koristeći Azure AI Foundry**. Ovaj strukturirani resurs za učenje pruža praktično iskustvo s implementacijama u Azure oblaku, rješavanjem uobičajenih problema i primjenom najboljih praksi za uspješne implementacije AZD predložaka.

### **Zašto je ovaj vodič važan za AI developere**
Prema nedavnoj anketi u Azure AI Foundry Discord zajednici, **45% developera zainteresirano je za korištenje AZD-a za AI radna opterećenja**, ali se suočavaju s izazovima kao što su:
- Složene AI arhitekture s više usluga
- Najbolje prakse za implementaciju AI u produkciji
- Integracija i konfiguracija Azure AI usluga
- Optimizacija troškova za AI radna opterećenja
- Rješavanje problema specifičnih za AI implementacije

## Ciljevi učenja

Radom kroz ovaj repozitorij, naučit ćete:
- Osnove i ključne koncepte Azure Developer CLI-a
- Kako implementirati i osigurati Azure resurse koristeći Infrastructure as Code
- Razviti vještine rješavanja problema za uobičajene AZD implementacijske izazove
- Razumjeti provjere prije implementacije i planiranje kapaciteta
- Primijeniti sigurnosne najbolje prakse i strategije optimizacije troškova
- Steći samopouzdanje u implementaciji aplikacija spremnih za produkciju na Azure

## Ishodi učenja

Nakon završetka ovog tečaja, moći ćete:
- Uspješno instalirati, konfigurirati i koristiti Azure Developer CLI
- Kreirati i implementirati aplikacije koristeći AZD predloške
- Rješavati probleme s autentifikacijom, infrastrukturom i implementacijom
- Provoditi provjere prije implementacije, uključujući planiranje kapaciteta i odabir SKU-a
- Primijeniti najbolje prakse za praćenje, sigurnost i upravljanje troškovima
- Integrirati AZD radne tokove u CI/CD pipeline

## Sadržaj

- [Što je Azure Developer CLI?](../..)
- [Brzi početak](../..)
- [Put učenja](../..)
  - [Za AI developere (Preporučeni početak ovdje!)](../..)
  - [Za studente i početnike](../..)
  - [Za developere](../..)
  - [Za DevOps inženjere](../..)
- [Dokumentacija](../..)
  - [Početak rada](../..)
  - [Implementacija i osiguranje](../..)
  - [Provjere prije implementacije](../..)
  - [AI i Azure AI Foundry](../..)
  - [Rješavanje problema](../..)
- [Primjeri i predlošci](../..)
  - [Istaknuto: Azure AI Foundry predlošci](../..)
  - [Istaknuto: Azure AI Foundry E2E scenariji](../..)
  - [Dodatni AZD predlošci](../..)
  - [Praktične radionice i laboratoriji](../..)
- [Resursi](../..)
- [Doprinos](../..)
- [Podrška](../..)
- [Zajednica](../..)

## Što je Azure Developer CLI?

Azure Developer CLI (azd) je sučelje naredbenog retka usmjereno na developere koje ubrzava proces izgradnje i implementacije aplikacija na Azure. Pruža:

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene aplikacijske obrasce
- **Infrastructure as Code** - Upravljajte Azure resursima koristeći Bicep ili Terraform
- **Integrirani radni tokovi** - Jednostavno osigurajte, implementirajte i pratite aplikacije
- **Prilagođeno developerima** - Optimizirano za produktivnost i iskustvo developera

### **AZD + Azure AI Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se AI developeri suočavaju:

- **Predlošci spremni za AI** - Unaprijed konfigurirani predlošci za Azure OpenAI, Cognitive Services i ML radna opterećenja
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i krajnje točke modela
- **Obrasci za AI u produkciji** - Najbolje prakse za skalabilne i isplative AI aplikacijske implementacije
- **End-to-End AI radni tokovi** - Od razvoja modela do produkcijske implementacije uz odgovarajuće praćenje
- **Optimizacija troškova** - Pametne strategije dodjele resursa i skaliranja za AI radna opterećenja
- **Integracija s Azure AI Foundry** - Jednostavno povezivanje s katalogom modela i krajnjim točkama AI Foundry

## Brzi početak

### Preduvjeti
- Azure pretplata
- Instaliran Azure CLI
- Git (za kloniranje predložaka)

### Instalacija
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaša prva implementacija
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Vaša prva AI implementacija
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Put učenja

### Za AI developere (Preporučeni početak ovdje!)
1. **Brzi početak**: Isprobajte [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) predložak
2. **Naučite osnove**: [AZD Osnove](docs/getting-started/azd-basics.md) + [Integracija s Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Praktična vježba**: Završite [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **Spremno za produkciju**: Pregledajte [Najbolje prakse za AI u produkciji](docs/ai-foundry/production-ai-practices.md)
5. **Napredno**: Implementirajte [contoso-chat](https://github.com/Azure-Samples/contoso-chat) predložak za poduzeća

### Za studente i početnike
1. Započnite s [AZD Osnove](docs/getting-started/azd-basics.md)
2. Slijedite [Vodič za instalaciju](docs/getting-started/installation.md)
3. Završite [Vaš prvi projekt](docs/getting-started/first-project.md)
4. Vježbajte s [Jednostavnim primjerom web aplikacije](../../examples/simple-web-app)

### Za developere
1. Pregledajte [Vodič za konfiguraciju](docs/getting-started/configuration.md)
2. Proučite [Vodič za implementaciju](docs/deployment/deployment-guide.md)
3. Radite na [Primjeru aplikacije s bazom podataka](../../examples/database-app)
4. Istražite [Primjer aplikacije s kontejnerima](../../examples/container-app)

### Za DevOps inženjere
1. Savladajte [Osiguranje resursa](docs/deployment/provisioning.md)
2. Implementirajte [Provjere prije implementacije](docs/pre-deployment/preflight-checks.md)
3. Vježbajte [Planiranje kapaciteta](docs/pre-deployment/capacity-planning.md)
4. Napredno [Primjer mikroservisa](../../examples/microservices)

## Dokumentacija

### Početak rada
- [**AZD Osnove**](docs/getting-started/azd-basics.md) - Ključni koncepti i terminologija
- [**Instalacija i postavljanje**](docs/getting-started/installation.md) - Vodiči za instalaciju specifični za platformu
- [**Konfiguracija**](docs/getting-started/configuration.md) - Postavljanje okruženja i autentifikacija
- [**Vaš prvi projekt**](docs/getting-started/first-project.md) - Korak-po-korak vodič

### Implementacija i osiguranje
- [**Vodič za implementaciju**](docs/deployment/deployment-guide.md) - Kompletni radni tokovi implementacije
- [**Osiguranje resursa**](docs/deployment/provisioning.md) - Upravljanje Azure resursima

### Provjere prije implementacije
- [**Planiranje kapaciteta**](docs/pre-deployment/capacity-planning.md) - Validacija kapaciteta Azure resursa
- [**Odabir SKU-a**](docs/pre-deployment/sku-selection.md) - Odabir pravih Azure SKU-ova
- [**Provjere prije implementacije**](docs/pre-deployment/preflight-checks.md) - Automatizirani validacijski skripti

### AI i Azure AI Foundry
- [**Integracija s Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Povezivanje AZD-a s Azure AI Foundry uslugama
- [**Obrasci za implementaciju AI modela**](docs/ai-foundry/ai-model-deployment.md) - Implementacija i upravljanje AI modelima s AZD-om
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Praktični laboratorij: Priprema AI rješenja za AZD
- [**Najbolje prakse za AI u produkciji**](docs/ai-foundry/production-ai-practices.md) - Sigurnost, skaliranje i praćenje za AI radna opterećenja

### Rješavanje problema
- [**Uobičajeni problemi**](docs/troubleshooting/common-issues.md) - Često susretani problemi i rješenja
- [**Vodič za otklanjanje pogrešaka**](docs/troubleshooting/debugging.md) - Strategije otklanjanja pogrešaka korak po korak  
- [**Otklanjanje problema specifičnih za AI**](docs/troubleshooting/ai-troubleshooting.md) - Problemi s AI uslugama i implementacijom modela  

## Primjeri i predlošci  

### [Istaknuto: Predlošci Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**Započnite ovdje ako implementirate AI aplikacije!**  

| Predložak | Opis | Složenost | Usluge |  
|----------|-------------|------------|----------|  
| [**Započnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kreirajte i implementirajte osnovnu aplikaciju za chat integriranu s vašim podacima i uvidima u telemetriju koristeći Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Započnite s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kreirajte i implementirajte osnovnu aplikaciju agenta s akcijama i uvidima u telemetriju koristeći Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Automatizacija radnih tijekova s više agenata**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poboljšajte planiranje zadataka i automatizaciju orkestriranjem i upravljanjem grupom AI agenata.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Generiranje dokumenata iz vaših podataka**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Ubrzajte generiranje dokumenata poput ugovora, računa i prijedloga za ulaganje pronalaženjem i sažimanjem relevantnih informacija iz vaših podataka. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Poboljšajte sastanke s klijentima uz agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Migrirajte zastarjeli kod na moderne jezike koristeći tim agenata. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Modernizirajte svoj kod uz agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kreirajte i implementirajte osnovnu aplikaciju za chat integriranu s vašim podacima i uvidima u telemetriju koristeći Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Izgradite svog konverzacijskog agenta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Iskoristite napredno razumijevanje konverzacija za kreiranje i poboljšanje chatbotova i agenata s determinističkim i kontroliranim radnim tijekovima. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Otključajte uvide iz konverzacijskih podataka**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poboljšajte učinkovitost kontakt centara otkrivanjem uvida iz velikih audio i tekstualnih skupova podataka koristeći napredne mogućnosti razumijevanja sadržaja. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Obrada sadržaja s više modaliteta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Brzo i precizno obradite zahtjeve, račune, ugovore i druge dokumente izvlačenjem informacija iz nestrukturiranog sadržaja i mapiranjem u strukturirani format. Ovaj predložak podržava tekst, slike, tablice i grafikone. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Istaknuto: Azure AI Foundry E2E Scenariji  
**Započnite ovdje ako implementirate AI aplikacije!**  

| Predložak | Opis | Složenost | Usluge |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Jednostavno sučelje za chat s Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat aplikacija s RAG podrškom i Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Analiza dokumenata s AI uslugama | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI agent framework s pozivanjem funkcija | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Enterprise chat s AI orkestracijom | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Dodatni AZD predlošci  
- [**Direktorij primjera**](examples/README.md) - Praktični primjeri, predlošci i scenariji iz stvarnog svijeta  
- [**Azure-Samples AZD predlošci**](https://github.com/Azure-Samples/azd-templates) - Službeni Microsoft predlošci  
- [**Galerija Awesome AZD**](https://azure.github.io/awesome-azd/) - Predlošci koje je doprinijela zajednica  

### Praktične radionice i laboratoriji  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **NOVO**: Učinite svoje AI rješenja spremnima za AZD implementaciju  
- [**AZD Radionica za početnike**](workshop/README.md) - Fokus na implementaciju AZD predložaka za AI agente  

## Resursi  

### Brzi referentni materijali  
- [**Popis naredbi**](resources/cheat-sheet.md) - Osnovne azd naredbe  
- [**Pojmovnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**FAQ**](resources/faq.md) - Često postavljana pitanja  
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatni ciljevi učenja i vježbe  

### Vanjski resursi  
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Doprinos  

Pozdravljamo doprinose! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:  
- Kako prijaviti probleme i predložiti značajke  
- Smjernice za doprinos kodu  
- Poboljšanja dokumentacije  
- Standardi zajednice  

## Podrška  

- **Problemi**: [Prijavite greške i predložite značajke](https://github.com/microsoft/azd-for-beginners/issues)  
- **Diskusije**: [Microsoft Azure Discord zajednica za pitanja i diskusije](https://discord.gg/microsoft-azure)  
- **Podrška specifična za AI**: Pridružite se [#Azure kanalu](https://discord.gg/microsoft-azure) za diskusije o AZD + AI Foundry  
- **Email**: Za privatne upite  
- **Microsoft Learn**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Uvidi zajednice iz Azure AI Foundry Discorda  

**Rezultati ankete iz #Azure kanala:**  
- **45%** developera želi koristiti AZD za AI radna opterećenja  
- **Glavni izazovi**: Implementacija više usluga, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: Predlošci specifični za AI, vodiči za otklanjanje problema, najbolje prakse  

**Pridružite se našoj zajednici kako biste:**  
- Podijelili svoja iskustva s AZD + AI i dobili pomoć  
- Pristupili ranim pregledima novih AI predložaka  
- Doprinijeli najboljim praksama za implementaciju AI  
- Utjecali na budući razvoj značajki za AI + AZD  

## Licenca  

Ovaj projekt je licenciran pod MIT licencom - pogledajte [LICENSE](../../LICENSE) datoteku za detalje.  

## Ostali tečajevi  

Naš tim proizvodi i druge tečajeve! Pogledajte:  

- [**NOVO** Model Context Protocol (MCP) za početnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agenti za početnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativni AI za početnike koristeći .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generativni AI za početnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativni AI za početnike koristeći Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML za početnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science za početnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI za početnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity za početnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web razvoj za početnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT za početnike](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR razvoj za početnike](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Savladavanje GitHub Copilot za AI programiranje u paru](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Savladavanje GitHub Copilot za C#/.NET developere](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Izaberite svoju vlastitu Copilot avanturu](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navigacija**  
- **Sljedeća lekcija**: [Osnove AZD-a](docs/getting-started/azd-basics.md)  

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
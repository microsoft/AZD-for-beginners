<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:30:13+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# AZD Pre Začiatočníkov

![AZD-pre-začiatočníkov](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sk.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Postupujte podľa týchto krokov, aby ste začali používať tieto zdroje:
1. **Forknite repozitár**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte repozitár**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Pripojte sa k Azure Discord komunitám a stretnite sa s odborníkmi a ďalšími vývojármi**](https://discord.com/invite/ByRwuEEgH4)

### Podpora Viacerých Jazykov

#### Podporované cez GitHub Action (Automatizované & Vždy Aktuálne)

[Francúzština](../fr/README.md) | [Španielčina](../es/README.md) | [Nemčina](../de/README.md) | [Ruština](../ru/README.md) | [Arabčina](../ar/README.md) | [Perzština (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradičná, Macao)](../mo/README.md) | [Čínština (tradičná, Hongkong)](../hk/README.md) | [Čínština (tradičná, Taiwan)](../tw/README.md) | [Japončina](../ja/README.md) | [Kórejčina](../ko/README.md) | [Hindčina](../hi/README.md) | [Bengálčina](../bn/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Portugalčina (Portugalsko)](../pt/README.md) | [Portugalčina (Brazília)](../br/README.md) | [Taliančina](../it/README.md) | [Poľština](../pl/README.md) | [Turečtina](../tr/README.md) | [Gréčtina](../el/README.md) | [Thajčina](../th/README.md) | [Švédčina](../sv/README.md) | [Dánčina](../da/README.md) | [Nórčina](../no/README.md) | [Fínčina](../fi/README.md) | [Holandčina](../nl/README.md) | [Hebrejčina](../he/README.md) | [Vietnamčina](../vi/README.md) | [Indonézština](../id/README.md) | [Malajčina](../ms/README.md) | [Tagalog (Filipínčina)](../tl/README.md) | [Swahilčina](../sw/README.md) | [Maďarčina](../hu/README.md) | [Čeština](../cs/README.md) | [Slovenčina](./README.md) | [Rumunčina](../ro/README.md) | [Bulharčina](../bg/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Chorvátčina](../hr/README.md) | [Slovinčina](../sl/README.md) | [Ukrajinčina](../uk/README.md) | [Barmčina (Mjanmarsko)](../my/README.md)

**Ak chcete podporu ďalších jazykov, zoznam podporovaných jazykov nájdete [tu](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Úvod

Vitajte v komplexnom sprievodcovi pre Azure Developer CLI (azd). Tento repozitár je navrhnutý tak, aby pomohol vývojárom na všetkých úrovniach, od študentov po profesionálnych vývojárov, naučiť sa a zvládnuť Azure Developer CLI pre efektívne nasadenie do cloudu, **s osobitným zameraním na nasadenie AI aplikácií pomocou Azure AI Foundry**. Táto štruktúrovaná vzdelávacia pomôcka poskytuje praktické skúsenosti s nasadením do Azure cloudu, riešením bežných problémov a implementáciou osvedčených postupov pre úspešné nasadenie AZD šablón.

### **Prečo je tento sprievodca dôležitý pre AI vývojárov**
Na základe nedávneho prieskumu v Azure AI Foundry Discord komunite, **45% vývojárov má záujem používať AZD pre AI pracovné zaťaženia**, ale čelí výzvam ako:
- Komplexné AI architektúry s viacerými službami
- Osvedčené postupy pre nasadenie AI do produkcie
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov na AI pracovné zaťaženia
- Riešenie problémov špecifických pre nasadenie AI

## Ciele učenia

Prácou s týmto repozitárom sa naučíte:
- Zvládnuť základy a hlavné koncepty Azure Developer CLI
- Naučiť sa nasadzovať a poskytovať Azure zdroje pomocou Infrastructure as Code
- Rozvíjať schopnosti riešiť bežné problémy pri nasadení AZD
- Pochopiť validáciu pred nasadením a plánovanie kapacity
- Implementovať osvedčené postupy pre bezpečnosť a optimalizáciu nákladov
- Získať istotu pri nasadzovaní aplikácií pripravených na produkciu do Azure

## Výsledky učenia

Po dokončení tohto kurzu budete schopní:
- Úspešne nainštalovať, nakonfigurovať a používať Azure Developer CLI
- Vytvárať a nasadzovať aplikácie pomocou AZD šablón
- Riešiť problémy s autentifikáciou, infraštruktúrou a nasadením
- Vykonávať kontroly pred nasadením vrátane plánovania kapacity a výberu SKU
- Implementovať osvedčené postupy pre monitorovanie, bezpečnosť a správu nákladov
- Integrovať AZD pracovné postupy do CI/CD pipeline

## Obsah

- [Čo je Azure Developer CLI?](../..)
- [Rýchly Štart](../..)
- [Vzdelávacia Cesta](../..)
  - [Pre AI Vývojárov (Odporúčané Začať Tu!)](../..)
  - [Pre Študentov & Začiatočníkov](../..)
  - [Pre Vývojárov](../..)
  - [Pre DevOps Inžinierov](../..)
- [Dokumentácia](../..)
  - [Začíname](../..)
  - [Nasadenie & Poskytovanie](../..)
  - [Kontroly Pred Nasadením](../..)
  - [AI & Azure AI Foundry](../..)
  - [Riešenie Problémov](../..)
- [Príklady & Šablóny](../..)
  - [Odporúčané: Azure AI Foundry Šablóny](../..)
  - [Odporúčané: Azure AI Foundry E2E Scenáre](../..)
  - [Ďalšie AZD Šablóny](../..)
  - [Praktické Cvičenia & Workshopy](../..)
- [Zdroje](../..)
- [Prispievanie](../..)
- [Podpora](../..)
- [Komunita](../..)

## Čo je Azure Developer CLI?

Azure Developer CLI (azd) je príkazový riadok zameraný na vývojárov, ktorý urýchľuje proces budovania a nasadzovania aplikácií do Azure. Poskytuje:

- **Nasadenie na základe šablón** - Používajte predpripravené šablóny pre bežné aplikačné vzory
- **Infrastructure as Code** - Spravujte Azure zdroje pomocou Bicep alebo Terraform
- **Integrované pracovné postupy** - Bezproblémové poskytovanie, nasadzovanie a monitorovanie aplikácií
- **Prívetivé pre vývojárov** - Optimalizované pre produktivitu a skúsenosti vývojárov

### **AZD + Azure AI Foundry: Ideálne pre AI Nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia AI vývojári:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Azure OpenAI, Cognitive Services a ML pracovné zaťaženia
- **Bezpečné AI Nasadenia** - Zabudované bezpečnostné vzory pre AI služby, API kľúče a modelové endpointy
- **Produkčné AI Vzory** - Osvedčené postupy pre škálovateľné a nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI Pracovné Postupy** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia Nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI pracovné zaťaženia
- **Integrácia s Azure AI Foundry** - Bezproblémové prepojenie s modelovým katalógom a endpointmi AI Foundry

## Rýchly Štart

### Predpoklady
- Azure predplatné
- Nainštalovaný Azure CLI
- Git (na klonovanie šablón)

### Inštalácia
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaše Prvé Nasadenie
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Vaše Prvé AI Nasadenie
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

## Vzdelávacia Cesta

### Pre AI Vývojárov (Odporúčané Začať Tu!)
1. **Rýchly Štart**: Vyskúšajte [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šablónu
2. **Naučte sa Základy**: [AZD Základy](docs/getting-started/azd-basics.md) + [Integrácia Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Praktické Cvičenie**: Dokončite [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **Pripravené na Produkciu**: Preštudujte [Osvedčené Postupy pre Produkčné AI](docs/ai-foundry/production-ai-practices.md)
5. **Pokročilé**: Nasadzujte [contoso-chat](https://github.com/Azure-Samples/contoso-chat) podnikové šablóny

### Pre Študentov & Začiatočníkov
1. Začnite s [AZD Základy](docs/getting-started/azd-basics.md)
2. Postupujte podľa [Inštalačného Sprievodcu](docs/getting-started/installation.md)
3. Dokončite [Váš Prvý Projekt](docs/getting-started/first-project.md)
4. Precvičte si [Jednoduchý Webový Aplikácia Príklad](../../examples/simple-web-app)

### Pre Vývojárov
1. Preštudujte si [Konfiguračný Sprievodca](docs/getting-started/configuration.md)
2. Preskúmajte [Sprievodca Nasadením](docs/deployment/deployment-guide.md)
3. Pracujte na [Príklade Databázovej Aplikácie](../../examples/database-app)
4. Preskúmajte [Príklad Kontajnerovej Aplikácie](../../examples/container-app)

### Pre DevOps Inžinierov
1. Zvládnite [Poskytovanie Zdroje](docs/deployment/provisioning.md)
2. Implementujte [Kontroly Pred Nasadením](docs/pre-deployment/preflight-checks.md)
3. Precvičte si [Plánovanie Kapacity](docs/pre-deployment/capacity-planning.md)
4. Pokročilé [Príklad Mikroservisov](../../examples/microservices)

## Dokumentácia

### Začíname
- [**AZD Základy**](docs/getting-started/azd-basics.md) - Hlavné koncepty a terminológia
- [**Inštalácia & Nastavenie**](docs/getting-started/installation.md) - Platformovo špecifické inštalačné sprievodce
- [**Konfigurácia**](docs/getting-started/configuration.md) - Nastavenie prostredia a autentifikácia
- [**Váš Prvý Projekt**](docs/getting-started/first-project.md) - Krok za krokom tutoriál

### Nasadenie & Poskytovanie
- [**Sprievodca Nasadením**](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy nasadenia
- [**Poskytovanie Zdroje**](docs/deployment/provisioning.md) - Správa Azure zdrojov

### Kontroly Pred Nasadením
- [**Plánovanie Kapacity**](docs/pre-deployment/capacity-planning.md) - Validácia kapacity Azure zdrojov
- [**Výber SKU**](docs/pre-deployment/sku-selection.md) - Výber správnych SKU pre Azure
- [**Kontroly Pred Nasadením**](docs/pre-deployment/preflight-checks.md) - Automatizované validačné skripty

### AI & Azure AI Foundry
- [**Integrácia Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Prepojenie AZD s Azure AI Foundry službami
- [**Vzory Nasadenia AI Modelov**](docs/ai-foundry/ai-model-deployment.md) - Nasadzovanie a správa AI modelov pomocou AZD
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Praktické cvičenie: Príprava AI riešení na AZD
- [**Osvedčené Postupy pre Produkčné AI**](docs/ai-foundry/production-ai-practices.md) - Bezpečnosť, škálovanie a monitorovanie AI pracovných zaťažení

### Riešenie Problémov
- [**Bežné Problémy**](docs/troubleshooting/common-issues.md) - Často sa vyskytujúce problémy a ich riešenia
- [**Príručka na ladenie**](docs/troubleshooting/debugging.md) - Krok za krokom stratégie ladenia
- [**Riešenie problémov špecifických pre AI**](docs/troubleshooting/ai-troubleshooting.md) - Problémy s nasadením AI služieb a modelov

## Príklady a šablóny

### [Odporúčané: Šablóny Azure AI Foundry](https://ai.azure.com/resource/build/templates)
**Začnite tu, ak nasadzujete AI aplikácie!**

| Šablóna | Popis | Zložitosť | Služby |
|----------|-------------|------------|----------|
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Vytvorte a nasadte základnú chatovaciu aplikáciu integrovanú s vašimi dátami a telemetrickými informáciami pomocou Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Vytvorte a nasadte základnú aplikáciu agenta s akciami a telemetrickými informáciami pomocou Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatizácia pracovných postupov s viacerými agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Zlepšite plánovanie úloh a automatizáciu orchestráciou a správou skupiny AI agentov.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generovanie dokumentov z vašich dát**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Urýchlite generovanie dokumentov, ako sú zmluvy, faktúry a investičné návrhy, vyhľadávaním a sumarizáciou relevantných informácií z vašich dát. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Zlepšenie klientskych stretnutí s agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Migrujte zastaraný kód na moderné jazyky využitím tímu agentov. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizácia vášho kódu s agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Vytvorte a nasadte základnú chatovaciu aplikáciu integrovanú s vašimi dátami a telemetrickými informáciami pomocou Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Vytvorte svoj konverzačný agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Využite pokročilé porozumenie konverzáciám na vytvorenie a zlepšenie chatbotov a agentov s deterministickými a ľudsky kontrolovateľnými pracovnými postupmi. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Odomknite poznatky z konverzačných dát**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Zlepšite efektivitu kontaktného centra odhaľovaním poznatkov z veľkých audio a textových dátových súborov pomocou pokročilých schopností porozumenia obsahu. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multimodálne spracovanie obsahu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rýchlo a presne spracujte nároky, faktúry, zmluvy a ďalšie dokumenty extrahovaním informácií z neštruktúrovaného obsahu a ich mapovaním na štruktúrovaný formát. Táto šablóna podporuje text, obrázky, tabuľky a grafy. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Odporúčané: Scenáre Azure AI Foundry E2E
**Začnite tu, ak nasadzujete AI aplikácie!**

| Šablóna | Popis | Zložitosť | Služby |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Jednoduché chatovacie rozhranie s Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chatová aplikácia s RAG podporou a Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Analýza dokumentov pomocou AI služieb | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rámec AI agenta s volaním funkcií | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Podnikový chat s AI orchestráciou | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### Ďalšie AZD šablóny
- [**Adresár príkladov**](examples/README.md) - Praktické príklady, šablóny a scenáre z reálneho sveta
- [**Azure-Samples AZD šablóny**](https://github.com/Azure-Samples/azd-templates) - Oficiálne šablóny od Microsoftu  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Šablóny prispievané komunitou

### Praktické laboratóriá a workshopy
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **NOVÉ**: Urobte vaše AI riešenia nasaditeľné pomocou AZD
- [**Workshop AZD pre začiatočníkov**](workshop/README.md) - Zameranie na nasadenie šablón AI agentov pomocou AZD

## Zdroje

### Rýchle odkazy
- [**Príručka príkazov**](resources/cheat-sheet.md) - Základné príkazy azd
- [**Slovník pojmov**](resources/glossary.md) - Terminológia Azure a azd
- [**FAQ**](resources/faq.md) - Často kladené otázky
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné učebné ciele a praktické cvičenia

### Externé zdroje
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cien Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

## Prispievanie

Radi privítame vaše príspevky! Prečítajte si našu [Príručku prispievania](CONTRIBUTING.md) pre podrobnosti o:
- Ako nahlásiť problémy a požiadavky na funkcie
- Pokyny na prispievanie kódu
- Zlepšenia dokumentácie
- Štandardy komunity

## Podpora

- **Problémy**: [Nahláste chyby a požiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskusie**: [Komunita Microsoft Azure na Discorde - otázky a diskusie](https://discord.gg/microsoft-azure)
- **Podpora špecifická pre AI**: Pripojte sa k [#Azure kanálu](https://discord.gg/microsoft-azure) pre diskusie o AZD + AI Foundry
- **Email**: Pre súkromné otázky
- **Microsoft Learn**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Discordu Azure AI Foundry

**Výsledky ankety z #Azure kanálu:**
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže
- **Najväčšie výzvy**: Nasadenie viacerých služieb, správa poverení, pripravenosť na produkciu
- **Najviac požadované**: Šablóny špecifické pre AI, príručky na riešenie problémov, osvedčené postupy

**Pripojte sa k našej komunite, aby ste:**
- Zdieľali svoje skúsenosti s AZD + AI a získali pomoc
- Mali prístup k skorým náhľadom nových AI šablón
- Prispievali k osvedčeným postupom nasadenia AI
- Ovplyvňovali budúci vývoj funkcií AI + AZD

## Licencia

Tento projekt je licencovaný pod licenciou MIT - podrobnosti nájdete v súbore [LICENSE](../../LICENSE).

## Ďalšie kurzy

Náš tím vytvára aj ďalšie kurzy! Pozrite si:

- [**NOVÉ** Protokol kontextu modelu (MCP) pre začiatočníkov](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI agenti pre začiatočníkov](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI pre začiatočníkov pomocou .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI pre začiatočníkov](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI pre začiatočníkov pomocou Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML pre začiatočníkov](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science pre začiatočníkov](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI pre začiatočníkov](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kybernetická bezpečnosť pre začiatočníkov](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webový vývoj pre začiatočníkov](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT pre začiatočníkov](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Vývoj XR pre začiatočníkov](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre AI párové programovanie](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre vývojárov C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Vyberte si vlastné dobrodružstvo s Copilotom](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigácia**
- **Ďalšia lekcia**: [Základy AZD](docs/getting-started/azd-basics.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
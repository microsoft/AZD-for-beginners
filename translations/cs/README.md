<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:28:55+00:00",
  "source_file": "README.md",
  "language_code": "cs"
}
-->
# AZD pro začátečníky

![AZD-pro-začátečníky](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.cs.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Postupujte podle těchto kroků, abyste mohli začít používat tyto zdroje:
1. **Forkněte repozitář**: Klikněte [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte repozitář**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Připojte se k Azure Discord komunitám a setkejte se s experty a dalšími vývojáři**](https://discord.com/invite/ByRwuEEgH4)

### Podpora více jazyků

#### Podporováno prostřednictvím GitHub Action (Automatizované & vždy aktuální)

[Francouzština](../fr/README.md) | [Španělština](../es/README.md) | [Němčina](../de/README.md) | [Ruština](../ru/README.md) | [Arabština](../ar/README.md) | [Perština (Fársí)](../fa/README.md) | [Urdu](../ur/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradiční, Macao)](../mo/README.md) | [Čínština (tradiční, Hongkong)](../hk/README.md) | [Čínština (tradiční, Tchaj-wan)](../tw/README.md) | [Japonština](../ja/README.md) | [Korejština](../ko/README.md) | [Hindština](../hi/README.md) | [Bengálština](../bn/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Paňdžábština (Gurmukhi)](../pa/README.md) | [Portugalština (Portugalsko)](../pt/README.md) | [Portugalština (Brazílie)](../br/README.md) | [Italština](../it/README.md) | [Polština](../pl/README.md) | [Turečtina](../tr/README.md) | [Řečtina](../el/README.md) | [Thajština](../th/README.md) | [Švédština](../sv/README.md) | [Dánština](../da/README.md) | [Norština](../no/README.md) | [Finština](../fi/README.md) | [Nizozemština](../nl/README.md) | [Hebrejština](../he/README.md) | [Vietnamština](../vi/README.md) | [Indonéština](../id/README.md) | [Malajština](../ms/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Svahilština](../sw/README.md) | [Maďarština](../hu/README.md) | [Čeština](./README.md) | [Slovenština](../sk/README.md) | [Rumunština](../ro/README.md) | [Bulharština](../bg/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Chorvatština](../hr/README.md) | [Slovinština](../sl/README.md) | [Ukrajinština](../uk/README.md) | [Barmština (Myanmar)](../my/README.md)

**Pokud si přejete přidat další překlady, seznam podporovaných jazyků najdete [zde](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Úvod

Vítejte v komplexním průvodci pro Azure Developer CLI (azd). Tento repozitář je navržen tak, aby pomohl vývojářům na všech úrovních, od studentů po profesionály, naučit se a zvládnout Azure Developer CLI pro efektivní nasazení do cloudu, **s důrazem na nasazení AI aplikací pomocí Azure AI Foundry**. Tento strukturovaný vzdělávací zdroj poskytuje praktické zkušenosti s nasazením do Azure cloudu, řešením běžných problémů a implementací osvědčených postupů pro úspěšné nasazení šablon AZD.

### **Proč je tento průvodce důležitý pro AI vývojáře**
Na základě nedávného průzkumu v komunitě Azure AI Foundry Discord, **45 % vývojářů má zájem používat AZD pro AI pracovní zátěže**, ale čelí výzvám jako:
- Složitá AI architektura zahrnující více služeb
- Osvědčené postupy pro nasazení AI do produkce
- Integrace a konfigurace Azure AI služeb
- Optimalizace nákladů na AI pracovní zátěže
- Řešení problémů specifických pro nasazení AI

## Cíle učení

Prací s tímto repozitářem se naučíte:
- Zvládnout základy a klíčové koncepty Azure Developer CLI
- Naučit se nasazovat a zřizovat Azure zdroje pomocí Infrastructure as Code
- Rozvíjet dovednosti v řešení běžných problémů při nasazení AZD
- Porozumět validaci před nasazením a plánování kapacity
- Implementovat osvědčené postupy v oblasti bezpečnosti a optimalizace nákladů
- Získat jistotu v nasazování aplikací připravených pro produkci na Azure

## Výsledky učení

Po dokončení tohoto kurzu budete schopni:
- Úspěšně nainstalovat, nakonfigurovat a používat Azure Developer CLI
- Vytvářet a nasazovat aplikace pomocí AZD šablon
- Řešit problémy s autentizací, infrastrukturou a nasazením
- Provádět kontroly před nasazením včetně plánování kapacity a výběru SKU
- Implementovat osvědčené postupy pro monitorování, bezpečnost a správu nákladů
- Integrovat pracovní postupy AZD do CI/CD pipeline

## Obsah

- [Co je Azure Developer CLI?](../..)
- [Rychlý start](../..)
- [Vzdělávací cesta](../..)
  - [Pro AI vývojáře (doporučený začátek)](../..)
  - [Pro studenty a začátečníky](../..)
  - [Pro vývojáře](../..)
  - [Pro DevOps inženýry](../..)
- [Dokumentace](../..)
  - [Začínáme](../..)
  - [Nasazení a zřizování](../..)
  - [Kontroly před nasazením](../..)
  - [AI a Azure AI Foundry](../..)
  - [Řešení problémů](../..)
- [Příklady a šablony](../..)
  - [Doporučené: Šablony Azure AI Foundry](../..)
  - [Doporučené: E2E scénáře Azure AI Foundry](../..)
  - [Další AZD šablony](../..)
  - [Praktické laboratoře a workshopy](../..)
- [Zdroje](../..)
- [Přispívání](../..)
- [Podpora](../..)
- [Komunita](../..)

## Co je Azure Developer CLI?

Azure Developer CLI (azd) je příkazový řádek zaměřený na vývojáře, který urychluje proces vytváření a nasazování aplikací na Azure. Nabízí:

- **Nasazení na základě šablon** - Použití předem připravených šablon pro běžné aplikační vzory
- **Infrastructure as Code** - Správa Azure zdrojů pomocí Bicep nebo Terraform
- **Integrované pracovní postupy** - Plynulé zřizování, nasazování a monitorování aplikací
- **Přátelské pro vývojáře** - Optimalizováno pro produktivitu a zkušenosti vývojářů

### **AZD + Azure AI Foundry: Ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým AI vývojáři čelí:

- **Šablony připravené pro AI** - Předkonfigurované šablony pro Azure OpenAI, Cognitive Services a ML pracovní zátěže
- **Bezpečné AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a modelové endpointy
- **Produkční AI vzory** - Osvědčené postupy pro škálovatelné a nákladově efektivní nasazení AI aplikací
- **End-to-End AI pracovní postupy** - Od vývoje modelu po produkční nasazení s odpovídajícím monitorováním
- **Optimalizace nákladů** - Chytré přidělování zdrojů a strategie škálování pro AI pracovní zátěže
- **Integrace Azure AI Foundry** - Plynulé propojení s katalogem modelů a endpointy AI Foundry

## Rychlý start

### Předpoklady
- Azure předplatné
- Nainstalovaný Azure CLI
- Git (pro klonování šablon)

### Instalace
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaše první nasazení
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Vaše první AI nasazení
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

## Vzdělávací cesta

### Pro AI vývojáře (doporučený začátek)
1. **Rychlý start**: Vyzkoušejte [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šablonu
2. **Naučte se základy**: [AZD základy](docs/getting-started/azd-basics.md) + [Integrace Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Praktická cvičení**: Dokončete [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **Připraveno pro produkci**: Projděte si [Osvědčené postupy pro produkční AI](docs/ai-foundry/production-ai-practices.md)
5. **Pokročilé**: Nasazení [contoso-chat](https://github.com/Azure-Samples/contoso-chat) šablony pro podnikové aplikace

### Pro studenty a začátečníky
1. Začněte s [AZD základy](docs/getting-started/azd-basics.md)
2. Postupujte podle [Instalačního průvodce](docs/getting-started/installation.md)
3. Dokončete [Váš první projekt](docs/getting-started/first-project.md)
4. Procvičte si [Jednoduchý příklad webové aplikace](../../examples/simple-web-app)

### Pro vývojáře
1. Projděte si [Konfigurační průvodce](docs/getting-started/configuration.md)
2. Studujte [Průvodce nasazením](docs/deployment/deployment-guide.md)
3. Pracujte na [Příkladu databázové aplikace](../../examples/database-app)
4. Prozkoumejte [Příklad kontejnerové aplikace](../../examples/container-app)

### Pro DevOps inženýry
1. Zvládněte [Zřizování zdrojů](docs/deployment/provisioning.md)
2. Implementujte [Kontroly před nasazením](docs/pre-deployment/preflight-checks.md)
3. Procvičte si [Plánování kapacity](docs/pre-deployment/capacity-planning.md)
4. Pokročilé [Příklady mikroslužeb](../../examples/microservices)

## Dokumentace

### Začínáme
- [**AZD základy**](docs/getting-started/azd-basics.md) - Klíčové koncepty a terminologie
- [**Instalace a nastavení**](docs/getting-started/installation.md) - Platformově specifické instalační průvodce
- [**Konfigurace**](docs/getting-started/configuration.md) - Nastavení prostředí a autentizace
- [**Váš první projekt**](docs/getting-started/first-project.md) - Krok za krokem tutoriál

### Nasazení a zřizování
- [**Průvodce nasazením**](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy nasazení
- [**Zřizování zdrojů**](docs/deployment/provisioning.md) - Správa Azure zdrojů

### Kontroly před nasazením
- [**Plánování kapacity**](docs/pre-deployment/capacity-planning.md) - Validace kapacity Azure zdrojů
- [**Výběr SKU**](docs/pre-deployment/sku-selection.md) - Výběr správných SKU pro Azure
- [**Kontroly před nasazením**](docs/pre-deployment/preflight-checks.md) - Automatizované validační skripty

### AI a Azure AI Foundry
- [**Integrace Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Propojení AZD s Azure AI Foundry službami
- [**Vzory nasazení AI modelů**](docs/ai-foundry/ai-model-deployment.md) - Nasazení a správa AI modelů pomocí AZD
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Praktická laboratoř: Příprava AI řešení pro AZD
- [**Osvědčené postupy pro produkční AI**](docs/ai-foundry/production-ai-practices.md) - Bezpečnost, škálování a monitorování AI pracovní zátěže

### Řešení problémů
- [**Běžné problémy**](docs/troubleshooting/common-issues.md) - Často se vyskytující problémy a jejich řešení
- [**Průvodce laděním**](docs/troubleshooting/debugging.md) - Krok za krokem strategie ladění
- [**AI-Specifické řešení problémů**](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami a nasazením modelů

## Příklady a šablony

### [Doporučeno: Šablony Azure AI Foundry](https://ai.azure.com/resource/build/templates)
**Začněte zde, pokud nasazujete AI aplikace!**

| Šablona | Popis | Složitost | Služby |
|----------|-------------|------------|----------|
| [**Začněte s AI chatem**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Vytvořte a nasaďte základní chatovací aplikaci integrovanou s vašimi daty a telemetrickými přehledy pomocí Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Začněte s AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Vytvořte a nasaďte základní aplikaci agenta s akcemi a telemetrickými přehledy pomocí Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatizace pracovních postupů s více agenty**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Zlepšete plánování úkolů a automatizaci orchestrací a správou skupiny AI agentů.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generování dokumentů z vašich dat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Zrychlete generování dokumentů, jako jsou smlouvy, faktury a investiční návrhy, nalezením a shrnutím relevantních informací z vašich dat. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Zlepšení klientských schůzek s agenty**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Migrujte zastaralý kód na moderní jazyky pomocí týmu agentů. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizace vašeho kódu s agenty**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Vytvořte a nasaďte základní chatovací aplikaci integrovanou s vašimi daty a telemetrickými přehledy pomocí Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Vytvořte svého konverzačního agenta**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Využijte pokročilé porozumění konverzaci k vytvoření a vylepšení chatbotů a agentů s deterministickými a kontrolovatelnými pracovními postupy. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Odemkněte přehledy z konverzačních dat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Zlepšete efektivitu kontaktního centra odhalením přehledů z velkých audio a textových datových sad pomocí pokročilých schopností porozumění obsahu. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Zpracování multimodálního obsahu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rychle a přesně zpracovávejte nároky, faktury, smlouvy a další dokumenty extrakcí informací z nestrukturovaného obsahu a jejich mapováním na strukturovaný formát. Tato šablona podporuje text, obrázky, tabulky a grafy. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Doporučeno: Azure AI Foundry E2E scénáře
**Začněte zde, pokud nasazujete AI aplikace!**

| Šablona | Popis | Složitost | Služby |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Jednoduché chatovací rozhraní s Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chatovací aplikace s podporou RAG a Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Analýza dokumentů pomocí AI služeb | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI agent framework s voláním funkcí | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Podnikový chat s AI orchestrací | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### Další AZD šablony
- [**Adresář příkladů**](examples/README.md) - Praktické příklady, šablony a scénáře z reálného světa
- [**Azure-Samples AZD šablony**](https://github.com/Azure-Samples/azd-templates) - Oficiální šablony od Microsoftu  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Šablony od komunity

### Praktické laboratoře a workshopy
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **NOVÉ**: Udělejte své AI řešení nasaditelné pomocí AZD
- [**Workshop AZD pro začátečníky**](workshop/README.md) - Zaměřeno na nasazení šablon AI agentů pomocí AZD

## Zdroje

### Rychlé odkazy
- [**Tahák příkazů**](resources/cheat-sheet.md) - Základní příkazy azd
- [**Slovník pojmů**](resources/glossary.md) - Terminologie Azure a azd
- [**FAQ**](resources/faq.md) - Často kladené otázky
- [**Studijní průvodce**](resources/study-guide.md) - Komplexní učební cíle a praktická cvičení

### Externí zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

## Přispívání

Uvítáme vaše příspěvky! Přečtěte si náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- Jak nahlásit problémy a požadavky na funkce
- Pokyny pro přispívání kódu
- Zlepšení dokumentace
- Standardy komunity

## Podpora

- **Problémy**: [Nahlaste chyby a požádejte o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskuse**: [Microsoft Azure Discord Community Q&A a diskuse](https://discord.gg/microsoft-azure)
- **AI-Specifická podpora**: Připojte se k [#Azure kanálu](https://discord.gg/microsoft-azure) pro diskuse o AZD + AI Foundry
- **E-mail**: Pro soukromé dotazy
- **Microsoft Learn**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy z komunity Azure AI Foundry Discord

**Výsledky ankety z #Azure kanálu:**
- **45%** vývojářů chce používat AZD pro AI pracovní zátěže
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost na produkci
- **Nejvíce požadováno**: AI-specifické šablony, průvodce řešením problémů, osvědčené postupy

**Připojte se k naší komunitě a:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte předběžný přístup k novým AI šablonám
- Přispívejte k osvědčeným postupům nasazení AI
- Ovlivněte budoucí vývoj funkcí AI + AZD

## Licence

Tento projekt je licencován pod licencí MIT - podrobnosti najdete v souboru [LICENSE](../../LICENSE).

## Další kurzy

Náš tým vytváří další kurzy! Podívejte se na:

- [**NOVÉ** Model Context Protocol (MCP) pro začátečníky](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agenti pro začátečníky](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativní AI pro začátečníky s .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativní AI pro začátečníky](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativní AI pro začátečníky s Javou](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML pro začátečníky](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science pro začátečníky](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI pro začátečníky](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kybernetická bezpečnost pro začátečníky](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webový vývoj pro začátečníky](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT pro začátečníky](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Vývoj XR pro začátečníky](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Ovládnutí GitHub Copilot pro AI párové programování](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Ovládnutí GitHub Copilot pro vývojáře C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Vyberte si vlastní dobrodružství s Copilotem](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigace**
- **Další lekce**: [AZD Základy](docs/getting-started/azd-basics.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
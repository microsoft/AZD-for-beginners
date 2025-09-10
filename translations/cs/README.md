<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:35:02+00:00",
  "source_file": "README.md",
  "language_code": "cs"
}
-->
# AZD Pro Začátečníky

![AZD-pro-začátečníky](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.cs.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Postupujte podle těchto kroků, abyste mohli začít používat tyto zdroje:  
1. **Forkněte repozitář**: Klikněte [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Naklonujte repozitář**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Připojte se k Azure Discord komunitám a setkejte se s experty a dalšími vývojáři**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Podpora více jazyků

#### Podporováno prostřednictvím GitHub Action (Automatizované & Vždy aktuální)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](./README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Pokud chcete přidat další překlady, seznam podporovaných jazyků najdete [zde](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Úvod

Vítejte v komplexním průvodci pro Azure Developer CLI (azd). Tento repozitář je navržen tak, aby pomohl vývojářům na všech úrovních, od studentů po profesionály, naučit se a zvládnout Azure Developer CLI pro efektivní nasazení do cloudu. Tento strukturovaný vzdělávací zdroj poskytuje praktické zkušenosti s nasazením do Azure, řešením běžných problémů a implementací osvědčených postupů pro úspěšné nasazení šablon AZD.

## Cíle učení

Prací s tímto repozitářem se naučíte:
- Zvládnout základy a klíčové koncepty Azure Developer CLI
- Nasazovat a zřizovat Azure zdroje pomocí Infrastructure as Code
- Rozvíjet dovednosti v řešení běžných problémů při nasazení AZD
- Porozumět validaci před nasazením a plánování kapacity
- Implementovat osvědčené postupy v oblasti bezpečnosti a optimalizace nákladů
- Získat jistotu v nasazování aplikací připravených pro produkci do Azure

## Výsledky učení

Po dokončení tohoto kurzu budete schopni:
- Úspěšně nainstalovat, nakonfigurovat a používat Azure Developer CLI
- Vytvářet a nasazovat aplikace pomocí šablon AZD
- Řešit problémy s autentizací, infrastrukturou a nasazením
- Provádět kontroly před nasazením včetně plánování kapacity a výběru SKU
- Implementovat osvědčené postupy pro monitorování, bezpečnost a správu nákladů
- Integrovat pracovní postupy AZD do CI/CD pipeline

## Obsah

- [Co je Azure Developer CLI?](../..)
- [Rychlý start](../..)
- [Dokumentace](../..)
- [Příklady & Šablony](../..)
- [Zdroje](../..)
- [Přispívání](../..)

## Co je Azure Developer CLI?

Azure Developer CLI (azd) je příkazový řádek zaměřený na vývojáře, který urychluje proces vytváření a nasazování aplikací do Azure. Nabízí:

- **Nasazení na základě šablon** - Používejte předpřipravené šablony pro běžné aplikační vzory
- **Infrastructure as Code** - Spravujte Azure zdroje pomocí Bicep nebo Terraform
- **Integrované pracovní postupy** - Plynule zřizujte, nasazujte a monitorujte aplikace
- **Přátelské pro vývojáře** - Optimalizováno pro produktivitu a zkušenosti vývojářů

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

## Dokumentace

### Začínáme
- [**AZD Základy**](docs/getting-started/azd-basics.md) - Klíčové koncepty a terminologie
- [**Instalace & Nastavení**](docs/getting-started/installation.md) - Platformově specifické instalační příručky
- [**Konfigurace**](docs/getting-started/configuration.md) - Nastavení prostředí a autentizace
- [**Váš první projekt**](docs/getting-started/first-project.md) - Krok za krokem tutoriál

### Nasazení & Zřizování
- [**Průvodce nasazením**](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy nasazení
- [**Zřizování zdrojů**](docs/deployment/provisioning.md) - Správa Azure zdrojů

### Kontroly před nasazením
- [**Plánování kapacity**](docs/pre-deployment/capacity-planning.md) - Validace kapacity Azure zdrojů
- [**Výběr SKU**](docs/pre-deployment/sku-selection.md) - Výběr správných SKU pro Azure
- [**Kontroly před nasazením**](docs/pre-deployment/preflight-checks.md) - Automatizované validační skripty

### Řešení problémů
- [**Běžné problémy**](docs/troubleshooting/common-issues.md) - Často se vyskytující problémy a jejich řešení
- [**Průvodce laděním**](docs/troubleshooting/debugging.md) - Krok za krokem strategie ladění

## Příklady & Šablony

### Startovací šablony
- [**Jednoduchá webová aplikace**](../../examples/simple-web-app) - Základní nasazení webové aplikace Node.js
- [**Statická webová stránka**](../../examples/static-website) - Hosting statické stránky na Azure Storage
- [**Aplikace v kontejneru**](../../examples/container-app) - Nasazení aplikace v kontejneru
- [**Databázová aplikace**](../../examples/database-app) - Webová aplikace s integrací databáze

### Pokročilé scénáře
- [**Mikroslužby**](../../examples/microservices) - Architektura aplikace s více službami
- [**Serverless funkce**](../../examples/serverless-function) - Nasazení Azure Functions
- [**Konfigurační příklady**](../../examples/configurations) - Znovupoužitelné konfigurační vzory

## Zdroje

### Rychlé odkazy
- [**Tahák příkazů**](resources/cheat-sheet.md) - Základní příkazy azd
- [**Slovníček**](resources/glossary.md) - Terminologie Azure a azd
- [**FAQ**](resources/faq.md) - Často kladené otázky
- [**Studijní příručka**](resources/study-guide.md) - Komplexní cíle učení a cvičení

### Externí zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Studijní cesta

### Pro studenty & začátečníky
1. Začněte s [AZD Základy](docs/getting-started/azd-basics.md)  
2. Postupujte podle [Instalační příručky](docs/getting-started/installation.md)  
3. Dokončete [Váš první projekt](docs/getting-started/first-project.md)  
4. Procvičte si [Jednoduchý příklad webové aplikace](../../examples/simple-web-app)  

### Pro vývojáře
1. Projděte si [Průvodce konfigurací](docs/getting-started/configuration.md)  
2. Studujte [Průvodce nasazením](docs/deployment/deployment-guide.md)  
3. Pracujte na [Příkladu databázové aplikace](../../examples/database-app)  
4. Prozkoumejte [Příklad aplikace v kontejneru](../../examples/container-app)  

### Pro DevOps inženýry
1. Zvládněte [Zřizování zdrojů](docs/deployment/provisioning.md)  
2. Implementujte [Kontroly před nasazením](docs/pre-deployment/preflight-checks.md)  
3. Procvičte si [Plánování kapacity](docs/pre-deployment/capacity-planning.md)  
4. Pokročilý [Příklad mikroslužeb](../../examples/microservices)  

## Přispívání

Uvítáme vaše příspěvky! Přečtěte si prosím náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:  
- Jak nahlásit problémy a požadavky na funkce  
- Pokyny pro přispívání kódu  
- Zlepšení dokumentace  
- Standardy komunity  

## Podpora

- **Problémy**: [Nahlaste chyby a požádejte o funkce](https://github.com/microsoft/azd-for-beginners/issues)  
- **Diskuze**: [Microsoft Azure Discord Community Q&A a diskuze](https://discord.gg/microsoft-azure)  
- **E-mail**: Pro soukromé dotazy  
- **Microsoft Learn**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Licence

Tento projekt je licencován pod licencí MIT - podrobnosti najdete v souboru [LICENSE](../../LICENSE).  

## 🎒 Další kurzy

Náš tým vytváří další kurzy! Podívejte se na:  

- [**NOVÉ** Model Context Protocol (MCP) Pro Začátečníky](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents Pro Začátečníky](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativní AI Pro Začátečníky pomocí .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generativní AI Pro Začátečníky](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativní AI Pro Začátečníky pomocí Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML Pro Začátečníky](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science Pro Začátečníky](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Pro Začátečníky](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Kybernetická bezpečnost Pro Začátečníky](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev pro začátečníky](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT pro začátečníky](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Vývoj XR pro začátečníky](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Ovládnutí GitHub Copilot pro párové programování s AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Ovládnutí GitHub Copilot pro vývojáře C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Vyberte si vlastní dobrodružství s Copilotem](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navigace**  
- **Další lekce**: [Základy AZD](docs/getting-started/azd-basics.md)  

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
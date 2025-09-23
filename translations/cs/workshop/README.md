<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "245d24997bbcf2bae93bb2a503845d37",
  "translation_date": "2025-09-23T12:03:29+00:00",
  "source_file": "workshop/README.md",
  "language_code": "cs"
}
-->
# AZD pro workshop vývojářů AI

## Šablony AZD

Vytvoření řešení AI aplikace na podnikové úrovni pro váš konkrétní scénář je podobné stavbě vlastního domu. Můžete si ho sami navrhnout, postavit cihlu po cihle a převzít odpovědnost za to, že splňuje všechny požadavky na správu a vývoj.

**NEBO ....**

Můžete spolupracovat s architektem, který vám poskytne _plán_ pro startovací dům, a poté s vámi pracovat na jeho _přizpůsobení_ vašim potřebám. To vám umožní soustředit se na to, co dělá **váš domov** jedinečným, zatímco odborníci se postarají o základní elektroinstalaci, vodovodní rozvody a další závislosti.

**To je přístup za [AI App Templates](https://ai.azure.com/templates)** - série plánů pro budování různých typů "domovů" AI aplikací v závislosti na vašich hlavních potřebách a závislostech.

## Přizpůsobení šablon

Šablony jsou navrženy tak, aby fungovaly s [Azure AI Foundry](https://ai.azure.com). Představte si tuto platformu jako svého "stavitele" s přístupem ke všem zdrojům, nástrojům a odborným znalostem, které potřebujete k dokončení práce!

Stačí si vybrat [své startovací šablony](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started). Například se zaměříme na šablonu _Get Started with AI Agents_, abychom vytvořili "Agentický AI domov", který je připraven na funkce jako AI Search, Red Teaming, Evaluace, Sledování, Monitoring a další!

![Plán](../../../translated_images/blueprint-1.fccfb7cb6f71dca946bbf512ef794e5d3b3f01dd98f8cdeb86c13a19c685f128.cs.png)

Stačí si rezervovat čas s architektem, který vás provede procesem přizpůsobení. [GitHub Copilot for Azure](https://learn.microsoft.com/en-us/azure/developer/github-copilot-azure/get-started) může být tím průvodcem. Stačí s ním "chatovat" a:

- Naučit se o funkcích Azure ve vaší šabloně
- Nasadit zdroje Azure
- Získat informace o vašem nasazení
- Diagnostikovat a řešit problémy!

V tomto workshopu se naučíme _rozebrat_ existující šablonu (abychom zjistili, co poskytuje), poté ji _přizpůsobit_ (aby splňovala naše požadavky) - krok za krokem.

Šablony AI **fungují** - dokončením workshopu se naučíte, jak je **přizpůsobit sobě**

----

**Navigace workshopu**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Související kapitoly**: Pokrývá [Kapitolu 1](../README.md#-chapter-1-foundation--quick-start), [Kapitolu 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) a [Kapitolu 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Praktická laboratoř**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Další kroky**: [Moduly workshopu](../../../workshop)

Vítejte v praktickém workshopu zaměřeném na Azure Developer CLI (AZD) s důrazem na nasazení AI aplikací. Tento workshop je navržen tak, aby vás provedl od základů AZD až po nasazení produkčně připravených AI řešení.

## Přehled workshopu

**Délka:** 2-3 hodiny  
**Úroveň:** Začátečník až středně pokročilý  
**Předpoklady:** Základní znalosti Azure, nástrojů příkazového řádku a konceptů AI

### Co se naučíte

- **Základy AZD**: Porozumění infrastruktuře jako kódu s AZD
- 🤖 **Integrace AI služeb**: Nasazení Azure OpenAI, AI Search a dalších AI služeb
- **Nasazení kontejnerů**: Použití Azure Container Apps pro AI aplikace
- **Nejlepší bezpečnostní postupy**: Implementace Managed Identity a bezpečných konfigurací
- **Monitoring a sledování**: Nastavení Application Insights pro AI pracovní zátěže
- **Produkční vzory**: Strategie nasazení na podnikové úrovni

## Struktura workshopu

### Modul 1: Základy AZD (30 minut)
- Instalace a konfigurace AZD
- Porozumění struktuře projektu AZD
- Vaše první nasazení AZD
- **Laboratoř**: Nasazení jednoduché webové aplikace

### Modul 2: Integrace Azure OpenAI (45 minut)
- Nastavení zdrojů Azure OpenAI
- Strategie nasazení modelů
- Konfigurace přístupu k API a autentizace
- **Laboratoř**: Nasazení chatovací aplikace s GPT-4

### Modul 3: RAG aplikace (45 minut)
- Integrace Azure AI Search
- Zpracování dokumentů s Azure Document Intelligence
- Vektorové embeddingy a sémantické vyhledávání
- **Laboratoř**: Vytvoření systému Q&A pro dokumenty

### Modul 4: Produkční nasazení (30 minut)
- Konfigurace Container Apps
- Optimalizace škálování a výkonu
- Monitoring a logování
- **Laboratoř**: Nasazení do produkce s observabilitou

### Modul 5: Pokročilé vzory (15 minut)
- Nasazení do více prostředí
- Integrace CI/CD
- Strategie optimalizace nákladů
- **Závěr**: Kontrolní seznam připravenosti na produkci

## Předpoklady

### Požadované nástroje

Před workshopem prosím nainstalujte tyto nástroje:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Nastavení účtu Azure

1. **Předplatné Azure**: [Zaregistrujte se zdarma](https://azure.microsoft.com/free/)
2. **Přístup k Azure OpenAI**: [Požádejte o přístup](https://aka.ms/oai/access)
3. **Požadovaná oprávnění**:
   - Role Contributor na předplatném nebo skupině zdrojů
   - User Access Administrator (pro přiřazení RBAC)

### Ověření předpokladů

Spusťte tento skript pro ověření nastavení:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Materiály workshopu

### Cvičení v laboratoři

Každý modul obsahuje praktická cvičení s výchozím kódem a podrobnými pokyny:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Vaše první nasazení AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chatovací aplikace s Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG aplikace s AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produkční vzory nasazení
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Pokročilé scénáře nasazení

### Referenční materiály

- **[Průvodce integrací AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Komplexní vzory integrace
- **[Průvodce nasazením AI modelů](../docs/ai-foundry/ai-model-deployment.md)** - Nejlepší postupy nasazení modelů
- **[Produkční AI praktiky](../docs/ai-foundry/production-ai-practices.md)** - Vzory nasazení na podnikové úrovni
- **[Průvodce řešením problémů AI](../docs/troubleshooting/ai-troubleshooting.md)** - Běžné problémy a jejich řešení

### Ukázkové šablony

Rychlé startovací šablony pro běžné AI scénáře:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Začínáme

### Možnost 1: GitHub Codespaces (doporučeno)

Nejrychlejší způsob, jak začít workshop:

[![Otevřít v GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Možnost 2: Lokální vývoj

1. **Naklonujte repozitář workshopu:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Přihlaste se do Azure:**
```bash
az login
azd auth login
```

3. **Začněte s Laboratoří 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Možnost 3: Workshop vedený instruktorem

Pokud se účastníte workshopu vedeného instruktorem:

- 🎥 **Záznam workshopu**: [Dostupný na vyžádání](https://aka.ms/azd-ai-workshop)
- 💬 **Komunita na Discordu**: [Připojte se pro živou podporu](https://aka.ms/foundry/discord)
- **Zpětná vazba k workshopu**: [Sdílejte své zkušenosti](https://aka.ms/azd-workshop-feedback)

## Časový plán workshopu

### Samostatné studium (3 hodiny)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Workshop vedený instruktorem (2,5 hodiny)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Kritéria úspěchu

Na konci tohoto workshopu budete schopni:

✅ **Nasadit AI aplikace** pomocí šablon AZD  
✅ **Konfigurovat Azure OpenAI** služby s odpovídající bezpečností  
✅ **Vytvořit RAG aplikace** s integrací Azure AI Search  
✅ **Implementovat produkční vzory** pro pracovní zátěže AI na podnikové úrovni  
✅ **Monitorovat a řešit problémy** při nasazení AI aplikací  
✅ **Aplikovat strategie optimalizace nákladů** pro pracovní zátěže AI  

## Komunita a podpora

### Během workshopu

- 🙋 **Dotazy**: Použijte chat workshopu nebo zvedněte ruku
- 🐛 **Problémy**: Zkontrolujte [průvodce řešením problémů](../docs/troubleshooting/ai-troubleshooting.md)
- **Tipy**: Sdílejte objevy s ostatními účastníky

### Po workshopu

- 💬 **Discord**: [Komunita Azure AI Foundry](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Nahlaste problémy se šablonami](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Zpětná vazba**: [Formulář hodnocení workshopu](https://aka.ms/azd-workshop-feedback)

## Další kroky

### Pokračujte v učení

1. **Pokročilé scénáře**: Prozkoumejte [nasazení do více regionů](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Integrace CI/CD**: Nastavte [workflow GitHub Actions](../docs/deployment/github-actions.md)
3. **Vlastní šablony**: Vytvořte si vlastní [šablony AZD](../docs/getting-started/custom-templates.md)

### Aplikujte ve svých projektech

1. **Hodnocení**: Použijte náš [kontrolní seznam připravenosti](./production-readiness-checklist.md)
2. **Šablony**: Začněte s našimi [AI-specifickými šablonami](../../../workshop/templates)
3. **Podpora**: Připojte se k [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Sdílejte svůj úspěch

- ⭐ **Ohodnoťte repozitář**, pokud vám workshop pomohl
- 🐦 **Sdílejte na sociálních sítích** s #AzureDeveloperCLI #AzureAI
- 📝 **Napište blogový příspěvek** o své cestě nasazením AI

---

## Zpětná vazba k workshopu

Vaše zpětná vazba nám pomáhá zlepšovat zážitek z workshopu:

| Aspekt | Hodnocení (1-5) | Komentáře |
|--------|-----------------|----------|
| Kvalita obsahu | ⭐⭐⭐⭐⭐ | |
| Praktické laboratoře | ⭐⭐⭐⭐⭐ | |
| Dokumentace | ⭐⭐⭐⭐⭐ | |
| Úroveň obtížnosti | ⭐⭐⭐⭐⭐ | |
| Celkový zážitek | ⭐⭐⭐⭐⭐ | |

**Odeslat zpětnou vazbu**: [Formulář hodnocení workshopu](https://aka.ms/azd-workshop-feedback)

---

**Předchozí:** [Průvodce řešením problémů AI](../docs/troubleshooting/ai-troubleshooting.md) | **Další:** Začněte s [Laboratoří 1: Základy AZD](../../../workshop/lab-1-azd-basics)

**Připraveni začít budovat AI aplikace s AZD?**

[Začněte s Laboratoří 1: Základy AZD →](./lab-1-azd-basics/README.md)

---


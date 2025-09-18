<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-18T09:46:29+00:00",
  "source_file": "workshop/README.md",
  "language_code": "cs"
}
-->
# AZD pro AI vývojáře Workshop

**Navigace workshopu**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Související kapitoly**: Pokrývá [Kapitolu 1](../README.md#-chapter-1-foundation--quick-start), [Kapitolu 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) a [Kapitolu 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Praktická laboratoř**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Další kroky**: [Moduly workshopu](../../../workshop)

Vítejte v praktickém workshopu zaměřeném na Azure Developer CLI (AZD) s důrazem na nasazení AI aplikací. Tento workshop vás provede od základů AZD až po nasazení AI řešení připravených pro produkci.

## Přehled workshopu

**Délka:** 2-3 hodiny  
**Úroveň:** Začátečník až středně pokročilý  
**Předpoklady:** Základní znalosti Azure, nástrojů příkazového řádku a AI konceptů

### Co se naučíte

- **Základy AZD**: Porozumění infrastruktuře jako kódu s AZD
- 🤖 **Integrace AI služeb**: Nasazení Azure OpenAI, AI Search a dalších AI služeb
- **Nasazení kontejnerů**: Použití Azure Container Apps pro AI aplikace
- **Nejlepší bezpečnostní postupy**: Implementace Managed Identity a bezpečných konfigurací
- **Monitoring a pozorovatelnost**: Nastavení Application Insights pro AI pracovní zátěže
- **Produkční vzory**: Strategie nasazení připravené pro podnikové prostředí

## Struktura workshopu

### Modul 1: Základy AZD (30 minut)
- Instalace a konfigurace AZD
- Porozumění struktuře projektu AZD
- Vaše první nasazení s AZD
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
- **Laboratoř**: Nasazení do produkce s pozorovatelností

### Modul 5: Pokročilé vzory (15 minut)
- Nasazení do více prostředí
- Integrace CI/CD
- Strategie optimalizace nákladů
- **Závěr**: Kontrolní seznam připravenosti pro produkci

## Předpoklady

### Požadované nástroje

Před workshopem si prosím nainstalujte tyto nástroje:

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

### Nastavení Azure účtu

1. **Azure předplatné**: [Zaregistrujte se zdarma](https://azure.microsoft.com/free/)
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

### Laboratorní cvičení

Každý modul obsahuje praktické laboratoře se startovacím kódem a podrobnými instrukcemi:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Vaše první nasazení s AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chatovací aplikace s Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG aplikace s AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produkční vzory nasazení
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Pokročilé scénáře nasazení

### Referenční materiály

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Komplexní integrační vzory
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Nejlepší postupy pro nasazení modelů
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Vzory nasazení pro podnikové prostředí
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Běžné problémy a jejich řešení

### Ukázkové šablony

Šablony pro rychlý start běžných AI scénářů:

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

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

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
- 💬 **Discord komunita**: [Připojte se pro živou podporu](https://aka.ms/foundry/discord)
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
✅ **Implementovat produkční vzory** pro podnikové AI pracovní zátěže  
✅ **Monitorovat a řešit problémy** při nasazení AI aplikací  
✅ **Aplikovat strategie optimalizace nákladů** pro AI pracovní zátěže  

## Komunita a podpora

### Během workshopu

- 🙋 **Dotazy**: Použijte chat workshopu nebo zvedněte ruku
- 🐛 **Problémy**: Zkontrolujte [průvodce řešením problémů](../docs/troubleshooting/ai-troubleshooting.md)
- **Tipy**: Sdílejte objevy s ostatními účastníky

### Po workshopu

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Nahlaste problémy se šablonami](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Zpětná vazba**: [Formulář hodnocení workshopu](https://aka.ms/azd-workshop-feedback)

## Další kroky

### Pokračujte v učení

1. **Pokročilé scénáře**: Prozkoumejte [nasazení do více regionů](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Integrace CI/CD**: Nastavte [GitHub Actions workflows](../docs/deployment/github-actions.md)
3. **Vlastní šablony**: Vytvořte si vlastní [AZD šablony](../docs/getting-started/custom-templates.md)

### Aplikujte ve svých projektech

1. **Hodnocení**: Použijte náš [kontrolní seznam připravenosti](./production-readiness-checklist.md)
2. **Šablony**: Začněte s našimi [AI-specifickými šablonami](../../../workshop/templates)
3. **Podpora**: Připojte se k [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Sdílejte svůj úspěch

- ⭐ **Ohodnoťte repozitář**, pokud vám workshop pomohl
- 🐦 **Sdílejte na sociálních sítích** s #AzureDeveloperCLI #AzureAI
- 📝 **Napište blogový příspěvek** o své cestě nasazení AI

---

## Zpětná vazba k workshopu

Vaše zpětná vazba nám pomáhá zlepšovat zážitek z workshopu:

| Aspekt | Hodnocení (1-5) | Komentáře |
|--------|-----------------|-----------|
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

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
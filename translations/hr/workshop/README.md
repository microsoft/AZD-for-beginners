<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:32:26+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hr"
}
-->
# AZD za AI Developere Radionica

**Prethodno:** [AI Vodič za rješavanje problema](../docs/troubleshooting/ai-troubleshooting.md) | **Sljedeće:** [Moduli radionice](../../../workshop)

Dobrodošli na praktičnu radionicu za učenje Azure Developer CLI (AZD) s fokusom na implementaciju AI aplikacija. Ova radionica osmišljena je da vas vodi od osnova AZD-a do implementacije AI rješenja spremnih za produkciju.

## Pregled radionice

**Trajanje:** 2-3 sata  
**Razina:** Početnik do srednje napredni  
**Preduvjeti:** Osnovno znanje o Azureu, alatima naredbenog retka i AI konceptima

### Što ćete naučiti

- **Osnove AZD-a**: Razumijevanje infrastrukture kao koda s AZD-om
- 🤖 **Integracija AI usluga**: Implementacija Azure OpenAI, AI Search i drugih AI usluga
- **Implementacija kontejnera**: Korištenje Azure Container Apps za AI aplikacije
- **Najbolje sigurnosne prakse**: Primjena Managed Identity i sigurnih konfiguracija
- **Praćenje i preglednost**: Postavljanje Application Insights za AI radna opterećenja
- **Produkcijski obrasci**: Strategije implementacije spremne za poduzeća

## Struktura radionice

### Modul 1: Osnove AZD-a (30 minuta)
- Instalacija i konfiguracija AZD-a
- Razumijevanje strukture AZD projekata
- Vaša prva AZD implementacija
- **Laboratorij**: Implementacija jednostavne web aplikacije

### Modul 2: Integracija Azure OpenAI (45 minuta)
- Postavljanje Azure OpenAI resursa
- Strategije implementacije modela
- Konfiguracija API pristupa i autentifikacije
- **Laboratorij**: Implementacija aplikacije za chat s GPT-4

### Modul 3: RAG aplikacije (45 minuta)
- Integracija Azure AI Search
- Obrada dokumenata s Azure Document Intelligence
- Vektorski embedding i semantičko pretraživanje
- **Laboratorij**: Izrada sustava za pitanja i odgovore na temelju dokumenata

### Modul 4: Produkcijska implementacija (30 minuta)
- Konfiguracija Container Apps
- Skaliranje i optimizacija performansi
- Praćenje i zapisivanje
- **Laboratorij**: Implementacija u produkciju s preglednošću

### Modul 5: Napredni obrasci (15 minuta)
- Implementacija u više okruženja
- Integracija CI/CD-a
- Strategije optimizacije troškova
- **Zaključak**: Kontrolni popis za spremnost za produkciju

## Preduvjeti

### Potrebni alati

Molimo instalirajte ove alate prije radionice:

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

### Postavljanje Azure računa

1. **Azure pretplata**: [Prijavite se besplatno](https://azure.microsoft.com/free/)
2. **Pristup Azure OpenAI**: [Zatražite pristup](https://aka.ms/oai/access)
3. **Potrebne dozvole**:
   - Uloga Contributor na pretplati ili grupi resursa
   - User Access Administrator (za RBAC dodjele)

### Provjera preduvjeta

Pokrenite ovaj skript za provjeru postavki:

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

## Materijali radionice

### Laboratorijske vježbe

Svaki modul uključuje praktične laboratorije s početnim kodom i korak-po-korak uputama:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Vaša prva AZD implementacija
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Aplikacija za chat s Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG aplikacija s AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Obrasci implementacije u produkciju
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Napredni scenariji implementacije

### Referentni materijali

- **[Vodič za integraciju AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Sveobuhvatni obrasci integracije
- **[Vodič za implementaciju AI modela](../docs/ai-foundry/ai-model-deployment.md)** - Najbolje prakse za implementaciju modela
- **[Produkcijske AI prakse](../docs/ai-foundry/production-ai-practices.md)** - Obrasci implementacije za poduzeća
- **[Vodič za rješavanje problema AI](../docs/troubleshooting/ai-troubleshooting.md)** - Uobičajeni problemi i rješenja

### Predlošci

Predlošci za brzi početak za uobičajene AI scenarije:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Početak

### Opcija 1: GitHub Codespaces (Preporučeno)

Najbrži način za početak radionice:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Opcija 2: Lokalni razvoj

1. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Prijavite se na Azure:**
```bash
az login
azd auth login
```

3. **Započnite s Laboratorijem 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Opcija 3: Radionica s instruktorom

Ako sudjelujete u radionici s instruktorom:

- 🎥 **Snimka radionice**: [Dostupno na zahtjev](https://aka.ms/azd-ai-workshop)
- 💬 **Discord zajednica**: [Pridružite se za podršku uživo](https://aka.ms/foundry/discord)
- **Povratne informacije o radionici**: [Podijelite svoje iskustvo](https://aka.ms/azd-workshop-feedback)

## Vremenski okvir radionice

### Učenje vlastitim tempom (3 sata)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sesija s instruktorom (2.5 sata)

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

## Kriteriji uspjeha

Na kraju ove radionice, moći ćete:

✅ **Implementirati AI aplikacije** koristeći AZD predloške  
✅ **Konfigurirati Azure OpenAI** usluge s odgovarajućom sigurnošću  
✅ **Izraditi RAG aplikacije** s integracijom Azure AI Search  
✅ **Primijeniti produkcijske obrasce** za AI radna opterećenja u poduzećima  
✅ **Pratiti i rješavati probleme** implementacije AI aplikacija  
✅ **Primijeniti strategije optimizacije troškova** za AI radna opterećenja  

## Zajednica i podrška

### Tijekom radionice

- 🙋 **Pitanja**: Koristite chat radionice ili podignite ruku
- 🐛 **Problemi**: Provjerite [vodič za rješavanje problema](../docs/troubleshooting/ai-troubleshooting.md)
- **Savjeti**: Podijelite otkrića s ostalim sudionicima

### Nakon radionice

- 💬 **Discord**: [Azure AI Foundry zajednica](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Prijavite probleme s predlošcima](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Povratne informacije**: [Obrazac za evaluaciju radionice](https://aka.ms/azd-workshop-feedback)

## Sljedeći koraci

### Nastavite učiti

1. **Napredni scenariji**: Istražite [implementacije u više regija](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Integracija CI/CD-a**: Postavite [GitHub Actions tijekove rada](../docs/deployment/github-actions.md)
3. **Prilagođeni predlošci**: Izradite vlastite [AZD predloške](../docs/getting-started/custom-templates.md)

### Primijenite u svojim projektima

1. **Procjena**: Koristite naš [kontrolni popis za spremnost](./production-readiness-checklist.md)
2. **Predlošci**: Započnite s našim [AI-specifičnim predlošcima](../../../workshop/templates)
3. **Podrška**: Pridružite se [Azure AI Foundry Discordu](https://aka.ms/foundry/discord)

### Podijelite svoj uspjeh

- ⭐ **Označite repozitorij zvjezdicom** ako vam je radionica pomogla
- 🐦 **Podijelite na društvenim mrežama** s #AzureDeveloperCLI #AzureAI
- 📝 **Napišite blog post** o svom putovanju implementacije AI-a

---

## Povratne informacije o radionici

Vaše povratne informacije pomažu nam poboljšati iskustvo radionice:

| Aspekt | Ocjena (1-5) | Komentari |
|--------|--------------|----------|
| Kvaliteta sadržaja | ⭐⭐⭐⭐⭐ | |
| Praktični laboratoriji | ⭐⭐⭐⭐⭐ | |
| Dokumentacija | ⭐⭐⭐⭐⭐ | |
| Razina težine | ⭐⭐⭐⭐⭐ | |
| Ukupno iskustvo | ⭐⭐⭐⭐⭐ | |

**Pošaljite povratne informacije**: [Obrazac za evaluaciju radionice](https://aka.ms/azd-workshop-feedback)

---

**Prethodno:** [AI Vodič za rješavanje problema](../docs/troubleshooting/ai-troubleshooting.md) | **Sljedeće:** Započnite s [Laboratorijem 1: Osnove AZD-a](../../../workshop/lab-1-azd-basics)

**Spremni za izradu AI aplikacija s AZD-om?**

[Započnite Laboratorij 1: Osnove AZD-a →](./lab-1-azd-basics/README.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:32:49+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sl"
}
-->
# AZD za delavnico AI razvijalcev

**Prejšnje:** [AI Vodnik za odpravljanje težav](../docs/troubleshooting/ai-troubleshooting.md) | **Naslednje:** [Moduli delavnice](../../../workshop)

Dobrodošli na praktični delavnici za učenje Azure Developer CLI (AZD) s poudarkom na uvajanju AI aplikacij. Ta delavnica je zasnovana tako, da vas popelje od osnov AZD do uvajanja produkcijsko pripravljenih AI rešitev.

## Pregled delavnice

**Trajanje:** 2-3 ure  
**Raven:** Začetnik do srednje napreden  
**Predpogoji:** Osnovno znanje o Azure, orodjih ukazne vrstice in konceptih AI

### Kaj boste naučili

- **Osnove AZD**: Razumevanje infrastrukture kot kode z AZD
- 🤖 **Integracija AI storitev**: Uvajanje Azure OpenAI, AI Search in drugih AI storitev
- **Uvajanje kontejnerjev**: Uporaba Azure Container Apps za AI aplikacije
- **Najboljše prakse varnosti**: Uporaba upravljane identitete in varnih konfiguracij
- **Spremljanje in opazovanje**: Nastavitev Application Insights za AI delovne obremenitve
- **Produkcijski vzorci**: Strategije uvajanja za podjetja

## Struktura delavnice

### Modul 1: Osnove AZD (30 minut)
- Namestitev in konfiguracija AZD
- Razumevanje strukture projekta AZD
- Vaša prva uvedba z AZD
- **Laboratorij**: Uvedba preproste spletne aplikacije

### Modul 2: Integracija Azure OpenAI (45 minut)
- Nastavitev virov Azure OpenAI
- Strategije uvajanja modelov
- Konfiguracija API dostopa in avtentikacije
- **Laboratorij**: Uvedba aplikacije za klepet z GPT-4

### Modul 3: RAG aplikacije (45 minut)
- Integracija Azure AI Search
- Obdelava dokumentov z Azure Document Intelligence
- Vektorske vdelave in semantično iskanje
- **Laboratorij**: Izdelava sistema za vprašanja in odgovore na podlagi dokumentov

### Modul 4: Produkcijska uvedba (30 minut)
- Konfiguracija Container Apps
- Optimizacija zmogljivosti in skaliranje
- Spremljanje in beleženje
- **Laboratorij**: Uvedba v produkcijo z opazovanjem

### Modul 5: Napredni vzorci (15 minut)
- Uvedbe v več okoljih
- Integracija CI/CD
- Strategije optimizacije stroškov
- **Zaključek**: Kontrolni seznam za pripravljenost na produkcijo

## Predpogoji

### Potrebna orodja

Prosimo, namestite ta orodja pred delavnico:

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

### Nastavitev Azure računa

1. **Azure naročnina**: [Prijavite se brezplačno](https://azure.microsoft.com/free/)  
2. **Dostop do Azure OpenAI**: [Zahtevajte dostop](https://aka.ms/oai/access)  
3. **Potrebna dovoljenja**:
   - Vloga Contributor na naročnini ali skupini virov
   - User Access Administrator (za dodelitve RBAC)

### Preverite predpogoje

Za preverjanje vaše nastavitve zaženite ta skript:

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

## Gradiva delavnice

### Laboratorijske vaje

Vsak modul vključuje praktične laboratorijske vaje z začetno kodo in navodili po korakih:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Vaša prva uvedba z AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Aplikacija za klepet z Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG aplikacija z AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produkcijski vzorci uvajanja
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Napredni scenariji uvajanja

### Referenčna gradiva

- **[Vodnik za integracijo AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Celoviti vzorci integracije
- **[Vodnik za uvajanje AI modelov](../docs/ai-foundry/ai-model-deployment.md)** - Najboljše prakse uvajanja modelov
- **[Produkcijske AI prakse](../docs/ai-foundry/production-ai-practices.md)** - Vzorci uvajanja za podjetja
- **[Vodnik za odpravljanje težav AI](../docs/troubleshooting/ai-troubleshooting.md)** - Pogoste težave in rešitve

### Predloge

Predloge za hiter začetek za pogoste AI scenarije:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Začetek

### Možnost 1: GitHub Codespaces (Priporočeno)

Najhitrejši način za začetek delavnice:

[![Odpri v GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Možnost 2: Lokalni razvoj

1. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Prijavite se v Azure:**
```bash
az login
azd auth login
```

3. **Začnite z laboratorijem 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Možnost 3: Delavnica z inštruktorjem

Če se udeležujete delavnice z inštruktorjem:

- 🎥 **Posnetek delavnice**: [Na voljo na zahtevo](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord skupnost**: [Pridružite se za podporo v živo](https://aka.ms/foundry/discord)  
- **Povratne informacije o delavnici**: [Delite svoje izkušnje](https://aka.ms/azd-workshop-feedback)  

## Časovnica delavnice

### Samostojno učenje (3 ure)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Seansa z inštruktorjem (2,5 ure)

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

## Merila uspeha

Do konca te delavnice boste lahko:

✅ **Uvajali AI aplikacije** z uporabo AZD predlog  
✅ **Konfigurirali Azure OpenAI** storitve z ustrezno varnostjo  
✅ **Izdelali RAG aplikacije** z integracijo Azure AI Search  
✅ **Uvedli produkcijske vzorce** za AI delovne obremenitve v podjetjih  
✅ **Spremljali in odpravljali težave** pri uvajanju AI aplikacij  
✅ **Uporabili strategije optimizacije stroškov** za AI delovne obremenitve  

## Skupnost in podpora

### Med delavnico

- 🙋 **Vprašanja**: Uporabite klepet delavnice ali dvignite roko  
- 🐛 **Težave**: Preverite [vodnik za odpravljanje težav](../docs/troubleshooting/ai-troubleshooting.md)  
- **Nasveti**: Delite odkritja z drugimi udeleženci  

### Po delavnici

- 💬 **Discord**: [Skupnost Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub težave**: [Prijavite težave s predlogami](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Povratne informacije**: [Obrazec za oceno delavnice](https://aka.ms/azd-workshop-feedback)  

## Naslednji koraki

### Nadaljujte z učenjem

1. **Napredni scenariji**: Raziščite [uvajanje v več regijah](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Integracija CI/CD**: Nastavite [GitHub Actions delovne tokove](../docs/deployment/github-actions.md)  
3. **Prilagojene predloge**: Ustvarite svoje [AZD predloge](../docs/getting-started/custom-templates.md)  

### Uporabite v svojih projektih

1. **Ocena**: Uporabite naš [kontrolni seznam pripravljenosti](./production-readiness-checklist.md)  
2. **Predloge**: Začnite z našimi [AI-specifičnimi predlogami](../../../workshop/templates)  
3. **Podpora**: Pridružite se [Discord skupnosti Azure AI Foundry](https://aka.ms/foundry/discord)  

### Delite svoj uspeh

- ⭐ **Ocenite repozitorij**, če vam je delavnica pomagala  
- 🐦 **Delite na družbenih omrežjih** z #AzureDeveloperCLI #AzureAI  
- 📝 **Napišite blog objavo** o svoji poti uvajanja AI  

---

## Povratne informacije o delavnici

Vaše povratne informacije nam pomagajo izboljšati izkušnjo delavnice:

| Vidik | Ocena (1-5) | Komentarji |
|-------|-------------|------------|
| Kakovost vsebine | ⭐⭐⭐⭐⭐ | |
| Praktični laboratoriji | ⭐⭐⭐⭐⭐ | |
| Dokumentacija | ⭐⭐⭐⭐⭐ | |
| Stopnja težavnosti | ⭐⭐⭐⭐⭐ | |
| Splošna izkušnja | ⭐⭐⭐⭐⭐ | |

**Pošljite povratne informacije**: [Obrazec za oceno delavnice](https://aka.ms/azd-workshop-feedback)

---

**Prejšnje:** [AI Vodnik za odpravljanje težav](../docs/troubleshooting/ai-troubleshooting.md) | **Naslednje:** Začnite z [Laboratorijem 1: Osnove AZD](../../../workshop/lab-1-azd-basics)

**Ste pripravljeni začeti graditi AI aplikacije z AZD?**

[Začnite z Laboratorijem 1: Osnove AZD →](./lab-1-azd-basics/README.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitna napačna razumevanja ali napačne interpretacije, ki bi nastale zaradi uporabe tega prevoda.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:34:11+00:00",
  "source_file": "workshop/README.md",
  "language_code": "lt"
}
-->
# AZD dirbtinio intelekto kūrėjų dirbtuvės

**Ankstesnis:** [AI trikčių šalinimo vadovas](../docs/troubleshooting/ai-troubleshooting.md) | **Kitas:** [Dirbtuvių laboratorijos moduliai](../../../workshop)

Sveiki atvykę į praktines dirbtuves, skirtas išmokti naudotis Azure Developer CLI (AZD), akcentuojant dirbtinio intelekto programų diegimą. Šios dirbtuvės padės jums pereiti nuo AZD pagrindų iki gamybai paruoštų AI sprendimų diegimo.

## Dirbtuvių apžvalga

**Trukmė:** 2–3 valandos  
**Lygis:** Pradedantysis iki vidutinio  
**Būtinos žinios:** Pagrindinės Azure, komandų eilutės įrankių ir AI koncepcijų žinios

### Ką išmoksite

- **AZD pagrindai**: Suprasti infrastruktūrą kaip kodą naudojant AZD
- 🤖 **AI paslaugų integracija**: Azure OpenAI, AI Search ir kitų AI paslaugų diegimas
- **Konteinerių diegimas**: Azure Container Apps naudojimas AI programoms
- **Saugumo geriausios praktikos**: Valdomos tapatybės ir saugių konfigūracijų įgyvendinimas
- **Stebėjimas ir stebimumas**: Application Insights nustatymas AI darbo krūviams
- **Gamybos modeliai**: Įmonės lygio diegimo strategijos

## Dirbtuvių struktūra

### 1 modulis: AZD pagrindai (30 minučių)
- AZD diegimas ir konfigūravimas
- AZD projekto struktūros supratimas
- Pirmasis AZD diegimas
- **Laboratorija**: Paprastos interneto programos diegimas

### 2 modulis: Azure OpenAI integracija (45 minutės)
- Azure OpenAI resursų nustatymas
- Modelių diegimo strategijos
- API prieigos ir autentifikacijos konfigūravimas
- **Laboratorija**: Pokalbių programos su GPT-4 diegimas

### 3 modulis: RAG programos (45 minutės)
- Azure AI Search integracija
- Dokumentų apdorojimas naudojant Azure Document Intelligence
- Vektoriniai įterpimai ir semantinė paieška
- **Laboratorija**: Dokumentų klausimų ir atsakymų sistemos kūrimas

### 4 modulis: Gamybos diegimas (30 minučių)
- Konteinerių programų konfigūravimas
- Skalavimas ir našumo optimizavimas
- Stebėjimas ir žurnalų analizė
- **Laboratorija**: Diegimas gamybai su stebimumu

### 5 modulis: Pažangūs modeliai (15 minučių)
- Diegimas keliuose aplinkose
- CI/CD integracija
- Kaštų optimizavimo strategijos
- **Apibendrinimas**: Gamybos pasirengimo kontrolinis sąrašas

## Būtinos sąlygos

### Reikalingi įrankiai

Prieš dirbtuves įdiekite šiuos įrankius:

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

### Azure paskyros nustatymas

1. **Azure prenumerata**: [Registruokitės nemokamai](https://azure.microsoft.com/free/)  
2. **Azure OpenAI prieiga**: [Prašyti prieigos](https://aka.ms/oai/access)  
3. **Reikalingi leidimai**:  
   - Contributor rolė prenumeratoje arba resursų grupėje  
   - User Access Administrator (RBAC priskyrimams)

### Patikrinkite būtinas sąlygas

Paleiskite šį scenarijų, kad patikrintumėte savo nustatymus:

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

## Dirbtuvių medžiaga

### Laboratoriniai pratimai

Kiekvienas modulis apima praktines laboratorijas su pradiniu kodu ir žingsnis po žingsnio instrukcijomis:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Pirmasis AZD diegimas  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Pokalbių programa su Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG programa su AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Gamybos diegimo modeliai  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Pažangūs diegimo scenarijai  

### Nuorodų medžiaga

- **[AI Foundry integracijos vadovas](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Išsamūs integracijos modeliai  
- **[AI modelių diegimo vadovas](../docs/ai-foundry/ai-model-deployment.md)** - Modelių diegimo geriausios praktikos  
- **[Gamybos AI praktikos](../docs/ai-foundry/production-ai-practices.md)** - Įmonės diegimo modeliai  
- **[AI trikčių šalinimo vadovas](../docs/troubleshooting/ai-troubleshooting.md)** - Dažniausios problemos ir sprendimai  

### Pavyzdiniai šablonai

Greito starto šablonai dažniausiems AI scenarijams:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Pradžia

### 1 variantas: GitHub Codespaces (rekomenduojama)

Greičiausias būdas pradėti dirbtuves:

[![Atidaryti GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### 2 variantas: Vietinis kūrimas

1. **Klonuokite dirbtuvių saugyklą:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Prisijunkite prie Azure:**  
```bash
az login
azd auth login
```

3. **Pradėkite nuo 1 laboratorijos:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### 3 variantas: Dirbtuvių su instruktoriumi sesija

Jei dalyvaujate sesijoje su instruktoriumi:

- 🎥 **Dirbtuvių įrašas**: [Pasiekiamas pagal poreikį](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord bendruomenė**: [Prisijunkite prie tiesioginės pagalbos](https://aka.ms/foundry/discord)  
- **Dirbtuvių atsiliepimai**: [Pasidalinkite savo patirtimi](https://aka.ms/azd-workshop-feedback)  

## Dirbtuvių laiko planas

### Mokymasis savarankiškai (3 valandos)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sesija su instruktoriumi (2,5 valandos)

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

## Sėkmės kriterijai

Dirbtuvių pabaigoje galėsite:

✅ **Diegti AI programas** naudodami AZD šablonus  
✅ **Konfigūruoti Azure OpenAI** paslaugas su tinkamu saugumu  
✅ **Kurti RAG programas** su Azure AI Search integracija  
✅ **Įgyvendinti gamybos modelius** įmonės AI darbo krūviams  
✅ **Stebėti ir šalinti problemas** AI programų diegimuose  
✅ **Taikyti kaštų optimizavimo** strategijas AI darbo krūviams  

## Bendruomenė ir pagalba

### Dirbtuvių metu

- 🙋 **Klausimai**: Naudokite dirbtuvių pokalbį arba pakelkite ranką  
- 🐛 **Problemos**: Peržiūrėkite [trikčių šalinimo vadovą](../docs/troubleshooting/ai-troubleshooting.md)  
- **Patarimai**: Dalinkitės atradimais su kitais dalyviais  

### Po dirbtuvių

- 💬 **Discord**: [Azure AI Foundry bendruomenė](https://aka.ms/foundry/discord)  
- **GitHub problemos**: [Praneškite apie šablonų problemas](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Atsiliepimai**: [Dirbtuvių vertinimo forma](https://aka.ms/azd-workshop-feedback)  

## Kiti žingsniai

### Tęskite mokymąsi

1. **Pažangūs scenarijai**: Tyrinėkite [diegimą keliuose regionuose](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **CI/CD integracija**: Nustatykite [GitHub Actions darbo eigas](../docs/deployment/github-actions.md)  
3. **Individualūs šablonai**: Kurkite savo [AZD šablonus](../docs/getting-started/custom-templates.md)  

### Taikykite savo projektuose

1. **Vertinimas**: Naudokite mūsų [pasirengimo kontrolinį sąrašą](./production-readiness-checklist.md)  
2. **Šablonai**: Pradėkite nuo mūsų [AI specifinių šablonų](../../../workshop/templates)  
3. **Pagalba**: Prisijunkite prie [Azure AI Foundry Discord](https://aka.ms/foundry/discord)  

### Pasidalinkite savo sėkme

- ⭐ **Pažymėkite saugyklą**, jei šios dirbtuvės jums padėjo  
- 🐦 **Dalinkitės socialiniuose tinkluose** su #AzureDeveloperCLI #AzureAI  
- 📝 **Rašykite tinklaraščio įrašą** apie savo AI diegimo kelionę  

---

## Dirbtuvių atsiliepimai

Jūsų atsiliepimai padeda mums tobulinti dirbtuvių patirtį:

| Aspektas | Įvertinimas (1–5) | Komentarai |
|----------|-------------------|------------|
| Turinys | ⭐⭐⭐⭐⭐ | |
| Praktinės laboratorijos | ⭐⭐⭐⭐⭐ | |
| Dokumentacija | ⭐⭐⭐⭐⭐ | |
| Sudėtingumo lygis | ⭐⭐⭐⭐⭐ | |
| Bendra patirtis | ⭐⭐⭐⭐⭐ | |

**Pateikite atsiliepimus**: [Dirbtuvių vertinimo forma](https://aka.ms/azd-workshop-feedback)

---

**Ankstesnis:** [AI trikčių šalinimo vadovas](../docs/troubleshooting/ai-troubleshooting.md) | **Kitas:** Pradėkite nuo [1 laboratorijos: AZD pagrindai](../../../workshop/lab-1-azd-basics)

**Pasiruošę pradėti kurti AI programas su AZD?**

[Pradėkite 1 laboratoriją: AZD pagrindai →](./lab-1-azd-basics/README.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
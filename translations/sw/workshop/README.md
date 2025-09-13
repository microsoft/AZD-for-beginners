<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:29:04+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sw"
}
-->
# Warsha ya AZD kwa Waendelezaji wa AI

**Iliyopita:** [Mwongozo wa Kutatua Matatizo ya AI](../docs/troubleshooting/ai-troubleshooting.md) | **Inayofuata:** [Moduli za Maabara ya Warsha](../../../workshop)

Karibu kwenye warsha ya vitendo ya kujifunza Azure Developer CLI (AZD) kwa lengo la kupeleka programu za AI. Warsha hii imeundwa kukuchukua kutoka misingi ya AZD hadi kupeleka suluhisho za AI tayari kwa uzalishaji.

## Muhtasari wa Warsha

**Muda:** Saa 2-3  
**Kiwango:** Mwanzoni hadi Kati  
**Mahitaji ya Awali:** Maarifa ya msingi ya Azure, zana za mstari wa amri, na dhana za AI

### Unachojifunza

- **Misingi ya AZD**: Kuelewa Miundombinu kama Nambari kwa kutumia AZD  
- 🤖 **Ujumuishaji wa Huduma za AI**: Kupeleka Azure OpenAI, AI Search, na huduma nyingine za AI  
- **Upelekaji wa Kontena**: Kutumia Azure Container Apps kwa programu za AI  
- **Mbinu Bora za Usalama**: Kutekeleza Managed Identity na usanidi salama  
- **Ufuatiliaji na Uangalizi**: Kuweka Application Insights kwa mzigo wa kazi za AI  
- **Mifumo ya Uzalishaji**: Mikakati ya upelekaji tayari kwa biashara  

## Muundo wa Warsha

### Moduli ya 1: Misingi ya AZD (Dakika 30)
- Kusakinisha na kusanidi AZD  
- Kuelewa muundo wa mradi wa AZD  
- Upelekaji wako wa kwanza wa AZD  
- **Maabara**: Peleka programu rahisi ya wavuti  

### Moduli ya 2: Ujumuishaji wa Azure OpenAI (Dakika 45)
- Kuweka rasilimali za Azure OpenAI  
- Mikakati ya upelekaji wa modeli  
- Kusimamia ufikiaji wa API na uthibitishaji  
- **Maabara**: Peleka programu ya mazungumzo na GPT-4  

### Moduli ya 3: Programu za RAG (Dakika 45)
- Ujumuishaji wa Azure AI Search  
- Usindikaji wa hati kwa kutumia Azure Document Intelligence  
- Uwekaji wa vekta na utafutaji wa semantiki  
- **Maabara**: Tengeneza mfumo wa maswali na majibu wa hati  

### Moduli ya 4: Upelekaji wa Uzalishaji (Dakika 30)
- Usanidi wa Container Apps  
- Uboreshaji wa utendaji na upanuzi  
- Ufuatiliaji na kumbukumbu  
- **Maabara**: Peleka kwa uzalishaji na uangalizi  

### Moduli ya 5: Mifumo ya Juu (Dakika 15)
- Upelekaji wa mazingira mengi  
- Ujumuishaji wa CI/CD  
- Mikakati ya uboreshaji wa gharama  
- **Hitimisho**: Orodha ya ukaguzi wa utayari wa uzalishaji  

## Mahitaji ya Awali

### Zana Zinazohitajika

Tafadhali sakinisha zana hizi kabla ya warsha:

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

### Usanidi wa Akaunti ya Azure

1. **Usajili wa Azure**: [Jisajili bure](https://azure.microsoft.com/free/)  
2. **Ufikiaji wa Azure OpenAI**: [Omba ufikiaji](https://aka.ms/oai/access)  
3. **Ruhusa Zinazohitajika**:  
   - Jukumu la Mchangiaji kwenye usajili au kikundi cha rasilimali  
   - Msimamizi wa Ufikiaji wa Mtumiaji (kwa ugawaji wa RBAC)  

### Thibitisha Mahitaji ya Awali

Endesha script hii ili kuthibitisha usanidi wako:

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

## Vifaa vya Warsha

### Mazoezi ya Maabara

Kila moduli inajumuisha maabara ya vitendo na nambari ya kuanzia na maelekezo ya hatua kwa hatua:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Upelekaji wako wa kwanza wa AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Programu ya mazungumzo na Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Programu ya RAG na AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Mifumo ya upelekaji wa uzalishaji  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Mifumo ya upelekaji wa hali ya juu  

### Vifaa vya Marejeleo

- **[Mwongozo wa Ujumuishaji wa AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Mifumo ya ujumuishaji wa kina  
- **[Mwongozo wa Upelekaji wa Modeli za AI](../docs/ai-foundry/ai-model-deployment.md)** - Mbinu bora za upelekaji wa modeli  
- **[Mbinu za AI za Uzalishaji](../docs/ai-foundry/production-ai-practices.md)** - Mifumo ya upelekaji wa biashara  
- **[Mwongozo wa Kutatua Matatizo ya AI](../docs/troubleshooting/ai-troubleshooting.md)** - Masuala ya kawaida na suluhisho  

### Violezo vya Mfano

Violezo vya kuanza haraka kwa hali za kawaida za AI:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Kuanza

### Chaguo 1: GitHub Codespaces (Inapendekezwa)

Njia ya haraka zaidi ya kuanza warsha:

[![Fungua katika GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Chaguo 2: Maendeleo ya Kawaida

1. **Clone hifadhi ya warsha:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Ingia kwenye Azure:**  
```bash
az login
azd auth login
```

3. **Anza na Maabara ya 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Chaguo 3: Warsha Inayoongozwa na Mwalimu

Ikiwa unahudhuria kikao kinachoongozwa na mwalimu:

- 🎥 **Rekodi ya Warsha**: [Inapatikana kwa mahitaji](https://aka.ms/azd-ai-workshop)  
- 💬 **Jumuiya ya Discord**: [Jiunge kwa msaada wa moja kwa moja](https://aka.ms/foundry/discord)  
- **Maoni ya Warsha**: [Shiriki uzoefu wako](https://aka.ms/azd-workshop-feedback)  

## Ratiba ya Warsha

### Kujifunza kwa Kujitegemea (Saa 3)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Kikao Kinachoongozwa na Mwalimu (Saa 2.5)

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

## Vigezo vya Mafanikio

Mwisho wa warsha hii, utaweza:

✅ **Kupeleka programu za AI** kwa kutumia violezo vya AZD  
✅ **Kusanidi Azure OpenAI** kwa usalama sahihi  
✅ **Kujenga programu za RAG** na ujumuishaji wa Azure AI Search  
✅ **Kutumia mifumo ya uzalishaji** kwa mzigo wa kazi za AI za biashara  
✅ **Kufuatilia na kutatua matatizo** ya upelekaji wa programu za AI  
✅ **Kutumia mikakati ya uboreshaji wa gharama** kwa mzigo wa kazi za AI  

## Jumuiya na Msaada

### Wakati wa Warsha

- 🙋 **Maswali**: Tumia mazungumzo ya warsha au inua mkono wako  
- 🐛 **Masuala**: Angalia [mwongozo wa kutatua matatizo](../docs/troubleshooting/ai-troubleshooting.md)  
- **Vidokezo**: Shiriki ugunduzi na washiriki wengine  

### Baada ya Warsha

- 💬 **Discord**: [Jumuiya ya Azure AI Foundry](https://aka.ms/foundry/discord)  
- **Masuala ya GitHub**: [Ripoti masuala ya violezo](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Maoni**: [Fomu ya tathmini ya warsha](https://aka.ms/azd-workshop-feedback)  

## Hatua Zifuatazo

### Endelea Kujifunza

1. **Hali za Juu**: Chunguza [upelekaji wa maeneo mengi](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Ujumuishaji wa CI/CD**: Sanidi [mifumo ya GitHub Actions](../docs/deployment/github-actions.md)  
3. **Violezo Maalum**: Tengeneza [violezo vyako vya AZD](../docs/getting-started/custom-templates.md)  

### Tumia katika Miradi Yako

1. **Tathmini**: Tumia [orodha yetu ya ukaguzi wa utayari](./production-readiness-checklist.md)  
2. **Violezo**: Anza na [violezo maalum vya AI](../../../workshop/templates)  
3. **Msaada**: Jiunge na [Discord ya Azure AI Foundry](https://aka.ms/foundry/discord)  

### Shiriki Mafanikio Yako

- ⭐ **Ongeza nyota kwenye hifadhi** ikiwa warsha hii imekusaidia  
- 🐦 **Shiriki kwenye mitandao ya kijamii** na #AzureDeveloperCLI #AzureAI  
- 📝 **Andika chapisho la blogu** kuhusu safari yako ya upelekaji wa AI  

---

## Maoni ya Warsha

Maoni yako yanatusaidia kuboresha uzoefu wa warsha:

| Kipengele | Ukadiriaji (1-5) | Maoni |
|-----------|------------------|-------|
| Ubora wa Maudhui | ⭐⭐⭐⭐⭐ | |
| Maabara ya Vitendo | ⭐⭐⭐⭐⭐ | |
| Nyaraka | ⭐⭐⭐⭐⭐ | |
| Kiwango cha Ugumu | ⭐⭐⭐⭐⭐ | |
| Uzoefu wa Jumla | ⭐⭐⭐⭐⭐ | |

**Tuma maoni**: [Fomu ya Tathmini ya Warsha](https://aka.ms/azd-workshop-feedback)

---

**Iliyopita:** [Mwongozo wa Kutatua Matatizo ya AI](../docs/troubleshooting/ai-troubleshooting.md) | **Inayofuata:** Anza na [Maabara ya 1: Misingi ya AZD](../../../workshop/lab-1-azd-basics)

**Uko tayari kuanza kujenga programu za AI kwa AZD?**

[Anza Maabara ya 1: Misingi ya AZD →](./lab-1-azd-basics/README.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
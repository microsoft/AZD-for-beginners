<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:29:33+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hu"
}
-->
# AZD az AI fejlesztők workshopja

**Előző:** [AI hibaelhárítási útmutató](../docs/troubleshooting/ai-troubleshooting.md) | **Következő:** [Workshop modulok](../../../workshop)

Üdvözlünk az Azure Developer CLI (AZD) gyakorlati workshopján, amely az AI alkalmazások telepítésére fókuszál. Ez a workshop segít az AZD alapjainak elsajátításában, és elvezet a termelésre kész AI megoldások telepítéséig.

## Workshop áttekintés

**Időtartam:** 2-3 óra  
**Szint:** Kezdő és középhaladó  
**Előfeltételek:** Alapvető ismeretek az Azure-ról, parancssori eszközökről és AI koncepciókról

### Amit megtanulsz

- **AZD alapok**: Az infrastruktúra kódba foglalásának megértése AZD-vel
- 🤖 **AI szolgáltatások integrációja**: Azure OpenAI, AI Search és más AI szolgáltatások telepítése
- **Konténeres telepítés**: Azure Container Apps használata AI alkalmazásokhoz
- **Biztonsági legjobb gyakorlatok**: Managed Identity és biztonságos konfigurációk alkalmazása
- **Monitoring és megfigyelés**: Application Insights beállítása AI munkaterhelésekhez
- **Termelési minták**: Vállalati szintű telepítési stratégiák

## Workshop felépítése

### 1. modul: AZD alapok (30 perc)
- AZD telepítése és konfigurálása
- AZD projektstruktúra megértése
- Az első AZD telepítésed
- **Lab**: Egyszerű webalkalmazás telepítése

### 2. modul: Azure OpenAI integráció (45 perc)
- Azure OpenAI erőforrások beállítása
- Modelltelepítési stratégiák
- API hozzáférés és hitelesítés konfigurálása
- **Lab**: Chat alkalmazás telepítése GPT-4-gyel

### 3. modul: RAG alkalmazások (45 perc)
- Azure AI Search integráció
- Dokumentumfeldolgozás az Azure Document Intelligence segítségével
- Vektoros beágyazások és szemantikus keresés
- **Lab**: Dokumentum kérdezz-felelek rendszer építése

### 4. modul: Termelési telepítés (30 perc)
- Container Apps konfiguráció
- Skálázás és teljesítményoptimalizálás
- Monitoring és naplózás
- **Lab**: Telepítés termelésbe megfigyeléssel

### 5. modul: Haladó minták (15 perc)
- Több környezet telepítése
- CI/CD integráció
- Költségoptimalizálási stratégiák
- **Összegzés**: Termelési készség ellenőrzőlista

## Előfeltételek

### Szükséges eszközök

Kérjük, telepítsd az alábbi eszközöket a workshop előtt:

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

### Azure fiók beállítása

1. **Azure előfizetés**: [Regisztrálj ingyenesen](https://azure.microsoft.com/free/)  
2. **Azure OpenAI hozzáférés**: [Kérj hozzáférést](https://aka.ms/oai/access)  
3. **Szükséges jogosultságok**:
   - Contributor szerepkör az előfizetésen vagy erőforráscsoporton
   - User Access Administrator (RBAC hozzárendelésekhez)

### Előfeltételek ellenőrzése

Futtasd ezt a szkriptet a beállítás ellenőrzéséhez:

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

## Workshop anyagok

### Lab gyakorlatok

Minden modul gyakorlati labokat tartalmaz kezdő kóddal és lépésről lépésre útmutatóval:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Az első AZD telepítésed  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chat alkalmazás Azure OpenAI-val  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG alkalmazás AI Search-csel  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Termelési telepítési minták  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Haladó telepítési forgatókönyvek  

### Referencia anyagok

- **[AI Foundry integrációs útmutató](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Átfogó integrációs minták  
- **[AI modell telepítési útmutató](../docs/ai-foundry/ai-model-deployment.md)** - Modelltelepítési legjobb gyakorlatok  
- **[Termelési AI gyakorlatok](../docs/ai-foundry/production-ai-practices.md)** - Vállalati telepítési minták  
- **[AI hibaelhárítási útmutató](../docs/troubleshooting/ai-troubleshooting.md)** - Gyakori problémák és megoldások  

### Mintasablonok

Gyorsindító sablonok gyakori AI forgatókönyvekhez:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Kezdés

### 1. opció: GitHub Codespaces (Ajánlott)

A workshop leggyorsabb indítása:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### 2. opció: Helyi fejlesztés

1. **Workshop repó klónozása:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure-ba bejelentkezés:**
```bash
az login
azd auth login
```

3. **Kezdd az 1. labbal:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### 3. opció: Oktató által vezetett workshop

Ha oktató által vezetett foglalkozáson veszel részt:

- 🎥 **Workshop felvétel**: [Elérhető igény szerint](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord közösség**: [Csatlakozz élő támogatásért](https://aka.ms/foundry/discord)  
- **Workshop visszajelzés**: [Oszd meg tapasztalataidat](https://aka.ms/azd-workshop-feedback)  

## Workshop idővonal

### Önálló tanulás (3 óra)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Oktató által vezetett foglalkozás (2,5 óra)

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

## Siker kritériumok

A workshop végére képes leszel:

✅ **AI alkalmazások telepítése** AZD sablonokkal  
✅ **Azure OpenAI konfigurálása** megfelelő biztonsággal  
✅ **RAG alkalmazások építése** Azure AI Search integrációval  
✅ **Termelési minták alkalmazása** vállalati AI munkaterhelésekhez  
✅ **AI alkalmazások telepítésének monitorozása és hibaelhárítása**  
✅ **Költségoptimalizálási stratégiák alkalmazása** AI munkaterhelésekhez  

## Közösség és támogatás

### A workshop alatt

- 🙋 **Kérdések**: Használd a workshop chatet vagy jelezd kézfeltartással  
- 🐛 **Problémák**: Nézd meg a [hibaelhárítási útmutatót](../docs/troubleshooting/ai-troubleshooting.md)  
- **Tippek**: Oszd meg felfedezéseidet más résztvevőkkel  

### A workshop után

- 💬 **Discord**: [Azure AI Foundry közösség](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Jelentsd a sablon hibákat](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Visszajelzés**: [Workshop értékelési űrlap](https://aka.ms/azd-workshop-feedback)  

## Következő lépések

### További tanulás

1. **Haladó forgatókönyvek**: Fedezd fel a [több régiós telepítéseket](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **CI/CD integráció**: Állítsd be a [GitHub Actions munkafolyamatokat](../docs/deployment/github-actions.md)  
3. **Egyedi sablonok**: Készítsd el saját [AZD sablonjaidat](../docs/getting-started/custom-templates.md)  

### Alkalmazás a projektjeidben

1. **Értékelés**: Használd a [készség ellenőrzőlistát](./production-readiness-checklist.md)  
2. **Sablonok**: Kezdd az [AI-specifikus sablonokkal](../../../workshop/templates)  
3. **Támogatás**: Csatlakozz az [Azure AI Foundry Discordhoz](https://aka.ms/foundry/discord)  

### Oszd meg a sikereidet

- ⭐ **Csillagozd a repót**, ha segített a workshop  
- 🐦 **Oszd meg a közösségi médiában** a #AzureDeveloperCLI #AzureAI hashtaggel  
- 📝 **Írj blogbejegyzést** az AI telepítési utazásodról  

---

## Workshop visszajelzés

A visszajelzésed segít javítani a workshop élményét:

| Szempont | Értékelés (1-5) | Megjegyzések |
|----------|----------------|--------------|
| Tartalom minősége | ⭐⭐⭐⭐⭐ | |
| Gyakorlati labok | ⭐⭐⭐⭐⭐ | |
| Dokumentáció | ⭐⭐⭐⭐⭐ | |
| Nehézségi szint | ⭐⭐⭐⭐⭐ | |
| Összélmény | ⭐⭐⭐⭐⭐ | |

**Visszajelzés beküldése**: [Workshop értékelési űrlap](https://aka.ms/azd-workshop-feedback)

---

**Előző:** [AI hibaelhárítási útmutató](../docs/troubleshooting/ai-troubleshooting.md) | **Következő:** Kezdd az [1. labbal: AZD alapok](../../../workshop/lab-1-azd-basics)

**Készen állsz AI alkalmazások építésére AZD-vel?**

[Indítsd el az 1. labot: AZD alapok →](./lab-1-azd-basics/README.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális, emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
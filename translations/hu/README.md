<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "05c30c9e5ed7951c72855108c6788034",
  "translation_date": "2025-12-25T07:02:36+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek: Strukturált tanulási útmutató

![AZD kezdőknek](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hu.png) 

[![GitHub megfigyelők](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkok](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub csillagok](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Első lépések ezzel a tanfolyammal

Kövesd ezeket a lépéseket, hogy elindítsd az AZD tanulási utadat:

1. **Tároló forkolása**: Kattints [![GitHub forkok](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a tárolót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a tanulási utadat**: Válassz az alábbi fejezetek közül, amely megfelel a tapasztalatodnak

### Többnyelvű támogatás

#### Automatikus fordítások (mindig naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Mianmar)](../my/README.md) | [Kínai (egyszerűsített)](../zh/README.md) | [Kínai (hagyományos, Hongkong)](../hk/README.md) | [Kínai (hagyományos, Makaó)](../mo/README.md) | [Kínai (hagyományos, Tajvan)](../tw/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../br/README.md) | [Portugál (Portugália)](../pt/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tanfolyam áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek a fokozatos tanulásra vannak tervezve. **Kiemelt figyelem az AI-alkalmazások telepítésére Microsoft Foundry integrációval.**

### Miért lényeges ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a szeretné használni az AZD-t AI terhelésekhez**, de nehézségekbe ütköznek a következőkkel kapcsolatban:
- Összetett, több szolgáltatásból álló AI architektúrák
- AI éles telepítési legjobb gyakorlatok  
- Azure AI szolgáltatások integrációja és konfigurálása
- AI terhelések költséghatékonysága
- AI-specifikus telepítési hibakeresés

### Tanulási célok

A strukturált tanfolyam elvégzésével:
- **AZD alapok elsajátítása**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kódként (IaC) megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítések hibakeresése**: Gyakori problémák megoldása és hibakeresés
- **Éles üzemre optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Több-ügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 📚 Tanulási fejezetek

*Válaszd ki tanulási utadat tapasztalati szint és célok alapján*

### 🚀 1. fejezet: Alapok és gyors kezdés
**Előfeltételek**: Azure-előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Mit fogsz megtanulni
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezdj itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Telepítés**: [Telepítés & Beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors referencia**: [Parancs összefoglaló](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Gyors telepítés ellenőrzése
azd version

# Telepítse az első alkalmazást
azd init --template todo-nodejs-mongo
azd up
```

**💡 A fejezet eredménye**: Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD használatával

**✅ Siker igazolása:**
```bash
# A 1. fejezet elvégzése után képes leszel:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepíti az alkalmazást az Azure-ba
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Eltávolítja az erőforrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készség szint a befejezés után:** Képes önállóan telepíteni alapalkalmazásokat

**✅ Siker igazolása:**
```bash
# Az 1. fejezet elvégzése után képesnek kell lenned:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepíti az Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-címét
# Az alkalmazás megnyílik a böngészőben, és működik
azd down --force --purge  # Eltávolítja az erőforrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készség szint a befejezés után:** Képes önállóan telepíteni alapalkalmazásokat

---

### 🤖 2. fejezet: AI-első fejlesztés (Ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet teljesítve  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Microsoft Foundry integráció az AZD-del
- AI-t használó alkalmazások telepítése
- AI szolgáltatások konfigurációinak megértése

#### Tanulási források
- **🎯 Kezdj itt**: [Microsoft Foundry integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Minták**: [AI modell telepítése](docs/microsoft-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Műhely**: [AI Workshop Labor](docs/microsoft-foundry/ai-workshop-lab.md) - Tedd AI-megoldásaidat AZD-kompatibilissé
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs-szal * DevContainer környezet
- **📋 Sablonok**: [Microsoft Foundry sablonok](../..)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati feladatok
```bash
# Telepítse az első mesterséges intelligencia-alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további mesterséges intelligencia-sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 A fejezet eredménye**: Telepíts és konfigurálj egy AI-vezérelt csevegőalkalmazást RAG képességekkel

**✅ Siker igazolása:**
```bash
# A 2. fejezet után képesnek kell lenned a következőkre:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI csevegőfelületet
# Kérdéseket feltenni és mesterséges intelligencia által generált, forrásokkal alátámasztott válaszokat kapni
# Ellenőrizni, hogy a keresési integráció működik
azd monitor  # Ellenőrizni, hogy az Application Insights megjeleníti a telemetriát
azd down --force --purge
```

**📊 Időráfordítás:** 1-2 óra  
**📈 Készség szint a befejezés után:** Képes telepíteni és konfigurálni éles környezetre kész AI alkalmazásokat  
**💰 Költségtudatosság:** Ismerd a fejlesztési költségeket (~$80–150/hó), az éles költségeket (~$300–3500/hó)

#### 💰 Költségszempontok AI telepítések esetén

**Fejlesztési környezet (Becsült $80–150/hó):**
- Azure OpenAI (Fogyasztás alapú / Pay-as-you-go): $0–50/hó (a tokenhasználattól függ)
- AI Search (Alap szint): $75/hó
- Container Apps (Fogyasztás): $0–20/hó
- Tárhely (Standard): $1–5/hó

**Éles környezet (Becsült $300–3,500+/hó):**
- Azure OpenAI (PTU a következetes teljesítményért): $3,000+/hó vagy Pay-as-you-go nagy forgalom esetén
- AI Search (Standard szint): $250/hó
- Container Apps (Dedikált): $50–100/hó
- Application Insights: $5–50/hó
- Tárhely (Premium): $10–50/hó

**💡 Költségoptimalizálási tippek:**
- Használj **ingyenes szintet** az Azure OpenAI-hoz tanuláshoz (50,000 token/hó included)
- Futtasd az `azd down` parancsot a források leállításához, amikor nem fejlesztesz aktívan
- Kezdd fogyasztás-alapú számlázással, PTU-ra csak éles környezetben válts
- Használd az `azd provision --preview` parancsot a költségek becsléséhez telepítés előtt
- Engedélyezd az automatikus skálázást: csak a tényleges használatért fizess

**Költségfigyelés:**
```bash
# Ellenőrizze a becsült havi költségeket
azd provision --preview

# Kövesse nyomon a tényleges költségeket az Azure Portalon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
**Előfeltételek**: 1. fejezet teljesítve  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Környezetkonfiguráció és kezelés
- Hitelesítés és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és rendszerezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és felügyelt identitás](docs/getting-started/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati feladatok
- Konfigurálj több környezetet (dev, staging, prod)
- Állíts be felügyelt identitás alapú hitelesítést
- Valósíts meg környezet-specifikus konfigurációkat

**💡 A fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kódként (IaC) és telepítés
**Előfeltételek**: 1–3. fejezetek teljesítve  
**Időtartam**: 1-1.5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Mit fogsz megtanulni
- Haladó telepítési minták
- Infrastruktúra kód (IaC) használata Bicep-pel
- Erőforrás-províziós stratégiák

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Provisioning**: [Erőforrások provisionálása](docs/deployment/provisioning.md) - Azure erőforráskezelés
- **📝 Példák**: [Konténeralkalmazás példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati feladatok
- Hozz létre egyedi Bicep sablonokat
- Telepíts több szolgáltatásból álló alkalmazásokat
- Valósíts meg blue-green telepítési stratégiákat

**💡 A fejezet eredménye**: Összetett, többszolgáltatásos alkalmazások telepítése egyedi infrastruktúra-sablonok használatával

---

### 🎯 5. fejezet: Több-ügynökös AI megoldások (Haladó)
**Előfeltételek**: 1–2. fejezetek teljesítve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Mit fogsz megtanulni
- Több-ügynökös architektúra minták
- Ügynökök orkestrációja és koordinációja
- Élesre kész AI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi több-ügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás

- [**Parancs gyorsreferencia**](resources/cheat-sheet.md) - Az azd alapvető parancsai fejezetek szerint rendezve
- [**Fogalomtár**](resources/glossary.md) - Azure és az azd terminológia  
- [**Gyakran ismételt kérdések**](resources/faq.md) - Gyakori kérdések a tanulási fejezetek szerint rendezve
- [**Tanulmányi útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati workshopok
- [**AI Workshop labor**](docs/microsoft-foundry/ai-workshop-lab.md) - Tedd az AI megoldásaidat AZD-telepíthetővé (2-3 óra)
- [**Interaktív workshop útmutató**](workshop/README.md) - Böngészőalapú workshop MkDocs-szal és DevContainer környezettel
- [**Strukturált tanulási útvonal**](../../workshop/docs/instructions) -7 lépéses vezetett gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD kezdőknek workshop**](workshop/README.md) - Teljes gyakorlati workshop anyagok GitHub Codespaces integrációval

### Külső tanulási források
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Gyors hibaelhárítási útmutató

**Kezdők által gyakran tapasztalt problémák és azonnali megoldások:**

### ❌ "azd: command not found"

```bash
# Először telepítse az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ellenőrizze a telepítést
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás az AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Próbáljon ki egy másik Azure-régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy a fejlesztéshez használjon kisebb SKU-kat
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Opció 1: Tisztítás és újrapróbálás
azd down --force --purge
azd up

# Opció 2: Csak az infrastruktúra javítása
azd provision

# Opció 3: Részletes naplók ellenőrzése
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Ismételt hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD egyedi neveket generál, de ha névütközés történik:
azd down --force --purge

# Ezután próbálja újra friss környezettel
azd env new dev-v2
azd up
```

### ❌ Sablon telepítése túl sokáig tart

**Átlagos várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázist használó alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (az OpenAI erőforrások előkészítése lassú)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha több mint 30 percig elakadt, ellenőrizze az Azure portált:
azd monitor
# Keresse a sikertelen telepítéseket
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább a "Contributor" szerepkör szükséges
# Kérje meg az Azure adminisztrátorát, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```

### ❌ Can't find deployed application URL

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Ellenőrizzen egy adott szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```

### 📚 Teljes hibaelhárítási források

- **Gyakori problémák útmutatója:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/troubleshooting/debugging.md)
- **Segítség:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Gyors hibaelhárítási útmutató

**Kezdők által gyakran tapasztalt problémák és azonnali megoldások:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Először telepítse az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ellenőrizze a telepítést
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás az AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Próbáljon ki másik Azure-régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy fejlesztéshez használjon kisebb SKU-kat
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opció 1: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# Opció 2: Csak az infrastruktúra javítása
azd provision

# Opció 3: Részletes naplók ellenőrzése
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Ismételt hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD egyedi neveket generál, de ha névütközés lép fel:
azd down --force --purge

# Ezután próbálja újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sablon telepítése túl sokáig tart</strong></summary>

**Átlagos várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázist használó alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (az OpenAI erőforrások előkészítése lassú)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha 30 percnél tovább elakadt, ellenőrizze az Azure-portált:
azd monitor
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább a "Contributor" szerepkör szükséges
# Kérje meg az Azure rendszergazdáját, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Ellenőrizzen egy adott szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```
</details>

### 📚 Teljes hibaelhárítási források

- **Gyakori problémák útmutatója:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/troubleshooting/debugging.md)
- **Segítség:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítás

### Haladás nyomon követése
Kövesd tanulási előrehaladásod fejezetenként:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra mint kód és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI-megoldások ✅
- [ ] **6. fejezet**: Előtelepítési ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibaelhárítás és hibakeresés ✅
- [ ] **8. fejezet**: Éles üzem és vállalati minták ✅

### Tanulás ellenőrzése
A fejezet elvégzése után igazold tudásod a következőkkel:
1. **Gyakorlati feladat**: Fejezd be a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Nézd át a fejezet GYIK szakaszát
3. **Közösségi megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Lépj a következő bonyolultsági szintre

### A tanfolyam elvégzésének előnyei
Minden fejezet teljesítése után a következőkkel fogsz rendelkezni:
- **Éles környezeti tapasztalat**: Valós AI-alkalmazások telepítése Azure-ba
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Az Azure fejlesztői közösség aktív tagja
- **Karrierfejlődés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség & támogatás

### Segítség és támogatás
- **Műszaki problémák**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintés a Microsoft Foundry Discord-ból

**A #Azure csatorna legfrissebb közvélemény-kutatási eredményei:**
- **45%** fejlesztők szeretnék AZD-t AI munkaterhelésekhez használni
- **Legfőbb kihívások**: Több szolgáltatásos telepítések, hitelesítő adatok kezelése, éles üzemre való felkészültség  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibaelhárítási útmutatók, bevált gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataidat és segítséget kapj
- Hozzáférj az új AI sablonok korai előnézeteihez
- Hozzájárulj az AI telepítési bevált gyakorlatokhoz
- Hatással legyél a jövőbeli AI + AZD fejlesztésekre

### Hozzájárulás a tanfolyamhoz
Szívesen fogadjuk a hozzájárulásokat! Kérjük, olvasd el a [Contributing Guide](CONTRIBUTING.md) útmutatót a részletekért:
- **Tartalom fejlesztése**: Javítsd a meglévő fejezeteket és példákat
- **Új példák**: Add hozzá a valós életből vett forgatókönyveket és sablonokat  
- **Fordítás**: Segíts a többnyelvű támogatás fenntartásában
- **Hiba bejelentések**: Növeld a pontosságot és az érthetőséget
- **Közösségi normák**: Kövesd inkluzív közösségi irányelveinket

---

## 📄 Tanfolyami információk

### Licence
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kezdőknek](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI sorozat
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető tanfolyamok
[![Gépi tanulás kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kezdőknek](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot AI páros programozáshoz](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET-hez](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot kaland](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz elkezdeni a tanulást?**

**Kezdők**: Kezdjétek ezzel [1. fejezet: Alapok és Gyors kezdés](../..)  
**AI fejlesztők**: Ugrás a [2. fejezet: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztők**: Kezdjétek a [3. fejezet: Konfiguráció és hitelesítés](../..)

**Következő lépések**: [1. fejezet kezdése - AZD alapok](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) mesterséges intelligencia alapú fordító szolgáltatásával fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus fontosságú információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
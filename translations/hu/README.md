# AZD Kezdőknek: Strukturált Tanulási Útmutató

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatikus Fordítások (Mindig Friss)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh-CN/README.md) | [Kínai (Hagyományos, Hongkong)](../zh-HK/README.md) | [Kínai (Hagyományos, Makaó)](../zh-MO/README.md) | [Kínai (Hagyományos, Tajvan)](../zh-TW/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../pt-BR/README.md) | [Portugál (Portugália)](../pt-PT/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Svahili](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filipinó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)

> **Inkább helyben klónoznád?**
>
> Ez a tároló több mint 50 nyelvű fordítást tartalmaz, ami jelentősen növeli a letöltési méretet. Ha fordítások nélkül szeretnéd klónozni, használj sparse checkout-ot:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Így mindent megkapsz, amire szükséged van a kurzus teljesítéséhez sokkal gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Mi az Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** egy fejlesztőbarát parancssori eszköz, amely megkönnyíti az alkalmazások Azure-ba történő telepítését. Ahelyett, hogy manuálisan hoznál létre és kapcsolnál össze tucatnyi Azure erőforrást, egyetlen paranccsal telepíthetsz egész alkalmazásokat.

### A `azd up` varázsa

```bash
# Ez az egyetlen parancs mindent elvégez:
# ✅ Létrehozza az összes Azure-erőforrást
# ✅ Beállítja a hálózatot és a biztonságot
# ✅ Felépíti az alkalmazás kódját
# ✅ Telepíti az Azure-ra
# ✅ Egy működő URL-t ad
azd up
```

**Ennyi az egész!** Nincs több Azure Portálon kattintgatás, bonyolult ARM sablonok megtanulása, vagy kézi konfiguráció – csak működő alkalmazások az Azure-on.

---

## ❓ Azure Developer CLI vs Azure CLI: Mi a különbség?

Ez a kezdők leggyakoribb kérdése. Íme a egyszerű válasz:

| Tulajdonság | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------------|---------------------|--------------------------------|
| **Cél** | Egyedi Azure erőforrások kezelése | Teljes alkalmazások telepítése |
| **Megközelítés** | Infrastruktúra-központú | Alkalmazás-központú |
| **Példa** | `az webapp create --name myapp...` | `azd up` |
| **Tanulási görbe** | Azure szolgáltatások ismerete szükséges | Csak az alkalmazásod ismerete kell |
| **Legjobb** | DevOps, Infrastruktúra | Fejlesztők, prototípus készítés |

### Egyszerű analógia

- **Azure CLI** olyan, mint ha minden eszköz meglenne egy házépítéshez – kalapácsok, fűrészek, szögek. Bármit építhetsz, de érteni kell az építkezéshez.
- **Azure Developer CLI** olyan, mint ha egy vállalkozót bíznál meg – elmondod, mit szeretnél, és ők építik.

### Mikor melyiket használd?

| Szituáció | Használd ezt |
|-----------|--------------|
| "Gyorsan szeretném telepíteni a webalkalmazásom" | `azd up` |
| "Csak egy tárolófiókot kell létrehoznom" | `az storage account create` |
| "Egy teljes AI alkalmazást építek" | `azd init --template azure-search-openai-demo` |
| "Egy adott Azure erőforrást szeretnék hibakeresni" | `az resource show` |
| "Pillanatok alatt szeretnék éles telepítést" | `azd up --environment production` |

### Együtt működnek!

Az AZD az Azure CLI-t használja a háttérben. Mindkettőt használhatod:
```bash
# Telepítse az alkalmazását az AZD-vel
azd up

# Ezután finomhangolja a konkrét erőforrásokat az Azure CLI segítségével
az webapp config set --name myapp --always-on true
```

---

## 🌟 Találj Sablonokat az Awesome AZD-ben

Ne kezdj a nulláról! Az **Awesome AZD** a közösség gyűjteménye, telepítésre kész sablonokkal:

| Erőforrás | Leírás |
|-----------|--------|
| 🔗 [**Awesome AZD galéria**](https://azure.github.io/awesome-azd/) | Böngéssz 200+ sablon között, egykattintásos telepítéssel |
| 🔗 [**Sablon beküldése**](https://github.com/Azure/awesome-azd/issues) | Add hozzá saját sablonod a közösséghez |
| 🔗 [**GitHub tárhely**](https://github.com/Azure/awesome-azd) | Csillagozd és fedezd fel a forrást |

### Népszerű AI sablonok az Awesome AZD-ből

```bash
# RAG-csevegés Azure OpenAI és AI Search szolgáltatással
azd init --template azure-search-openai-demo

# Gyors AI csevegőalkalmazás
azd init --template openai-chat-app-quickstart

# AI-ügynökök a Foundry Agents segítségével
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kezdés 3 lépésben

### 1. lépés: AZD telepítése (2 perc)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 2. lépés: Bejelentkezés az Azure-ba

```bash
azd auth login
```

### 3. lépés: Az első alkalmazás telepítése

```bash
# Inicializálás sablonból
azd init --template todo-nodejs-mongo

# Telepítés Azure-ra (mindent létrehoz!)
azd up
```

**🎉 Kész is vagy!** Az alkalmazásod most már élő az Azure-on.

### Takarítás (Ne felejtsd el!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hogyan használd ezt a kurzust

Ez a tanfolyam **fokozatos tanulásra** lett tervezve – kezdj ott, ahol kényelmes, és haladj felfelé:

| Tapasztalatod | Itt kezd |
|---------------|----------|
| **Teljesen új vagy az Azure-ben** | [1. fejezet: Alapok](../..) |
| **Ismered az Azure-t, de új vagy az AZD-ben** | [1. fejezet: Alapok](../..) |
| **AI alkalmazásokat szeretnél telepíteni** | [2. fejezet: AI-First Fejlesztés](../..) |
| **Gyakorlati gyakorlásra vágysz** | [🎓 Interaktív Műhely](workshop/README.md) – 3-4 órás vezetett labor |
| **Éles mintákra van szükséged** | [8. fejezet: Termelés és vállalati minták](../..) |

### Gyors beállítás

1. **Forkold ezt a tárolót**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kérj segítséget**: [Azure Discord közösség](https://discord.com/invite/ByRwuEEgH4)

> **Inkább helyben klónoznál?**

> Ez a tároló több mint 50 nyelvű fordítást tartalmaz, ami jelentősen növeli a letöltési méretet. Ha fordítások nélkül szeretnéd klónozni, használj sparse checkout-ot:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Így mindent megkapsz a kurzus teljesítéséhez sokkal gyorsabb letöltéssel.


## Kurzus áttekintése

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek fokozatos tanuláshoz készültek. **Különös hangsúlyt kap az AI alkalmazások telepítése Microsoft Foundry integrációval.**

### Miért fontos ez a kurzus a modern fejlesztőknek

A Microsoft Foundry Discord közösségének visszajelzései alapján a fejlesztők **45%-a szeretné használni az AZD-t AI munkafolyamatokhoz**, de kihívásokba ütköznek a következő területeken:
- Komplex több szolgáltatásból álló AI architektúrák
- Éles AI telepítési legjobb gyakorlatok
- Azure AI szolgáltatások integrációja és konfigurációja
- AI munkafolyamatok költségoptimalizálása
- AI specifikus telepítési hibák elhárítása

### Tanulási célok

A kurzus elvégzése során:
- **Mesterked az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kód formájában**: Azure erőforrások kezelése Bicep sablonokkal
- **Deploy hibák elhárítása**: Gyakori problémák megoldása és hibakeresés
- **Éles környezetre optimalizálás**: Biztonság, skálázás, monitorozás és költségmenedzsment
- **Több ügynökös megoldások építése**: Komplex AI architektúrák telepítése

## 🗺️ Kurzustérkép: Gyors navigáció fejezetenként

Minden fejezethez külön README tartozik a tanulási célokkal, gyors indulással és feladatokkal:

| Fejezet | Téma | Tananyag | Időtartam | Nehézség |
|---------|-------|---------|----------|----------|
| **[1. fejezet: Alapok](docs/chapter-01-foundation/README.md)** | Kezdés | [AZD alapok](docs/chapter-01-foundation/azd-basics.md) &#124; [Telepítés](docs/chapter-01-foundation/installation.md) &#124; [Első projekt](docs/chapter-01-foundation/first-project.md) | 30-45 perc | ⭐ |
| **[2. fejezet: AI fejlesztés](docs/chapter-02-ai-development/README.md)** | AI-központú alkalmazások | [Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ügynökök](docs/chapter-02-ai-development/agents.md) &#124; [Modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Műhely](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 óra | ⭐⭐ |
| **[3. fejezet: Konfiguráció](docs/chapter-03-configuration/README.md)** | Hitelesítés és biztonság | [Konfiguráció](docs/chapter-03-configuration/configuration.md) &#124; [Hitelesítés és biztonság](docs/chapter-03-configuration/authsecurity.md) | 45-60 perc | ⭐⭐ |
| **[4. fejezet: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & Telepítés | [Telepítési Útmutató](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 óra | ⭐⭐⭐ |
| **[5. fejezet: Többügynökös](docs/chapter-05-multi-agent/README.md)** | AI Ügynök Megoldások | [Kiskereskedelmi Forgatókönyv](examples/retail-scenario.md) &#124; [Koordinációs Minták](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[6. fejezet: Telepítés Előtti](docs/chapter-06-pre-deployment/README.md)** | Tervezés és Érvényesítés | [Előtti Ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 óra | ⭐⭐ |
| **[7. fejezet: Hibakeresés](docs/chapter-07-troubleshooting/README.md)** | Hibakeresés & Javítás | [Gyakori Problémák](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hibakeresés](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Problémák](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 óra | ⭐⭐ |
| **[8. fejezet: Éles Üzem](docs/chapter-08-production/README.md)** | Vállalati Minták | [Éles Üzemi Gyakorlatok](docs/chapter-08-production/production-ai-practices.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[🎓 Műhelymunka](workshop/README.md)** | Gyakorlati Labor | [Bevezetés](workshop/docs/instructions/0-Introduction.md) &#124; [Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Lebontás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Lebontás](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Összefoglaló](workshop/docs/instructions/7-Wrap-up.md) | 3-4 óra | ⭐⭐ |

**Teljes Tanfolyam Időtartama:** ~10-14 óra | **Készségfejlődés:** Kezdő → Éles Üzem-Kész

---

## 📚 Tanulási fejezetek

*Válaszd ki tanulási utadat tapasztalati szinted és céljaid alapján*

### 🚀 1. fejezet: Alapok & Gyors Kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit Megtanulsz
- Az Azure Developer CLI alapjai
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási Források
- **🎯 Kezdéshez**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD Alapok](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Telepítés**: [Telepítés & Beállítás](docs/chapter-01-foundation/installation.md) - Platform specifikus útmutatók
- **🛠️ Gyakorlat**: [Az Első Projekted](docs/chapter-01-foundation/first-project.md) - Lépésről lépésre bemutató
- **📋 Gyors Referencia**: [Parancs Gyorsítótár](resources/cheat-sheet.md)

#### Gyakorlati Feladatok
```bash
# Gyors telepítés-ellenőrzés
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet Eredmény**: Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD segítségével

**✅ Sikeres Érvényesítés:**
```bash
# Az 1. fejezet befejezése után képes leszel:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepít az Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Takarítja a forrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készségszint Utána:** Alapalkalmazásokat önállóan képes telepíteni

**✅ Sikeres Érvényesítés:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepít Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrásokat tisztít meg
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készségszint Utána:** Alapalkalmazásokat önállóan képes telepíteni

---

### 🤖 2. fejezet: AI-Központú Fejlesztés (AI Fejlesztőknek Ajánlott)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Microsoft Foundry integráció az AZD-vel
- AI-vezérelt alkalmazások telepítése
- AI szolgáltatás konfigurációinak megértése

#### Tanulási Források
- **🎯 Kezdéshez**: [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Ügynökök**: [AI Ügynök Útmutató](docs/chapter-02-ai-development/agents.md) - Intelligens ügynökök telepítése AZD-vel
- **📖 Minták**: [AI Modell Telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellek kezelése és telepítése
- **🛠️ Műhelymunka**: [AI Műhely Labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI megoldások AZD-re optimalizálása
- **🎥 Interaktív Útmutató**: [Műhelyanyagok](workshop/README.md) - Böngésző-alapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Microsoft Foundry sablonok](../..)
- **📝 Példák**: [AZD Telepítési példák](examples/README.md)

#### Gyakorlati Feladatok
```bash
# Telepítse első MI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további MI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet Eredmény**: AI-vezérelt chatalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Sikeres Érvényesítés:**
```bash
# A 2. fejezet után képes leszel:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI chat felületet
# Kérdéseket feltenni és AI-alapú válaszokat kapni forrásokkal
# Ellenőrizni a keresés integráció működését
azd monitor  # Megnézni, hogy az Application Insights mutatja-e a telemetriát
azd down --force --purge
```

**📊 Időráfordítás:** 1-2 óra  
**📈 Készségszint Utána:** Éles üzemre kész AI alkalmazásokat tud telepíteni és konfigurálni  
**💰 Költségtudatosság:** Érti az $80-150/hó fejlesztési, $300-3500/hó éles költségeket

#### 💰 Költségszempontok AI Telepítéseknél

**Fejlesztői Környezet (Becsült $80-150/hó):**
- Azure OpenAI (fizetés használat alapján): $0-50/hó (token használattól függően)
- AI Keresés (Alap szint): $75/hó
- Container Apps (Fogyasztás alapú): $0-20/hó
- Tárolás (Standard): $1-5/hó

**Éles Környezet (Becsült $300-3,500+/hó):**
- Azure OpenAI (PTU a következetes teljesítményért): $3,000+/hó VAGY magas forgalom mellett fizetés használat alapján
- AI Keresés (Standard szint): $250/hó
- Container Apps (Dedikált): $50-100/hó
- Application Insights: $5-50/hó
- Tárolás (Prémium): $10-50/hó

**💡 Költségoptimalizálás Tippek:**
- Használd az **Ingyenes szintű** Azure OpenAI-t tanuláshoz (havonta 50,000 token jár)
- Futtasd az `azd down` parancsot, ha nem fejlesztesz aktívan, hogy felszabadíts erőforrásokat
- Kezdd fogyasztás-alapú számlázással, PTU-ra csak az éles környezetben válts
- Használd az `azd provision --preview` parancsot a telepítés előtti költségbecsléshez
- Engedélyezd az auto-scaling-et: csak a tényleges használat után fizess

**Költségfigyelés:**
```bash
# Becslések szerinti havi költségek ellenőrzése
azd provision --preview

# Valós költségek figyelése az Azure Portálon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció & Hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Környezet konfiguráció és kezelés
- Hitelesítési és biztonsági gyakorlati minták
- Erőforrás elnevezés és szervezés

#### Tanulási Források
- **📖 Konfiguráció**: [Konfigurációs Útmutató](docs/chapter-03-configuration/configuration.md) - Környezeti beállítások
- **🔐 Biztonság**: [Hitelesítési minták és kezelt azonosító](docs/chapter-03-configuration/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis Alkalmazás Példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati Feladatok
- Több környezet beállítása (fejlesztői, teszt, éles)
- Kezelt azonosító hitelesítés konfigurálása
- Környezet-specifikus konfigurációk alkalmazása

**💡 Fejezet Eredmény**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra Kódként & Telepítés
**Előfeltételek**: 1-3. fejezetek elvégezve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit Megtanulsz
- Fejlett telepítési minták
- Infrastructure as Code Biceppel
- Erőforrás-provízionálási stratégiák

#### Tanulási Források
- **📖 Telepítés**: [Telepítési Útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Provisioning**: [Erőforrás Provisioning](docs/chapter-04-infrastructure/provisioning.md) - Azure erőforrás menedzsment
- **📝 Példák**: [Container App Példa](../../examples/container-app) - Konténeres telepítések

#### Gyakorlati Feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatásból álló alkalmazások telepítése
- Blue-green telepítési stratégiák megvalósítása

**💡 Fejezet Eredmény**: Összetett, több szolgáltatásból álló alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI Megoldások (Haladó)
**Előfeltételek**: 1-2. fejezetek elvégezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit Megtanulsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Éles üzemre kész AI telepítések

#### Tanulási Források
- **🤖 Kiemelt Projekt**: [Kiskereskedelmi Többügynökös Megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM Sablonok**: [ARM Sablon Csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: [Többügynökös koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati Feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet Eredmény**: Éles üzemre kész többügynökös AI megoldás telepítése és kezelése Ügyfél- és Készletügynökökkel

---

### 🔍 6. fejezet: Telepítés Előtti Érvényesítés & Tervezés
**Előfeltételek**: 4. fejezet elvégzése  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Kapacitástervezés és erőforrás-ellenőrzés
- SKU kiválasztási stratégiák
- Előtti ellenőrzések és automatizálás

#### Tanulási Források
- **📊 Tervezés**: [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás érvényesítés
- **💰 Kiválasztás**: [SKU Kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választás
- **✅ Érvényesítés**: [Előtti Ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati Feladatok
- Kapacitás ellenőrző szkriptek futtatása
- SKU kiválasztások optimalizálása költség szempontból
- Automatikus telepítés előtti ellenőrzések megvalósítása

**💡 Fejezet Eredmény**: Telepítések validálása és optimalizálása végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés & Debugging
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Szisztematikus hibakeresési módszerek
- Gyakori problémák és megoldásaik
- AI-specifikus hibakeresés

#### Tanulási Források
- **🔧 Gyakori Problémák**: [Gyakori Problémák](docs/chapter-07-troubleshooting/common-issues.md) - Gyakran ismételt kérdések és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési Útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI Problémák**: [AI Problémaelhárítás](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati Feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési gondok megoldása
- AI szolgáltatás kapcsolódási hibák hibakeresése

**💡 Fejezet Eredmény**: Gyakori telepítési problémák önálló diagnosztizálása és megoldása

---

### 🏢 8. fejezet: Éles Üzem & Vállalati Minták
**Előfeltételek**: 1-4. fejezetek elvégzése  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit Megtanulsz
- Éles környezet telepítési stratégiái
- Vállalati biztonsági minták
- Monitoring és költséghatékonyság

#### Tanulási Források
- **🏭 Éles Üzem**: [Éles AI Legjobb Gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások Példa](../../examples/microservices) - Összetett architektúrák
- **📊 Monitorozás**: [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Gyakorlati Feladatok
- Vállalati biztonsági minták bevezetése
- Átfogó monitorozás beállítása
- Éles telepítés megfelelő irányítással

**💡 Fejezet Eredmény**: Vállalati szintű alkalmazások telepítése teljes éles üzem funkcióval

---

## 🎓 Műhely áttekintés: Gyakorlati Tanulási Élmény

> **⚠️ MŰHELY ÁLLAPOT: Aktív Fejlesztés**  

> A workshop anyagai jelenleg fejlesztés alatt állnak és finomításra kerülnek. Az alapmodulok működőképesek, de néhány haladó rész még hiányos. Aktívan dolgozunk a teljes tartalom befejezésén. [Nyomon követés →](workshop/README.md)

### Interaktív Workshop Anyagok
**Átfogó gyakorlati tanulás böngészőalapú eszközökkel és irányított gyakorlatokkal**

Workshop anyagaink strukturált, interaktív tanulási élményt nyújtanak, amelyek kiegészítik a fenti fejezetalapú tananyagot. A workshopot önálló tanulásra és oktató által vezetett alkalmakra egyaránt terveztük.

#### 🛠️ Workshop Jellemzők
- **Böngészőalapú Felület**: Teljes MkDocs-alapú workshop kereséssel, másolási és témabeállítási funkciókkal
- **GitHub Codespaces Integráció**: Egykattintásos fejlesztői környezet beállítás
- **Strukturált Tanulási Útvonal**: 8 modulból álló irányított gyakorlatok (összesen 3-4 óra)
- **Fokozatos Módszertan**: Bevezetés → Kiválasztás → Érvényesítés → Dekonstruálás → Konfigurálás → Testreszabás → Lebontás → Összegzés
- **Interaktív DevContainer Környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Workshop Modul Struktúra
A workshop egy **8 modulból álló fokozatos módszertant** követ, amely a felfedezéstől a telepítés mesterségéig vezet:

| Modul | Téma | Mit Fogsz Tenni | Időtartam |
|--------|-------|----------------|----------|
| **0. Bevezetés** | Workshop áttekintés | Megérteni a tanulási célokat, előfeltételeket és a workshop struktúráját | 15 perc |
| **1. Kiválasztás** | Sablon felfedezés | Felfedezni az AZD sablonokat és kiválasztani a megfelelő AI sablont a te esetedhez | 20 perc |
| **2. Érvényesítés** | Telepítés & Ellenőrzés | Telepíteni a sablont `azd up` paranccsal és validálni az infrastruktúra működését | 30 perc |
| **3. Dekonstruálás** | Struktúra megértése | A GitHub Copilot segítségével felfedezni a sablon architektúrát, Bicep fájlokat és kód szervezést | 30 perc |
| **4. Konfigurálás** | azure.yaml mélyreható | Elsajátítani az `azure.yaml` konfigurációt, életciklus hookokat és környezeti változókat | 30 perc |
| **5. Testreszabás** | Tegyél belőle a sajátodat | Engedélyezni az AI Keresést, trace-elést, kiértékelést és testreszabni az adott esethez | 45 perc |
| **6. Lebontás** | Tisztítás | Biztonságosan felszámolni az erőforrásokat `azd down --purge` paranccsal | 15 perc |
| **7. Összegzés** | Következő lépések | Áttekinteni az elért eredményeket, kulcsfogalmakat és folytatni a tanulási utat | 15 perc |

**Workshop Menet:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Workshop Kezdése
```bash
# 1. lehetőség: GitHub Codespaces (ajánlott)
# Kattints a „Code” → „Create codespace on main” lehetőségre a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a workshop/README.md fájlban lévő beállítási utasításokat
```

#### 🎯 Workshop Tanulási Eredmények
A workshop befejezésével a résztvevők képesek lesznek:
- **Termelési AI Alkalmazások Telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Többügynökös Architektúrák Mesteri Használata**: Koordinált AI ügynök megoldások implementálása
- **Biztonsági Legjobb Gyakorlatok Alkalmazása**: Hitelesítés és hozzáférés-vezérlés konfigurálása
- **Méretezés Optimalizálása**: Költséghatékony és teljesítményorientált telepítések tervezése
- **Telepítési Hibák Elhárítása**: Gyakori problémák önálló megoldása

#### 📖 Workshop Források
- **🎥 Interaktív Útmutató**: [Workshop Anyagok](workshop/README.md) - Böngészőalapú tanulási környezet
- **📋 Modulokra Bontott Utasítások**:
  - [0. Bevezetés](workshop/docs/instructions/0-Introduction.md) - Workshop áttekintése és céljai
  - [1. Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) - AI sablonok megtalálása és kiválasztása
  - [2. Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) - Sablonok telepítése és ellenőrzése
  - [3. Dekonstruálás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Sablon architektúra feltérképezése
  - [4. Konfigurálás](workshop/docs/instructions/4-Configure-AI-Template.md) - Az azure.yaml elsajátítása
  - [5. Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) - Testreszabás az adott igényekhez
  - [6. Lebontás](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Erőforrások felszámolása
  - [7. Összegzés](workshop/docs/instructions/7-Wrap-up.md) - Áttekintés és további lépések
- **🛠️ AI Workshop Labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-központú gyakorlatok
- **💡 Gyors Kezdés**: [Workshop Beállítási Útmutató](workshop/README.md#quick-start) - Környezet konfiguráció

**Tökéletes választás**: vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mélyebb Ismeretek: AZD Képességek

Az alapokon túl az AZD erőteljes funkciókat biztosít termelési telepítésekhez:

- **Sablonalapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazásmintákhoz
- **Infrastructure as Code** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Zökkenőmentes erőforrás-províziózás, telepítés és alkalmazásfigyelés
- **Fejlesztőbarát** - A fejlesztők termelékenysége és élménye optimalizálva

### **AZD + Microsoft Foundry: Tökéletes AI Alkalmazásokhoz**

**Miért AZD AI megoldásokhoz?** AZD kezeli az AI fejlesztők legfontosabb kihívásait:

- **AI-Kész Sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML feladatokra
- **Biztonságos AI Telepítések** - Beépített biztonsági minták AI szolgáltatások, API kulcsok és modell végpontok számára  
- **Termelési AI Minták** - Skálázható, költséghatékony AI alkalmazás telepítési legjobb gyakorlatok
- **Végponttól végpontig AI Munkafolyamatok** - Modellfejlesztéstől a termelési telepítésig megfelelő monitorozással
- **Költségoptimalizálás** - Intelligens erőforrás-elosztási és méretezési stratégiák AI munkaterhelésekhez
- **Microsoft Foundry Integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modell katalógushoz és végpontokhoz

---

## 🎯 Sablonok és Példatár

### Kiemelt: Microsoft Foundry Sablonok  
**Kezdj itt, ha AI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különféle AI mintákat mutatnak be. Egyesek külső Azure minták, mások helyi megvalósítások.

| Sablon | Fejezet | Komplexitás | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**Kezdés AI csevegéssel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Modell Lekérdezési API + Azure AI Keresés + Azure Container Apps + Application Insights | Külső |
| [**Kezdés AI ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Keresés + Azure Container Apps + Application Insights| Külső |
| [**Azure Keresés + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Keresés + App Service + Storage | Külső |
| [**OpenAI Chat App Gyorsindítás**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Keresés + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi Többügynökös Megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Keresés + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes Tanulási Forgatókönyvek  
**Termelésre kész alkalmazás sablonok tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Komplexitás | Fő tanulási pont |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Kereséssel |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentum intelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és függvényhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI koordináció |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél és Készlet ügynökökkel |

### Tanulás Példatípusok Szerint

> **📌 Helyi vs. Külső Példák:**  
> **Helyi példák** (ebben a repóban) = Azonnal használatra kész  
> **Külső példák** (Azure minták) = Linkelt tárolókból klónozandók

#### Helyi Példák (azonnal használható)
- [**Kiskereskedelmi Többügynökös Megoldás**](examples/retail-scenario.md) - Teljes termelésre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készlet ügynökök)
  - Átfogó monitorozás és kiértékelés
  - Egykattintásos telepítés ARM sablonon keresztül

#### Helyi Példák - Konténer Alkalmazások (2-5. fejezetek)
**Átfogó konténer alapú telepítési példák ebben a tárolóban:**
- [**Konténer App Példák**](examples/container-app/README.md) - Teljes útmutató konténer alapú telepítéshez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázással nullára
  - [Mikroszerviz architektúra](../../examples/container-app/microservices) - Termelésre kész többszervizes telepítés
  - Gyors Kezdés, Termelési és Haladó telepítési minták
  - Monitorozás, biztonság és költségoptimalizálási útmutató

#### Külső Példák - Egyszerű Alkalmazások (1-2. fejezetek)
**Klónozd ezeket az Azure Samples tárolókat a gyors kezdéshez:**
- [Egyszerű Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták
- [Statikus Weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítés
- [Konténer App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső Példák - Adatbázis Integráció (3-4. fejezet)  
- [Adatbázis App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis kapcsolat minták
- [Függvények + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Szerver nélküli adatfolyamat

#### Külső Példák - Haladó Minták (4-8. fejezetek)
- [Java Mikroszervizek](https://github.com/Azure-Samples/java-microservices-aca-lab) - Többszervizes architektúrák
- [Konténer Alkalmazások Munkák](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész ML minták

### Külső Sablon Gyűjtemények
- [**Hivatalos AZD Sablon Galéria**](https://azure.github.io/awesome-azd/) - Hivatalos és közösségi sablonok válogatott gyűjteménye
- [**Azure Developer CLI Sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példák Könyvtár**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási Források & Hivatkozások

### Gyors Hivatkozások
- [**Parancs Összefoglaló**](resources/cheat-sheet.md) - Fontos azd parancsok fejezetenként rendszerezve
- [**Fogalomtár**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések tanulási fejezetek szerint
- [**Tanulási Útmutató**](resources/study-guide.md) - Átfogó gyakorlati gyakorlatok

### Gyakorlati Workshopok
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AZD-hez telepíthető AI megoldások készítése (2-3 óra)
- [**Interaktív Workshop**](workshop/README.md) - 8 modulból álló irányított gyakorlat MkDocs és GitHub Codespaces támogatással
  - Menet: Bevezetés → Kiválasztás → Érvényesítés → Dekonstruálás → Konfigurálás → Testreszabás → Lebontás → Összegzés

### Külső Tanulási Források
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

---

## 🔧 Gyors Hibakeresési Útmutató

**Gyakori kezdői hibák és azonnali megoldások:**

<details>
<summary><strong>❌ "azd: parancs nem található"</strong></summary>

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
<summary><strong>❌ "Nem található előfizetés" vagy "Előfizetés nincs beállítva"</strong></summary>

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# AZD környezethez beállítás
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" vagy "Kvóta túllépve"</strong></summary>

```bash
# Próbáljon ki más Azure régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy használjon kisebb SKU-kat fejlesztés közben
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ Az "azd up" félúton meghiúsul</strong></summary>

```bash
# 1. lehetőség: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# 2. lehetőség: Csak az infrastruktúra javítása
azd provision

# 3. lehetőség: Részletes állapot ellenőrzése
azd show

# 4. lehetőség: Naplók ellenőrzése az Azure Monitorban
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Hitelesítés sikertelen" vagy "Token lejárt"</strong></summary>

```bash
# Újra hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Erőforrás már létezik" vagy névütközések</strong></summary>

```bash
# Az AZD egyedi neveket generál, de ha ütközés van:
azd down --force --purge

# Akkor próbálkozz újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ A sablon telepítése túl sokáig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- Mesterséges intelligencia alkalmazások: 15-25 perc (Az OpenAI üzembe helyezés lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha több mint 30 percig elakadt, nézze meg az Azure Portált:
azd monitor
# Keresse meg a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Hozzáférés megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Contributor" szerepkörre van szüksége
# Kérje meg az Azure rendszergazdáját, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyisd meg az Azure portált
azd monitor

# Ellenőrizd a konkrét szolgáltatást
azd env get-values
# Keresd a *_URL változókat
```
</details>

### 📚 Teljes hibakeresési források

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/chapter-07-troubleshooting/common-issues.md)
- **MI-hez kapcsolódó problémák:** [MI hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/chapter-07-troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Haladáskövetés
Kövesse nyomon tanulási előrehaladását minden egyes fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és Gyors kezdés ✅
- [ ] **2. fejezet**: MI-központú fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és telepítés ✅
- [ ] **5. fejezet**: Többügynökös MI megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és javítás ✅
- [ ] **8. fejezet**: Termelési és vállalati minták ✅

### Tanulási ellenőrzés
Minden fejezet befejezése után ellenőrizze tudását:
1. **Gyakorlati feladat**: Teljesítse a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Tekintse át a fejezet GYIK szekcióját
3. **Közösségi beszélgetés**: Ossza meg tapasztalatait az Azure Discordon
4. **Következő fejezet**: Térjen át a következő komplexitási szintre

### Tanfolyam befejezésének előnyei
Az összes fejezet befejezésével rendelkezik majd:
- **Termelési tapasztalat**: Valódi MI alkalmazások telepítése az Azure-ra
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és MI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás igénylése
- **Technikai problémák**: [Hibák bejelentése és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **MI-specifikus segítség**: Csatlakozzon a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések a Microsoft Foundry Discordról

**Legutóbbi szavazás eredményei a #Azure csatornán:**
- A fejlesztők **45%-a** szeretné az AZD-t MI munkaterhelésekhez használni
- **Fő kihívások**: Többszolgáltatásos telepítések, hitelesítő adatkezelés, termelési készültség  
- **Leggyakrabban kért**: MI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozzon közösségünkhöz, hogy:**
- Megossza AZD + MI tapasztalatait és segítséget kapjon
- Hozzáférjen az új MI sablonok korai verzióihoz
- Hozzájáruljon az MI telepítési legjobb gyakorlatokhoz
- Befolyásolja a jövőbeni MI + AZD funkciófejlesztéseket

### A tanfolyamhoz való hozzájárulás
Szívesen fogadunk hozzájárulásokat! Kérjük, olvassa el a [Hozzájárulási Útmutatót](CONTRIBUTING.md) a következőkről:
- **Tartalomfejlesztések**: Meglévő fejezetek és példák fejlesztése
- **Új példák**: Valós esetek és sablonok hozzáadása  
- **Fordítás**: Többnyelvű támogatás fenntartása
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi szabályok**: Befogadó közösségi irányelveink követése

---

## 📄 Tanfolyam információk

### Licenc
Ez a projekt az MIT licenc hatálya alá tartozik - részletek a [LICENSE](../../LICENSE) fájlban.

### Kapcsolódó Microsoft Learning források

Csapatunk további átfogó tanfolyamokat készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kezdőknek](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ügynökök
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kezdőknek](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MI ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív MI sorozat
[![Generatív MI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív MI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív MI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív MI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető tanulás
[![ML kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![MI kezdőknek](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot MI páros programozáshoz](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET-hez](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot kaland](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdők**: Kezdj a [1. fejezet: Alapok és Gyors kezdés](../..)  
**AI fejlesztők**: Ugorj a [2. fejezet: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztők**: Kezdj a [3. fejezet: Konfiguráció és hitelesítés](../..)

**Következő lépések**: [Kezdd el az 1. fejezetet - AZD Alapok](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
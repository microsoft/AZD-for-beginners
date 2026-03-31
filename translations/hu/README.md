# AZD kezdőknek: Egy strukturált tanulási út

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatikus fordítások (Mindig naprakészek)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmese (Mianmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh-CN/README.md) | [Kínai (Hagyományos, Hongkong)](../zh-HK/README.md) | [Kínai (Hagyományos, Makaó)](../zh-MO/README.md) | [Kínai (Hagyományos, Tajvan)](../zh-TW/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai Pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Farsi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../pt-BR/README.md) | [Portugál (Portugália)](../pt-PT/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)

> **Inkábba helyben klónoznál?**
>
> Ez a tároló 50+ nyelvi fordítást tartalmaz, amely jelentősen növeli a letöltési méretet. Fordítások nélküli klónozáshoz használd a sparse checkoutot:
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
> Ez mindent megad, amire szükséged van a kurzus elvégzéséhez sokkal gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mi újság az azd-ben ma

Az Azure Developer CLI túlmutat a hagyományos webalkalmazásokon és API-ken. Ma az azd az az egyetlen eszköz, amelyre bármilyen alkalmazás Azure-ba való telepítéséhez szükséged van – beleértve a mesterséges intelligenciával működő alkalmazásokat és intelligens ügynököket is.

Ez számodra azt jelenti, hogy:

- **Az AI ügynökök mostantól elsőrangú azd munkaterhelések.** Az AI ügynök projektek inicializálása, telepítése és kezelése ugyanazzal az `azd init` → `azd up` munkafolyamattal történik, amit már ismersz.
- **A Microsoft Foundry integrációja** közvetlenül bevonja a modelltelepítést, az ügynök hosztolást és az AI szolgáltatások konfigurálását az azd sablon ökoszisztémába.
- **Az alapmunkafolyamat nem változott.** Legyen szó teendő lista alkalmazásról, mikroszolgáltatásról vagy több ügynökös AI megoldásról, a parancsok ugyanazok.

Ha már használtad korábban az azd-t, az AI támogatás egy természetes kiterjesztés – nem egy külön eszköz vagy haladó szintű tanfolyam. Ha frissen kezded, egyetlen munkafolyamatot tanulsz meg, amely mindenre működik.

---

## 🚀 Mi az Azure Developer CLI (azd)?

**Az Azure Developer CLI (azd)** egy fejlesztőbarát parancssori eszköz, amely leegyszerűsíti az alkalmazások Azure-ba történő telepítését. Ahelyett, hogy kézzel hoznál létre és kapcsolnál össze tucatnyi Azure-erőforrást, egyetlen parancs segítségével telepíthetsz teljes alkalmazásokat.

### Az `azd up` varázsa

```bash
# Ez az egyetlen parancs mindent elvégez:
# ✅ Létrehozza az összes Azure-erőforrást
# ✅ Konfigurálja a hálózatot és a biztonságot
# ✅ Felépíti az alkalmazásod kódját
# ✅ Telepíti az Azure-ra
# ✅ Egy működő URL-t ad
azd up
```

**Ennyi az egész!** Nincs Azure Portal kattintgatás, bonyolult ARM sablonok tanulása vagy kézi konfiguráció – csak működő alkalmazások az Azure-on.

---

## ❓ Azure Developer CLI és Azure CLI: Mi a különbség?

Ez a leggyakoribb kérdés kezdők részéről. Íme a egyszerű válasz:

| Jellemző | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cél** | Egyéni Azure erőforrások kezelése | Teljes alkalmazások telepítése |
| **Megközelítés** | Infrastruktúra-központú | Alkalmazás-központú |
| **Példa** | `az webapp create --name myapp...` | `azd up` |
| **Tanulási görbe** | Azure szolgáltatások ismerete szükséges | Csak az alkalmazásod ismerete kell |
| **Legjobb** | DevOps, infrastruktúra | Fejlesztők, prototípus készítés |

### Egyszerű hasonlat

- **Azure CLI** olyan, mint az összes szerszám birtoklása egy ház építéséhez – kalapácsok, fűrészek, szegek. Bármit megépíthetsz, ha tudod az építést.
- **Azure Developer CLI** olyan, mint egy vállalkozó megbízása – elmondod, mit akarsz, ők megépítik.

### Mikor melyiket használd?

| Forgatókönyv | Ezt használd |
|----------|----------|
| "Gyorsan akarom telepíteni a webalkalmazásom" | `azd up` |
| "Csak egy tárolófiókot akarok létrehozni" | `az storage account create` |
| "Teljes AI alkalmazást építek" | `azd init --template azure-search-openai-demo` |
| "Egy adott Azure erőforrás hibakeresése kell" | `az resource show` |
| "Perceken belül éles telepítést akarok" | `azd up --environment production` |

### Együtt is működnek!

AZD az Azure CLI-t használja a háttérben. Mindkettőt használhatod:
```bash
# Telepítse az alkalmazását az AZD-vel
azd up

# Ezután finomhangolja a konkrét erőforrásokat az Azure CLI segítségével
az webapp config set --name myapp --always-on true
```

---

## 🌟 Keress sablonokat az Awesome AZD-ben

Ne kezdd a nulláról! Az **Awesome AZD** a közösség által gyűjtött, azonnal telepíthető sablonok gyűjteménye:

| Erőforrás | Leírás |
|----------|-------------|
| 🔗 [**Awesome AZD galéria**](https://azure.github.io/awesome-azd/) | Böngéssz 200+ sablon között egykattintásos telepítéssel |
| 🔗 [**Sablon beküldése**](https://github.com/Azure/awesome-azd/issues) | Adj hozzá saját sablont a közösséghez |
| 🔗 [**GitHub tároló**](https://github.com/Azure/awesome-azd) | Csillagozd és fedezd fel a forrást |

### Népszerű AI sablonok az Awesome AZD-ből

```bash
# RAG csevegés Microsoft Foundry modellekkel + AI Search
azd init --template azure-search-openai-demo

# Gyors AI csevegőalkalmazás
azd init --template openai-chat-app-quickstart

# AI ügynökök Foundry-ügynökökkel
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kezdés 3 lépésben

### 1. lépés: Telepítsd az AZD-t (2 perc)

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

### 2. lépés: Jelentkezz be Azure-ba

```bash
azd auth login
```

### 3. lépés: Telepítsd az első alkalmazásod

```bash
# Inicializálás sablonból
azd init --template todo-nodejs-mongo

# Telepítés Azure-ra (mindent létrehoz!)
azd up
```

**🎉 Ennyi az egész!** Az alkalmazásod most már élő az Azure-on.

### Takarítás (Ne felejtsd el!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hogyan használd ezt a kurzust

Ez a kurzus **fokozatos tanulásra** készült – kezdj ott, ahol kényelmes, és haladj felfelé:

| Tapasztalatod | Itt kezdj |
|-----------------|------------|
| **Teljesen új vagy az Azure-ban** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **Ismered az Azure-t, de az AZD új neked** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **AI alkalmazások telepítését szeretnéd** | [2. fejezet: AI-első fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gyakorlati kézzelfogható tapasztalatot szeretnél** | [🎓 Interaktív Workshop](workshop/README.md) - 3-4 órás vezetett labor |
| **Éles környezeti mintákra van szükséged** | [8. fejezet: Éles & vállalati minták](#-chapter-8-production--enterprise-patterns) |

### Gyors beállítás

1. **Forkold ezt a tárolót**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd le**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kérj segítséget**: [Azure Discord közösség](https://discord.com/invite/ByRwuEEgH4)

> **Inkábba helyben klónoznál?**

> Ez a tároló több mint 50 nyelvi fordítást tartalmaz, ami jelentősen növeli a letöltési méretet. Ha fordítások nélkül szeretnéd klónozni, akkor használd a sparse checkoutot:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ez mindent megad a tanfolyam elvégzéséhez, sokkal gyorsabb letöltéssel.

## Kurzus áttekintés

Az Azure Developer CLI (azd) mesteri szintű elsajátítása strukturált fejezeteken keresztül, amely a fokozatos tanulást szolgálja. **Különös hangsúly az AI alkalmazások telepítésén Microsoft Foundry integrációval.**

### Miért fontos ez a kurzus a modern fejlesztőknek

A Microsoft Foundry Discord közösség tapasztalatai alapján, **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de kihívásokkal szembesülnek:
- Összetett több-szolgáltatásos AI architektúrák
- Éles AI telepítési bevált gyakorlatok
- Azure AI szolgáltatások integrációja és konfigurációja
- Költségoptimalizálás AI munkaterhelésekhez
- AI-specifikus telepítési problémák hibaelhárítása

### Tanulási célok

A kurzus elvégzésével képes leszel:
- **AZD alapok elsajátítása**: Alapfogalmak, telepítés és beállítás
- **AI alkalmazások telepítése**: AZD használata a Microsoft Foundry szolgáltatásokkal
- **Infrastructure as Code megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési hibák elhárítása**: Gyakori problémák megoldása és hibakeresés
- **Éles környezetre optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Több ügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 🗺️ Kurzus térkép: Gyors navigáció fejezetek szerint

Minden fejezet saját README fájllal rendelkezik tanulási célokkal, gyors kezdéssel és gyakorlatokkal:

| Fejezet | Téma | Tananyagok | Időtartam | Bonyolultság |
|---------|-------|---------|----------|------------|
| **[1. fejezet: Alapok](docs/chapter-01-foundation/README.md)** | Kezdés | [AZD alapok](docs/chapter-01-foundation/azd-basics.md) &#124; [Telepítés](docs/chapter-01-foundation/installation.md) &#124; [Első projekt](docs/chapter-01-foundation/first-project.md) | 30-45 perc | ⭐ |
| **[2. fejezet: MI fejlesztés](docs/chapter-02-ai-development/README.md)** | MI-első alkalmazások | [Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [MI ügynökök](docs/chapter-02-ai-development/agents.md) &#124; [Modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 óra | ⭐⭐ |
| **[3. fejezet: Konfiguráció](docs/chapter-03-configuration/README.md)** | Hitelesítés és Biztonság | [Konfiguráció](docs/chapter-03-configuration/configuration.md) &#124; [Hitelesítés és Biztonság](docs/chapter-03-configuration/authsecurity.md) | 45-60 perc | ⭐⭐ |
| **[4. fejezet: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC és Telepítés | [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Előkészítés](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 óra | ⭐⭐⭐ |
| **[5. fejezet: Több ügynök](docs/chapter-05-multi-agent/README.md)** | MI Ügynök Megoldások | [Kiskereskedelmi forgatókönyv](examples/retail-scenario.md) &#124; [Koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[6. fejezet: Telepítés előtti](docs/chapter-06-pre-deployment/README.md)** | Tervezés és ellenőrzés | [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 óra | ⭐⭐ |
| **[7. fejezet: Hibakeresés](docs/chapter-07-troubleshooting/README.md)** | Hibakeresés és javítás | [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hibakeresés](docs/chapter-07-troubleshooting/debugging.md) &#124; [MI problémák](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 óra | ⭐⭐ |
| **[8. fejezet: Termelés](docs/chapter-08-production/README.md)** | Vállalati minták | [Termelési gyakorlatok](docs/chapter-08-production/production-ai-practices.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Gyakorlati labor | [Bevezetés](workshop/docs/instructions/0-Introduction.md) &#124; [Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Ellenőrzés](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Szétbontás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Lebontás](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Összefoglalás](workshop/docs/instructions/7-Wrap-up.md) | 3-4 óra | ⭐⭐ |

**A tanfolyam teljes időtartama:** ~10-14 óra | **Készségfejlődés:** Kezdő → Termelésre kész

---

## 📚 Tanulási fejezetek

*Válassza ki tanulási útvonalát tapasztalati szint és célok szerint*

### 🚀 1. fejezet: Alapok és gyors kezdés
**Előfeltételek**: Azure-előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit megtanul
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformjára
- Az első sikeres telepítés

#### Tanulási források
- **🎯 Kezdés itt**: [Mi az Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Elmélet**: [AZD alapismeretek](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekted](docs/chapter-01-foundation/first-project.md) - Lépésről lépésre oktatóanyag
- **📋 Gyors hivatkozás**: [Parancsfelsorolás](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Gyors telepítés ellenőrzés
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet eredménye**: Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD segítségével

**✅ Siker ellenőrzése:**
```bash
# Az 1. fejezet befejezése után képes leszel:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepítés Azure-ra
azd show                # Futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások tisztítása
```

**📊 Időbefektetés:** 30-45 perc  
**📈 Készség szintje a fejezet után:** Alap alkalmazások önálló telepítése

---

### 🤖 2. fejezet: MI-első fejlesztés (Ajánlott MI fejlesztőknek)
**Előfeltétel**: 1. fejezet befejezve  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanul
- Microsoft Foundry integráció AZD-vel
- MI-alapú alkalmazások telepítése
- MI szolgáltatás konfiguralása

#### Tanulási források
- **🎯 Kezdés itt**: [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 MI ügynökök**: [MI ügynök útmutató](docs/chapter-02-ai-development/agents.md) - Intelligens ügynökök telepítése AZD-vel
- **📖 Minták**: [MI modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) - MI modellek telepítése és kezelése
- **🛠️ Workshop**: [MI workshop labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tegye AZD-kompatibilissé MI megoldásait
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőben elérhető tanulás MkDocs * DevContainer környezettel
- **📋 Sablonok**: [Microsoft Foundry sablonok](#a-műhely-forrásai)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati feladatok
```bash
# Telepítse első MI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további MI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet eredménye**: MI-alapú csevegőalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Siker ellenőrzése:**
```bash
# A 2. fejezet után képesnek kell lenned:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI csevegőfelületet
# Kérdéseket feltenni és AI által támogatott válaszokat kapni forrásokkal
# Ellenőrizni, hogy a keresési integráció működik
azd monitor  # Megnézni, hogy az Application Insights megjeleníti a telemetriát
azd down --force --purge
```

**📊 Időbefektetés:** 1-2 óra  
**📈 Készség szintje a fejezet után:** Termelésre kész MI alkalmazások telepítése és konfigurálása  
**💰 Költségtudatosság:** Ismeri az $80-150/hónap fejlesztési, $300-3500/hónap termelési költségeket

#### 💰 Költségszempontok MI telepítéseknél

**Fejlesztői környezet (Becsült $80-150/hónap):**
- Microsoft Foundry modellek (fizetés használat alapján): $0-50/hónap (token használattól függően)
- MI keresés (Alapcsomag): $75/hónap
- Container Apps (Fogyasztás alapú): $0-20/hónap
- Tárolás (Standard): $1-5/hónap

**Termelési környezet (Becsült $300-3,500+/hónap):**
- Microsoft Foundry modellek (PTU a konzisztens teljesítményért): $3,000+/hónap VAGY Fogyasztás alapú magas használattal
- MI keresés (Standard csomag): $250/hónap
- Container Apps (Dedikált): $50-100/hónap
- Application Insights: $5-50/hónap
- Tárolás (Prémium): $10-50/hónap

**💡 Költségoptimalizálási tippek:**
- Használjon **Ingyenes szintű** Microsoft Foundry modelleket tanuláshoz (Azure OpenAI 50,000 token/hónap tartalmazva)
- Futtassa az `azd down` parancsot, ha nincs aktív fejlesztés, hogy felszabadítsa az erőforrásokat
- Kezdje a fogyasztás alapú elszámolással, PTU-ra csak termeléshez váltson
- Használja az `azd provision --preview` parancsot a költségbecsléshez telepítés előtt
- Engedélyezze az automatikus skálázást: csak a tényleges használatért fizet

**Költségfigyelés:**
```bash
# Ellenőrizze a becsült havi költségeket
azd provision --preview

# Kövesse nyomon a tényleges költségeket az Azure Portálon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
**Előfeltétel**: 1. fejezet befejezve  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit megtanul
- Környezet konfiguráció és kezelés
- Hitelesítés és biztonság legjobb gyakorlatai
- Erőforrás elnevezés és szervezés

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/chapter-03-configuration/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati feladatok
- Több környezet konfigurálása (fejlesztői, teszt, termelés)
- Kezelt identitás alapú hitelesítés beállítása
- Környezet specifikus konfigurációk implementálása

**💡 Fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kódként (IaC) és telepítés
**Előfeltétel**: 1-3. fejezetek befejezve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit megtanul
- Haladó telepítési minták
- Infrastruktúra kódként Bicep használatával
- Erőforrás előkészítési stratégiák

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Előkészítés**: [Erőforrás előkészítés](docs/chapter-04-infrastructure/provisioning.md) - Azure erőforráskezelés
- **📝 Példák**: [Container App példa](../../examples/container-app) - Konténeres telepítések

#### Gyakorlati feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatásos alkalmazások telepítése
- Blue-green telepítési stratégiák alkalmazása

**💡 Fejezet eredménye**: Komplex több szolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Több ügynökös MI megoldások (Haladó)
**Előfeltétel**: 1-2. fejezetek befejezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanul
- Több ügynök architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész MI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi több ügynök megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM sablonok**: [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Egy kattintásos telepítés
- **📖 Architektúra**: [Több ügynök koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Termelésre kész több ügynökös MI megoldás telepítése és kezelése Ügyfél- és Készlet ügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti ellenőrzés és tervezés
**Előfeltétel**: 4. fejezet befejezve  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanul
- Kapacitástervezés és erőforrás-ellenőrzés
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás ellenőrzés
- **💰 Kiválasztás**: [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Ellenőrzés**: [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati feladatok
- Kapacitás ellenőrző szkriptek futtatása
- SKU kiválasztás optimalizálása költség alapján
- Automatizált telepítés előtti ellenőrzések alkalmazása

**💡 Fejezet eredménye**: Telepítések ellenőrzése és optimalizálása a végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés és debugolás
**Előfeltétel**: Bármely telepítési fejezet befejezve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanul
- Szisztematikus hibakeresési módszerek
- Gyakori problémák és megoldások
- MI-specifikus hibakezelés

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - Gyakori kérdések és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 MI problémák**: [MI-specifikus hibakezelés](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - MI szolgáltatás problémák

#### Gyakorlati feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- MI szolgáltatás kapcsolat hibáinak hibakeresése

**💡 Fejezet eredménye**: Gyakori telepítési hibák önálló azonosítása és megoldása

---

### 🏢 8. fejezet: Termelés és vállalati minták
**Előfeltétel**: 1-4. fejezetek befejezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanul
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás

#### Tanulási források
- **🏭 Termelés**: [Termelési mesterséges intelligencia legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Microservices példa](../../examples/microservices) - Összetett architektúrák
- **📊 Monitorozás**: [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Monitorozás

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó monitorozás beállítása
- Termelési környezetbe történő telepítés megfelelő kormányzással

**💡 Fejezet eredménye**: Vállalati szintű alkalmazások telepítése teljes termelési képességekkel

---

## 🎓 Műhely áttekintése: Gyakorlati tanulási élmény

> **⚠️ MŰHELY ÁLLAPOTA: Aktív fejlesztés**  
> A műhely anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működőképesek, de néhány haladó szakasz még nem teljes. Aktívan dolgozunk az összes tartalom befejezésén. [Nyomon követés →](workshop/README.md)

### Interaktív műhely anyagok
**Átfogó gyakorlati tanulás böngésző alapú eszközökkel és irányított feladatokkal**

A műhely anyagok egy strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fentebb bemutatott fejezetalapú tananyagot. A műhely mind önálló tanuláshoz, mind oktató által vezetett órákhoz készült.

#### 🛠️ A műhely jellemzői
- **Böngésző alapú felület**: Teljes MkDocs alapú műhely kereséssel, másolási és téma opciókkal
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet telepítés
- **Strukturált tanulási útvonal**: 8 modulból álló irányított gyakorlatok (összesen 3-4 óra)
- **Fokozatos módszertan**: Bevezetés → Kiválasztás → Érvényesítés → Bontás → Konfiguráció → Testreszabás → Leszerelés → Összefoglalás
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Műhely modul struktúra
A műhely egy **8 modulból álló fokozatos módszertant** követ, amely elvezet a felfedezéstől a telepítés mesteri szintjéig:

| Modul | Téma | Mit fogsz csinálni | Időtartam |
|--------|-------|----------------|----------|
| **0. Bevezetés** | Műhely áttekintése | A tanulási célok, előfeltételek és a műhely struktúrájának megértése | 15 perc |
| **1. Kiválasztás** | Sablon felfedezés | AZD sablonok felfedezése és az adott helyzethez legmegfelelőbb AI sablon kiválasztása | 20 perc |
| **2. Érvényesítés** | Telepítés és ellenőrzés | `azd up` paranccsal végzett sablon telepítés és infrastruktúra működésének validálása | 30 perc |
| **3. Bontás** | Felépítés megértése | GitHub Copilot használata a sablon architektúra, Bicep fájlok és kód szerkezetének feltérképezésére | 30 perc |
| **4. Konfiguráció** | azure.yaml mélyreható | `azure.yaml` konfiguráció, életciklus hook-ok és környezeti változók elsajátítása | 30 perc |
| **5. Testreszabás** | Személyre szabás | AI Keresés, trace-elés, értékelés engedélyezése, és testreszabás az adott helyzethez | 45 perc |
| **6. Leszerelés** | Takarítás | Biztonságos erőforrás leszerelés `azd down --purge` használatával | 15 perc |
| **7. Összefoglalás** | Következő lépések | Eredmények áttekintése, kulcsfogalmak, tanulási út folytatása | 15 perc |

**A műhely menete:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 A műhely megkezdése
```bash
# 1. lehetőség: GitHub Codespaces (Ajánlott)
# Kattints a "Code" → "Create codespace on main" menüpontra a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a beállítási utasításokat a workshop/README.md fájlban
```

#### 🎯 A műhely tanulási eredményei
A műhely elvégzésével a résztvevők:
- **Termelési AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Többügynökös architektúrák elsajátítása**: Koordinált AI ügynök megoldások implementálása
- **Biztonsági legjobb gyakorlatok megvalósítása**: Hitelesítés és hozzáférés-vezérlés konfigurálása
- **Méretezés optimalizálása**: Költséghatékony, magas teljesítményű telepítések tervezése
- **Telepítési hibák elhárítása**: Gyakori problémák önálló megoldása

#### 📖 A műhely forrásai
- **🎥 Interaktív útmutató**: [Műhely anyagok](workshop/README.md) - Böngésző alapú tanulási környezet
- **📋 Modulonkénti utasítások**:
  - [0. Bevezetés](workshop/docs/instructions/0-Introduction.md) - Műhely áttekintés és célok
  - [1. Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) - AI sablonok keresése és kiválasztása
  - [2. Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) - Sablon telepítés és ellenőrzés
  - [3. Bontás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Sablon architektúra feltérképezése
  - [4. Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml elsajátítása
  - [5. Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) - Testreszabás az adott helyzethez
  - [6. Leszerelés](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Erőforrások eltávolítása
  - [7. Összefoglalás](workshop/docs/instructions/7-Wrap-up.md) - Áttekintés és további lépések
- **🛠️ AI műhely labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fókuszú feladatok
- **💡 Gyorsindítás**: [Műhely beállítási útmutató](workshop/README.md#quick-start) - Környezet konfiguráció

**Ideális:** Vállalati képzéshez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mélyebb áttekintés: AZD képességek

Az alapokon túl, az AZD erőteljes funkciókat kínál termelési telepítésekhez:

- **Sablonalapú telepítések** - Előre elkészített sablonok gyakori alkalmazási mintákhoz
- **Infrastruktúra mint kód** - Azure erőforrások kezelés Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Kliensoldali, telepítési és monitorozási feladatok zökkenőmentes egyesítése
- **Fejlesztőbarát** - Optimalizált fejlesztői termelékenység és élmény

### **AZD + Microsoft Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** AZD kezeli az AI fejlesztők legfontosabb kihívásait:

- **AI-Kész sablonok** - Előre konfigurált sablonok Microsoft Foundry modellekhez, Cognitive Serviceshez, ML munkákhoz
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz, modell végpontokhoz  
- **Termelési AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazásokhoz
- **Végponttól végpontig AI munkafolyamatok** - Modellfejlesztéstől a termelési telepítésig megfelelő monitorozással
- **Költségoptimalizálás** - Okos erőforrás-elosztás és skálázási stratégiák AI munkákhoz
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modell katalógusával és végpontjaival

---

## 🎯 Sablonok és példatár

### Kiemelt: Microsoft Foundry sablonok
**Innen indulj, ha AI alkalmazást telepítesz!**

> **Megjegyzés:** Ezek a sablonok különböző AI mintákat mutatnak be. Néhány külső Azure minta, mások helyi megvalósítások.

| Sablon | Fejezet | Összetettség | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**AI chat kezdő lépések**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**AI ügynök kezdő lépések**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Külső |
| [**Azure Search + OpenAI demó**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat gyorsindító**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Komplett tanulási forgatókönyvek
**Termelési alkalmazás sablonok tanulási fejezetekhez kötve**

| Sablon | Tanulási fejezet | Összetettség | Fő tanulási pont |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search-szal |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentum intelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és function hívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI összehangolás |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél és Készlet ügynökökkel |

### Tanulás példa típus szerint

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repóban) = Azonnal használható  
> **Külső példák** (Azure minták) = Hivatkozott repókból klónozhatók

#### Helyi példák (Azonnal használható)
- [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) - Teljes termelési implementáció ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készlet ügynökök)
  - Átfogó monitorozás és értékelés
  - Egykattintásos telepítés ARM sablonnal

#### Helyi példák - Konténer alkalmazások (2-5. fejezetek)
**Átfogó konténer telepítési példák ebben a repóban:**
- [**Konténer alkalmazás példák**](examples/container-app/README.md) - Teljes útmutató konténerizált telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázás nulla felé
  - [Mikroszolgáltatási architektúra](../../examples/container-app/microservices) - Termelési többszolgáltatásos telepítés
  - Gyorsindítás, termelés és haladó minták
  - Monitorozási, biztonsági és költségoptimalizálási útmutató

#### Külső példák - Egyszerű alkalmazások (1-2. fejezetek)
**Ezeket az Azure sample repókat klónozd a kezdéshez:**
- [Egyszerű webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták
- [Statikus webhely - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítés
- [Konténer alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis kapcsolódási minták
- [Funkciók + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Szerver nélküli adatfolyam

#### Külső példák - Haladó minták (4-8. fejezetek)
- [Java mikroservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Többszolgáltatásos architektúrák
- [Konténer alkalmazások háttérfeldolgozása](https://github.com/Azure-Samples/container-apps-jobs)  
- [Vállalati ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Termelési ML minták

### Külső sablon gyűjtemények
- [**Hivatalos AZD sablon galéria**](https://azure.github.io/awesome-azd/) - Kiválasztott hivatalos és közösségi sablonok
- [**Azure Developer CLI sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példatár könyvtár**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források és hivatkozások

### Gyors hivatkozások
- [**Parancs összefoglaló**](resources/cheat-sheet.md) - Fontos azd parancsok fejezetenként rendszerezve
- [**Fogalomtár**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések tanulási fejezetek szerint
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó gyakorlatok

### Gyakorlati műhelyek
- [**AI műhely labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tedd AI megoldásaidat AZD telepíthetővé (2-3 óra)
- [**Interaktív műhely**](workshop/README.md) - 8 modulból álló irányított gyakorlat MkDocs és GitHub Codespaces használatával
  - Követi: Bevezetés → Kiválasztás → Érvényesítés → Bontás → Konfiguráció → Testreszabás → Leszerelés → Összefoglalás

### Külső tanulási források
- [Azure fejlesztői CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure státusz](https://status.azure.com/)

### AI ügynök készségek a szerkesztődhöz
- [**Microsoft Azure készségek a skills.sh-en**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt ügynök készség Azure AI, Foundry, telepítés, diagnosztika, költségoptimalizálás és egyebek számára. Telepítsd őket GitHub Copilotba, Cursorba, Claude Code-ba vagy bármely támogatott ügynökbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Gyors hibakeresési útmutató

**Gyakori problémák, amikkel a kezdők szembesülnek, és azonnali megoldások:**

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

# Beállítás az AZD környezethez
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

# Vagy használjon kisebb SKU-kat fejlesztésben
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" lefutási hiba a folyamat felénél</strong></summary>

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
<summary><strong>❌ "Az erőforrás már létezik" vagy névütközések</strong></summary>

```bash
# Az AZD egyedi neveket generál, de ha ütközés van:
azd down --force --purge

# Akkor próbálkozzon új környezettel újra
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ A sablon telepítése túl sokáig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Alkalmazás adatbázissal: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI szolgáltatás lassú)

```bash
# Ellenőrizze a folyamatot
azd show

# Ha 30 percnél tovább elakadt, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Engedély megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Contributor" szerepkör szükséges
# Kérje meg Azure adminisztrátorát, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem találom a telepített alkalmazás URL-jét</strong></summary>

```bash
# Minden szolgáltatás végpontjának megjelenítése
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Ellenőrizze az adott szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```
</details>

### 📚 Teljes hibakeresési források

- **Gyakori hibák útmutató:** [Részletes megoldások](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikus hibák:** [AI hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/chapter-07-troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése & tanúsítvány

### Előrehaladás nyomon követése
Kövesd nyomon tanulási előrehaladásodat minden fejezetben:

- [ ] **1. fejezet**: Alapok & Gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció & Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra mint kód & Telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti validálás & tervezés ✅
- [ ] **7. fejezet**: Hibakeresés & Debug ✅
- [ ] **8. fejezet**: Éles & vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet elvégzése után ellenőrizd tudásodat:
1. **Gyakorlati feladat**: Végezze el a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Nézd át a fejezet GYIK szekcióját
3. **Közösségi megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Lépj a következő nehézségi szintre

### A tanfolyam befejezésének előnyei
Minden fejezet elvégzése után:
- **Éles tapasztalat**: Valódi AI alkalmazások telepítése Azure-re
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség & támogatás

### Segítségkérés & támogatás
- **Műszaki problémák**: [Hibabejelentés és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: Csatlakozz a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések a Microsoft Foundry Discordról

**Legutóbbi szavazás eredménye a #Azure csatornán:**
- A fejlesztők **45%-a** szeretné az AZD-t AI munkafolyamatokhoz használni
- **Fő kihívások**: Több szolgáltatás telepítése, hitelesítő adat kezelés, éles környezetre való felkészülés  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataidat, és segítséget kapj
- Hozzáférj új AI sablonok korai verzióihoz
- Hozzájárulj AI telepítési legjobb gyakorlatokhoz
- Befolyásold a jövőbeli AI + AZD funkciók fejlesztését

### Hozzájárulás a tanfolyamhoz
Örömmel fogadjuk a hozzájárulásokat! Kérjük, olvasd el a [Hozzájárulási Útmutatót](CONTRIBUTING.md) a részletekért:
- **Tartalom fejlesztés**: További fejezetek és példák bővítése
- **Új példák**: Valós helyzetek és sablonok hozzáadása  
- **Fordítás**: Többnyelvű támogatás fenntartása
- **Hibajelentések**: Pontosság és egyértelműség javítása
- **Közösségi normák**: Inkluzív közösségi irányelveink követése

---

## 📄 Tanfolyam információk

### Licenc
Ez a projekt az MIT licenc alatt áll - további részletek a [LICENSE](../../LICENSE) fájlban találhatók.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanulási tanfolyamokat is készít:

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
[![AI ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI sorozat
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető tanulás
[![ML kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kezdőknek](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web fejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulás elkezdésére?**

**Kezdők**: Kezdj a [1. fejezet: Alapok és gyors kezdés](#-chapter-1-foundation--quick-start)  
**AI fejlesztők**: Ugorj a [2. fejezet: AI-először fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Tapasztalt fejlesztők**: Kezdd a [3. fejezet: Konfiguráció és hitelesítés](#️-chapter-3-configuration--authentication)

**Következő lépések**: [Kezdd az 1. fejezetet - AZD alapok](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével készült. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén professzionális, humán fordítást javaslunk. Nem vállalunk felelősséget semmilyen félreértésért vagy félreértelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD Kezdőknek: Egy Strukturált Tanulási Út

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatikus Fordítások (Mindig Friss)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Myanmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh-CN/README.md) | [Kínai (Hagyományos, Hong Kong)](../zh-HK/README.md) | [Kínai (Hagyományos, Makaó)](../zh-MO/README.md) | [Kínai (Hagyományos, Tajvan)](../zh-TW/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigeriai pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Farsi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../pt-BR/README.md) | [Portugál (Portugália)](../pt-PT/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)

> **Inkább helyileg klónoznád?**
>
> Ez a tároló 50+ nyelvi fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretnél klónozni, használj sparse checkout-ot:
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
> Így minden meglesz, ami a kurzus elvégzéséhez kell, jóval gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mi Újság az azd-vel Ma

Az Azure Developer CLI túlnőtt a hagyományos webalkalmazások és API-k kezelésén. Ma az azd az egyetlen eszköz, amellyel **bármilyen** alkalmazást lehet telepíteni az Azure-ra – beleértve a mesterséges intelligencia vezérelt alkalmazásokat és intelligens ügynököket is.

Ez mit jelent számodra:

- **Az AI ügynökök most elsőrendű azd munkaterhelésként kezelhetők.** Inicializálhatod, telepítheted és kezelheted az AI ügynök projekteket ugyanazzal az `azd init` → `azd up` folyamattal, amit már ismersz.
- **A Microsoft Foundry integráció** közvetlenül beemeli a modelltelepítést, az ügynökök hosztolását és az AI szolgáltatások konfigurációját az azd sablon ökoszisztémába.
- **Az alapvető munkafolyamat változatlan maradt.** Akár todo alkalmazást, mikro-szolgáltatást, vagy több ügynökből álló AI megoldást telepítesz, a parancsok ugyanazok.

Ha már használtad az azd-t korábban, az AI támogatás annak természetes kiterjesztése – nem egy külön eszköz vagy haladó útvonal. Ha most kezded, egyetlen munkafolyamatot tanulsz meg, ami mindenre működik.

---

## 🚀 Mi az Azure Developer CLI (azd)?

**Az Azure Developer CLI (azd)** egy fejlesztőbarát parancssori eszköz, amely leegyszerűsíti az alkalmazások Azure-ra történő telepítését. Ahelyett, hogy manuálisan hoznál létre és csatlakoztatnál tucatnyi Azure erőforrást, egyetlen parancs segítségével telepíthetsz egész alkalmazásokat.

### Az `azd up` varázslata

```bash
# Ez az egyetlen parancs mindent elvégez:
# ✅ Létrehozza az összes Azure-erőforrást
# ✅ Konfigurálja a hálózatot és a biztonságot
# ✅ Lefordítja az alkalmazás kódját
# ✅ Telepíti az Azure-ba
# ✅ Megad egy működő URL-címet
azd up
```

**Ennyi!** Nem kell kattintgatni az Azure Portalon, nem kell bonyolult ARM sablonokat megtanulni előre, nincs manuális konfiguráció – csak működő alkalmazás az Azure-on.

---

## ❓ Azure Developer CLI vs Azure CLI: Mi a Különbség?

Ez a kezdők leggyakoribb kérdése. Íme a rövid válasz:

| Jellemző | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cél** | Egyedi Azure erőforrások kezelése | Teljes alkalmazások telepítése |
| **Megközelítés** | Infrastruktúra-központú | Alkalmazás-központú |
| **Példa** | `az webapp create --name myapp...` | `azd up` |
| **Tanulási görbe** | Azure szolgáltatások ismerete szükséges | Csak az alkalmazásodat kell ismerned |
| **Legalkalmasabb** | DevOps, Infrastruktúra | Fejlesztők, prototípus készítés |

### Egyszerű Analógia

- **Azure CLI** olyan, mintha minden építőeszközt megkapnál egy ház felépítéséhez – kalapács, fűrész, szögek. Bármit fel tudsz építeni, de ismerned kell az építkezést.
- **Azure Developer CLI** olyan, mintha felbérelnél egy vállalkozót – elmondod, mit szeretnél, ők pedig elvégzik az építést.

### Mikor melyiket használd

| Szituáció | Használd ezt |
|----------|--------------|
| "Gyorsan szeretném telepíteni a webalkalmazásom" | `azd up` |
| "Csak egy tárolófiókot akarok létrehozni" | `az storage account create` |
| "Teljes AI alkalmazást fejlesztek" | `azd init --template azure-search-openai-demo` |
| "Egy specifikus Azure erőforrást kell hibakeresnem" | `az resource show` |
| "Pár perc alatt éles környezetbe akarok telepíteni" | `azd up --environment production` |

### Együtt is használhatók!

Az azd az Azure CLI-t használja a háttérben. Mindkettőt használhatod:
```bash
# Telepítse az alkalmazását az AZD-vel
azd up

# Ezután finomhangolja a konkrét erőforrásokat az Azure CLI-vel
az webapp config set --name myapp --always-on true
```

---

## 🌟 Találj sablonokat az Awesome AZD-ben

Ne kezdj nulláról! Az **Awesome AZD** a közösség által készített, azonnal telepíthető sablonok gyűjteménye:

| Erőforrás | Leírás |
|----------|---------|
| 🔗 [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) | Böngéssz 200+ sablon között, egykattintásos telepítéssel |
| 🔗 [**Sablont beküldeni**](https://github.com/Azure/awesome-azd/issues) | Küldd be saját sablonodat a közösségnek |
| 🔗 [**GitHub tároló**](https://github.com/Azure/awesome-azd) | Csillagozd és böngészd a forrást |

### Népszerű AI sablonok az Awesome AZD-ből

```bash
# RAG-csevegés Microsoft Foundry modellekkel + MI-keresés
azd init --template azure-search-openai-demo

# Gyors MI-csevegőalkalmazás
azd init --template openai-chat-app-quickstart

# MI-ügynökök Foundry-ügynökökkel
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kezdés 3 lépésben

Mielőtt elkezdenéd, győződj meg róla, hogy a géped készen áll az adott sablon telepítésére:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha bármelyik ellenőrzés megbukik, előbb azt javítsd, majd folytasd a gyors kezdéssel.

### 1. lépés: Azd telepítése (2 perc)

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

### 2. lépés: Azd hitelesítés

```bash
# Nem kötelező, ha a kurzus során közvetlenül az Azure CLI parancsokat kívánja használni
az login

# Szükséges az AZD munkafolyamatokhoz
azd auth login
```

Ha nem vagy biztos, melyikre van szükséged, kövesd a teljes beállítási folyamatot a [Telepítés és beállítás](docs/chapter-01-foundation/installation.md#authentication-setup) dokumentumban.

### 3. lépés: Az első alkalmazás telepítése

```bash
# Inicializálás sablonból
azd init --template todo-nodejs-mongo

# Telepítés Azure-ra (mindent létrehoz!)
azd up
```

**🎉 Ennyi!** Az alkalmazásod most már élő az Azure-on.

### Takarítás (Ne feledd!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hogyan használd ezt a kurzust

Ez a kurzus **fokozatos tanulásra** lett tervezve – kezd ott, ahol kényelmes és lépésről lépésre haladj előre:

| Tapasztalatod | Innen kezd |
|---------------|------------|
| **Totál új vagy az Azure-ban** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **Ismered az Azure-t, az azd újdonság** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **AI alkalmazásokat szeretnél telepíteni** | [2. fejezet: AI-Központú Fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gyakorlati kézbe vétel érdekel** | [🎓 Interaktív Műhely](workshop/README.md) - 3-4 órás vezetett labor |
| **Éles minták kellenek** | [8. fejezet: Termelés & Vállalati minták](#-chapter-8-production--enterprise-patterns) |

### Gyors beállítás

1. **Forkold ezt a tárolót**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kérj segítséget**: [Azure Discord Közösség](https://discord.com/invite/ByRwuEEgH4)

> **Inkább helyileg klónoznád?**

> Ez a tároló 50+ nyelvi fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretnél klónozni, használj sparse checkout-ot:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Így minden meglesz, ami a kurzus elvégzéséhez kell, jóval gyorsabb letöltéssel.


## Kurzus Áttekintés

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek a fokozatos tanulásra vannak kialakítva. **Különös hangsúly az AI alkalmazások telepítésén Microsoft Foundry integrációval.**

### Miért lényeges ez a kurzus a modern fejlesztőknek

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a az azd-t szeretné használni AI munkaterhelésekhez**, de akadályokkal találkoznak:
- Komplex többszolgáltatásos AI architektúrák
- AI termelési telepítési legjobb gyakorlatok  
- Azure AI szolgáltatás integráció és konfiguráció
- AI munkaterhelések költséghatékonyságának optimalizálása
- AI-specifikus telepítési problémák hibakeresése

### Tanulási célok

A kurzus elvégzése után:
- **Azd alapok mesterfokon**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazások telepítése**: Azd használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kód formájában**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítések hibakeresése**: Gyakori problémák megoldása és hibák feltárása
- **Termelésre optimalizálás**: Biztonság, skálázás, monitoring, költségkezelés
- **Több ügynökös megoldások építése**: Komplex AI architektúrák telepítése

## Mielőtt elkezdenéd: Fiókok, elérések és feltételezések

Mielőtt megkezdenéd az 1. fejezetet, győződj meg róla, hogy a következők rendben vannak. A telepítési lépések később ezek meglétét feltételezik.
- **Egy Azure-előfizetés**: Használhat meglévő előfizetést a munkahelyéről vagy saját fiókjából, vagy létrehozhat egy [ingyenes próbaverziót](https://aka.ms/azurefreetrial) a kezdéshez.
- **Engedély az Azure-erőforrások létrehozására**: A legtöbb gyakorlatnál legalább **Contributor** jogosultsággal kell rendelkeznie a cél előfizetésben vagy erőforráscsoportban. Egyes fejezetek feltételezhetik, hogy erőforráscsoportokat, kezelt identitásokat és RBAC-hozzárendeléseket is létre tud hozni.
- [**Egy GitHub-fiók**](https://github.com): Hasznos a tárház fork-olásához, a saját módosítások nyomon követéséhez, valamint a GitHub Codespaces használatához a workshop során.
- **Sablon futtatási előfeltételek**: Egyes sablonok helyi eszközöket igényelnek, például Node.js, Python, Java vagy Docker. A hiányzó eszközök korai felismeréséhez futtassa a beállítás érvényesítőjét a kezdés előtt.
- **Alapvető terminál-ismeretek**: Nem kell szakértőnek lennie, de kényelmesen kell tudnia futtatni parancsokat, mint például `git clone`, `azd auth login` és `azd up`.

> **Vállalati előfizetésben dolgozik?**  
> Ha Azure-környezetét egy rendszergazda kezeli, előre egyeztesse, hogy tud-e erőforrásokat telepíteni az előfizetésbe vagy erőforráscsoportba, amelyet használni szeretne. Ha nem, kérjen sandbox előfizetést vagy Contributor jogosultságot a kezdés előtt.

> **Új az Azure-ban?**  
> Kezdje a saját Azure próbaverziójával vagy a pay-as-you-go előfizetésével a https://aka.ms/azurefreetrial oldalon, hogy a gyakorlatokat végig tudja csinálni bérlőszintű jóváhagyások nélkül.

## 🗺️ Tanfolyam térkép: Gyors navigáció fejezetenként

Minden fejezethez tartozik egy dedikált README a tanulási célokkal, gyors kezdettel és gyakorlatokkal:

| Fejezet | Téma | Leckék | Időtartam | Bonyolultság |
|---------|-------|---------|----------|------------|
| **[1. fejezet: Alapok](docs/chapter-01-foundation/README.md)** | Bevezetés | [AZD alapok](docs/chapter-01-foundation/azd-basics.md) &#124; [Telepítés](docs/chapter-01-foundation/installation.md) &#124; [Első projekt](docs/chapter-01-foundation/first-project.md) | 30-45 perc | ⭐ |
| **[2. fejezet: AI fejlesztés](docs/chapter-02-ai-development/README.md)** | AI-előre épített alkalmazások | [Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ügynökök](docs/chapter-02-ai-development/agents.md) &#124; [Modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 óra | ⭐⭐ |
| **[3. fejezet: Konfiguráció](docs/chapter-03-configuration/README.md)** | Hitelesítés és biztonság | [Konfiguráció](docs/chapter-03-configuration/configuration.md) &#124; [Hitelesítés & Biztonság](docs/chapter-03-configuration/authsecurity.md) | 45-60 perc | ⭐⭐ |
| **[4. fejezet: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & Telepítés | [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 óra | ⭐⭐⭐ |
| **[5. fejezet: Többügynök](docs/chapter-05-multi-agent/README.md)** | AI ügynök megoldások | [Kiskereskedelmi forgatókönyv](examples/retail-scenario.md) &#124; [Koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[6. fejezet: Telepítés előtti lépések](docs/chapter-06-pre-deployment/README.md)** | Tervezés & Ellenőrzés | [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 óra | ⭐⭐ |
| **[7. fejezet: Hibakeresés](docs/chapter-07-troubleshooting/README.md)** | Hibakeresés & Javítás | [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hibakeresés](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémák](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 óra | ⭐⭐ |
| **[8. fejezet: Éles környezet](docs/chapter-08-production/README.md)** | Vállalati minták | [Éles gyakorlatok](docs/chapter-08-production/production-ai-practices.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Gyakorlati labor | [Bevezető](workshop/docs/instructions/0-Introduction.md) &#124; [Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Szétszedés](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Összegzés](workshop/docs/instructions/7-Wrap-up.md) | 3-4 óra | ⭐⭐ |

**A teljes tanfolyam időtartama:** ~10-14 óra | **Készségfejlődés:** Kezdő → Éles környezetre kész

---

## 📚 Tanulási fejezetek

*Válassza ki tanulási útját tapasztalat és célok alapján*

### 🚀 1. fejezet: Alapok & Gyors kezdés  
**Előfeltételek**: Azure-előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit tanulni fog  
- Az Azure Developer CLI alapjainak megértése  
- AZD telepítése a platformjára  
- Az első sikeres telepítés  

#### Tanulási források  
- **🎯 Induljon innen**: [Mi az Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Elmélet**: [AZD alapok](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak és terminológia  
- **⚙️ Beállítás**: [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - Platform specifikus útmutatók  
- **🛠️ Gyakorlati bemutató**: [Az első projektje](docs/chapter-01-foundation/first-project.md) - Lépésről lépésre bemutató  
- **📋 Gyors referencia**: [Parancs összefoglaló](resources/cheat-sheet.md)  

#### Gyakorlati feladatok  
```bash
# Gyors telepítés ellenőrzése
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 A fejezet eredménye**: Egyszerű webalkalmazás sikeres telepítése Azure-ra AZD segítségével  

**✅ Siker igazolása:**  
```bash
# Az 1. fejezet elvégzése után képes leszel:
azd version              # Megmutatja a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepíti az Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Takarítja a forrásokat
```
  
**📊 Időráfordítás:** 30-45 perc  
**📈 Készségszint a fejezet után:** Képes alapalkalmazások önálló telepítésére  
**📈 Készségszint a fejezet után:** Képes alapalkalmazások önálló telepítésére  

---

### 🤖 2. fejezet: AI-első fejlesztés (AI fejlesztőknek ajánlott)  
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fog  
- Microsoft Foundry integráció AZD-vel  
- Mesterséges intelligenciával támogatott alkalmazások telepítése  
- AI szolgáltatások konfigurációjának megértése  

#### Tanulási források  
- **🎯 Induljon innen**: [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI ügynökök**: [AI ügynökök útmutatója](docs/chapter-02-ai-development/agents.md) - Intelligens ügynökök telepítése AZD-vel  
- **📖 Minták**: [AI modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellek telepítése és kezelése  
- **🛠️ Workshop**: [AI workshop labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AZD-kompatibilis AI megoldások készítése  
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs * DevContainer környezettel  
- **📋 Sablonok**: [Microsoft Foundry sablonok](#workshop-források)  
- **📝 Példák**: [AZD telepítési példák](examples/README.md)  

#### Gyakorlati feladatok  
```bash
# Telepítse első mesterséges intelligencia alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további MI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 A fejezet eredménye**: AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel  

**✅ Siker igazolása:**  
```bash
# A 2. fejezet után képes leszel:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI csevegőfelületet
# Kérdéseket feltenni és AI által támogatott válaszokat kapni forrásokkal
# Ellenőrizni, hogy a keresési integráció működik
azd monitor  # Megnézni, hogy az Application Insights megjeleníti a telemetriát
azd down --force --purge
```
  
**📊 Időráfordítás:** 1-2 óra  
**📈 Készségszint a fejezet után:** Képes éles környezetre kész AI alkalmazások telepítésére és konfigurálására  
**💰 Költségtudatosság:** Érti az kb. 80-150$/hó fejlesztési, 300-3500$/hó éles költségeket  

#### 💰 Költségek figyelembevétele AI telepítések esetén  

**Fejlesztési környezet (becsült 80-150$/hó):**  
- Microsoft Foundry modellek (pay-as-you-go): 0-50$/hó (token-használattól függően)  
- AI keresés (Alap csomag): 75$/hó  
- Container App-ek (Fogyasztás alapú): 0-20$/hó  
- Tárolás (Standard): 1-5$/hó  

**Éles környezet (becsült 300-3500+$/hó):**  
- Microsoft Foundry modellek (PTU a stabil teljesítményért): 3000+$/hó VAGY pay-as-you-go nagy volumen esetén  
- AI keresés (Standard csomag): 250$/hó  
- Container App-ek (Dedikált): 50-100$/hó  
- Application Insights: 5-50$/hó  
- Tárolás (Prémium): 10-50$/hó  

**💡 Költségoptimalizálási tippek:**  
- Használja a **Free Tier** Microsoft Foundry modelleket tanuláshoz (Azure OpenAI havi 50 000 tokennel együtt)  
- Az aktív fejlesztés szüneteltetésekor futtassa az `azd down` parancsot az erőforrások felszabadításához  
- Kezdje fogyasztás alapú számlázással, PTU-ra csak éles környezetben váltson  
- Használja az `azd provision --preview` parancsot a költségek előzetes becsléséhez telepítés előtt  
- Kapcsolja be az automatikus skálázást: csak a tényleges használatért fizet  

**Költségfigyelés:**  
```bash
# Becsült havi költségek ellenőrzése
azd provision --preview

# Aktuális költségek figyelése az Azure Portálon
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 3. fejezet: Konfiguráció & Hitelesítés  
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fog  
- Környezeti konfiguráció és menedzsment  
- Hitelesítés és biztonsági bevált gyakorlatok  
- Erőforrásnévzés és szervezés  

#### Tanulási források  
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítása  
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/chapter-03-configuration/authsecurity.md) - Hitelesítési minták  
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák  

#### Gyakorlati feladatok  
- Több környezet konfigurálása (fejlesztői, teszt, éles)  
- Kezelt identitás alapú hitelesítés beállítása  
- Környezet-specifikus konfigurációk megvalósítása  

**💡 A fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal  

---

### 🏗️ 4. fejezet: Infrastruktúra kódként & Telepítés  
**Előfeltételek**: 1-3. fejezet befejezése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit tanulni fog  
- Haladó telepítési minták  
- Infrastruktúra kódként Bicep használatával  
- Erőforrás-provisioning stratégiák  

#### Tanulási források  
- **📖 Telepítés**: [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamat  
- **🏗️ Provisioning**: [Provisioning erőforrások](docs/chapter-04-infrastructure/provisioning.md) - Azure erőforrás menedzsment  
- **📝 Példák**: [Konténer alkalmazás példa](../../examples/container-app) - Konténeres telepítések  

#### Gyakorlati feladatok  
- Egyedi Bicep sablonok készítése  
- Több szolgáltatásos alkalmazások telepítése  
- Blue-green telepítési stratégiák megvalósítása  

**💡 A fejezet eredménye**: Összetett több szolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal  

---

### 🎯 5. fejezet: Többügynök AI megoldások (Haladó)  
**Előfeltételek**: 1-2. fejezet befejezése  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit tanulni fog  
- Többügynök architektúra minták  
- Ügynök-orchesztráció és koordináció  
- Éles környezetre kész AI telepítések  

#### Tanulási források  
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynök megoldás](examples/retail-scenario.md) - Teljes megvalósítás  
- **🛠️ ARM sablonok**: [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés  
- **📖 Architektúra**: [Többügynök koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Minták  

#### Gyakorlati feladatok  
```bash
# Telepítse az egész kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 A fejezet eredménye**: Többügynök AI megoldáséles környezetbe telepítése és kezelése Ügyfél és Készlet ügynökökkel  

---

### 🔍 6. fejezet: Telepítés előtti érvényesítés & tervezés  
**Előfeltételek**: 4. fejezet befejezése  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐
#### Amit megtanulsz  
- Kapacitástervezés és erőforrás-validálás  
- SKU kiválasztási stratégiák  
- Előzetes ellenőrzések és automatizálás  

#### Tanulási források  
- **📊 Tervezés**: [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás-ellenőrzés  
- **💰 Kiválasztás**: [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választások  
- **✅ Érvényesítés**: [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizált szkriptek  

#### Gyakorlati feladatok  
- Futtass kapacitás-ellenőrző szkripteket  
- Optimalizáld a SKU-k kiválasztását költség szerint  
- Valósíts meg automatizált előtelepítési ellenőrzéseket  

**💡 Fejezet eredménye**: Ellenőrizd és optimalizáld a telepítéseket a végrehajtás előtt  

---

### 🚨 7. fejezet: Hibakeresés és hibajavítás  
**Előfeltételek**: Bármely telepítési fejezet teljesítve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐  

#### Amit megtanulsz  
- Szisztematikus hibakeresési módszerek  
- Gyakori problémák és megoldások  
- AI-specifikus hibajavítás  

#### Tanulási források  
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - Gyakran ismételt kérdések és megoldások  
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák  
- **🤖 AI problémák**: [AI-specifikus hibajavítás](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák  

#### Gyakorlati feladatok  
- Diagnosztizáld a telepítési hibákat  
- Oldd meg az azonosítási problémákat  
- Hibakeresés AI szolgáltatás-kapcsolódási hibák esetén  

**💡 Fejezet eredménye**: Önállóan diagnosztizáld és oldd meg a gyakori telepítési problémákat  

---

### 🏢 8. fejezet: Gyártási és vállalati minták  
**Előfeltételek**: 1-4. fejezet teljesítve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐  

#### Amit megtanulsz  
- Gyártási telepítési stratégiák  
- Vállalati biztonsági minták  
- Felügyelet és költség-optimalizálás  

#### Tanulási források  
- **🏭 Gyártás**: [Gyártási AI legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták  
- **📝 Példák**: [Mikroszolgáltatások példa](../../examples/microservices) - Komplex architektúrák  
- **📊 Felügyelet**: [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Felügyelet  

#### Gyakorlati feladatok  
- Valósíts meg vállalati biztonsági mintákat  
- Állíts be átfogó monitorozást  
- Telepíts gyártási környezetbe megfelelő irányítással  

**💡 Fejezet eredménye**: Telepíts vállalati szintű alkalmazásokat teljes gyártási képességekkel  

---

## 🎓 Workshop áttekintése: Gyakorlati tanulási élmény  

> **⚠️ WORKSHOP ÁLLAPOT: Folyamatban lévő fejlesztés**  
> A workshop anyagait jelenleg fejlesztjük és finomítjuk. Az alapmodulok működőképesek, de néhány haladó rész még nem teljes. Aktívan dolgozunk a teljes tartalom elkészítésén. [Nyomon követés →](workshop/README.md)  

### Interaktív workshop anyagok  
**Átfogó, gyakorlati tanulás böngészőalapú eszközökkel és vezetett gyakorlatokkal**  

Workshop anyagaink strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fent bemutatott fejezet-alapú tananyagot. A workshop önálló és oktató vezette tanulásra is alkalmas.  

#### 🛠️ Workshop jellemzők  
- **Böngészőalapú felület**: Teljes MkDocs-alapú workshop kereséssel, másolással és témakezeléssel  
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet beállítás  
- **Strukturált tanulási útvonal**: 8 modul vezérelt gyakorlatokkal (összesen 3-4 óra)  
- **Fokozatos módszertan**: Bevezetés → Kiválasztás → Érvényesítés → De-konstruálás → Konfiguráció → Testreszabás → Lebontás → Összefoglalás  
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek  

#### 📚 Workshop modul struktúra  
A workshop egy **8 modulból álló fokozatos módszertan**, amely a felfedezéstől a telepítés mesterségéig vezet:  

| Modul | Téma | Mi a teendő | Időtartam |  
|--------|-------|----------------|----------|  
| **0. Bevezetés** | Workshop áttekintés | Értelmezd a tanulási célokat, előfeltételeket és workshop struktúrát | 15 perc |  
| **1. Kiválasztás** | Sablon felfedezés | Fedezd fel az AZD sablonokat és válaszd ki a megfelelő AI sablont a helyzethez | 20 perc |  
| **2. Érvényesítés** | Telepítés és ellenőrzés | Telepítsd a sablont `azd up` paranccsal és ellenőrizd az infrastruktúrát | 30 perc |  
| **3. De-konstruálás** | Szerkezet megértése | Használd a GitHub Copilotot a sablon architektúra, Bicep fájlok és kód szervezésének felfedezésére | 30 perc |  
| **4. Konfiguráció** | azure.yaml mélyreható | Mesterkedj az `azure.yaml` konfigurációban, életciklus horgonyokban és környezeti változókban | 30 perc |  
| **5. Testreszabás** | Személyre szabás | Engedélyezd az AI keresést, nyomon követést, értékelést és alakítsd a saját forgatókönyved szerint | 45 perc |  
| **6. Lebontás** | Erőforrások tisztítása | Biztonságosan töröld az erőforrásokat `azd down --purge` paranccsal | 15 perc |  
| **7. Összefoglalás** | Következő lépések | Tekintsd át az elért eredményeket, kulcsfogalmakat és folytasd a tanulási utadat | 15 perc |  

**Workshop menet:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Workshop elindítása  
```bash
# 1. lehetőség: GitHub Codespaces (ajánlott)
# Kattints a "Code" → "Create codespace on main" menüpontra a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a workshop/README.md-ben található telepítési útmutatót
```
  
#### 🎯 Workshop tanulási eredmények  
A workshop elvégzésével a résztvevők:  
- **Telepítsenek gyártási AI alkalmazásokat**: Használják az AZD-t Microsoft Foundry szolgáltatásokkal  
- **Mesterkedjenek többügynökös architektúrákban**: Valósítsanak meg koordinált AI ügynök megoldásokat  
- **Alkalmazzanak biztonsági legjobb gyakorlatokat**: Konfigurálják az azonosítást és hozzáférés-vezérlést  
- **Optimalizálják a méretezést**: Tervezzenek költséghatékony, teljesítményorientált telepítéseket  
- **Hibakeresést végezzenek telepítéseken**: Önállóan oldják meg a gyakori problémákat  

#### 📖 Workshop források  
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulási környezet  
- **📋 Modulonkénti utasítások**:  
  - [0. Bevezetés](workshop/docs/instructions/0-Introduction.md) - Workshop áttekintés és célok  
  - [1. Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) - AI sablonok keresése és kiválasztása  
  - [2. Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) - Sablonok telepítése és ellenőrzése  
  - [3. De-konstruálás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Sablon architektúrájának felfedezése  
  - [4. Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml mélyreható ismerete  
  - [5. Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) - Testreszabás a saját forgatókönyvhöz  
  - [6. Lebontás](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Erőforrások eltávolítása  
  - [7. Összefoglalás](workshop/docs/instructions/7-Wrap-up.md) - Áttekintés és további lépések  
- **🛠️ AI Workshop Labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI fókuszú gyakorlatok  
- **💡 Gyors indulás**: [Workshop beállítási útmutató](workshop/README.md#quick-start) - Környezetkonfiguráció  

**Ideális**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcampokhoz.  

---

## 📖 Mélyebb betekintés: AZD képességek  

Az alapok mellett az AZD igen erős funkciókat biztosít gyártási telepítésekhez:  

- **Sablonalapú telepítések** - Használj előre elkészített sablonokat gyakori alkalmazási mintákhoz  
- **Infrastruktúra kódonként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Zökkenőmentes erőforrás-provisionálás, telepítés és monitorozás  
- **Fejlesztőbarát** - Optimalizált a fejlesztői termelékenység és élmény érdekében  

### **AZD + Microsoft Foundry: Tökéletes AI telepítésekhez**  

**Miért AZD az AI megoldásokhoz?** AZD kezeli az AI fejlesztők fő kihívásait:  

- **AI-kész sablonok** - Előre konfigurált sablonok Microsoft Foundry modellekhez, kognitív szolgáltatásokhoz és ML munkaterhelésekhez  
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és model végpontokhoz  
- **Gyártási AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazás telepítésekhez  
- **End-to-end AI munkafolyamatok** - A modellfejlesztéstől a gyártásba vitelig megfelelő monitorozással  
- **Költségoptimalizálás** - Intelligens erőforrás-allokáció és skálázási stratégiák AI munkaterhelésekhez  
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modell katalógussal és végpontokkal  

---

## 🎯 Sablonok és példatár  

### Kiemelt: Microsoft Foundry sablonok  
**Kezdj itt, ha AI alkalmazásokat telepítesz!**  

> **Megjegyzés:** Ezek a sablonok különféle AI mintákat demonstrálnak. Némelyik külső Azure mintákból, mások helyi implementációk.  

| Sablon | Fejezet | Bonyolultság | Szolgáltatások | Típus |  
|----------|---------|------------|----------|------|  
| [**Kezdés AI chattel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |  
| [**Kezdés AI ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Külső |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |  
| [**OpenAI Chat App Gyorsindító**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |  
| [**Retail Többügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |  

### Kiemelt: Teljes tanulási forgatókönyvek  
**Gyártásra kész alkalmazás sablonok a tanulási fejezetek szerint**  

| Sablon | Tanulási fejezet | Bonyolultság | Fő tanulási pont |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alap AI telepítési minták |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI kereséssel |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentum intelligencia integráció |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és függvényhívás |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI összehangolás |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra vevő és készlet ügynökökkel |  

### Példák típus szerint  

> **📌 Helyi vs Külső példák:**  
> **Helyi példák** (ebben a repo-ban) = Azonnal használatra készek  
> **Külső példák** (Azure Samples) = Klónozd a linkelt tárolókat  

#### Helyi példák (azonnal használható)  
- [**Retail Többügynökös megoldás**](examples/retail-scenario.md) - Teljes gyártásra kész implementáció ARM sablonokkal  
  - Többügynökös architektúra (Vevő + Készlet ügynökök)  
  - Átfogó monitorozás és értékelés  
  - Egykattintásos telepítés ARM sablonnal  

#### Helyi példák - Konténeres alkalmazások (2-5. fejezet)  
**Átfogó konténeres telepítési példák ebben a tárolóban:**  
- [**Konténer app példák**](examples/container-app/README.md) - Komplett útmutató konténeres telepítésekhez  
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázás-zéróra  
  - [Mikroszolgáltatások architektúra](../../examples/container-app/microservices) - Gyártásra kész többszolgáltatásos telepítés  
  - Gyors kezdés, gyártás és haladó telepítési minták  
  - Monitorozás, biztonság és költségoptimalizálási útmutatás  

#### Külső példák - Egyszerű alkalmazások (1-2. fejezet)  
**Klónozd ezeket az Azure Sample tárolókat a kezdéshez:**  
- [Egyszerű webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták  
- [Statikus webhely - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítés  
- [Konténer app - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés  

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis-kapcsolati minták
- [Funkciók + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Szerver nélküli adatfeldolgozás

#### Külső példák - Haladó minták (4-8. fejezet)
- [Java mikroszolgáltatások](https://github.com/Azure-Samples/java-microservices-aca-lab) - Több szolgáltatást tartalmazó architektúrák
- [Konténer alkalmazások munkafolyamatai](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML folyamat](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész gépi tanulási minták

### Külső sablon gyűjtemények
- [**Hivatalos AZD sablon galéria**](https://azure.github.io/awesome-azd/) - Válogatott hivatalos és közösségi sablonok gyűjteménye
- [**Azure Developer CLI sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példák könyvtár**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források és hivatkozások

### Gyors hivatkozások
- [**Parancs összefoglaló**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetenként rendszerezve
- [**Fogalomtár**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések a tanulási fejezetek szerint
- [**Tanulmányi útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati műhelyek
- [**MI Műhely labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tegye MI megoldásait az AZD-vel telepíthetővé (2-3 óra)
- [**Interaktív műhely**](workshop/README.md) - 8 modulból álló irányított gyakorlat MkDocs és GitHub Codespaces használattal
  - Menete: Bevezetés → Kiválasztás → Érvényesítés → Lebontás → Konfiguráció → Testreszabás → Bontás → Összegzés

### Külső tanulási források
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

### MI ügynök képességek az Ön szerkesztőjéhez
- [**Microsoft Azure képességek a skills.sh-en**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt ügynök képesség Azure MI, Foundry, telepítés, diagnosztika, költségoptimalizálás és még sok más területen. Telepítse őket GitHub Copilotba, Cursorba, Claude Code-ba vagy bármely támogatott ügynökbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Gyors hibaelhárítási útmutató

**Gyakori kezdői hibák és azonnali megoldásaik:**

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

# A telepítés ellenőrzése
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

# AZD környezet beállítása
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" vagy "Kvóta túllépve"</strong></summary>

```bash
# Próbáljon ki másik Azure régiót
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
<summary><strong>❌ "azd up" a folyamat közepén hibát jelez</strong></summary>

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
# Jelentkezzen be újra az AZD-hez
azd auth logout
azd auth login

# Opcionális: frissítse az Azure CLI-t is, ha az az parancsokat futtatja
az logout
az login

# Hitelesítés ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Erőforrás már létezik" vagy névütközések</strong></summary>

```bash
# Az AZD egyedi neveket generál, de ha konfliktus van:
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
- Adatbázis alkalmazással: 10-15 perc
- MI alkalmazások: 15-25 perc (OpenAI előkészítés lassú)

```bash
# Haladás ellenőrzése
azd show

# Ha több mint 30 percig akad el, ellenőrizze az Azure Portált:
azd monitor --overview
# Keresse meg a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Engedély megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Contributor" szerepkörre van szüksége
# Kérje az Azure adminisztrátorától, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Ellenőrizzen egy adott szolgáltatást
azd env get-values
# Keressen *_URL változókat
```
</details>

### 📚 Teljes hibaelhárítási források

- **Gyakori problémák útmutatója:** [Részletes megoldások](docs/chapter-07-troubleshooting/common-issues.md)
- **MI-specifikus problémák:** [MI hibaelhárítás](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/chapter-07-troubleshooting/debugging.md)
- **Segítség kérése:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Haladás követése
Kövesse tanulási előrehaladását minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és gyors indulás ✅
- [ ] **2. fejezet**: MI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra mint kód és telepítés ✅
- [ ] **5. fejezet**: Többügynökös MI megoldások ✅
- [ ] **6. fejezet**: Előzetes telepítési érvényesítés és tervezés ✅
- [ ] **7. fejezet**: Hibaelhárítás és hibakeresés ✅
- [ ] **8. fejezet**: Termelési és vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet befejezése után ellenőrizze tudását:
1. **Gyakorlati feladat**: Fejezeti gyakorlati telepítés befejezése
2. **Tudásellenőrzés**: A fejezet GYIK szakaszának áttekintése
3. **Közösségi beszélgetés**: Tapasztalat megosztása az Azure Discordban
4. **Következő fejezet**: Haladás magasabb szintű fejezetre

### Tanfolyam befejezésének előnyei
Az összes fejezet befejezésével rendelkezni fog:
- **Termelési tapasztalat**: Valós MI alkalmazások telepítése Azure-ba
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és MI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás
- **Műszaki problémák**: [Hibajegyek és fejlesztési kérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulással kapcsolatos kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **MI-specifikus segítség**: Csatlakozzon a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) közösséghez
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések a Microsoft Foundry Discordról

**Legutóbbi szavazás eredményei a #Azure csatornán:**
- **45%** fejlesztő szeretné használni az AZD-t MI munkaterhelésekhez
- **Fő kihívások**: Több szolgáltatás telepítése, hitelesítő adatok kezelése, termelési készség  
- **Leggyakrabban kért**: MI-specifikus sablonok, hibaelhárítási útmutatók, bevált gyakorlatok

**Csatlakozzon közösségünkhöz, hogy:**
- Megoszthassa AZD + MI tapasztalatait és segítséget kapjon
- Korai hozzáférést kapjon új MI sablonokhoz
- Hozzájáruljon MI telepítési legjobb gyakorlataihoz
- Befolyásolja a jövőbeni MI + AZD fejlesztéseket

### Hozzájárulás a tanfolyamhoz
Szívesen fogadunk hozzájárulásokat! Kérjük, olvassa el a [Hozzájárulási útmutatót](CONTRIBUTING.md) az alábbiakról:
- **Tartalom fejlesztések**: Meglévő fejezetek és példák tökéletesítése
- **Új példák**: Valós helyzeteket és sablonokat adjon hozzá  
- **Fordítás**: Segítsen a többnyelvű támogatás fenntartásában
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi szabályok**: Befogadó közösségi irányelvek követése

---

## 📄 Tanfolyam információk

### Licenc
Ez a projekt az MIT licenc alatt áll - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kezdőknek](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ügynökök
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge MI kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
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
[![Gépi tanulás kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdőknek**: Kezdd a [1. fejezettel: Alapok és Gyors kezdés](#-chapter-1-foundation--quick-start)  
**AI fejlesztőknek**: Ugorj a [2. fejezethez: AI-első fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Tapasztalt fejlesztőknek**: Kezdd a [3. fejezettel: Beállítás és hitelesítés](#️-chapter-3-configuration--authentication)

**Következő lépések**: [Kezdd az 1. fejezettel - AZD alapok](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:  
Ez a dokumentum az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból adódó félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
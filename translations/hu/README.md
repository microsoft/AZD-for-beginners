# AZD kezdőknek: Egy strukturált tanulási út

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatikus fordítások (Mindig naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Myanmar)](../my/README.md) | [Kínai (egyszerűsített)](../zh-CN/README.md) | [Kínai (hagyományos, Hong Kong)](../zh-HK/README.md) | [Kínai (hagyományos, Makaó)](../zh-MO/README.md) | [Kínai (hagyományos, Tajvan)](../zh-TW/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malajálam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../pt-BR/README.md) | [Portugál (Portugália)](../pt-PT/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Szeretne helyileg klónozni?**
>
> Ez a tároló 50+ nyelvű fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretné klónozni, használja a kötött kiadást (sparse checkout):
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
> Így minden szükséges dolgot megkap, hogy gyorsabban lefusson a tanfolyam.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mi az újdonság az azd-ben ma

> 📌 Ez a tanfolyam az **`azd 1.25.6`** (2026. június) verzió alapján készült. Futtassa az `azd version` parancsot a verzió ellenőrzéséhez, és az `azd upgrade`-et a frissítéshez.

Az Azure Developer CLI túlmutat a hagyományos webalkalmazásokon és API-okon. Az azd ma már az egyetlen eszköz **bármilyen** alkalmazás Azure-ba való telepítéséhez — beleértve az AI-alapú alkalmazásokat és intelligens ügynököket.

Ez Önnek azt jelenti, hogy:

- **Az AI-ügynökök most már elsőrangú azd munkaterhelések.** Ugyanazzal az `azd init` → `azd up` munkafolyamattal inicializálhatja, telepítheti és kezelheti az AI-ügynök projektjeit, amit már ismer.
- **Teljes ügynök életciklus a CLI-ből.** Az `azure.ai.agents` kiterjesztéssel az egész folyamat lefedett — a `azd ai agent init` az induláshoz, `azd ai agent invoke` a teszteléshez (válaszidő megjelenítéssel), `azd ai agent eval generate` és `azd ai agent optimize` a minőség mérésére és javítására, valamint `azd ai agent delete` a takarításhoz.
- **További AI építőkockák.** Az új előzetes verziójú kiterjesztések — `azure.ai.skills` és `azure.ai.connections` — lehetővé teszik az újrahasználható ügynökszakértelem és Foundry kapcsolatok közvetlen kezelését az azd-vel.
- **Microsoft Foundry integráció** modellek telepítését, ügynökök hosztolását és AI szolgáltatás konfigurációt hoz az azd sablon ökoszisztémába.
- **Könnyebb mindennapi alapok.** A legutóbbi kiadások az `azd init` parancsot ismételhetővé tették (idempotens), az `azd auth login` automatikusan törli a lejárt tokeneket, és hozzáadtak egy barátságos `azd tool` első futtatás beállító kérést.
- **Az alap munkafolyamat változatlan.** Akár egy teendőlista appot, mikroszolgáltatást vagy több ügynökös AI megoldást telepít, a parancsok ugyanazok.

> **Megjegyzés Aspire felhasználóknak:** A Microsoft mostantól egyszerűen **Aspire** néven említi a terméket (korábban ".NET Aspire"). Az azd Aspire támogatása változatlan – csak a név lett frissítve.

Ha már használta azd-t, az AI támogatás természetes kiterjesztés — nem külön eszköz vagy haladó ágazat. Ha új vagy, egy munkafolyamatot tanulsz meg, ami mindent lefed.

---

## 🚀 Mi az Azure Developer CLI (azd)?

Az **Azure Developer CLI (azd)** egy fejlesztőbarát parancssori eszköz, mely egyszerűvé teszi az alkalmazások Azure-ba történő telepítését. Ahelyett, hogy kézzel hozná létre és kapcsolná össze az Azure erőforrásokat, egyetlen parancssal az egész alkalmazást telepítheti.

### Az `azd up` varázslata

```bash
# Ez az egyetlen parancs mindent elvégez:
# ✅ Létrehozza az összes Azure-erőforrást
# ✅ Konfigurálja a hálózatot és a biztonságot
# ✅ Összeállítja az alkalmazás kódját
# ✅ Telepíti az Azure-ba
# ✅ Egy működő URL-t ad
azd up
```

**Ennyi az egész!** Nem kell az Azure portált kattintgatni, nem szükséges komplex ARM sablonokat tanulni, nincs kézi konfiguráció – működő alkalmazások az Azure-on.

---

## ❓ Azure Developer CLI vagy Azure CLI: Mi a különbség?

Ez a leggyakoribb kérdés kezdők részéről. Itt a rövid válasz:

| Funkció | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cél** | Egyéni Azure erőforrások kezelése | Teljes alkalmazások telepítése |
| **Gondolkodásmód** | Infrastruktúra-központú | Alkalmazás-központú |
| **Példa** | `az webapp create --name myapp...` | `azd up` |
| **Tanulási görbe** | Tudni kell az Azure szolgáltatásokat | Csak az appot ismerje |
| **Leginkább alkalmas** | DevOps, infrastruktúra | Fejlesztők, prototípusok |

### Egyszerű analógia

- **Azure CLI** olyan, mint amikor mindent megkap a házépítéshez – kalapácsot, fűrészt, szögeket. Bármit megépíthet, de értenie kell az építkezést.
- **Azure Developer CLI** olyan, mintha kivitelezőt bérelne – elmondja, mit akar, ők pedig megépítik.

### Mikor melyiket használja

| Helyzet | Használd ezt |
|----------|----------|
| "Gyorsan szeretném telepíteni a webalkalmazásom" | `azd up` |
| "Csak egy tárhelyfiókot akarok létrehozni" | `az storage account create` |
| "Teljes AI alkalmazást építek" | `azd init --template azure-search-openai-demo` |
| "Egy adott Azure erőforrást akarok hibakeresni" | `az resource show` |
| "Pár perc alatt éles telepítés kell" | `azd up --environment production` |

### Együtt működnek!

Az AZD az Azure CLI-t használja háttérben. Mindkettőt használhatja:
```bash
# Telepítse az alkalmazását az AZD-vel
azd up

# Ezután finomhangolja a konkrét erőforrásokat az Azure CLI-vel
az webapp config set --name myapp --always-on true
```

---

## 🌟 Találj sablonokat az Awesome AZD-n

Ne kezdj a nulláról! Az **Awesome AZD** a közösségi gyűjtemény, telepítésre kész sablonokból áll:

| Erőforrás | Leírás |
|----------|-------------|
| 🔗 [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) | Több mint 200 sablon egy kattintással telepíthető |
| 🔗 [**Sablon beküldése**](https://github.com/Azure/awesome-azd/issues) | Küldd be a saját sablonodat a közösségnek |
| 🔗 [**GitHub tárhely**](https://github.com/Azure/awesome-azd) | Csillagozd és fedezd fel a forrást |

### Népszerű AI sablonok az Awesome AZD-ből

```bash
# RAG-csevegés Microsoft Foundry-modellekkel + MI-keresés
azd init --template azure-search-openai-demo

# Gyors MI-csevegőalkalmazás
azd init --template openai-chat-app-quickstart

# MI-ügynökök Foundry-ügynökökkel
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 lépésben a kezdéshez

Mielőtt elkezdenéd, győződj meg róla, hogy a géped készen áll a kívánt sablon telepítésére:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha bármelyik ellenőrzés sikertelen, először azt javítsd, majd folytasd a gyors kezdést.

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

### 2. lépés: Bejelentkezés az AZD-hez

```bash
# Opcionális, ha a tanfolyam során közvetlenül az Azure CLI parancsokat tervezed használni
az login

# Szükséges az AZD munkafolyamatokhoz
azd auth login
```

Ha nem tudod, melyiket válaszd, kövesd a teljes beállítási folyamatot a [Telepítés és beállítás](docs/chapter-01-foundation/installation.md#authentication-setup) részben.

### 3. lépés: Az első alkalmazás telepítése

```bash
# Inicializálás sablonból
azd init --template todo-nodejs-mongo

# Telepítés Azure-ra (mindent létrehoz!)
azd up
```

**🎉 Kész is!** Az alkalmazásod most élő az Azure-on.

### Takarítás (Ne feledd!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hogyan használd ezt a tanfolyamot

Ez a tanfolyam **fokozatos tanulásra** készült – kezd ott, ahol kényelmes, és haladj felfelé:

| Tapasztalatod | Innen kezd |
|-----------------|------------|
| **Totálisan új vagy az Azure-ban** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **Ismered az Azure-t, de új vagy az azd-ben** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **AI alkalmazásokat akarsz telepíteni** | [2. fejezet: AI-First Fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gyakorlati tapasztalatot szeretnél** | [🎓 Interaktív műhely](workshop/README.md) – 3-4 órás vezetett labor |
| **Éles mintákat keresel** | [8. fejezet: Éles & vállalati minták](#-chapter-8-production--enterprise-patterns) |

### Gyors beállítás

1. **Forkold ezt a tárolót:** [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonozd le:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kérj segítséget:** [Azure Discord közösség](https://discord.com/invite/ByRwuEEgH4)

> **Szeretne helyileg klónozni?**

> Ez a tároló 50+ nyelvű fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretné klónozni, használja a kötött kiadást (sparse checkout):
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Így megkapja azt, amire szüksége van a tanfolyamhoz, sokkal gyorsabb letöltéssel.


## Tanfolyam áttekintése

Sajátítsa el az Azure Developer CLI-t (azd) strukturált fejezetek révén, melyek fokozatos tanuláshoz készültek. **Különös figyelem az AI alkalmazások telepítésére a Microsoft Foundry integrációval.**
### Miért létfontosságú ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösség visszajelzései alapján a **fejlesztők 45%-a az AZD-t szeretné használni AI munkaterhelésekhez**, de a következő kihívásokkal találkoznak:
- Bonyolult, több szolgáltatásból álló AI architektúrák
- AI gyártásba való telepítésének legjobb gyakorlatai  
- Azure AI szolgáltatások integrációja és konfigurációja
- AI munkaterhelések költségoptimalizálása
- AI-hoz kapcsolódó telepítési problémák hibaelhárítása

### Tanulási célok

A strukturált tanfolyam elvégzése után képes leszel:
- **AZD alapok elsajátítása**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kód formájában**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítések hibakeresése**: Gyakori problémák megoldása és hibák javítása
- **Gyártásra optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Több-ügynökös megoldások építése**: Összetett AI architektúrák telepítése

## Mielőtt elkezdenéd: fiókok, hozzáférés és feltételezések

Az 1. fejezet megkezdése előtt győződj meg róla, hogy a következők rendelkezésedre állnak. A telepítési lépések ezt alapul véve feltételezik ezeket az alapokat.

- **Egy Azure előfizetés**: Használhatod a munkahelyeden vagy saját fiókod meglévő előfizetését, vagy létrehozhatsz egy [ingyenes próbaverziót](https://aka.ms/azurefreetrial) a kezdéshez.
- **Jogosultság Azure erőforrások létrehozására**: A legtöbb gyakorlatnál legalább **Közreműködő** jogosultsággal kell rendelkezned a cél előfizetésen vagy erőforráscsoporton. Egyes fejezetek olyan jogosultságokat is feltételeznek, mint erőforráscsoportok, kezelt identitások és RBAC hozzárendelések létrehozása.
- [**GitHub fiók**](https://github.com): Hasznos a tárhely fork-olásához, a saját változtatások nyomon követéséhez és a GitHub Codespaces használatához a műhely során.
- **Sablon futtatási előfeltételek**: Bizonyos sablonok helyi eszközöket igényelnek, például Node.js, Python, Java vagy Docker. Indítsd el az ellenőrző eszközt a kezdés előtt, hogy időben felismerd az esetleges hiányosságokat.
- **Alapvető terminál ismeretek**: Nem kell szakértőnek lenned, de kényelmesen kell futtatnod parancsokat, mint a `git clone`, `azd auth login` és `azd up`.

> **Vállalati előfizetésben dolgozol?**  
> Ha az Azure környezetedet adminisztrátor kezeli, előzetesen ellenőrizd, hogy telepíthetsz-e erőforrásokat azon az előfizetésen vagy erőforráscsoportban, amit használni szeretnél. Ha nem, kérj homokozós (sandbox) előfizetést vagy Közreműködő jogosultságot indulás előtt.

> **Új vagy az Azure-ban?**  
> Kezdj a saját Azure próbaverzióddal vagy pay-as-you-go előfizetéseddel a https://aka.ms/azurefreetrial oldalon, hogy a gyakorlatokat teljes körűen elvégezd bérlőszintű jóváhagyások nélkül.

## 🗺️ Tanfolyam térkép: gyors navigáció fejezetenként

Minden fejezet külön README-t tartalmaz a tanulási célokkal, gyors indítókkal és gyakorlatokkal:

| Fejezet | Téma | Leckék | Időtartam | Bonyolultság |
|---------|-------|---------|----------|------------|
| **[1. fejezet: Alapok](docs/chapter-01-foundation/README.md)** | Kezdés | [AZD alapok](docs/chapter-01-foundation/azd-basics.md) &#124; [Telepítés](docs/chapter-01-foundation/installation.md) &#124; [Első projekt](docs/chapter-01-foundation/first-project.md) | 30-45 perc | ⭐ |
| **[2. fejezet: AI fejlesztés](docs/chapter-02-ai-development/README.md)** | AI-első alkalmazások | [Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ügynökök](docs/chapter-02-ai-development/agents.md) &#124; [Modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 óra | ⭐⭐ |
| **[3. fejezet: Konfiguráció](docs/chapter-03-configuration/README.md)** | Hitelesítés & Biztonság | [Konfiguráció](docs/chapter-03-configuration/configuration.md) &#124; [Hitelesítés és Biztonság](docs/chapter-03-configuration/authsecurity.md) | 45-60 perc | ⭐⭐ |
| **[4. fejezet: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & Telepítés | [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Províziós](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 óra | ⭐⭐⭐ |
| **[5. fejezet: Több-ügynök](docs/chapter-05-multi-agent/README.md)** | AI ügynökmegoldások | [Kiskereskedelmi forgatókönyv](examples/retail-scenario.md) &#124; [Koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[6. fejezet: Előzetes telepítés](docs/chapter-06-pre-deployment/README.md)** | Tervezés & Ellenőrzés | [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU választás](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 óra | ⭐⭐ |
| **[7. fejezet: Hibakeresés](docs/chapter-07-troubleshooting/README.md)** | Hibakeresés & Javítás | [Gyakori hibák](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hibakeresés](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémák](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 óra | ⭐⭐ |
| **[8. fejezet: Gyártás](docs/chapter-08-production/README.md)** | Vállalati minták | [Gyártási gyakorlatok](docs/chapter-08-production/production-ai-practices.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Gyakorlati labor | [Bevezető](workshop/docs/instructions/0-Introduction.md) &#124; [Sablon választás](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Elemzés](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Leszerelés](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Összegzés](workshop/docs/instructions/7-Wrap-up.md) | 3-4 óra | ⭐⭐ |

**Teljes tanfolyam időtartam:** kb. 10-14 óra | **Képesség szintlépés:** Kezdő → Gyártásra kész

---

## 📚 Tanulási fejezetek

*Válaszd ki a tapasztalatod és céljaid alapján a tanulási utat*

### 🚀 1. fejezet: Alapok és Gyors kezdés  
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit tanulni fogsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a te platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezdd itt**: [Mi az Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Elmélet**: [AZD alapok](docs/chapter-01-foundation/azd-basics.md) - alapfogalmak és terminológia
- **⚙️ Telepítés**: [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - platform specifikus útmutatók
- **🛠️ Gyakorlati**: [Első projekted](docs/chapter-01-foundation/first-project.md) - lépésről lépésre
- **📋 Gyorsmenü**: [Parancs összefoglaló](resources/cheat-sheet.md)

#### Gyakorlati feladatok  
```bash
# Gyors telepítési ellenőrzés
azd version

# Telepítse az első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Fejezet eredmény:** Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD-vel

**✅ Siker ellenőrzése:**  
```bash
# Az 1. fejezet befejezése után képesnek kell lenned a következőkre:
azd version              # A telepített verzió megjelenítése
azd init --template todo-nodejs-mongo  # Projekt inicializálása
azd up                  # Telepítés Azure-ra
azd show                # Futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások megtisztítása
```
  
**📊 Időráfordítás:** 30-45 perc  
**📈 Képesség szint:** Képes alapvető alkalmazásokat önállóan telepíteni

---

### 🤖 2. fejezet: AI-első fejlesztés (Ajánlott AI fejlesztőknek)  
**Előfeltételek**: 1. fejezet befejezve  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fogsz
- Microsoft Foundry integráció az AZD-vel
- AI által működtetett alkalmazások telepítése
- AI szolgáltatások konfigurációinak megértése

#### Tanulási források
- **🎯 Kezdd itt**: [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ügynökök**: [AI Ügynökök útmutató](docs/chapter-02-ai-development/agents.md) - intelligens ügynökök telepítése AZD-vel
- **📖 Minták**: [AI model telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AZD-re kész AI megoldások
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngésző alapú tanulás MkDocs * DevContainer környezettel
- **📋 Sablonok**: [Microsoft Foundry sablonok](#műhely-forrásai)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati feladatok  
```bash
# Telepítse első AI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további AI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Fejezet eredmény:** AI-alapú chat alkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Siker ellenőrzése:**  
```bash
# A 2. fejezet után képes leszel:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI csevegőfelületet
# Kérdéseket feltenni és AI által támogatott válaszokat kapni forrásokkal
# Ellenőrizni, hogy a keresési integráció működik
azd monitor  # Megnézni, hogy az Application Insights mutatja a telemetriát
azd down --force --purge
```
  
**📊 Időráfordítás:** 1-2 óra  
**📈 Képesség szint:** Képes gyártásra kész AI alkalmazásokat telepíteni és konfigurálni  
**💰 Költségtudatosság:** Érti a fejlesztési $80-150/hó és a gyártási $300-3500/hó költségeket

#### 💰 Költségszempontok az AI telepítésekhez

**Fejlesztési környezet (Becsült $80-150/hó):**  
- Microsoft Foundry modellek (fizetés a használat után): $0-50/hó (token használat alapján)  
- AI keresés (Alap szint): $75/hó  
- Container Apps (Fogyasztás alapú): $0-20/hó  
- Tárolás (Standard): $1-5/hó

**Gyártási környezet (Becsült $300-3500+/hó):**  
- Microsoft Foundry modellek (PTU stabil teljesítményért): $3000+/hó VAGY magas volumenű Pay-as-you-go  
- AI keresés (Standard szint): $250/hó  
- Container Apps (Dedikált): $50-100/hó  
- Application Insights: $5-50/hó  
- Tárolás (Prémium): $10-50/hó

**💡 Költségoptimalizálás tippek:**  
- Használj **Ingyenes szintű** Microsoft Foundry modelleket tanuláshoz (Azure OpenAI 50,000 token/hó benne)  
- Használd az `azd down` parancsot a fejlesztés szüneteltetéséhez  
- Kezdd fogyasztás-alapú számlázással, PTU-t csak gyártásra  
- `azd provision --preview` használatával becsüld meg a költségeket telepítés előtt  
- Kapcsold be az automatikus skálázást: csak a tényleges használatért fizess

**Költségmonitorozás:**  
```bash
# Becsült havi költségek ellenőrzése
azd provision --preview

# Aktuális költségek nyomon követése az Azure Portalon
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés  
**Előfeltételek**: 1. fejezet befejezve  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fogsz
- Környezetek konfigurációja és kezelése
- Hitelesítés és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítás
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/chapter-03-configuration/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati feladatok
- Több környezet konfigurálása (fejlesztés, teszt, produkció)  
- Kezelt identitás hitelesítés beállítása  
- Környezet-specifikus konfigurációk megvalósítása

**💡 Fejezet eredmény:** Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kód formájában és telepítés  
**Előfeltételek**: 1-3. fejezetek elvégzése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit tanulni fogsz
- Haladó telepítési minták
- Infrastruktúra kód formájában Biceppel
- Erőforrás-províziós stratégiák

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Províziózás**: [Erőforrás provisionálás](docs/chapter-04-infrastructure/provisioning.md) - Azure erőforrás-menedzsment
- **📝 Példák**: [Container App példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati feladatok
- Egyedi Bicep sablonok készítése
- Több szolgáltatásból álló alkalmazások telepítése
- Blue-green telepítési stratégiák megvalósítása

**💡 Fejezet eredmény:** Összetett több-szolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---
### 🎯 5. Fejezet: Többügynökös MI-megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet elkészítve  
**Időtartam**: 2-3 óra  
**Összetettség**: ⭐⭐⭐⭐

#### Amit tanulni fogsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész MI-telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM-sablonok**: [ARM-sablon csomag](../../examples/retail-multiagent-arm-template) - Egylépéses telepítés
- **📖 Architektúra**: [Többügynökös koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynöki konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredmény**: Telepíts és kezeld egy termelésre kész többügynökös MI-megoldást Ügyfél és Készlet ügynökökkel

---

### 🔍 6. Fejezet: Telepítés előtti érvényesítés és tervezés
**Előfeltételek**: 4. fejezet elkészítve  
**Időtartam**: 1 óra  
**Összetettség**: ⭐⭐

#### Amit tanulni fogsz
- Kapacitástervezés és erőforrás-ellenőrzés
- SKU kiválasztási stratégiák
- Pre-flight ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás ellenőrzés
- **💰 Kiválasztás**: [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony döntések
- **✅ Érvényesítés**: [Pre-flight ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatikus szkriptek

#### Gyakorlati feladatok
- Futtasd le a kapacitás ellenőrző szkripteket
- Optimalizáld a SKU-kat költség szempontjából
- Valósítsd meg az automatikus telepítés előtti ellenőrzéseket

**💡 Fejezet eredmény**: Érvényesítsd és optimalizáld a telepítéseket a végrehajtás előtt

---

### 🚨 7. Fejezet: Hibakeresés és Debuggolás
**Előfeltételek**: Bármely telepítési fejezet elkészült  
**Időtartam**: 1-1,5 óra  
**Összetettség**: ⭐⭐

#### Amit tanulni fogsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldásaik
- MI-specifikus hibakeresés

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresési útmutató**: [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 MI problémák**: [MI-specifikus hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - MI szolgáltatási problémák

#### Gyakorlati feladatok
- Diagnosztizáld a telepítési hibákat
- Oldd meg az autentikációs problémákat
- Debuggold az MI szolgáltatás kapcsolódását

**💡 Fejezet eredmény**: Önállóan diagnosztizáld és oldd meg a gyakori telepítési problémákat

---

### 🏢 8. Fejezet: Termelési és vállalati minták
**Előfeltételek**: 1-4. fejezetek elkészítve  
**Időtartam**: 2-3 óra  
**Összetettség**: ⭐⭐⭐⭐

#### Amit tanulni fogsz
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizáció

#### Tanulási források
- **🏭 Termelés**: [Termelési MI legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások példája](../../examples/microservices) - Komplex architektúrák
- **📊 Monitorozás**: [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Monitorozás

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Teljes körű monitorozás beállítása
- Telepítés termelési környezetbe megfelelő irányítással

**💡 Fejezet eredmény**: Telepíts vállalati szintű alkalmazásokat teljes termelési képességekkel

---

## 🎓 Műhely áttekintés: Gyakorlati tanulási élmény

> **⚠️ MŰHELY ÁLLAPOTA: Fejlesztés alatt**  
> A műhely anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működőképesek, de néhány haladó rész nincs még kész. Aktívan dolgozunk a teljes tartalom elkészítésén. [Előrehaladás követése →](workshop/README.md)

### Interaktív műhelyanyagai
**Átfogó, kézzel fogható tanulás böngésző-alapú eszközökkel és irányított feladatokkal**

Műhelyanyagunk struktúrált, interaktív tanulási élményt nyújt, amely kiegészíti a fenti fejezet-alapú tananyagot. A műhely önálló és oktató vezette tanulásra egyaránt alkalmas.

#### 🛠️ Műhely jellemzők
- **Böngésző-alapú felület**: Komplett MkDocs-alapú műhely kereséssel, másolással és témabeállításokkal
- **GitHub Codespaces integráció**: Egylépéses fejlesztői környezet telepítés
- **Strukturált tanulási útvonal**: 8 modulból álló irányított gyakorlat (összesen 3-4 óra)
- **Fokozatos módszertan**: Bevezetés → Kiválasztás → Érvényesítés → Feltárás → Konfiguráció → Testreszabás → Leszerelés → Összefoglalás
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Műhely modul struktúra
A műhely egy **8 modulból álló fokozatos módszertant** követ, amely a felfedezéstől a telepítés elsajátításáig vezet:

| Modul | Téma | Mit csinálsz | Időtartam |
|--------|-------|----------------|----------|
| **0. Bevezetés** | Műhely áttekintés | A tanulási célok, előfeltételek és a műhely felépítésének megértése | 15 perc |
| **1. Kiválasztás** | Sablon felfedezés | AZD sablonok feltérképezése és a helyes MI sablon kiválasztása | 20 perc |
| **2. Érvényesítés** | Telepítés és ellenőrzés | Telepítsd a sablont `azd up`-pal és ellenőrizd az infrastruktúrát | 30 perc |
| **3. Feltárás** | Szerkezet megértése | Használd a GitHub Copilotot a sablon architektúra, Bicep fájlok és kód szervezés feltárására | 30 perc |
| **4. Konfiguráció** | azure.yaml mélyreható | Sajátítsd el az `azure.yaml` konfigurációt, életciklus horgonyokat és környezeti változókat | 30 perc |
| **5. Testreszabás** | Személyre szabás | Engedélyezd az AI keresést, trace-elést, értékelést és szabjad testre a forgatókönyvhöz | 45 perc |
| **6. Leszerelés** | Tisztítás | Biztonságosan szüntesd meg az erőforrásokat `azd down --purge` használatával | 15 perc |
| **7. Összefoglalás** | Következő lépések | Tekintsd át az eredményeket, főbb fogalmakat és folytasd tanulásodat | 15 perc |

**Műhely folyamata:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 A műhely elkezdése
```bash
# 1. lehetőség: GitHub Codespaces (Ajánlott)
# Kattintson a "Code" → "Create codespace on main" elemre a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesse a workshop/README.md fájlban található beállítási útmutatót
```

#### 🎯 Műhely tanulási eredmények
A műhely befejeztével a résztvevők:
- **Termelési MI alkalmazásokat telepítenek**: AZD használatával Microsoft Foundry szolgáltatásokkal
- **Mesteri szintű többügynökös architektúrákat ismernek meg**: Koordinált MI ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatokat valósítanak meg**: Hitelesítés és hozzáférés-vezérlés beállítása
- **Skálázásra optimalizálnak**: Költséghatékony, teljesítményorientált telepítési tervek
- **Telepítési hibákat önállóan hárítanak**: Gyakori problémák megoldása

#### 📖 Műhely forrásai
- **🎥 Interaktív útmutató**: [Műhely anyagok](workshop/README.md) - Böngésző-alapú tanulási környezet
- **📋 Modulonkénti útmutatók**:
  - [0. Bevezetés](workshop/docs/instructions/0-Introduction.md) - Műhely áttekintése és célok
  - [1. Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) - MI sablonok keresése és kiválasztása
  - [2. Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) - Sablon telepítés és ellenőrzés
  - [3. Feltárás](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Sablon architektúra feltárása
  - [4. Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml mesteri szint
  - [5. Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) - Szenárió specifikus testreszabás
  - [6. Leszerelés](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Erőforrások tisztítása
  - [7. Összefoglalás](workshop/docs/instructions/7-Wrap-up.md) - Áttekintés és továbblépés
- **🛠️ MI műhely labor**: [MI műhely labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - MI fókuszú gyakorlatok
- **💡 Gyors kezdés**: [Műhely beállítása](workshop/README.md#quick-start) - Környezet konfiguráció

**Tökéletes választás**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcampokhoz.

---

## 📖 Mélyebb betekintés: AZD képességek

Az alapokon túl az AZD erőteljes funkciókat kínál termelési telepítésekhez:

- **Sablonalapú telepítések** - Előre elkészített sablonok használata általános alkalmazásmintákhoz
- **Infrastructure as Code** - Azure erőforrások kezelése Bicep vagy Terraform használatával  
- **Integrált munkafolyamatok** - Zökkenőmentes alkalmazás-províziós, telepítési és monitorozási folyamatok
- **Fejlesztőbarát** - Optimalizált fejlesztői hatékonyság és élmény

### **AZD + Microsoft Foundry: Tökéletes MI telepítésekhez**

**Miért AZD MI megoldásokhoz?** AZD lefedi az MI fejlesztők legfontosabb kihívásait:

- **MI-Ready sablonok** - Előkonfigurált Microsoft Foundry modellekhez, Azure MI szolgáltatásokhoz és ML munkaterhelésekhez
- **Biztonságos MI telepítések** - Beépített biztonsági minták MI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Termelési MI minták** - Költséghatékony, skálázható MI alkalmazás telepítési legjobb gyakorlatok
- **Végponttól végpontig MI munkafolyamatok** - Modell fejlesztéstől a termelésbe vitelig megfelelő monitorozással
- **Költségoptimalizálás** - Intelligens erőforráskiosztás és skálázási stratégiák MI munkaterhelésekhez
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat Microsoft Foundry modell katalógushoz és végpontokhoz

---

## 🎯 Sablonok és példák könyvtára

### Kiemelt: Microsoft Foundry sablonok
**Itt kezdj, ha MI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különféle MI mintákat mutatnak be. Néhány külső Azure minta, mások helyi megvalósítások.

| Sablon | Fejezet | Összetettség | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Külső |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + MI keresés + Cosmos DB + Container Apps | Külső |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + MI keresés + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási forgatókönyvek
**Termelésre kész alkalmazás sablonok tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Összetettség | Fő tanulási pont |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alap MI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure MI kereséssel |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentum intelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és függvényhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati MI összehangolás |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél és Készlet ügynökökkel |

### Tanulj a példa típusa alapján

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repo-ban) = Azonnal használhatók  
> **Külső példák** (Azure Samples) = A kapcsolódó repók klónozandók

#### Helyi példák (Azonnal használhatók)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Teljes termelésre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készlet ügynökök)
  - Átfogó monitorozás és értékelés
  - Egylépéses telepítés ARM sablonon keresztül

#### Helyi példák - Konténer alkalmazások (2-5. fejezet)
**Átfogó konténer telepítési példák ebben a tárban:**
- [**Konténer Alkalmazás Példák**](examples/container-app/README.md) - Teljes útmutató konténerizált telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázással nullára
  - [Mikroszolgáltatás Architektúra](../../examples/container-app/microservices) - Termelésre kész több-szolgáltatásos telepítés
  - Gyors kezdés, termelés és fejlett telepítési minták
  - Megfigyelési, biztonsági és költségoptimalizálási útmutatás

#### Külső Példák - Egyszerű Alkalmazások (1-2. fejezet)
**Klonozd le ezeket az Azure Samples tárolókat a kezdéshez:**
- [Egyszerű Webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták
- [Statikus Weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítése
- [Konténer Alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső Példák - Adatbázis Integráció (3-4. fejezet)  
- [Adatbázis Alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis-kapcsolati minták
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Szerver nélküli adatfolyam

#### Külső Példák - Haladó Minták (4-8. fejezet)
- [Java Mikroszolgáltatások](https://github.com/Azure-Samples/java-microservices-aca-lab) - Több-szolgáltatásos architektúrák
- [Konténer Alkalmazás Munkák](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész gépi tanulási minták

### Külső Sablon Gyűjtemények
- [**Hivatalos AZD Sablongyűjtemény**](https://azure.github.io/awesome-azd/) - Válogatott hivatalos és közösségi sablonok
- [**Azure Fejlesztői CLI Sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példák Könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási Anyagok & Hivatkozások

### Gyors Hivatkozások
- [**Parancs Gyorslista**](resources/cheat-sheet.md) - Fontos azd parancsok fejezetenként rendezve
- [**Szószedet**](resources/glossary.md) - Azure és azd terminológia  
- [**Gyakran Ismételt Kérdések**](resources/faq.md) - Gyakori kérdések tanulási fejezetek szerint
- [**Tanulmányi Útmutató**](resources/study-guide.md) - Átfogó gyakorló feladatok

### Gyakorlatias Műhelyek
- [**AI Műhely Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tedd AZD-kompatibilissé AI megoldásaidat (2-3 óra)
- [**Interaktív Műhely**](workshop/README.md) - 8 modulból álló vezetett gyakorlatok MkDocs és GitHub Codespaces segítségével
  - Menete: Bevezetés → Kiválasztás → Ellenőrzés → Szétbontás → Konfigurálás → Testreszabás → Lebontás → Összefoglalás

### Külső Tanulási Források
- [Azure Fejlesztői CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

### AI Ügynök Készségek Szerkesztődhöz
- [**Microsoft Azure Készségek a skills.sh-en**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt ügynök készség Azure AI-hoz, Foundry-hoz, telepítéshez, diagnosztikához, költségoptimalizáláshoz és továbbiakhoz. Telepítsd GitHub Copilotba, Cursorba, Claude Code-ba vagy bármely támogatott ügynökbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Gyors Hibakeresési Útmutató

**Gyakori kezdői problémák és azonnali megoldások:**

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

# Telepítés ellenőrzése
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
<summary><strong>❌ "Elégtelen kvóta" vagy "Kvóta túllépve"</strong></summary>

```bash
# Próbálja ki más Azure régiót
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
<summary><strong>❌ "azd up" félúton meghiúsul</strong></summary>

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
# Újra hitelesítés AZD-hez
azd auth logout
azd auth login

# Választható: frissítse az Azure CLI-t is, ha az az parancsokat futtat
az logout
az login

# Hitelesítés ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Forrás már létezik" vagy névütközések</strong></summary>

```bash
# Az AZD egyedi neveket generál, de ha ütközés van:
azd down --force --purge

# Akkor új környezettel próbálkozik újra
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ A sablon telepítése túl hosszú ideig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI készítés lassú)

```bash
# Folyamat ellenőrzése
azd show

# Ha 30 percnél tovább elakadt, ellenőrizze az Azure Portált:
azd monitor --overview
# Keresse meg a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Hozzáférés megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkörre van szüksége
# Kérje meg Azure adminját, hogy adja meg:
# - Közreműködő (erőforrásokhoz)
# - Felhasználói Hozzáférés Adminisztrátor (szerepkör hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Egy adott szolgáltatás ellenőrzése
azd env get-values
# Keresse az *_URL változókat
```
</details>

### 📚 Teljes Hibakeresési Anyagok

- **Gyakori Problémák Útmutató:** [Részletes Megoldások](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikus Problémák:** [AI Hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hibakeresési Útmutató:** [Lépésenkénti hibakeresés](docs/chapter-07-troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam Teljesítés & Tanúsítás

### Haladási Nyomonkövetés
Kövesd tanulási haladásod fejezetenként:

- [ ] **1. fejezet**: Alapok & Gyors Kezdés ✅
- [ ] **2. fejezet**: AI-első Fejlesztés ✅  
- [ ] **3. fejezet**: Konfigurálás & Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kód formájában & Telepítés ✅
- [ ] **5. fejezet**: Több Ügynökös AI Megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti Ellenőrzés & Tervezés ✅
- [ ] **7. fejezet**: Hibakeresés & Debug ✅
- [ ] **8. fejezet**: Termelési & Vállalati Minták ✅

### Tanulásellenőrzés
Minden fejezet után ellenőrizd tudásod a következőkkel:
1. **Gyakorlat**: Teljesítsd a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Nézd át a fejezet FAQ szekcióját
3. **Közösségi Megbeszélés**: Oszd meg tapasztalataid az Azure Discordon
4. **Következő fejezet**: Haladj a következő szintre

### Tanfolyam Befejezés Előnyei
Az összes fejezet elvégzése után rendelkezel:
- **Termelési Tapasztalat**: Valódi AI alkalmazások telepítése az Azure-ra
- **Professzionális Készségek**: Vállalati szintű telepítési képességek  
- **Közösségi Elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier Előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség & Támogatás

### Segítség & Támogatás Kérése
- **Technikai Problémák**: [Hibabejelentés és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási Kérdések**: [Microsoft Azure Discord Közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus Segítség**: Csatlakozz a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Fejlesztői CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi Nézetek a Microsoft Foundry Discordból

**Legfrissebb Szavazási Eredmények a #Azure Csatornán:**
- **45%** fejlesztő AZD használatát szeretné az AI munkaterheléseknél
- **Top kihívások**: Több-szolgáltatásos telepítések, hitelesítési kulcskezelés, termelési készség  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibakeresési útmutatók, bevált gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataid és kapj segítséget
- Hozzáférj új AI sablonok korai verzióihoz
- Hozzájárulj az AI telepítési bevált gyakorlatokhoz
- Befolyásold a jövő AI + AZD funkciófejlesztéseit

### Hozzájárulás a Tanfolyamhoz
Szívesen fogadjuk a hozzájárulásokat! Olvasd el a [Hozzájárulási Útmutatót](CONTRIBUTING.md) a részletekért:
- **Tartalom Fejlesztések**: Fejlessz meglévő fejezeteket és példákat
- **Új Példák**: Adj hozzá valós helyzeteket és sablonokat  
- **Fordítás**: Segíts fenntartani a többnyelvű támogatást
- **Hibajelentések**: Pontosabb és érthetőbb anyagokért
- **Közösségi Szabályok**: Kövesd befogadó közösségi elveinket

---

## 📄 Tanfolyam Információk

### Licenc
Ez a projekt az MIT licenc alatt áll - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft Tanulási Források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j Kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js Kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain Kezdőknek](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ügynökök
[![AZD Kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP Kezdőknek](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Ügynökök Kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI Sorozat
[![Generatív AI Kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető tanulás
[![Gépi tanulás kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Mesterséges intelligencia kezdőknek](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot AI páros programozáshoz](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET fejlesztőknek](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot kalandok](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdőknek**: Kezdj a [1. fejezettel: Alapok és Gyorsindítás](#-chapter-1-foundation--quick-start)  
**AI fejlesztőknek**: Ugorj a [2. fejezethez: AI-első fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Tapasztalt fejlesztőknek**: Kezdj a [3. fejezettel: Konfiguráció és hitelesítés](#️-chapter-3-configuration--authentication)

**Következő lépések**: [Kezd el az 1. fejezetet - AZD alapok](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
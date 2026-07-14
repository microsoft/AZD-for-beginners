# AZD Kezdőknek: Egy Strukturált Tanulási Út

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatikus Fordítások (Mindig Naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](./README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Inkább helyben másolna?**
>
> Ez a tároló 50+ nyelvű fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretne klónozni, használja a sparse checkoutot:
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
> Így megkap mindent, amire a tanfolyam befejezéséhez szüksége van, sokkal gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mi újság az azd-ben ma

> 📌 Ez a tanfolyam **`azd 1.27.1`** (2026 július) verzióhoz igazított. Futtassa az `azd version` parancsot a build ellenőrzéséhez, és az `azd upgrade`-et a legújabb eléréséhez.

Az Azure Developer CLI túlnőtt a hagyományos webalkalmazásokon és API-kon. Ma az azd az egységes eszköz **bármilyen** alkalmazás Azure-ra telepítéséhez – beleértve az AI-vezérelt alkalmazásokat és intelligens ügynököket is.

Ez Önnek annyit jelent:

- **Az AI ügynökök mostantól elsőrendű azd munkaterhelések.** Inicializálhatja, telepítheti és kezelheti az AI ügynök projektjeit ugyanazzal az `azd init` → `azd up` munkafolyamattal, amelyet már ismer.
- **Teljes ügynöki életciklus CLI-ből.** Az `azure.ai.agents` bővítmény most lefedi az egész folyamatot—`azd ai agent init` a sablonhoz, `azd ai agent invoke` a teszteléshez (válaszidős visszajelzéssel), `azd ai agent eval generate` és `azd ai agent optimize` a minőség méréséhez és javításához, valamint `azd ai agent delete` a takarításhoz.
- **További AI építőelemek.** Új előzetes bővítmények—`azure.ai.skills` és `azure.ai.connections`—lehetővé teszik újrahasználható ügynök képességek és Foundry kapcsolatok közvetlen kezelését az azd-vel.
- **Microsoft Foundry integráció** behozza a modell telepítést, ügynök tárhelyet és az AI szolgáltatás konfigurációkat közvetlenül az azd sablon ökoszisztémába.
- **Zökkenőmentes mindennapos alapok.** A frissítések az `azd init`-et ismétfuthatóvá tették (biztonságos újrafuttatás), az `azd auth login` automatikusan törli a lejárt tokeneket, és hozzáadták az `azd tool` barátságos első futtatási beállító kérést.
- **A fő munkafolyamat nem változott.** Akár egy todo alkalmazást, mikroszolgáltatást vagy többügynökös AI megoldást telepít, a parancsok ugyanazok.

> **Megjegyzés Aspire felhasználóknak:** A Microsoft most egyszerűen **Aspire** néven hivatkozik a termékre (korábban ".NET Aspire"). Az azd Aspire támogatása változatlan – csak a név frissült.

Ha korábban használt azd-t, az AI támogatás természetes kiterjesztés – nem külön eszköz vagy haladó szint. Ha most kezd, egyetlen munkafolyamatot tanul, ami mindenhova működik.

---

## 🚀 Mi az Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** egy fejlesztőbarát parancssori eszköz, ami egyszerűvé teszi az alkalmazások Azure-ra való telepítését. Ahelyett, hogy kézzel hozna létre és kapcsolna össze tucatnyi Azure erőforrást, egyetlen parancssal egész alkalmazásokat telepíthet.

### Az `azd up` varázsa

```bash
# Ez az egyetlen parancs mindent elvégez:
# ✅ Létrehozza az összes Azure erőforrást
# ✅ Beállítja a hálózatot és a biztonságot
# ✅ Létrehozza az alkalmazáskódot
# ✅ Telepíti az Azure-ra
# ✅ Működő URL-t ad Önnek
azd up
```

**Ennyi az egész!** Nem kell az Azure Portalon kattintgatni, bonyolult ARM sablonokat megtanulni, vagy kézzel beállítani - csak működő alkalmazások az Azure-on.

---

## ❓ Azure Developer CLI vs Azure CLI: Mi a Különbség?

Ez a leggyakoribb kérdés, amit kezdők tesznek fel. Íme a rövid válasz:

| Tulajdonság | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cél** | Egyedi Azure erőforrások kezelése | Teljes alkalmazások telepítése |
| **Gondolkodásmód** | Infrastruktúra-központú | Alkalmazás-központú |
| **Példa** | `az webapp create --name myapp...` | `azd up` |
| **Tanulási görbe** | Az Azure szolgáltatásokat ismerni kell | Csak az alkalmazást kell ismerni |
| **Legjobb Bírálók** | DevOps, Infrastruktúra | Fejlesztők, Prototípus |

### Egyszerű Analógia

- **Azure CLI** olyan, mint az összes eszköz rendelkezésre állása egy ház építéséhez - kalapácsok, fűrészek, szegek. Bármit megépíthet, de értenie kell az építkezést.
- **Azure Developer CLI** olyan, mint egy vállalkozó megbízása - elmondja, mit szeretne, és ők elvégzik az építést.

### Mikor melyiket használjuk

| Szenárió | Használja ezt |
|----------|----------|
| "Gyorsan telepíteném a webalkalmazásomat" | `azd up` |
| "Csak egy tárolófiókot kell létrehoznom" | `az storage account create` |
| "Egy teljes AI alkalmazást építek" | `azd init --template azure-search-openai-demo` |
| "Egy adott Azure erőforrást kell hibakeresnem" | `az resource show` |
| "Percek alatt gyártásra készen szeretnék telepíteni" | `azd up --environment production` |

### Együtt is működnek!

Az azd az Azure CLI-t használja a háttérben. Mindkettőt használhatja:
```bash
# Telepítse alkalmazását AZD-vel
azd up

# Ezután finomhangolja a konkrét erőforrásokat az Azure CLI segítségével
az webapp config set --name myapp --always-on true
```

---

## 🌟 Találjon Sablonokat az Awesome AZD-ben

Ne kezdjen nulláról! **Awesome AZD** a közösség gyűjteménye a kész sablonokból:

| Erőforrás | Leírás |
|----------|-------------|
| 🔗 [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) | Böngésszen 200+ sablon között, egykattintásos telepítéssel |
| 🔗 [**Sablon Beküldése**](https://github.com/Azure/awesome-azd/issues) | Adjon hozzá saját sablont a közösséghez |
| 🔗 [**GitHub Tároló**](https://github.com/Azure/awesome-azd) | Csillagozza és fedezze fel a forrást |

### Népszerű AI Sablonok az Awesome AZD-ből

```bash
# RAG Chat Microsoft Foundry modellekkel + AI keresés
azd init --template azure-search-openai-demo

# Gyors AI csevegőalkalmazás
azd init --template openai-chat-app-quickstart

# AI ügynökök Foundry ügynökökkel
azd init --template get-started-with-ai-agents
```

---

## 🎯 Első lépések 3 lépésben

Mielőtt elkezdené, győződjön meg róla, hogy gépe készen áll a telepíteni kívánt sablonhoz:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha bármelyik szükséges ellenőrzés sikertelen, előbb azt javítsa, majd folytassa a gyors indítással.

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

### 2. lépés: Hitelesítés az AZD-hez

```bash
# Opcionális, ha azt tervezed, hogy közvetlenül az Azure CLI parancsokat használod ebben a kurzusban
az login

# Kötelező az AZD munkafolyamatokhoz
azd auth login
```

Ha nem biztos benne, melyikre van szüksége, kövesse a teljes beállítási folyamatot az [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) oldalon.

### 3. lépés: Az első alkalmazás telepítése

```bash
# Inicializálás sablonból
azd init --template todo-nodejs-mongo

# Telepítés Azure-ra (minden létrehozása!)
azd up
```

**🎉 Ennyi az egész!** Az alkalmazása most már él az Azure-on.

### Takarítás (ne felejtse el!)

```bash
# Távolítsa el az összes erőforrást a kísérletezés befejezése után
azd down --force --purge
```

---

## 📚 Hogyan Használja Ezt a Tanfolyamot

Ez a tanfolyam **fokozatos tanulásra** lett tervezve - kezdje ott, ahol kényelmes, és haladjon előre:

| A tapasztalata | Innen kezdje |
|-----------------|------------|
| **Teljesen új az Azure-ben** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **Ismeri az Azure-t, de új az AZD-ben** | [1. fejezet: Alapok](#-chapter-1-foundation--quick-start) |
| **AI alkalmazások telepítését szeretné** | [2. fejezet: AI-Központú Fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gyakorlati tapasztalatot akar** | [🎓 Interaktív Műhely](workshop/README.md) - 3-4 órás vezetett labor |
| **Gyártási mintákra van szüksége** | [8. fejezet: Gyártás & Vállalati](#-chapter-8-production--enterprise-patterns) |

### Gyors beállítás

1. **Forkolja ezt a tárolót**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozza**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kérjen segítséget**: [Azure Discord Közösség](https://discord.com/invite/ByRwuEEgH4)

> **Inkább helyben másolna?**

> Ez a tároló 50+ nyelvű fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Fordítások nélkül az alábbi sparse checkouttal klónozhat:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Így megkap mindent, amire a tanfolyam befejezéséhez szüksége van, jelentősen gyorsabb letöltéssel.


## Tanfolyam Áttekintése

Sajátítsa el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek fokozatos tanulást támogatnak. **Különös hangsúlyt kap az AI alkalmazások telepítése Microsoft Foundry integrációval.**


### Miért lényeges ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösségi betekintései alapján, **a fejlesztők 45%-a szeretné használni az AZD-t AI feladatokhoz**, de kihívásokkal szembesülnek:
- Összetett, több szolgáltatásból álló AI architektúrák
- AI éles bevezetés legjobb gyakorlatai  
- Azure AI szolgáltatások integrációja és konfigurációja
- Költségoptimalizálás AI feladatokra
- AI-specifikus telepítési problémák elhárítása

### Tanulási célkitűzések

A struktúrált tanfolyam elvégzésével:
- **Elsajátítja az AZD alapjait**: alapfogalmak, telepítés és konfiguráció
- **AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kód formájában megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési hibák elhárítása**: gyakori problémák megoldása és hibakeresés
- **Optimalizálás éles környezetre**: biztonság, skálázás, monitorozás, költségkezelés
- **Több ágenses megoldások építése**: összetett AI architektúrák telepítése

## Mielőtt elkezdené: fiókok, hozzáférések és feltételezések

Mielőtt elkezded az 1. fejezetet, győződj meg róla, hogy a következők rendelkezésre állnak. Az ezt követő telepítési lépések feltételezik ezeket az alapokat.

- **Egy Azure előfizetés**: Használhatsz egy meglévőt munkából vagy saját fiókodból, vagy létrehozhatsz egy [ingyenes próbaverziót](https://aka.ms/azurefreetrial) a kezdéshez.
- **Jogosultság Azure erőforrások létrehozására**: A legtöbb gyakorlathoz legalább **Közreműködő** hozzáférés kell a cél előfizetésen vagy erőforrás csoporton. Egyes fejezetekben feltételezhetik, hogy tudsz erőforrás csoportokat, kezelt identitásokat és RBAC hozzárendeléseket létrehozni.
- [**Egy GitHub fiók**](https://github.com): Hasznos a repozitórium fork-olásához, saját változtatások nyomon követéséhez és a GitHub Codespaces használatához a műhelymunka során.
- **Sablon futtatási előfeltételek**: Néhány sablon helyi eszközöket igényel, mint Node.js, Python, Java vagy Docker. Futtasd a telepítés ellenőrzőt a kezdés előtt, hogy időben észrevedd a hiányzó eszközöket.
- **Alapvető terminálismeret**: Nem kell szakértőnek lenned, de kényelmesnek kell lenned olyan parancsok futtatásában, mint `git clone`, `azd auth login` és `azd up`.

> **Vállalati előfizetésben dolgozol?**
> Ha az Azure környezetedet egy rendszergazda kezeli, előre erősítsd meg, hogy telepíthetsz erőforrásokat az előfizetésben vagy erőforrás csoportban, amit használni tervezel. Ha nem, kérj egy sandbox előfizetést vagy Közreműködő hozzáférést a kezdés előtt.

> **Új az Azure-ben?**
> Kezdj egy saját Azure próbaverzióval vagy pay-as-you-go előfizetéssel a https://aka.ms/azurefreetrial címen, hogy végig tudd csinálni a gyakorlatokat várakozás nélkül a tenant szintű jóváhagyásokra.

## 🗺️ Tanfolyam térkép: Gyors navigáció fejezet szerint

Minden fejezethez külön README tartozik tanulási célokkal, gyors indítással és gyakorlatokkal:

| Fejezet | Téma | Leckék | Időtartam | Bonyolultság |
|---------|-------|---------|----------|------------|
| **[1. fejezet: Alapok](docs/chapter-01-foundation/README.md)** | Kezdés | [AZD Alapok](docs/chapter-01-foundation/azd-basics.md) &#124; [Telepítés](docs/chapter-01-foundation/installation.md) &#124; [Első projekt](docs/chapter-01-foundation/first-project.md) | 30-45 perc | ⭐ |
| **[2. fejezet: AI fejlesztés](docs/chapter-02-ai-development/README.md)** | AI-első alkalmazások | [Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ágensek](docs/chapter-02-ai-development/agents.md) &#124; [Model telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Műhelymunka](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 óra | ⭐⭐ |
| **[3. fejezet: Konfiguráció](docs/chapter-03-configuration/README.md)** | Hitelesítés és biztonság | [Konfiguráció](docs/chapter-03-configuration/configuration.md) &#124; [Hitelesítés és biztonság](docs/chapter-03-configuration/authsecurity.md) | 45-60 perc | ⭐⭐ |
| **[4. fejezet: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC és telepítés | [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Erőforrás biztosítás](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 óra | ⭐⭐⭐ |
| **[5. fejezet: Több ágens](docs/chapter-05-multi-agent/README.md)** | AI ágens megoldások | [Kiskereskedelmi szcenárió](examples/retail-scenario.md) &#124; [Koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[6. fejezet: Előkészítés](docs/chapter-06-pre-deployment/README.md)** | Tervezés és ellenőrzés | [Előkészítő ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 óra | ⭐⭐ |
| **[7. fejezet: Hibakeresés](docs/chapter-07-troubleshooting/README.md)** | Hibakeresés és javítás | [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hibakeresés](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémák](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 óra | ⭐⭐ |
| **[8. fejezet: Éles környezet](docs/chapter-08-production/README.md)** | Vállalati minták | [Éles AI gyakorlatok](docs/chapter-08-production/production-ai-practices.md) | 2-3 óra | ⭐⭐⭐⭐ |
| **[🎓 Műhelymunka](workshop/README.md)** | Gyakorlati labor | [Bevezető](workshop/docs/instructions/0-Introduction.md) &#124; [Választás](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Ellenőrzés](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Szétszedés](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguráció](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Leszerelés](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Befejezés](workshop/docs/instructions/7-Wrap-up.md) | 3-4 óra | ⭐⭐ |

**Teljes tanfolyami idő:** kb. 10-14 óra | **Képességek fejlődése:** Kezdőtől → Éles környezetre kész

---

## 📚 Tanulási fejezetek

*Válaszd ki a tanulási utadat tapasztalati szinted és céljaid alapján*

### 🚀 1. fejezet: Alapok és gyors kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezd itt**: [Mi az Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Elmélet**: [AZD alapok](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Telepítés**: [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - Platform specifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekt](docs/chapter-01-foundation/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors referencia**: [Parancs összefoglaló](resources/cheat-sheet.md)

#### Gyakorlati gyakorlatok
```bash
# Gyors telepítés ellenőrzése
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet eredmény**: Egyszerű webalkalmazás sikeres telepítése az Azure-ra AZD-vel

**✅ Sikertörténet ellenőrzése:**
```bash
# Az 1. fejezet befejezése után képesnek kell lennie a következőkre:
azd version              # Telepített verzió megjelenítése
azd init --template todo-nodejs-mongo  # Projekt inicializálása
azd up                  # Telepítés Azure-ra
azd show                # Futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások tisztítása
```

**📊 Idő ráfordítás:** 30-45 perc  
**📈 Képességi szint a fejezet után:** Alap alkalmazásokat önállóan tud telepíteni
**📈 Képességi szint a fejezet után:** Alap alkalmazásokat önállóan tud telepíteni

---

### 🤖 2. fejezet: AI-első fejlesztés (ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Microsoft Foundry integráció AZD-vel
- AI-vezérelt alkalmazások telepítése
- AI szolgáltatás konfigurációinak megértése

#### Tanulási források
- **🎯 Kezd itt**: [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ágensek**: [AI ágensek útmutató](docs/chapter-02-ai-development/agents.md) - Intelligens ágensek telepítése AZD-vel
- **📖 Minták**: [AI modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Műhelymunka**: [AI műhelylabor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI megoldásaid AZD-re készítése
- **🎥 Interaktív útmutató**: [Műhely anyagok](workshop/README.md) - Böngésző alapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Microsoft Foundry sablonok](#műhely-források)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati gyakorlatok
```bash
# Telepítse első AI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további AI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet eredmény**: AI-vezérelt csevegőalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Sikertörténet ellenőrzése:**
```bash
# A 2. fejezet után képes leszel:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az AI csevegőfelületet
# Kérdéseket feltenni és AI-alapú válaszokat kapni forrásokkal
# Ellenőrizni, hogy a keresési integráció működik-e
azd monitor  # Megnézni, hogy az Application Insights megjeleníti-e a telemetriát
azd down --force --purge
```

**📊 Idő ráfordítás:** 1-2 óra  
**📈 Képességi szint a fejezet után:** Éles környezetre kész AI alkalmazásokat tud telepíteni és konfigurálni  
**💰 Költségtudatosság:** Értse meg a fejlesztési költségeket ($80-150/hó), és az éles környezeti költségeket ($300-3500/hó)

#### 💰 Költségszempontok AI telepítésekhez

**Fejlesztői környezet (becsült $80-150/hó):**
- Microsoft Foundry modellek (fizess a használat után): $0-50/hó (token használat szerint)
- AI keresés (alapszint): $75/hó
- Konténeralkalmazások (fogyasztás alapú): $0-20/hó
- Tárolás (standard): $1-5/hó

**Éles környezet (becsült $300-3,500+/hó):**
- Microsoft Foundry modellek (PTU a konzisztens teljesítményért): $3,000+/hó VAGY nagy volumenű Pay-as-you-go
- AI keresés (standard szint): $250/hó
- Konténeralkalmazások (dedikált): $50-100/hó
- Application Insights: $5-50/hó
- Tárolás (prémium): $10-50/hó

**💡 Költségoptimalizálási tippek:**
- Használj **ingyenes szintű** Microsoft Foundry modelleket tanuláshoz (Azure OpenAI 50,000 token/hó ingyen)
- Futtasd az `azd down` parancsot, hogy leállítsd az erőforrásokat, amikor nem fejlesztesz aktívan
- Kezdd fogyasztás alapú számlázással, PTU-t csak éles környezethez válassz
- Használd az `azd provision --preview` parancsot a költségbecsléshez telepítés előtt
- Engedélyezd az automatikus skálázást: csak a tényleges használatért fizess

**Költségfigyelés:**
```bash
# Becslés a havi költségekre
azd provision --preview

# Az aktuális költségek figyelése az Azure portálon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Környezet konfiguráció és kezelése
- Hitelesítés és biztonsági legjobb gyakorlatok
- Erőforrás elnevezés és szervezés

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/chapter-03-configuration/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati gyakorlatok
- Több környezet konfigurálása (dev, staging, prod)
- Kezelt identitás hitelesítés beállítása
- Környezet specifikus konfigurációk megvalósítása

**💡 Fejezet eredmény**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kódként és telepítés
**Előfeltételek**: 1-3. fejezetek befejezése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Biceppel
- Erőforrás-províziós stratégiák

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Biztosítás**: [Erőforrás biztosítás](docs/chapter-04-infrastructure/provisioning.md) - Azure erőforrás-kezelés
- **📝 Példák**: [Konténeralkalmazás példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati gyakorlatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatású alkalmazások telepítése
- Kék-zöld telepítési stratégiák megvalósítása

**💡 Fejezet eredmény**: Összetett több szolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---


### 🎯 5. fejezet: Többügynökös MI megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet befejezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész MI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM sablonok**: [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Egyszerű telepítés
- **📖 Architektúra**: [Többügynökös koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Telepíts és kezeld termelésre kész többügynökös MI megoldást Ügyfél- és Készletügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti érvényesítés és tervezés
**Előfeltételek**: 4. fejezet befejezve  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrás-érvényesítés
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás ellenőrzés
- **💰 Kiválasztás**: [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Érvényesítés**: [Előzetes ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati feladatok
- Futtasd a kapacitás-érvényesítő szkripteket
- Optimalizáld az SKU választásokat a költség érdekében
- Valósíts meg automatizált telepítés előtti ellenőrzéseket

**💡 Fejezet eredménye**: Érvényesítsd és optimalizáld a telepítéseket végrehajtás előtt

---

### 🚨 7. fejezet: Hibaelhárítás és hibakeresés
**Előfeltételek**: Bármely telepítési fejezet befejezve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- MI-specifikus hibaelhárítás

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - Gyakran ismételt kérdések és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 MI problémák**: [MI-specifikus hibaelhárítás](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - MI szolgáltatás problémák

#### Gyakorlati feladatok
- Diagnosztizáld a telepítési hibákat
- Oldd meg az hitelesítési problémákat
- Hibakeresés MI szolgáltatás kapcsolódási problémáin

**💡 Fejezet eredménye**: Önállóan diagnosztizáld és oldd meg a gyakori telepítési problémákat

---

### 🏢 8. fejezet: Termelési és vállalati minták
**Előfeltételek**: 1-4. fejezet befejezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás

#### Tanulási források
- **🏭 Termelés**: [Termelési MI legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások példa](../../examples/microservices) - Összetett architektúrák
- **📊 Monitorozás**: [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Monitorozás

#### Gyakorlati feladatok
- Valósítsd meg a vállalati biztonsági mintákat
- Állíts be átfogó monitorozást
- Telepítsd termelésre megfelelő kormányzással

**💡 Fejezet eredménye**: Telepíts vállalati kész alkalmazásokat teljes termelési képességekkel

---

## 🎓 Műhely áttekintés: Gyakorlati tanulási élmény

> **⚠️ MŰHELY ÁLLAPOTA: Aktív fejlesztés**  
> A műhely anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működőképesek, de egyes haladó részek hiányosak. Aktívan dolgozunk a tartalom teljes lezárásán. [Haladás követése →](workshop/README.md)

### Interaktív műhely anyagok
**Átfogó gyakorlati tanulás böngészőalapú eszközökkel és vezetett gyakorlatokkal**

Műhelyünk anyagai egy strukturált, interaktív tanulási élményt kínálnak, amely kiegészíti a fent említett fejezet alapú tananyagot. A műhely mind önálló tanulásra, mind oktató által vezetett foglalkozásokra alkalmas.

#### 🛠️ Műhely jellemzők
- **Böngésző alapú felület**: Teljes MkDocs-alapú műhely kereséssel, másolással és témaválasztási lehetőségekkel
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet beállítás
- **Strukturált tanulási útvonal**: 8 modulból álló vezetett gyakorlatok (összesen 3-4 óra)
- **Fokozatos módszertan**: Bevezetés → Kiválasztás → Érvényesítés → Feltérképezés → Konfigurálás → Testreszabás → Leszerelés → Összefoglalás
- **Interaktív DevContainer környezet**: Előre konfigurált eszközökkel és függőségekkel

#### 📚 Műhely modulstrukturája
A műhely egy **8 modulból álló fokozatos módszertant** követ, amely a felfedezéstől a telepítés mesteri szintjéig vezet:

| Modul | Téma | Mit fogsz csinálni | Időtartam |
|--------|-------|----------------|----------|
| **0. Bevezetés** | Műhely áttekintése | Megérted a tanulási célokat, előfeltételeket és a műhely felépítését | 15 perc |
| **1. Kiválasztás** | Sablon felfedezés | Fedezd fel az AZD sablonokat és válaszd ki a megfelelő MI sablont a szcenáriódhoz | 20 perc |
| **2. Érvényesítés** | Telepítés és igazolás | Telepítsd a sablont `azd up`-pal, és ellenőrizd az infrastruktúra működését | 30 perc |
| **3. Feltérképezés** | Szerkezet megértése | Használd a GitHub Copilotot a sablon architektúra, Bicep fájlok és kód szervezet felfedezéséhez | 30 perc |
| **4. Konfigurálás** | Mélyedj el az azure.yaml-ban | Sajátítsd el az `azure.yaml` konfigurációt, életciklus horgonyokat és környezeti változókat | 30 perc |
| **5. Testreszabás** | Tedd sajátoddá | Engedélyezd az MI keresést, követést, értékelést, és testreszabhatod a szcenáriódhoz | 45 perc |
| **6. Leszerelés** | Takarítás | Biztonságosan törölj erőforrásokat `azd down --purge` paranccsal | 15 perc |
| **7. Összefoglalás** | Következő lépések | Tekintsd át az elért eredményeket, kulcsfogalmakat, és folytasd a tanulási utadat | 15 perc |

**Műhely menete:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 A műhely megkezdése
```bash
# 1. lehetőség: GitHub Codespaces (ajánlott)
# Kattintson a "Code" → "Create codespace on main" gombra a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesse a workshop/README.md fájlban található beállítási utasításokat
```

#### 🎯 A műhely tanulási eredményei
A műhely elvégzésével a résztvevők:
- **Termelési MI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Többügynökös architektúrák mesteri szintű elsajátítása**: Koordinált MI ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatok alkalmazása**: Hitelesítés és hozzáférés vezérlés beállítása
- **Skálázás optimalizálása**: Költséghatékony, teljesítményorientált telepítések tervezése
- **Telepítési hibák hibaelhárítása**: Gyakori problémák önálló megoldása

#### 📖 Műhely források
- **🎥 Interaktív útmutató**: [Műhely anyagok](workshop/README.md) - Böngészőalapú tanulási környezet
- **📋 Modulonkénti utasítások**:
  - [0. Bevezetés](workshop/docs/instructions/0-Introduction.md) - Műhely áttekintése és céljai
  - [1. Kiválasztás](workshop/docs/instructions/1-Select-AI-Template.md) - MI sablonok megkeresése és kiválasztása
  - [2. Érvényesítés](workshop/docs/instructions/2-Validate-AI-Template.md) - Sablonok telepítése és ellenőrzése
  - [3. Feltérképezés](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Sablon architektúra feltérképezése
  - [4. Konfigurálás](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml elsajátítása
  - [5. Testreszabás](workshop/docs/instructions/5-Customize-AI-Template.md) - Szcenáriód szerinti testreszabás
  - [6. Leszerelés](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Erőforrások takarítása
  - [7. Összefoglalás](workshop/docs/instructions/7-Wrap-up.md) - Áttekintés és további lépések
- **🛠️ MI műhely labor**: [MI műhely labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - MI fókuszú gyakorlatok
- **💡 Gyors indítás**: [Műhely beállítási útmutató](workshop/README.md#quick-start) - Környezet konfiguráció

**Tökéletes**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mélyebb betekintés: AZD képességek

Az alapokon túlmenően az AZD erőteljes funkciókat kínál termelési telepítésekhez:

- **Sablon alapú telepítések** - Gyakori alkalmazásminták előre elkészített sablonokkal
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Zökkenőmentes szolgáltatás telepítés, összeállítás és monitorozás
- **Fejlesztőbarát** - Optimalizálva a fejlesztők termelékenységére és élményére

### **AZD + Microsoft Foundry: Tökéletes MI telepítésekhez**

**Miért AZD az MI megoldásokhoz?** Az AZD kezeli az MI fejlesztők legfőbb kihívásait:

- **MI-kész sablonok** - Előre konfigurált sablonok Microsoft Foundry modellekhez, Azure MI szolgáltatásokhoz és ML feladatokhoz
- **Biztonságos MI telepítések** - Beépített biztonsági minták MI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Termelési MI minták** - Legjobb gyakorlatok méretezhető, költséghatékony MI alkalmazásokhoz
- **Végponttól végpontig MI munkafolyamatok** - Modellfejlesztéstől a termelési telepítésig megfelelő monitorozással
- **Költségoptimalizálás** - Okos erőforrás-elosztás és skálázási stratégiák MI feladatokhoz
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modell katalógussal és végpontokkal

---

## 🎯 Sablonok és példatár

### Kiemelt: Microsoft Foundry sablonok
**Kezdj itt, ha MI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különféle MI mintákat mutatnak be. Egyesek külső Azure példák, mások helyi megvalósítások.

| Sablon | Fejezet | Bonyolultság | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**Kezdj az MI csevegéssel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure MI modell lekérdezés API + Azure MI keresés + Azure Container Apps + Application Insights | Külső |
| [**Kezdj az MI ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Foundry ügynökök + AzureOpenAI + Azure MI keresés + Azure Container Apps + Application Insights| Külső |
| [**Azure keresés + OpenAI bemutató**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure MI keresés + App Service + Storage | Külső |
| [**OpenAI csevegőalkalmazás gyorsindító**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + MI keresés + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi Többügynökös Megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + MI keresés + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási szcenáriók
**Termelésre kész alkalmazás sablonok, tanulási fejezetekhez rendelve**

| Sablon | Tanulási fejezet | Bonyolultság | Fő tanulási pont |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alap MI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure MI kereséssel |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati MI összehangolás |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél és Készlet ügynökökkel |

### Példák a tanulási típus alapján

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a tárolóban) = Azonnal használatra kész  
> **Külső példák** (Azure példák) = Klónozandó kapcsolt tárolókból

#### Helyi példák (használatra kész)
- [**Kiskereskedelmi Többügynökös Megoldás**](examples/retail-scenario.md) - Teljes termelésre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készlet ügynökök)
  - Átfogó monitorozás és értékelés
  - Egy kattintásos telepítés ARM sablonon keresztül

#### Helyi példák - Konténer alkalmazások (2-5. fejezetek)
**Átfogó konténer telepítési példák ebben a tárolóban:**

- [**Konténeres Alkalmazás Példák**](examples/container-app/README.md) - Teljes útmutató konténeres telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API scale-to-zero funkcióval
  - [Mikroszolgáltatások Architektúrája](../../examples/container-app/microservices) - Termelésre kész többszolgáltatásos telepítés
  - Gyors kezdés, termelés és haladó telepítési minták
  - Monitorozás, biztonság és költségoptimalizálás útmutatás

#### Külső példák - Egyszerű alkalmazások (1-2. fejezet)
**Klónozd ezeket az Azure Samples adattárakat a kezdéshez:**
- [Egyszerű Webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alapvető telepítési minták
- [Statikus Webhely - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítés
- [Konténeres Alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Adatbázis Alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis kapcsolódási minták
- [Funkciók + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless adatfolyam

#### Külső példák - Haladó minták (4-8. fejezet)
- [Java Mikroszolgáltatások](https://github.com/Azure-Samples/java-microservices-aca-lab) - Többszolgáltatásos architektúrák
- [Konténer alkalmazás feladatok](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész ML minták

### Külső sablon gyűjtemények
- [**Hivatalos AZD Sablongaléria**](https://azure.github.io/awesome-azd/) - Gondosan válogatott hivatalos és közösségi sablonok gyűjteménye
- [**Azure Developer CLI Sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példa könyvtár**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási erőforrások és hivatkozások

### Gyors hivatkozások
- [**Parancs összefoglaló**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetenként rendszerezve
- [**Fogalomtár**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések tanulási fejezetenként rendszerezve
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó gyakorló feladatok

### Gyakorlati műhelyek
- [**AI Műhely Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tegye AI megoldásait AZD-vel telepíthetővé (2-3 óra)
- [**Interaktív műhely**](workshop/README.md) - 8 modulból álló vezetett gyakorlatok MkDocs és GitHub Codespaces használatával
  - Követi: Bevezetés → Kiválasztás → Érvényesítés → Szétszerelés → Konfiguráció → Testreszabás → Lebontás → Összegzés

### Külső tanulási források
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

### AI ügynök képességek a szerkesztődhöz
- [**Microsoft Azure Képességek a skills.sh-en**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt AI ügynök képesség Azure-hoz, Foundry-hoz, telepítéshez, diagnosztikához, költségoptimalizáláshoz és még sok máshoz. Telepítsd őket GitHub Copilotba, Cursorba, Claude Code-ba vagy bármelyik támogatott ügynökbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Gyors hibakeresési útmutató

**Gyakori problémák kezdőknek és gyors megoldások:**

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
<summary><strong>❌ "Nincs előfizetés" vagy "Előfizetés nincs beállítva"</strong></summary>

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

# Vagy használjon kisebb SKU-kat fejlesztéskor
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" középtájt megbukik</strong></summary>

```bash
# 1. lehetőség: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# 2. lehetőség: Csak a infrastruktúra javítása
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
# Azonosítás újbóli végrehajtása az AZD-hez
azd auth logout
azd auth login

# Opcionális: frissítse az Azure CLI-t is, ha az az parancsokat futtatja
az logout
az login

# Azonosítás ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Erőforrás már létezik" vagy névütközések</strong></summary>

```bash
# Az AZD egyedi neveket generál, de ha konfliktus van:
azd down --force --purge

# Akkor újra próbálkozik friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sablon telepítése túl sokáig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Alkalmazás adatbázissal: 10-15 perc
- AI alkalmazások: 15-25 perc (Az OpenAI lassú előkészítése)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha több mint 30 percig elakad, ellenőrizze az Azure Portált:
azd monitor --overview
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Hozzáférés megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkör szükséges
# Kérje meg az Azure rendszergazdáját, hogy adja meg:
# - Közreműködő (az erőforrásokhoz)
# - Felhasználói hozzáférés kezelő (a szerepkör hozzárendelésekhez)
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
# Keresés *_URL változókra
```
</details>

### 📚 Teljes hibakeresési erőforrások

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/chapter-07-troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Előrehaladás nyomon követése
Kövesd nyomon tanulási előrehaladásodat minden egyes fejezeten át:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-központú fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastructure as Code és telepítés ✅
- [ ] **5. fejezet**: Több-ügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előtelepítési érvényesítés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és debuggolás ✅
- [ ] **8. fejezet**: Termelési és vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet elvégzése után ellenőrizd tudásod az alábbiak szerint:
1. **Gyakorlati feladat**: Hajtsd végre a fejezet gyakorlati telepítését
2. **Tudásellenőrző kérdések**: Tekintsd át a fejezet GYIK szakaszát
3. **Közösségi beszélgetés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Lépj tovább a következő nehézségi szintre

### A tanfolyam elvégzésének előnyei
A fejezetek elvégzése után az alábbiakat kapod:
- **Termelési tapasztalat**: Valós AI alkalmazások telepítése Azure-ra
- **Szakmai képességek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás
- **Műszaki problémák**: [Hibabejelentések és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord Közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: Csatlakozz a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések a Microsoft Foundry Discord-ról

**Friss szavazási eredmények a #Azure csatornán:**
- **45%** fejlesztők AZD-t szeretnének használni AI munkaterhelésekhez
- **Legnagyobb kihívások**: Többszolgáltatásos telepítések, hitelesítő adatok kezelése, termelési készség  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Oszd meg AZD + AI tapasztalataidat és kapj segítséget
- Hozzáférj az új AI sablonok korai verzióihoz
- Hozzájárulj az AI telepítési legjobb gyakorlatokhoz
- Befolyásold a jövőbeli AI + AZD funkciófejlesztést

### Hozzájárulás a tanfolyamhoz
Szívesen fogadjuk a hozzájárulásokat! Kérjük, olvasd el a [Contributing Guide](CONTRIBUTING.md) útmutatót az alábbiakról:
- **Tartalmi fejlesztések**: A meglévő fejezetek és példák fejlesztése
- **Új példák**: Valódi világ szcenáriók és sablonok hozzáadása  
- **Fordítás**: Többnyelvű támogatás fenntartása
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi szabályok**: Az inkluzív közösségi irányelvek követése

---

## 📄 Tanfolyaminformációk

### Licenc
Ez a projekt az MIT License alapján licencelt - lásd a [LICENSE](../../LICENSE) fájlt a részletekért.

### Kapcsolódó Microsoft tanulási erőforrások

Csapatunk más átfogó tanfolyamokat is készít:

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
[![AI Ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI sorozat
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető tanulás
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
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

**Kezdők**: Kezdj a [1. fejezet: Alapok és gyors kezdés](#-chapter-1-foundation--quick-start)  
**AI fejlesztőknek**: Ugorj a [2. fejezet: AI-első fejlesztés](#-chapter-2-ai-first-development-recommended-for-ai-developers) részhez  
**Tapasztalt fejlesztőknek**: Kezdd a [3. fejezet: Konfiguráció és hitelesítés](#️-chapter-3-configuration--authentication)

**Következő lépések**: [Kezdd az 1. fejezettel - AZD alapok](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
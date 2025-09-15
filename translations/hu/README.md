<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:27:40+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek

![AZD-kezdőknek](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hu.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Kövesd az alábbi lépéseket, hogy elkezdhesd használni ezeket az erőforrásokat:
1. **Forkold a repót**: Kattints [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a repót**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Csatlakozz az Azure Discord közösségekhez, és találkozz szakértőkkel és fejlesztőkkel**](https://discord.com/invite/ByRwuEEgH4)

### Többnyelvű támogatás

#### GitHub Action által támogatott (Automatikus és mindig naprakész)

[Francia](../fr/README.md) | [Spanyol](../es/README.md) | [Német](../de/README.md) | [Orosz](../ru/README.md) | [Arab](../ar/README.md) | [Perzsa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Japán](../ja/README.md) | [Koreai](../ko/README.md) | [Hindi](../hi/README.md) | [Bengáli](../bn/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Portugál (Portugália)](../pt/README.md) | [Portugál (Brazília)](../br/README.md) | [Olasz](../it/README.md) | [Lengyel](../pl/README.md) | [Török](../tr/README.md) | [Görög](../el/README.md) | [Thai](../th/README.md) | [Svéd](../sv/README.md) | [Dán](../da/README.md) | [Norvég](../no/README.md) | [Finn](../fi/README.md) | [Holland](../nl/README.md) | [Héber](../he/README.md) | [Vietnámi](../vi/README.md) | [Indonéz](../id/README.md) | [Maláj](../ms/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Szuahéli](../sw/README.md) | [Magyar](./README.md) | [Cseh](../cs/README.md) | [Szlovák](../sk/README.md) | [Román](../ro/README.md) | [Bolgár](../bg/README.md) | [Szerb (Cirill)](../sr/README.md) | [Horvát](../hr/README.md) | [Szlovén](../sl/README.md) | [Ukrán](../uk/README.md) | [Burmai (Mianmar)](../my/README.md)

**Ha további fordításokat szeretnél, a támogatott nyelvek listája [itt található](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Bevezetés

Üdvözlünk az Azure Developer CLI (azd) átfogó útmutatójában! Ez a repó segít minden szinten lévő fejlesztőnek, legyen szó diákokról vagy profi fejlesztőkről, hogy megtanulják és elsajátítsák az Azure Developer CLI használatát hatékony felhőalapú telepítésekhez, **különös tekintettel az AI alkalmazások telepítésére az Azure AI Foundry segítségével**. Ez a strukturált tanulási erőforrás gyakorlati tapasztalatot nyújt az Azure felhőalapú telepítésekben, a gyakori problémák elhárításában, és a legjobb gyakorlatok alkalmazásában az AZD sablonok sikeres telepítéséhez.

### **Miért fontos ez az útmutató AI fejlesztők számára?**
Az Azure AI Foundry Discord közösségünk legutóbbi szavazása alapján **a fejlesztők 45%-a érdeklődik az AZD AI munkaterhelésekhez való használata iránt**, de kihívásokkal szembesülnek:
- Összetett, több szolgáltatást igénylő AI architektúrák
- AI telepítési legjobb gyakorlatok produkciós környezetben
- Azure AI szolgáltatások integrációja és konfigurációja
- Költségoptimalizálás AI munkaterhelésekhez
- AI-specifikus telepítési problémák elhárítása

## Tanulási célok

A repó feldolgozása során:
- Elsajátítod az Azure Developer CLI alapjait és kulcsfogalmait
- Megtanulod az Azure erőforrások telepítését és előkészítését Infrastructure as Code segítségével
- Fejleszted a hibaelhárítási készségeidet az AZD telepítési problémák megoldásában
- Megérted az előtelepítési validációt és kapacitástervezést
- Alkalmazod a biztonsági legjobb gyakorlatokat és költségoptimalizálási stratégiákat
- Magabiztosságot szerzel produkciós alkalmazások Azure-ba történő telepítésében

## Tanulási eredmények

A kurzus befejezése után képes leszel:
- Sikeresen telepíteni, konfigurálni és használni az Azure Developer CLI-t
- Alkalmazásokat létrehozni és telepíteni AZD sablonok segítségével
- Hibaelhárítani hitelesítési, infrastruktúra- és telepítési problémákat
- Elvégezni az előtelepítési ellenőrzéseket, beleértve a kapacitástervezést és SKU kiválasztást
- Alkalmazni a monitorozási, biztonsági és költségkezelési legjobb gyakorlatokat
- Integrálni AZD munkafolyamatokat CI/CD csővezetékekbe

## Tartalomjegyzék

- [Mi az Azure Developer CLI?](../..)
- [Gyors kezdés](../..)
- [Tanulási útvonal](../..)
  - [AI fejlesztőknek (Ajánlott kezdés itt!)](../..)
  - [Diákoknak és kezdőknek](../..)
  - [Fejlesztőknek](../..)
  - [DevOps mérnököknek](../..)
- [Dokumentáció](../..)
  - [Első lépések](../..)
  - [Telepítés és előkészítés](../..)
  - [Előtelepítési ellenőrzések](../..)
  - [AI és Azure AI Foundry](../..)
  - [Hibaelhárítás](../..)
- [Példák és sablonok](../..)
  - [Kiemelt: Azure AI Foundry sablonok](../..)
  - [Kiemelt: Azure AI Foundry E2E forgatókönyvek](../..)
  - [További AZD sablonok](../..)
  - [Gyakorlati laborok és workshopok](../..)
- [Erőforrások](../..)
- [Hozzájárulás](../..)
- [Támogatás](../..)
- [Közösség](../..)

## Mi az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését. Az alábbiakat kínálja:

- **Sablon alapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazási mintákhoz
- **Infrastructure as Code** - Azure erőforrások kezelése Bicep vagy Terraform segítségével
- **Integrált munkafolyamatok** - Zökkenőmentes előkészítés, telepítés és monitorozás
- **Fejlesztőbarát** - Optimalizált a fejlesztői produktivitás és élmény érdekében

### **AZD + Azure AI Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** Az AZD megoldja az AI fejlesztők legnagyobb kihívásait:

- **AI-kész sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML munkaterhelésekhez
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz
- **Produkciós AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazások telepítéséhez
- **End-to-End AI munkafolyamatok** - Modellfejlesztéstől a produkciós telepítésig megfelelő monitorozással
- **Költségoptimalizálás** - Okos erőforrás-allokáció és skálázási stratégiák AI munkaterhelésekhez
- **Azure AI Foundry integráció** - Zökkenőmentes kapcsolat az AI Foundry modell katalógushoz és végpontokhoz

## Gyors kezdés

### Előfeltételek
- Azure előfizetés
- Telepített Azure CLI
- Git (sablonok klónozásához)

### Telepítés
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Első telepítésed
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Első AI telepítésed
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Tanulási útvonal

### AI fejlesztőknek (Ajánlott kezdés itt!)
1. **Gyors kezdés**: Próbáld ki az [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sablont
2. **Alapok elsajátítása**: [AZD Alapok](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Gyakorlati tapasztalat**: Teljesítsd az [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) feladatot
4. **Produkciós készség**: Nézd át a [Produkciós AI legjobb gyakorlatok](docs/ai-foundry/production-ai-practices.md) dokumentumot
5. **Haladó szint**: Telepítsd a [contoso-chat](https://github.com/Azure-Samples/contoso-chat) vállalati sablont

### Diákoknak és kezdőknek
1. Kezdd az [AZD Alapok](docs/getting-started/azd-basics.md) dokumentummal
2. Kövesd a [Telepítési útmutatót](docs/getting-started/installation.md)
3. Teljesítsd az [Első projekted](docs/getting-started/first-project.md)
4. Gyakorolj az [Egyszerű webalkalmazás példával](../../examples/simple-web-app)

### Fejlesztőknek
1. Nézd át a [Konfigurációs útmutatót](docs/getting-started/configuration.md)
2. Tanulmányozd a [Telepítési útmutatót](docs/deployment/deployment-guide.md)
3. Dolgozz a [Adatbázis alkalmazás példán](../../examples/database-app)
4. Fedezd fel a [Konténer alkalmazás példát](../../examples/container-app)

### DevOps mérnököknek
1. Sajátítsd el az [Erőforrások előkészítését](docs/deployment/provisioning.md)
2. Valósítsd meg az [Előzetes ellenőrzéseket](docs/pre-deployment/preflight-checks.md)
3. Gyakorolj a [Kapacitástervezéssel](docs/pre-deployment/capacity-planning.md)
4. Haladó [Mikroszolgáltatások példa](../../examples/microservices)

## Dokumentáció

### Első lépések
- [**AZD Alapok**](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- [**Telepítés és beállítás**](docs/getting-started/installation.md) - Platform-specifikus telepítési útmutatók
- [**Konfiguráció**](docs/getting-started/configuration.md) - Környezet beállítása és hitelesítés
- [**Első projekted**](docs/getting-started/first-project.md) - Lépésről lépésre bemutató

### Telepítés és előkészítés
- [**Telepítési útmutató**](docs/deployment/deployment-guide.md) - Teljes telepítési munkafolyamatok
- [**Erőforrások előkészítése**](docs/deployment/provisioning.md) - Azure erőforrások kezelése

### Előtelepítési ellenőrzések
- [**Kapacitástervezés**](docs/pre-deployment/capacity-planning.md) - Azure erőforrás kapacitásának validálása
- [**SKU kiválasztás**](docs/pre-deployment/sku-selection.md) - Megfelelő Azure SKU kiválasztása
- [**Előzetes ellenőrzések**](docs/pre-deployment/preflight-checks.md) - Automatikus validációs szkriptek

### AI és Azure AI Foundry
- [**Azure AI Foundry Integráció**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD csatlakoztatása Azure AI Foundry szolgáltatásokhoz
- [**AI Modell Telepítési Minták**](docs/ai-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése AZD-vel
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Gyakorlati labor: AI megoldások AZD-re való felkészítése
- [**Produkciós AI legjobb gyakorlatok**](docs/ai-foundry/production-ai-practices.md) - Biztonság, skálázás és monitorozás AI munkaterhelésekhez

### Hibaelhárítás
- [**Gyakori problémák**](docs/troubleshooting/common-issues.md) - Gyakran előforduló problémák és megoldások
- [**Hibakeresési útmutató**](docs/troubleshooting/debugging.md) - Lépésről lépésre bemutatott hibakeresési stratégiák
- [**AI-specifikus hibakeresés**](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások és modelltelepítési problémák

## Példák és sablonok

### [Kiemelt: Azure AI Foundry sablonok](https://ai.azure.com/resource/build/templates)
**Kezdd itt, ha AI alkalmazásokat telepítesz!**

| Sablon | Leírás | Komplexitás | Szolgáltatások |
|----------|-------------|------------|----------|
| [**AI chat indítása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hozz létre és telepíts egy alapvető chat alkalmazást, amely integrálva van az adataiddal és telemetriai betekintésekkel az Azure Container Apps segítségével |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ügynökök indítása**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hozz létre és telepíts egy alapvető ügynök alkalmazást műveletekkel és telemetriai betekintésekkel az Azure Container Apps segítségével. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Több ügynökös munkafolyamat automatizálás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Javítsd a feladatok tervezését és automatizálását AI ügynökök csoportjának összehangolásával és kezelésével.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Dokumentumok generálása az adataidból**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Gyorsítsd fel dokumentumok, például szerződések, számlák és befektetési javaslatok generálását az adataidból releváns információk keresésével és összegzésével. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Ügyfélmegbeszélések javítása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Modernizáld a régi kódokat modern nyelvekre egy ügynökcsapat segítségével. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kód modernizálása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hozz létre és telepíts egy alapvető chat alkalmazást, amely integrálva van az adataiddal és telemetriai betekintésekkel az Azure Container Apps segítségével |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Beszélgetési ügynök létrehozása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Használj fejlett beszélgetési megértést chatbotok és ügynökök létrehozásához és fejlesztéséhez determinisztikus és ember által irányítható munkafolyamatokkal. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Betekintések feltárása beszélgetési adatokból**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Javítsd az ügyfélszolgálati hatékonyságot nagy mennyiségű hang- és szövegalapú adathalmazokból származó betekintések feltárásával fejlett tartalommegértési képességek segítségével. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Többmódú tartalomfeldolgozás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Gyorsan és pontosan dolgozz fel igényeket, számlákat, szerződéseket és más dokumentumokat az információk kinyerésével strukturálatlan tartalomból és strukturált formátumba való átalakításával. Ez a sablon támogatja a szöveget, képeket, táblázatokat és grafikonokat. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Kiemelt: Azure AI Foundry E2E Szenáriók
**Kezdd itt, ha AI alkalmazásokat telepítesz!**

| Sablon | Leírás | Komplexitás | Szolgáltatások |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Egyszerű chat felület Azure OpenAI-val | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-alapú chat alkalmazás Azure OpenAI-val | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Dokumentumelemzés AI szolgáltatásokkal | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI ügynök keretrendszer funkcióhívásokkal | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Vállalati chat AI összehangolással | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### További AZD sablonok
- [**Példák könyvtára**](examples/README.md) - Gyakorlati példák, sablonok és valós forgatókönyvek
- [**Azure-Samples AZD sablonok**](https://github.com/Azure-Samples/azd-templates) - Hivatalos Microsoft mintasablonok  
- [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) - Közösség által készített sablonok

### Gyakorlati laborok és workshopok
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **ÚJ**: Tedd AI megoldásaidat AZD-telepíthetővé
- [**AZD Kezdőknek Workshop**](workshop/README.md) - Fókuszban az AI ügynökök AZD sablon telepítése

## Erőforrások

### Gyors referenciák
- [**Parancsok segédlete**](resources/cheat-sheet.md) - Alapvető azd parancsok
- [**Szószedet**](resources/glossary.md) - Azure és azd terminológia
- [**GYIK**](resources/faq.md) - Gyakran ismételt kérdések
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó tanulási célok és gyakorlati feladatok

### Külső erőforrások
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

## Hozzájárulás

Szívesen fogadjuk a hozzájárulásokat! Kérjük, olvasd el a [Hozzájárulási útmutatót](CONTRIBUTING.md) a részletekért:
- Hogyan nyújts be hibajelentéseket és funkciókéréseket
- Kódhozzájárulási irányelvek
- Dokumentáció fejlesztése
- Közösségi normák

## Támogatás

- **Hibák**: [Hibák jelentése és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Beszélgetések**: [Microsoft Azure Discord közösségi kérdések és beszélgetések](https://discord.gg/microsoft-azure)
- **AI-specifikus támogatás**: Csatlakozz az [#Azure csatornához](https://discord.gg/microsoft-azure) AZD + AI Foundry beszélgetésekhez
- **Email**: Privát megkeresésekhez
- **Microsoft Learn**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések az Azure AI Foundry Discordból

**Szavazási eredmények az #Azure csatornáról:**
- **45%** fejlesztő szeretné AZD-t használni AI munkaterhelésekhez
- **Fő kihívások**: Több szolgáltatás telepítése, hitelesítés kezelése, éles környezetre való felkészülés
- **Leginkább kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozz a közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataidat és segítséget kapj
- Korai hozzáférést kapj új AI sablonokhoz
- Hozzájárulj AI telepítési legjobb gyakorlatokhoz
- Hatással legyél a jövőbeli AI + AZD funkciók fejlesztésére

## Licenc

Ez a projekt az MIT Licenc alatt van licencelve - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

## Egyéb kurzusok

Csapatunk más kurzusokat is készít! Nézd meg:

- [**ÚJ** Model Context Protocol (MCP) Kezdőknek](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Ügynökök Kezdőknek](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatív AI Kezdőknek .NET használatával](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatív AI Kezdőknek](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatív AI Kezdőknek Java használatával](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML Kezdőknek](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Adattudomány Kezdőknek](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Kezdőknek](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kiberbiztonság Kezdőknek](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webfejlesztés Kezdőknek](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT Kezdőknek](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Fejlesztés Kezdőknek](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot Elsajátítása AI Páros Programozáshoz](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot Elsajátítása C#/.NET Fejlesztőknek](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Válaszd ki saját Copilot kalandodat](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigáció**
- **Következő lecke**: [AZD Alapok](docs/getting-started/azd-basics.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
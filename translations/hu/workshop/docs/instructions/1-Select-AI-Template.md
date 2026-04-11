# 1. Válassz egy sablont

!!! tip "A MODUL VÉGÉRE KÉPES LESZEL"

    - [ ] Leírni, mik azok az AZD sablonok
    - [ ] Felfedezni és használni AZD sablonokat AI-hoz
    - [ ] Elindulni az AI Ügynökök sablonnal
    - [ ] **Gyakorlat 1:** AZD Gyorsindítás Codespaces-ben vagy fejlesztői konténerben

---

## 1. Az építész hasonlat

Egy modern, vállalati szintre kész AI alkalmazás _nulláról_ történő felépítése kimerítő lehet. Ez olyan, mintha saját magad építenéd az új otthonodat, tégláról téglára. Igen, meg lehet csinálni! De nem a leghatékonyabb módja a kívánt végeredmény elérésének!

Ehelyett gyakran létező _tervrajzokkal_ kezdünk, és egy építésszel dolgozunk együtt, hogy személyre szabjuk azokat igényeink szerint. És ez pontosan az az megközelítés, amit az intelligens alkalmazások felépítésénél ajánlott követni. Először találj egy jó tervezési architektúrát, ami illeszkedik a problémádhoz. Aztán működj együtt egy megoldás-építésszel, hogy azt testre szabja és fejlessze a te konkrét esetedre.

De hol találjuk meg ezeket a tervrajzokat? És hogyan találunk egy építészt, aki hajlandó megtanítani, hogyan testre szabjuk és telepítsük ezeket a tervrajzokat magunknak? Ebben a műhelyben választ adunk ezekre a kérdésekre, három technológia bemutatásával:

1. [Azure Developer CLI](https://aka.ms/azd) – egy nyílt forráskódú eszköz, amely gyorsítja a fejlesztő útját a helyi fejlesztésből (build) a felhőbe történő telepítésig (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) – szabványosított nyílt forráskódú tárhelyek, amelyek mintakódot, infrastruktúra- és konfigurációs fájlokat tartalmaznak AI megoldás architektúra telepítéséhez.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) – egy kódolási ügynök, amely az Azure ismereteken alapul, és segít eligazodni a kódbázisban és változtatásokat végrehajtani – természetes nyelv használatával.

Ezekkel az eszközökkel a kezünkben most már _felfedezhetjük_ a megfelelő sablont, _telepíthetjük_, hogy validáljuk annak működését, majd _testre szabhatjuk_ saját szcenáriókra szabva. Merüljünk el és tanuljuk meg, hogyan működnek!

---

## 2. Azure Developer CLI

Az [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (vagy `azd`) egy nyílt forráskódú parancssori eszköz, amely felgyorsítja a kódból felhőbe vezető utadat egy fejlesztőbarát parancskészlettel, amely konzisztensen működik az IDE-d (fejlesztés) és a CI/CD (devops) környezetekben.

Az `azd` segítségével a telepítési út egyszerű lehet, mint:

- `azd init` – Egy új AI projekt inicializálása egy meglévő AZD sablonból.
- `azd up` – Infrastrukturát biztosít és telepíti az alkalmazásodat egy lépésben.
- `azd monitor` – Valós idejű monitorozást és diagnosztikát biztosít a telepített alkalmazáshoz.
- `azd pipeline config` – CI/CD pipeline-okat állít be a telepítés automatizálásához Azure-ba.

**🎯 | GYAKORLAT**: <br/> Fedezd fel az `azd` parancssori eszközt a jelenlegi műhelyed környezetében most. Ez lehet GitHub Codespaces, fejlesztői konténer vagy egy helyi klón a szükséges előfeltételekkel telepítve. Kezdd azzal, hogy beírod ezt a parancsot, hogy lásd, mit tud az eszköz:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/hu/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Az AZD sablon

Az `azd` használatához tudnia kell, milyen infrastruktúrát biztosítson, milyen konfigurációs beállításokat alkalmazzon, és melyik alkalmazást telepítse. Ekkor jönnek képbe az [AZD sablonok](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Az AZD sablonok nyílt forráskódú tárhelyek, amelyek mintakódot kombinálnak az infrastruktúra- és konfigurációs fájlokkal, melyek szükségesek a megoldás architektúra telepítéséhez.
_Infrastruktúra-kód formájában_ (IaC) dolgoznak, így lehetővé teszik, hogy a sablon erőforrás definíciók és konfigurációs beállítások verziókezelve legyenek (akárcsak az alkalmazás forráskódja) – ezáltal újrahasznosítható és konzisztens munkafolyamatokat teremtenek a projekt felhasználói számára.

Ha saját szcenáriódhoz hozol létre vagy használsz újra egy AZD sablont, fontold meg ezeket a kérdéseket:

1. Mit építesz? → Van olyan sablon, amely tartalmaz induló kódot erre a szcenárióra?
1. Hogyan van az alkalmazásod megtervezve? → Van olyan sablon, amely tartalmazza a szükséges erőforrásokat?
1. Hogyan történik a telepítés? → Gondolj az `azd deploy` elő- és utó-feldolgozási horgokra!
1. Hogyan tudod tovább optimalizálni? → Gondolj beépített monitorozásra és automatizált pipeline-okra!

**🎯 | GYAKORLAT**: <br/> 
Látogasd meg a [Awesome AZD](https://azure.github.io/awesome-azd/) galériát, és használd a szűrőket, hogy felfedezd a több mint 250 elérhető sablont. Próbáld meg megtalálni azt, amelyik a _te_ szcenáriód igényeinek megfelel.

![Code](../../../../../translated_images/hu/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI Alkalmazássablonok

AI-alapú alkalmazásokhoz a Microsoft speciális sablonokat kínál, melyek tartalmazzák a **Microsoft Foundry** és **Foundry Agents** elemeit. Ezek a sablonok felgyorsítják az intelligens, gyártásra kész alkalmazások fejlesztését.

### Microsoft Foundry és Foundry Agents sablonok

Válassz egy sablont az alábbiak közül a telepítéshez. Mindegyik sablon elérhető a [Awesome AZD](https://azure.github.io/awesome-azd/) oldalon, és egyetlen parancssal inicializálható.

| Sablon | Leírás | Telepítő parancs |
|--------|---------|------------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Csevegőalkalmazás Retrieval Augmented Generationnel, Microsoft Foundry-val | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | AI ügynökök építése Foundry Agents használatával autonóm feladatvégrehajtáshoz | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Több Foundry Agent koordinálása komplex munkafolyamatokhoz | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Dokumentumok kinyerése és elemzése Microsoft Foundry modellekkel | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Intelligens chatbotok építése Microsoft Foundry integrációval | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Képgenerálás DALL-E segítségével Microsoft Foundry-n keresztül | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI ügynökök Semantic Kernel és Foundry Agents használatával | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Több ügynökös rendszerek AutoGen keretrendszerrel | `azd init -t azure-samples/autogen-multi-agent` |

### Gyors indítás

1. **Böngészd a sablonokat**: Látogasd meg a [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) oldalt, és szűrj `AI`, `Agents`, vagy `Microsoft Foundry` szerint
2. **Válaszd ki a sablont**: Olyat válassz, amely megfelel az esetednek
3. **Inicializáld**: Futtasd az `azd init` parancsot a választott sablonra
4. **Telepítsd**: Futtasd az `azd up` parancsot az erőforrások biztosításához és telepítéshez

**🎯 | GYAKORLAT**: <br/>
Válassz egyet a fenti sablonok közül a szcenáriód alapján:

- **Chatbotot építesz?** → Kezdd az **AI Chat with RAG** vagy **Conversational AI Bot** sablonnal
- **Autonóm ügynökökre van szükséged?** → Próbáld ki a **Foundry Agent Service Starter** vagy **Multi-Agent Orchestration** sablont
- **Dokumentumokat dolgozol fel?** → Használd az **AI Document Intelligence** sablont
- **AI-kódsegítségre vágysz?** → Fedezd fel a **Semantic Kernel Agent** vagy **AutoGen Multi-Agent** sablonokat

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Fedezz fel több sablont"
    Az [Awesome AZD Galéria](https://azure.github.io/awesome-azd/) több mint 250 sablont tartalmaz. Használd a szűrőket, hogy megtaláld a nyelv-, keretrendszer- és Azure szolgáltatások szerint a te igényeidnek megfelelő sablonokat.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvű változata tekintendő hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
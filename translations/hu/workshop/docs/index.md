# AZD az AI fejlesztők számára workshop

> Érvényesítve az `azd 1.25.6` verzióval 2026 júniusában.

> [!IMPORTANT]  
> **Ez a workshop egy workshop útmutatóval van felszerelve, amelyet megtekinthet a helyi böngészőjében. A kezdéshez nyissa meg a repót a GitHub Codespaces-ben, egy fejlesztői konténerben vagy egy helyi klónban MkDocs telepítéssel—majd várjon, amíg meg nem jelenik egy aktív VS Code terminál, és gépelje be:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Ekkor egy felugró ablaknak kell megjelennie, amely felajánlja a preview oldal megnyitását a böngészőben.**

Üdvözöljük az Azure Developer CLI (AZD) gyakorlati workshopján, amelynek fókuszában az AI alkalmazás telepítése áll. Ez a workshop segít abban, hogy alkalmazott módon megértse az AZD sablonokat 3 lépésben:

1. **Felfedezés** - megtalálni az Önnek megfelelő sablont.
1. **Telepítés** - telepíteni és ellenőrizni, hogy működik
1. **Testreszabás** - módosítani és iterálni, hogy az Öné legyen!

A workshop során megismerkedik továbbá alapvető fejlesztői eszközökkel és munkafolyamatokkal, hogy segítsen optimalizálni a teljes fejlesztési folyamatát.

| | | 
|:---|:---|
| **📚 Tanfolyam főoldal**| [AZD kezdőknek](../README.md)|
| **📖 Dokumentáció** | [AI sablonokkal való kezdés](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI sablonok** | [Microsoft Foundry sablonok](https://ai.azure.com/templates) |
|**🚀 Következő lépések** | [Vegye fel a kihívást](#workshop-challenge) |
| | |

## Workshop áttekintés

**Időtartam:** 3-4 óra  
**Szint:** Kezdőtől középhaladóig  
**Előfeltételek:** Alapismeretek az Azure-ról, AI koncepciókról, VS Code-ról és parancssori eszközökről.

Ez egy gyakorlati workshop, ahol a tanulás cselekvés által történik. A gyakorlatok elvégzése után javasoljuk az AZD kezdőknek tananyagot átnézni, hogy tovább mélyítse tudását a biztonság és a termelékenység legjobb gyakorlatairól.

| Idő| Modul  | Célkitűzés |
|:---|:---|:---|
| 15 perc | Bevezetés | Alapozás, célok megértése |
| 30 perc | AI sablon kiválasztása | Lehetőségek felfedezése és kezdő sablon választása | 
| 30 perc | AI sablon érvényesítése | Alapértelmezett megoldás telepítése az Azure-ba |
| 30 perc | AI sablon bontása | Felépítés és konfiguráció felfedezése |
| 30 perc | AI sablon konfigurálása | Funkciók aktiválása és kipróbálása |
| 30 perc | AI sablon testreszabása | Sablon igazítása az igényeihez |
| 30 perc | Infrastruktúra lebontása | Erőforrások tisztítása és felszabadítása |
| 15 perc | Összefoglalás és következő lépések | Tanulási források, workshop kihívás |
| | |

## Amit megtanul

Gondoljon az AZD sablonra úgy, mint egy tanulási homokozóra, ahol felfedezheti a Microsoft Foundry end-to-end fejlesztési lehetőségeit és eszközeit. A workshop végére intuitív érzése lesz a különböző eszközökhöz és fogalmakhoz ebben a kontextusban.

| Fogalom  | Célkitűzés |
|:---|:---|
| **Azure Developer CLI** | Az eszköz parancsainak és munkafolyamatainak megértése|
| **AZD sablonok**| Projektstruktúra és konfiguráció megértése|
| **Azure AI Agent**| Microsoft Foundry projekt előkészítése és telepítése  |
| **Azure AI Search**| Kontextus menedzsment engedélyezése agentekkel |
| **Megfigyelhetőség**| Tracing, monitorozás és értékelések felfedezése |
| **Red Teaming**| Ellenféltesztelés és ellensúlyozások felfedezése |
| | |

## Workshop modulok

Készen áll? Navigáljon a workshop modulok között:

- [1. modul: AI sablon kiválasztása](instructions/1-Select-AI-Template.md)
- [2. modul: AI sablon érvényesítése](instructions/2-Validate-AI-Template.md) 
- [3. modul: AI sablon bontása](instructions/3-Deconstruct-AI-Template.md)
- [4. modul: AI sablon konfigurálása](instructions/4-Configure-AI-Template.md)
- [5. modul: AI sablon testreszabása](instructions/5-Customize-AI-Template.md)
- [6. modul: Infrastruktúra lebontása](instructions/6-Teardown-Infrastructure.md)
- [7. modul: Összefoglalás és következő lépések](instructions/7-Wrap-up.md)

## Visszajelzés?

Hozzon létre egy issue-t ezen a repón (címkézze `Workshop`-kal), vagy csatlakozzon hozzánk a [Discordon](https://aka.ms/foundry/discord), és írjon a `#get-help` csatornára.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
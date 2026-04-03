# AZD AI Fejlesztőknek Workshop

> Ellenőrizve az `azd 1.23.12` verzióval 2026 márciusában.

> [!IMPORTANT]  
> **Ez a workshop egy útmutatóval van ellátva, amit megtekinthetsz a helyi böngésződben. A kezdéshez nyisd meg a repót GitHub Codespaces-ben, egy fejlesztői konténerben vagy egy helyi klónban MkDocs telepítéssel — majd várj, amíg megjelenik egy aktív VS Code terminál, és gépeld be:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Meg kell jelennie egy felugró párbeszédablaknak, amely felajánlja az előnézeti oldal megnyitását a böngészőben.**

Üdvözlünk a gyakorlati workshopon, ahol az Azure Developer CLI (AZD) használatát tanulhatod mesterséges intelligencia alkalmazások telepítésére fókuszálva. Ez a workshop segít gyakorlatiasan megérteni az AZD sablonokat 3 lépésben:

1. **Felfedezés** – találd meg a számodra megfelelő sablont.
1. **Telepítés** – telepítsd és ellenőrizd, hogy működik-e
1. **Testreszabás** – módosítsd és alakítsd a sajátoddá!

A workshop során megismerkedsz a legfontosabb fejlesztői eszközökkel és munkafolyamatokkal is, hogy segítsd az átfogó fejlesztési utadat.

| | | 
|:---|:---|
| **📚 Tanfolyam kezdőlap**| [AZD Kezdőknek](../README.md)|
| **📖 Dokumentáció** | [Kezdés AI sablonokkal](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Sablonok** | [Microsoft Foundry Sablonok](https://ai.azure.com/templates) |
|**🚀 Következő lépések** | [Vegyél részt a kihívásban](#workshop-challenge) |
| | |

## Workshop áttekintés

**Időtartam:** 3-4 óra  
**Szint:** Kezdő középhaladó  
**Előfeltételek:** Azure, alap AI fogalmak, VS Code és parancssoros eszközök ismerete.

Ez egy gyakorlati workshop, ahol a tanulás gyakorlással történik. A gyakorlatok befejezése után javasoljuk, hogy tekintsd át az AZD Kezdőknek tananyagot, hogy folytathasd a tanulást a Biztonság és Hatékonyság legjobb gyakorlatai témakörben.

| Idő | Modul  | Célkitűzés |
|:---|:---|:---|
| 15 perc | Bevezetés | A témakör ismertetése, célok megértése |
| 30 perc | AI Sablon kiválasztása | Lehetőségek felfedezése és induló választás | 
| 30 perc | AI Sablon Validálása | Alapértelmezett megoldás telepítése Azure-ra |
| 30 perc | AI Sablon felbontása | Szerkezet és konfiguráció feltérképezése |
| 30 perc | AI Sablon konfigurálása | Elérhető funkciók aktiválása és kipróbálása |
| 30 perc | AI Sablon testreszabása | A sablon személyre szabása |
| 30 perc | Infrastruktúra bontása | Erőforrások törlése és felszabadítása |
| 15 perc | Összefoglalás és következő lépések | Tanulási anyagok, workshop kihívás |
| | |

## Amit megtanulsz

Tekints az AZD sablonra úgy, mint egy tanulási játszótérre, ahol bepillantást nyerhetsz a Microsoft Foundry end-to-end fejlesztéshez használható eszközök és képességek különböző területeibe. A workshop végére intuitív érzéked lesz a kontextus különböző eszközeihez és fogalmaihoz.

| Fogalom  | Cél |
|:---|:---|
| **Azure Developer CLI** | Az eszközparancsok és munkafolyamatok megértése |
| **AZD Sablonok**| Projektstruktúra és konfiguráció megértése |
| **Azure AI Ügynök**| Microsoft Foundry projekt létrehozása és telepítése |
| **Azure AI Keresés**| Kontextus menedzsment ügynökökkel |
| **Megfigyelhetőség**| Trace-elés, monitorozás és értékelések |
| **Red Teaming**| Ellenséges tesztelés és védekezés |
| | |

## Workshop modulok

Készen állsz a kezdésre? Navigálj a workshop moduljai között:

- [1. Modul: AI Sablon kiválasztása](instructions/1-Select-AI-Template.md)
- [2. Modul: AI Sablon validálása](instructions/2-Validate-AI-Template.md) 
- [3. Modul: AI Sablon felbontása](instructions/3-Deconstruct-AI-Template.md)
- [4. Modul: AI Sablon konfigurálása](instructions/4-Configure-AI-Template.md)
- [5. Modul: AI Sablon testreszabása](instructions/5-Customize-AI-Template.md)
- [6. Modul: Infrastruktúra bontása](instructions/6-Teardown-Infrastructure.md)
- [7. Modul: Összefoglalás és következő lépések](instructions/7-Wrap-up.md)

## Van visszajelzésed?

Hibajegyet küldhetsz erre a repóra (`Workshop` címkével), vagy csatlakozz hozzánk a [Discordon](https://aka.ms/foundry/discord), és írhatsz a `#get-help` csatornára.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti, anyanyelvi dokumentum tekintendő hiteles forrásnak. Fontos információk esetén szakmai, emberi fordítást javasolunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
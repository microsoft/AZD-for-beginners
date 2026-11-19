# AZD AI Fejlesztőknek Műhely

> Forrásútmutató átnézve az AZD 1.37.2 verzió alapján 2026. november 4-én. A képernyőképek szemléltető jellegűek; a szolgáltatás elérhetősége, portálcímkék és sablon alapbeállítások változhatnak.

> [!IMPORTANT]  
> **Ezt a műhelyt egy olyan műhelyútmutató támogatja, amelyet a helyi böngésződben megtekinthetsz. A kezdéshez nyisd meg a tárolót GitHub Codespaces-ben, egy fejlesztői konténerben vagy egy helyi klónban, amelyen telepítve van a MkDocs—ezután várd meg, amíg aktív VS Code terminált látsz, majd írd be:**  
> A tanfolyam tároló gyökeréből telepítsd az `requirements-dev.txt`, majd futtasd az `python -m mkdocs serve --config-file workshop/mkdocs.yml` a előtérben.
> **Meg kell jelennie egy felugró párbeszédablaknak, amelyben megnyithatod az előnézeti oldalt a böngészőben.**

Üdvözlünk az Azure Developer CLI (AZD) megtanulására fókuszáló AI alkalmazás telepítési gyakorlati műhelyben. Ez a műhely három lépésben segít megszerezni az AZD sablonok gyakorlati ismeretét:

1. **Felfedezés** - keresd meg a számodra legmegfelelőbb sablont.
1. **Telepítés** - telepítsd és ellenőrizd, hogy működik
1. **Testreszabás** - módosítsd és finomítsd, hogy a sajátoddá váljon!

A műhely során megismerkedsz az alapvető fejlesztői eszközökkel és munkafolyamatokkal is, hogy segítsenek egyszerűbbé tenni az end-to-end fejlesztési folyamatodat.

| | | 
|:---|:---|
| **📚 Tanfolyam Kezdőlap**| [AZD Kezdőknek](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentáció** | [Ismerkedj meg az AI sablonokkal](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Sablonok** | [Microsoft Foundry Sablonok](https://ai.azure.com/templates) |
|**🚀 Következő lépések** | [Vállald a kihívást](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Műhely áttekintése

**Időtartam:** 3-4 óra  
**Szint:** Kezdőtől középhaladóig  
**Előfeltételek:** Azure, AI fogalmak, VS Code & parancssori eszközök ismerete.

Ez egy gyakorlati műhely, ahol tanulás közben csinálod a feladatokat. Amint befejezted a gyakorlatokat, javasoljuk, hogy nézd át az AZD Kezdőknek tananyagot, hogy folytasd tanulmányaidat a Biztonság és Termelékenység legjobb gyakorlataival.

| Idő| Modul  | Célkitűzés |
|:---|:---|:---|
| 15 perc | Bevezetés | Alapok lefektetése, célok megértése |
| 30 perc | AI Sablon kiválasztása | Lehetőségek feltérképezése és induló kiválasztása | 
| 30 perc | AI Sablon ellenőrzése | Alapsablon telepítése Azure-ba |
| 30 perc | AI Sablon lebontása | Szerkezet és konfiguráció feltárása |
| 30 perc | AI Sablon konfigurálása | Elérhető funkciók aktiválása és kipróbálása |
| 30 perc | AI Sablon testreszabása | A sablon igényekhez igazítása |
| 30 perc | Infrastruktúra bontása | Takarítás és erőforrások felszabadítása |
| 15 perc | Összefoglaló & Következő lépések | Tanulási források, műhely kihívás |
| | |

## Amit megtanulsz

Gondolj az AZD sablonra úgy, mint egy tanulási homokozóra, ahol megismerhetsz különféle képességeket és eszközöket az end-to-end fejlesztéshez a Microsoft Foundryn. A műhely végére intuitív érzéked lesz a különböző eszközök és fogalmak kapcsán ebben a környezetben.

| Fogalom  | Célkitűzés |
|:---|:---|
| **Azure Developer CLI** | Eszközparancsok és munkafolyamatok megértése|
| **AZD Sablonok**| Projekt struktúra és konfiguráció megértése|
| **Azure AI Ügynök**| Microsoft Foundry projekt előkészítése & telepítése  |
| **Azure AI Keresés**| Kontextus alapszintű kezelése ügynökökkel |
| **Megfigyelhetőség**| Tracing, monitorozás és kiértékelések felfedezése |
| **Red Teaming**| Ellenséges tesztelés és védekezések feltérképezése |
| | |

## Műhely modulok

Készen állsz? Navigálj a műhely moduljain keresztül:

- [1. Modul: AI Sablon kiválasztása](instructions/1-Select-AI-Template.md)
- [2. Modul: AI Sablon ellenőrzése](instructions/2-Validate-AI-Template.md) 
- [3. Modul: AI Sablon lebontása](instructions/3-Deconstruct-AI-Template.md)
- [4. Modul: AI Sablon konfigurálása](instructions/4-Configure-AI-Template.md)
- [5. Modul: AI Sablon testreszabása](instructions/5-Customize-AI-Template.md)
- [6. Modul: Infrastruktúra lebontása](instructions/6-Teardown-Infrastructure.md)
- [7. Modul: Összefoglalás & Következő lépések](instructions/7-Wrap-up.md)

## Van visszajelzésed?

Küldj egy hibajegyet ebben a tárolóban (címkézd `Workshop`), vagy csatlakozz hozzánk a [Discordon](https://aka.ms/foundry/discord), és posztolj az `#get-help` csatornára.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
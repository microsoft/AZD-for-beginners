<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:05:29+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hu"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop építés alatt 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Ez a workshop jelenleg aktív fejlesztés alatt áll.</strong><br>
      A tartalom hiányos lehet, vagy változhat. Nézz vissza hamarosan a frissítésekért!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Utolsó frissítés: 2025 október
      </span>
    </div>
  </div>
</div>

# AZD workshop AI fejlesztőknek

Üdvözlünk az Azure Developer CLI (AZD) használatát bemutató gyakorlati workshopon, amely az AI alkalmazások telepítésére fókuszál. Ez a workshop segít az AZD sablonok gyakorlati megértésében 3 lépésben:

1. **Felfedezés** - találd meg a számodra megfelelő sablont.
1. **Telepítés** - telepítsd és ellenőrizd, hogy működik.
1. **Testreszabás** - módosítsd és alakítsd a saját igényeid szerint!

A workshop során megismerkedsz alapvető fejlesztői eszközökkel és munkafolyamatokkal, amelyek segítenek az end-to-end fejlesztési folyamatok egyszerűsítésében.

<br/>

## Böngésző-alapú útmutató

A workshop leckéi Markdown formátumban érhetők el. Közvetlenül a GitHub-on böngészheted őket – vagy elindíthatsz egy böngésző-alapú előnézetet, ahogy az alábbi képernyőképen látható.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.hu.png)

Ehhez az opcióhoz forkolnod kell a repót a profilodra, majd elindítanod a GitHub Codespaces-t. Miután a VS Code terminál aktív, írd be ezt a parancsot:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Néhány másodperc múlva megjelenik egy felugró ablak. Válaszd az `Open in browser` opciót. Az útmutató most megnyílik egy új böngészőfülön. Az előnézet néhány előnye:

1. **Beépített keresés** - gyorsan megtalálhatod a kulcsszavakat vagy leckéket.
1. **Másolás ikon** - kódblokkok fölé húzva megjelenik ez az opció.
1. **Téma váltás** - válthatsz sötét és világos témák között.
1. **Segítség kérése** - kattints a Discord ikonra a láblécben, hogy csatlakozz!

<br/>

## Workshop áttekintés

**Időtartam:** 3-4 óra  
**Szint:** Kezdő-től középhaladóig  
**Előfeltételek:** Azure, AI koncepciók, VS Code és parancssori eszközök ismerete.

Ez egy gyakorlati workshop, ahol tanulás közben cselekszel. Miután befejezted a gyakorlatokat, javasoljuk, hogy tekintsd át az AZD kezdőknek szóló tananyagot, hogy folytathasd a tanulási utadat a biztonsági és produktivitási legjobb gyakorlatok irányába.

| Idő | Modul  | Cél |
|:---|:---|:---|
| 15 perc | [Bevezetés](docs/instructions/0-Introduction.md) | Alapok, célok megértése |
| 30 perc | [AI sablon kiválasztása](docs/instructions/1-Select-AI-Template.md) | Opciók felfedezése és kezdés | 
| 30 perc | [AI sablon validálása](docs/instructions/2-Validate-AI-Template.md) | Alapértelmezett megoldás telepítése Azure-ra |
| 30 perc | [AI sablon elemzése](docs/instructions/3-Deconstruct-AI-Template.md) | Struktúra és konfiguráció felfedezése |
| 30 perc | [AI sablon konfigurálása](docs/instructions/4-Configure-AI-Template.md) | Funkciók aktiválása és kipróbálása |
| 30 perc | [AI sablon testreszabása](docs/instructions/5-Customize-AI-Template.md) | Sablon testreszabása saját igények szerint |
| 30 perc | [Infrastruktúra lebontása](docs/instructions/6-Teardown-Infrastructure.md) | Tisztítás és erőforrások felszabadítása |
| 15 perc | [Összegzés és következő lépések](docs/instructions/7-Wrap-up.md) | Tanulási források, workshop kihívás |

<br/>

## Amit megtanulsz

Gondolj az AZD sablonra úgy, mint egy tanulási homokozóra, amely lehetőséget ad különböző képességek és eszközök felfedezésére az Azure AI Foundry end-to-end fejlesztési környezetében. A workshop végére intuitív érzéket szerzel az eszközök és koncepciók használatához ebben a kontextusban.

| Koncepció  | Cél |
|:---|:---|
| **Azure Developer CLI** | Eszközparancsok és munkafolyamatok megértése |
| **AZD sablonok**| Projektstruktúra és konfiguráció megértése |
| **Azure AI Agent**| Azure AI Foundry projekt létrehozása és telepítése |
| **Azure AI Search**| Kontextus mérnöki munka engedélyezése ügynökökkel |
| **Megfigyelhetőség**| Nyomkövetés, monitorozás és értékelés felfedezése |
| **Red Teaming**| Ellenséges tesztelés és enyhítési stratégiák felfedezése |

<br/>

## Workshop felépítése

A workshop célja, hogy végigvezessen a sablon felfedezésétől a telepítésen, elemzésen és testreszabáson át - az [AI ügynökök használatának kezdő lépései](https://github.com/Azure-Samples/get-started-with-ai-agents) hivatalos kezdő sablon alapján.

### [1. modul: AI sablon kiválasztása](docs/instructions/1-Select-AI-Template.md) (30 perc)

- Mik azok az AI sablonok?
- Hol találhatók AI sablonok?
- Hogyan kezdhetek el AI ügynököket építeni?
- **Labor**: Gyors kezdés GitHub Codespaces-szel

### [2. modul: AI sablon validálása](docs/instructions/2-Validate-AI-Template.md) (30 perc)

- Mi az AI sablon architektúrája?
- Mi az AZD fejlesztési munkafolyamat?
- Hogyan kaphatok segítséget az AZD fejlesztéshez?
- **Labor**: AI ügynök sablon telepítése és validálása

### [3. modul: AI sablon elemzése](docs/instructions/3-Deconstruct-AI-Template.md) (30 perc)

- Fedezd fel a környezetedet `.azure/` mappában.
- Fedezd fel az erőforrás beállításokat `infra/` mappában.
- Fedezd fel AZD konfigurációdat `azure.yaml` fájlokban.
- **Labor**: Környezeti változók módosítása és újratelepítés

### [4. modul: AI sablon konfigurálása](docs/instructions/4-Configure-AI-Template.md) (30 perc)
- Fedezd fel: Retrieval Augmented Generation
- Fedezd fel: Ügynök értékelés és Red Teaming
- Fedezd fel: Nyomkövetés és monitorozás
- **Labor**: AI ügynök + megfigyelhetőség felfedezése

### [5. modul: AI sablon testreszabása](docs/instructions/5-Customize-AI-Template.md) (30 perc)
- Határozd meg: PRD forgatókönyv követelményekkel
- Konfiguráld: Környezeti változók AZD-hez
- Valósítsd meg: Lifecycle Hooks további feladatokhoz
- **Labor**: Sablon testreszabása saját forgatókönyvhöz

### [6. modul: Infrastruktúra lebontása](docs/instructions/6-Teardown-Infrastructure.md) (30 perc)
- Összefoglalás: Mik azok az AZD sablonok?
- Összefoglalás: Miért használjuk az Azure Developer CLI-t?
- Következő lépések: Próbálj ki egy másik sablont!
- **Labor**: Infrastruktúra lebontása és tisztítás

<br/>

## Workshop kihívás

Szeretnéd magad nagyobb kihívás elé állítani? Íme néhány projektjavaslat – vagy oszd meg velünk saját ötleteidet!

| Projekt | Leírás |
|:---|:---|
|1. **Egy komplex AI sablon elemzése** | Használd az általunk bemutatott munkafolyamatot és eszközöket, és próbálj meg telepíteni, validálni és testreszabni egy másik AI megoldás sablont. _Mit tanultál?_|
|2. **Testreszabás saját forgatókönyvvel**  | Próbálj meg írni egy PRD-t (Termék Követelmények Dokumentum) egy másik forgatókönyvhöz. Ezután használd a GitHub Copilotot a sablon repódban Ügynök Modellben – és kérd meg, hogy generáljon egy testreszabási munkafolyamatot számodra. _Mit tanultál? Hogyan tudnád továbbfejleszteni ezeket a javaslatokat?_|
| | |

## Van visszajelzésed?

1. Küldj egy hibajelentést ebbe a repóba – címkézd meg `Workshop`-ként a könnyebb azonosítás érdekében.
1. Csatlakozz az Azure AI Foundry Discordhoz – lépj kapcsolatba a társaiddal!


| | | 
|:---|:---|
| **📚 Kurzus kezdőlapja**| [AZD kezdőknek](../README.md)|
| **📖 Dokumentáció** | [AI sablonok használatának kezdő lépései](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI sablonok** | [Azure AI Foundry sablonok](https://ai.azure.com/templates) |
|**🚀 Következő lépések** | [Próbáld ki a kihívást](../../../workshop) |
| | |

<br/>

---

**Előző:** [AI hibaelhárítási útmutató](../docs/troubleshooting/ai-troubleshooting.md) | **Következő:** Kezdj az [1. laborral: AZD alapok](../../../workshop/lab-1-azd-basics)

**Készen állsz AI alkalmazások építésére AZD-vel?**

[Indítsd el az 1. labort: AZD alapok →](./lab-1-azd-basics/README.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
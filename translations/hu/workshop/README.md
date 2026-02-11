<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD AI Fejlesztőknek Műhely
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Gyakorlati műhely az AI alkalmazások építéséhez Azure Developer CLI-vel.</strong><br>
      Teljesíts 7 modult, hogy elsajátítsd az AZD sablonokat és az AI telepítési munkafolyamatokat.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Utolsó frissítés: 2026 február
      </span>
    </div>
  </div>
</div>

# AZD AI Fejlesztőknek Műhely

Üdvözlünk a gyakorlati műhelyben, ahol az Azure Developer CLI-t (AZD) tanulhatod AI alkalmazások telepítésére fókuszálva. Ez a műhely segít három lépésben alkalmazottan megérteni az AZD sablonokat:

1. **Felfedezés** - találd meg a neked megfelelő sablont.
1. **Telepítés** - telepítsd és ellenőrizd, hogy működik
1. **Testreszabás** - módosítsd és ismételd, hogy a sajátoddá tedd!

A műhely során megismerkedsz a legfontosabb fejlesztői eszközökkel és munkafolyamatokkal is, hogy egyszerűbbé tedd az end-to-end fejlesztési utadat.

<br/>

## Böngésző-alapú útmutató

A műhely leckéi Markdown formátumúak. Közvetlenül GitHubon navigálhatsz bennük – vagy elindíthatsz egy böngésző-alapú előnézetet a lenti képernyőkép szerint.

![Workshop](../../../translated_images/hu/workshop.75906f133e6f8ba0.webp)

Ehhez az opcióhoz – forkold a repót a profilodba, és indítsd el a GitHub Codespaces-t. Amint a VS Code terminál aktív, írd be ezt a parancsot:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Néhány másodperc múlva megjelenik egy felugró ablak. Válaszd ki az `Open in browser` opciót. A webes útmutató mostantól új böngészőfülön nyílik meg. Ennek az előnézetnek néhány előnye:

1. **Beépített kereső** - kulcsszavakat vagy leckéket gyorsan megtalálsz.
1. **Másolás ikon** - kódblokkok fölé mozgatva jelenik meg
1. **Téma váltó** - válthatsz sötét és világos téma között
1. **Segítség kérése** - kattints a láblécben a Discord ikonra, és csatlakozz!

<br/>

## Műhely áttekintése

**Időtartam:** 3-4 óra  
**Szint:** Kezdőtől Középhaladóig  
**Előfeltételek:** Azure, AI fogalmak, VS Code és parancssori eszközök ismerete.

Ez egy gyakorlati műhely, ahol csinálva tanulsz. A feladatok elvégzése után érdemes áttekinteni az AZD For Beginners tananyagot, hogy folytasd a tanulást Biztonság és Termelékenység legjobb gyakorlatok terén.

| Idő | Modul  | Célkitűzés |
|:---|:---|:---|
| 15 perc | [Bevezetés](docs/instructions/0-Introduction.md) | Alapok lefektetése, célok megértése |
| 30 perc | [AI sablon kiválasztása](docs/instructions/1-Select-AI-Template.md) | Lehetőségek feltérképezése és kezdő választás | 
| 30 perc | [AI sablon validálása](docs/instructions/2-Validate-AI-Template.md) | Alap megoldás telepítése Azure-ra |
| 30 perc | [AI sablon lebontása](docs/instructions/3-Deconstruct-AI-Template.md) | Szerkezet és konfiguráció feltárása |
| 30 perc | [AI sablon konfigurálása](docs/instructions/4-Configure-AI-Template.md) | Funkciók aktiválása és kipróbálása |
| 30 perc | [AI sablon testreszabása](docs/instructions/5-Customize-AI-Template.md) | Sablon személyre szabása igényeidhez |
| 30 perc | [Infrastruktúra bontása](docs/instructions/6-Teardown-Infrastructure.md) | Erőforrások tisztítása és felszabadítása |
| 15 perc | [Összegzés és következő lépések](docs/instructions/7-Wrap-up.md) | Tanulási források, műhely kihívás |

<br/>

## Amit megtanulsz

Gondolj az AZD Sablonra, mint egy tanuló homokozóra, ahol különböző képességeket és eszközöket fedezhetsz fel az end-to-end fejlesztéshez a Microsoft Foundry platformon. A műhely végére intuitív érzésed lesz ezekhez az eszközökhöz és fogalmakhoz.

| Fogalom  | Célkitűzés |
|:---|:---|
| **Azure Developer CLI** | Eszközparancsok és munkafolyamatok megértése |
| **AZD Sablonok** | Projekt szerkezet és konfiguráció megértése |
| **Azure AI Agent** | Microsoft Foundry projekt biztosítása és telepítése |
| **Azure AI Search** | Kontextus alapú mérnökség támogatása agentekkel |
| **Megfigyelhetőség** | Trace-elés, monitorozás és értékelések felfedezése |
| **Red Teaming** | Ellenséges tesztelés és elleni védekezések megismerése |

<br/>

## A műhely felépítése

A műhely úgy van felépítve, hogy végigvezessen a sablon felfedezésétől a telepítésen, lebontáson, és testreszabáson át – az hivatalos [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) kezdősablont használva alapként.

### [1. Modul: AI sablon kiválasztása](docs/instructions/1-Select-AI-Template.md) (30 perc)

- Mik az AI sablonok?
- Hol találok AI sablonokat?
- Hogyan kezdhetek AI agentek fejlesztésébe?
- **Gyakorlat**: Gyors kezdés GitHub Codespaces-ben

### [2. Modul: AI sablon validálása](docs/instructions/2-Validate-AI-Template.md) (30 perc)

- Mi az AI sablon architektúrája?
- Mi az AZD fejlesztési munkafolyamat?
- Hol kérhetek segítséget az AZD fejlesztéshez?
- **Gyakorlat**: AI agent sablon telepítése és validálása

### [3. Modul: AI sablon lebontása](docs/instructions/3-Deconstruct-AI-Template.md) (30 perc)

- Fedezd fel a környezetet a `.azure/` könyvtárban 
- Vizsgáld meg az erőforrás beállításokat az `infra/` mappában 
- Nézd át az AZD konfigurációt az `azure.yaml` fájlokban
- **Gyakorlat**: Környezeti változók módosítása és újratelepítés

### [4. Modul: AI sablon konfigurálása](docs/instructions/4-Configure-AI-Template.md) (30 perc)
- Fedezd fel: Retrieval Augmented Generation
- Fedezd fel: Agent értékelés & Red Teaming
- Fedezd fel: Trace-elés és monitorozás
- **Gyakorlat**: AI agent + megfigyelhetőség felfedezése

### [5. Modul: AI sablon testreszabása](docs/instructions/5-Customize-AI-Template.md) (30 perc)
- Határozd meg: PRD a forgatókönyv követelményeivel
- Konfiguráld: Környezeti változók az AZD-hez
- Implementáld: Élettartam horgonyok további feladatokhoz
- **Gyakorlat**: Sablon testreszabása a saját forgatókönyvhöz

### [6. Modul: Infrastruktúra bontása](docs/instructions/6-Teardown-Infrastructure.md) (30 perc)
- Áttekintés: Mik az AZD sablonok?
- Áttekintés: Miért használjuk az Azure Developer CLI-t?
- Következő lépések: Próbálj ki más sablont!
- **Gyakorlat**: Infrastruktúra leállítása és tisztítása

<br/>

## Műhely kihívás

Szeretnél többet kipróbálni? Íme néhány projekt javaslat – vagy oszd meg velünk az ötleteidet!

| Projekt | Leírás |
|:---|:---|
|1. **Egy összetett AI sablon lebontása** | Használd a leírt munkafolyamatot és eszközöket, próbálj meg egy másik AI megoldás sablont telepíteni, validálni és testreszabni. _Mit tanultál?_|
|2. **Testreszabás a saját forgatókönyveddel**  | Írj egy PRD-t (Termékkövetelmény dokumentumot) egy másik forgatókönyvhöz. Utána használd a GitHub Copilotot az agent modell sablon könyvtárában és kérj tőle testreszabási munkafolyamatot. _Mit tanultál? Hogyan javíthatnád ezeket a javaslatokat?_|
| | |

## Van visszajelzésed?

1. Nyiss egy issue-t ezen repository-ban – jelöld meg `Workshop` címkével a könnyebb azonosíthatóságért.
1. Csatlakozz a Microsoft Foundry Discord szerveréhez – kapcsolódj társaiddal!


| | | 
|:---|:---|
| **📚 Tanfolyam kezdőoldal**| [AZD Kezdőknek](../README.md)|
| **📖 Dokumentáció** | [AI sablonokkal való kezdés](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI sablonok** | [Microsoft Foundry sablonok](https://ai.azure.com/templates) |
|**🚀 Következő lépések** | [Műhely megkezdése](../../../workshop) |
| | |

<br/>

---

**Navigáció:** [Fő tanfolyam](../README.md) | [Bevezetés](docs/instructions/0-Introduction.md) | [1. Modul: Sablon kiválasztása](docs/instructions/1-Select-AI-Template.md)

**Készen állsz AI alkalmazásokat építeni AZD-vel?**

[Műhely kezdése: Bevezetés →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ez a dokumentum az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakember általi emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből az fordításból eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
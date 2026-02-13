# 7. Összefoglalás és következő lépések

!!! tip "A LEGFŐBB TANULSÁGOK"

    - [ ] Az AZD sablonok az AI alkalmazásfejlesztést napok helyett órákra gyorsítják fel
    - [ ] A Felfedezés → Telepítés → Testreszabás módszertan struktúrált tanulási utat kínál
    - [ ] A GitHub Copilot MCP szerverekkel természetes nyelvű keresést tesz lehetővé összetett kódbázisokban
    - [ ] A Microsoft Foundry beépített megfigyelhetőséget, értékelést és biztonsági tesztelést biztosít

---

## 1. Amit elértél

Gratulálunk! Ebben a műhelymunkában sikeresen:

| Modul | Eredmény |
|:---|:---|
| **1. modul** | Megismerted az Azure Developer CLI-t és kiválasztottál egy AI sablont |
| **2. modul** | Telepítettél és validáltál egy teljes AI ügynök megoldást |
| **3. modul** | Szétszedted a sablont, hogy megértsd annak architektúráját |
| **4. modul** | Felfedezted az `azure.yaml` konfigurációt és az életciklus műveleteket |
| **5. modul** | Testreszabtad a sablont a saját esetedhez |
| **6. modul** | Biztonságosan leszerelted az infrastruktúrát és kezelted az erőforrásokat |

---

## 2. Megszerzett kulcsfogalmak

### Azure Developer CLI (azd)
- `azd init` – Projektek inicializálása sablonokból
- `azd up` – Egy parancsban történő előkészítés és telepítés
- `azd env` – Környezeti változók kezelése
- `azd down` – Erőforrások biztonságos eltávolítása

### AZD sablon szerkezet
- `azure.yaml` – Konfigurációs és telepítési műveletek
- `infra/` – Bicep infrastruktúra-kód
- `src/` – Alkalmazás forráskódja
- `scripts/` – Automatizációs és beállító szkriptek

### Microsoft Foundry képességek
- AI Agent Service az intelligens asszisztensekhez
- Fájlkeresés és Azure AI Search a tudásbázis kezeléséhez
- Beépített nyomkövetés, monitoring és értékelés
- Red teaming az AI biztonsági validációhoz

---

## 3. Folytasd tanulási utadat

### Ajánlott következő lépések

| Út | Erőforrás | Idő |
|:---|:---|:---|
| **Teljes kurzus** | [AZD kezdőknek tananyag](../../README.md) | 8-12 óra |
| **Próbálj ki másik sablont** | [Microsoft Foundry sablonok](https://ai.azure.com/templates) | 1-2 óra |
| **Mélyebb merülés** | [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Folyamatos |
| **Közösség** | [Azure Discord](https://aka.ms/foundry/discord) | Csatlakozz ma! |

### Ajánlott sablonok a folytatáshoz

1. **[Kezdés AI csevegéssel](https://github.com/Azure-Samples/get-started-with-ai-chat)** – Alap chat az adataiddal
2. **[Azure Search OpenAI demó](https://github.com/Azure-Samples/azure-search-openai-demo)** – Fejlett RAG minták
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** – Vállalati kereskedelmi forgatókönyvek

---

## 4. Műhely kihívás

Készen állsz tesztelni tudásod? Próbáld ki az alábbi kihívásokat:

| Kihívás | Leírás | Nehézség |
|:---|:---|:---|
| **1. Több ügynökös forgatókönyv** | Telepítsd és testreszabva egy más iparágra (pl. egészségügy, pénzügy) | ⭐⭐ |
| **2. Egyedi tudásbázis** | Adj hozzá saját adatfájlokat és készíts egyedi keresőindexet | ⭐⭐⭐ |
| **3. Éles üzembe helyezés** | Állíts be CI/CD-t GitHub Actions segítségével `azd pipeline config`-kal | ⭐⭐⭐⭐ |

---

## 5. Oszd meg visszajelzésed

Visszajelzésed segít nekünk a műhely fejlesztésében!

- **GitHub Issues**: [Írj visszajelzést](https://github.com/microsoft/azd-for-beginners/issues) – címke: `Workshop`
- **Discord**: Csatlakozz a [Microsoft Foundry Discordhoz](https://aka.ms/foundry/discord) – posztolj a `#get-help` csatornába
- **Hozzájárulások**: Segíts fejleszteni a műhelyt pull requestekkel!

---

## Köszönjük! 🎉

Köszönjük, hogy elvégezted az AZD AI fejlesztőknek szóló műhelyt. Reméljük, tapasztalatod felvértez AI alkalmazások építéséhez és telepítéséhez az Azure-on.

**Építs tovább, tanulj tovább, és üdvözlünk az Azure AI fejlesztői közösségben!**

---

| | |
|:---|:---|
| **📚 Kurzus kezdőlap** | [AZD kezdőknek](../../README.md) |
| **📖 Dokumentáció** | [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI sablonok** | [Microsoft Foundry sablonok](https://ai.azure.com/templates) |
| **💬 Közösség** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ez a dokumentum az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Míg a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
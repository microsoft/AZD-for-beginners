<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T09:13:29+00:00",
  "source_file": "course-outline.md",
  "language_code": "hu"
}
-->
## 8 fejezetes tanulási struktúra

### 1. fejezet: Alapok és gyors kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Komplexitás**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra  
- Az első sikeres telepítésed
- Alapfogalmak és terminológia

#### Tanulási források
- [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak
- [Telepítés és beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- [Az első projekted](docs/getting-started/first-project.md) - Gyakorlati bemutató
- [Parancsok gyorstalpalója](resources/cheat-sheet.md) - Gyors referencia

#### Gyakorlati eredmény
Egy egyszerű webalkalmazás sikeres telepítése az Azure-ra AZD segítségével

---

### 2. fejezet: AI-első fejlesztés (1-2 óra) 🤖
**Előfeltételek**: 1. fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Azure AI Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási források
- [Azure AI Foundry integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI modell telepítése](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gyakorlati labor
- [Azure AI Foundry sablonok](README.md#featured-azure-ai-foundry-templates)

#### Gyakorlati eredmény
AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel

---

### 3. fejezet: Konfiguráció és hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Környezet konfigurációja és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése
- Több környezet telepítése

#### Tanulási források
- [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- Biztonsági minták és kezelt identitás
- Több környezet példái

#### Gyakorlati eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. fejezet: Infrastruktúra kódként és telepítés (1-1,5 óra) 🏗️
**Előfeltételek**: 1-3. fejezet elvégzése  
**Komplexitás**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőforrások biztosítási stratégiái
- Egyedi sablonok létrehozása

#### Tanulási források
- [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- [Erőforrások biztosítása](docs/deployment/provisioning.md) - Erőforrás-kezelés
- Konténer és mikroszolgáltatások példái

#### Gyakorlati eredmény
Komplex, több szolgáltatást tartalmazó alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 5. fejezet: Többügynökös AI megoldások (2-3 óra) 🤖🤖
**Előfeltételek**: 1-2. fejezet elvégzése  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- AI telepítések gyártásra kész állapotban
- Ügyfél- és készletkezelő ügynökök implementációja

#### Tanulási források
- [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes implementáció
- [ARM sabloncsomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- Többügynökös koordinációs minták

#### Gyakorlati eredmény
Gyártásra kész többügynökös AI megoldás telepítése és kezelése

---

### 6. fejezet: Telepítés előtti validáció és tervezés (1 óra) 🔍
**Előfeltételek**: 4. fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrások validációja
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás
- Költségoptimalizálási tervezés

#### Tanulási források
- [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrások validációja
- [SKU kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- [Előzetes ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati eredmény
Telepítések validálása és optimalizálása végrehajtás előtt

---

### 7. fejezet: Hibakeresés és hibaelhárítás (1-1,5 óra) 🔧
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibaelhárítás
- Teljesítményoptimalizálás

#### Tanulási források
- [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- [AI-specifikus hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati eredmény
Gyakori telepítési problémák önálló diagnosztizálása és megoldása

---

### 8. fejezet: Gyártás és vállalati minták (2-3 óra) 🏢
**Előfeltételek**: 1-4. fejezet elvégzése  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Gyártási telepítési stratégiák
- Vállalati biztonsági minták
- Felügyelet és költségoptimalizálás
- Skálázhatóság és irányítás

#### Tanulási források
- [Gyártási AI legjobb gyakorlatok](docs/ai-foundry/production-ai-practices.md) - Vállalati minták
- Mikroszolgáltatások és vállalati példák
- Felügyeleti és irányítási keretrendszerek

#### Gyakorlati eredmény
Vállalati szintű alkalmazások telepítése teljes gyártási képességekkel

---

## Tanulási haladás és komplexitás

### Fokozatos készségfejlesztés

- **🌱 Kezdők**: Kezdj az 1. fejezettel (Alapok) → 2. fejezet (AI fejlesztés)
- **🔧 Középhaladók**: 3-4. fejezet (Konfiguráció és infrastruktúra) → 6. fejezet (Validáció)
- **🚀 Haladók**: 5. fejezet (Többügynökös megoldások) → 7. fejezet (Hibaelhárítás)
- **🏢 Vállalati szint**: Végezze el az összes fejezetet, különös figyelmet fordítva a 8. fejezetre (Gyártási minták)

### Komplexitás jelzők

- **⭐ Alap**: Egyetlen koncepció, irányított bemutatók, 30-60 perc
- **⭐⭐ Középhaladó**: Több koncepció, gyakorlati tapasztalat, 1-2 óra  
- **⭐⭐⭐ Haladó**: Komplex architektúrák, egyedi megoldások, 1-3 óra
- **⭐⭐⭐⭐ Szakértő**: Gyártási rendszerek, vállalati minták, 2-4 óra

### Rugalmas tanulási utak

#### 🎯 AI fejlesztő gyorsított pálya (4-6 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **2. fejezet**: AI-első fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI megoldások (3 óra)
4. **8. fejezet**: Gyártási AI legjobb gyakorlatok (1 óra)

#### 🛠️ Infrastruktúra szakértői út (5-7 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **3. fejezet**: Konfiguráció és hitelesítés (1 óra)
3. **4. fejezet**: Infrastruktúra kódként és telepítés (1,5 óra)
4. **6. fejezet**: Telepítés előtti validáció és tervezés (1 óra)
5. **7. fejezet**: Hibakeresés és hibaelhárítás (1,5 óra)
6. **8. fejezet**: Gyártás és vállalati minták (2 óra)

#### 🎓 Teljes tanulási út (8-12 óra)
Az összes fejezet sorrendben történő elvégzése gyakorlati tapasztalatokkal és validációval

## Tanfolyam befejezési keretrendszer

### Tudás validáció
- **Fejezet ellenőrzőpontok**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati ellenőrzés**: Működő megoldások telepítése minden fejezethez
- **Haladás nyomon követése**: Vizualizált indikátorok és teljesítési jelvények
- **Közösségi validáció**: Tapasztalatok megosztása az Azure Discord csatornákon

### Tanulási eredmények értékelése

#### 1-2. fejezet elvégzése (Alapok + AI)
- ✅ Egyszerű webalkalmazás telepítése AZD segítségével
- ✅ AI-alapú chatalkalmazás telepítése RAG funkcióval
- ✅ AZD alapfogalmainak és AI integrációjának megértése

#### 3-4. fejezet elvégzése (Konfiguráció + Infrastruktúra)  
- ✅ Több környezet telepítése és kezelése
- ✅ Egyedi Bicep infrastruktúra sablonok létrehozása
- ✅ Biztonságos hitelesítési minták implementálása

#### 5-6. fejezet elvégzése (Többügynökös + Validáció)
- ✅ Komplex többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás végrehajtása
- ✅ Automatizált telepítés előtti validáció implementálása

#### 7-8. fejezet elvégzése (Hibaelhárítás + Gyártás)
- ✅ Telepítési problémák önálló diagnosztizálása és megoldása  
- ✅ Vállalati szintű felügyelet és biztonság implementálása
- ✅ Gyártásra kész alkalmazások telepítése irányítással

### Tanúsítvány és elismerés
- **Tanfolyam teljesítési jelvény**: Az összes fejezet gyakorlati validációval történő elvégzése
- **Közösségi elismerés**: Aktív részvétel az Azure AI Foundry Discord közösségben
- **Szakmai fejlődés**: Iparág-specifikus AZD és AI telepítési készségek
- **Karrier előrelépés**: Vállalati szintű felhőtelepítési képességek

## Tartalom megfelelősége modern fejlesztők számára

### Technikai mélység és lefedettség
- **Azure OpenAI integráció**: Teljes lefedettség GPT-4o, beágyazások és többmodell telepítések terén
- **AI architektúra minták**: RAG implementációk, többügynökös összehangolás és gyártási AI munkafolyamatok
- **Infrastruktúra kódként**: Bicep sablonok, ARM telepítések és automatizált erőforrás-biztosítás
- **Gyártásra kész állapot**: Biztonság, skálázás, felügyelet, költségoptimalizálás és irányítás
- **Vállalati minták**: Több környezet telepítése, CI/CD integráció és megfelelőségi keretrendszerek

### Gyakorlati tanulási fókusz
- **Telepítés automatizálása**: AZD munkafolyamatok gyakorlati hangsúlya, nem elméleti koncepciók
- **Valós forgatókönyvek**: Teljes kiskereskedelmi többügynökös megoldás Ügyfél- és Készletkezelő ügynökökkel
- **Gyártási példák**: ARM sabloncsomagok, egykattintásos telepítések és vállalati minták
- **Hibaelhárítási készségek**: AI-specifikus hibakeresés, több szolgáltatás diagnosztikája és teljesítményoptimalizálás
- **Iparági relevancia**: Az Azure AI Foundry közösség visszajelzései és vállalati igények alapján

### Közösségi és támogatási integráció
- **Discord integráció**: Aktív részvétel az Azure AI Foundry és Microsoft Azure közösségekben
- **GitHub megbeszélések**: Együttműködő tanulás és problémamegoldás társaikkal és szakértőkkel
- **Szakértői hozzáférés**: Közvetlen kapcsolat Microsoft mérnökökkel és AI telepítési specialistákkal
- **Folyamatos frissítések**: A tanfolyam tartalma az Azure platform frissítéseivel és közösségi visszajelzésekkel fejlődik
- **Karrierfejlesztés**: Készségek, amelyek közvetlenül alkalmazhatók modern felhő- és AI fejlesztési szerepkörökben

### Tanulási eredmények validációja
- **Mérhető készségek**: Minden fejezet gyakorlati telepítési feladatokat tartalmaz ellenőrizhető eredményekkel
- **Portfólió fejlesztés**: Teljes projektek, amelyek alkalmasak szakmai portfóliókhoz és állásinterjúkhoz
- **Iparági elismerés**: A készségek megfelelnek az aktuális munkaerőpiaci igényeknek AZD és AI telepítési szakértelem terén
- **Szakmai hálózat**: Hozzáférés az Azure fejlesztői közösséghez karrierfejlesztés és együttműködés céljából

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
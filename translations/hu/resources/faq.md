# Gyakran Ismételt Kérdések (GYIK)

**Segítség fejezetenként**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../README.md)
- **🚆 Telepítési problémák**: [1. fejezet: Telepítés és beállítás](../docs/getting-started/installation.md)
- **🤖 MI kérdések**: [2. fejezet: MI-központú fejlesztés](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Hibakeresés**: [7. fejezet: Hibakeresés és hibajavítás](../docs/troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó GYIK válaszokat ad az Azure Developer CLI (azd) és az Azure-telepítések leggyakoribb kérdéseire. Gyors megoldásokat találhat gyakori problémákra, megértheti a legjobb gyakorlatokat, és tisztázást kaphat az azd fogalmairól és munkafolyamatairól.

## Tanulási célok

A GYIK áttekintése során Ön:
- Gyors válaszokat talál az Azure Developer CLI leggyakoribb kérdéseire és problémáira
- Megért néhány kulcsfogalmat és terminológiát gyakorlati kérdés-felelet formában
- Hozzáfér hibakeresési megoldásokhoz gyakori problémák és hibahelyzetek esetén
- Megismeri a legjobb gyakorlatokat optimalizálási kérdéseken keresztül
- Felfedezi a fejlett funkciókat szakértői szintű kérdések által
- Hatékonyan hivatkozhat költség-, biztonsági és telepítési stratégiákra vonatkozó útmutatásokra

## Tanulási eredmények

A GYIK rendszeres használatával képes lesz:
- Önállóan megoldani az Azure Developer CLI leggyakoribb problémáit a rendelkezésre álló megoldások segítségével
- Megalapozott döntéseket hozni telepítési stratégiák és konfigurációk tekintetében
- Megérteni az azd és más Azure eszközök, szolgáltatások közötti kapcsolatot
- Alkalmazni a legjobb gyakorlatokat a közösségi tapasztalatok és szakértői ajánlások alapján
- Hatékonyan hibakeresni hitelesítési, telepítési és konfigurációs problémákat
- Optimalizálni a költségeket és teljesítményt a GYIKból származó felismerések és ajánlások alapján

## Tartalomjegyzék

- [Kezdő lépések](../../../resources)
- [Hitelesítés és hozzáférés](../../../resources)
- [Sablonok és projektek](../../../resources)
- [Telepítés és infrastruktúra](../../../resources)
- [Konfiguráció és környezetek](../../../resources)
- [Hibakeresés](../../../resources)
- [Költség és számlázás](../../../resources)
- [Legjobb gyakorlatok](../../../resources)
- [Haladó témák](../../../resources)

---

## Kezdő lépések

### K: Mi az az Azure Developer CLI (azd)?
**V**: Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazás helyi fejlesztési környezetből Azure-ba történő eljuttatásának idejét. Legjobb gyakorlatokat nyújt sablonokon keresztül, és segíti a teljes telepítési életciklust.

### K: Miben különbözik az azd az Azure CLI-től?
**V**: 
- **Azure CLI**: Általános célú eszköz Azure-erőforrások kezelésére
- **azd**: Fejlesztő-központú eszköz alkalmazástelepítési munkafolyamatokhoz
- azd belsőleg az Azure CLI-t használja, de magasabb szintű absztrakciókat biztosít a közös fejlesztési helyzetekhez
- azd tartalmaz sablonokat, környezetkezelést és telepítési automatizálást

### K: Szükségem van az Azure CLI telepítésére az azd használatához?
**V**: Igen, azd az Azure CLI-t használja hitelesítéshez és néhány művelethez. Először telepítse az Azure CLI-t, majd az azd-t.

### K: Milyen programozási nyelveket támogat az azd?
**V**: Az azd nyelvfüggetlen. Támogatja:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statikus weboldalak
- Konténerizált alkalmazások

### K: Használhatom az azd-t meglévő projektekhez?
**V**: Igen! Vagy:
1. Használja az `azd init` parancsot az azd konfiguráció hozzáadásához meglévő projektekhez
2. Alkalmazza meglévő projektjét az azd sablon struktúrájára
3. Hozzon létre egyedi sablonokat a meglévő architektúrája alapján

---

## Hitelesítés és hozzáférés

### K: Hogyan hitelesítem magam az Azure-ban az azd-vel?
**V**: Használja az `azd auth login` parancsot, amely megnyit egy böngészőablakot az Azure hitelesítéshez. CI/CD esetekben használjon szolgáltatásazonosítókat vagy kezelt identitásokat.

### K: Használhatom az azd-t több Azure előfizetéssel?
**V**: Igen. Használja az `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` parancsot, hogy megadja, mely előfizetést használja az egyes környezetekhez.

### K: Milyen jogosultságokra van szükségem az azd-vel történő telepítéshez?
**V**: Általában szükséges:
- **Contributor** szerepkör az erőforráscsoportban vagy előfizetésben
- **User Access Administrator** ha olyan erőforrásokat telepít, amelyek szerepkör-hozzárendelést igényelnek
- A specifikus jogosultságok sablontól és az erőforrásoktól függően változnak

### K: Használhatom az azd-t CI/CD pipeline-okban?
**V**: Természetesen! Az azd CI/CD integrációra készült. Használjon szolgáltatásazonosítókat hitelesítéshez és állítson be környezeti változókat konfigurációhoz.

### K: Hogyan kezeljem a hitelesítést GitHub Actions-ben?
**V**: Használja az Azure Login action-t szolgáltatásazonosító hitelesítő adatokkal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Sablonok és projektek

### K: Hol találok azd sablonokat?
**V**: 
- Hivatalos sablonok: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Közösségi sablonok: GitHub keresés "azd-template" kulcsszóra
- Használja az `azd template list` parancsot a rendelkezésre álló sablonok böngészéséhez

### K: Hogyan hozhatok létre egyedi sablont?
**V**: 
1. Kezdjen egy létező sablon struktúrájával
2. Módosítsa az `azure.yaml`, infrastruktúra fájlokat és az alkalmazáskódot
3. Tesztelje alaposan az `azd up` paranccsal
4. Tegye közzé GitHub-on a megfelelő címkékkel

### K: Használhatom az azd-t sablon nélkül?
**V**: Igen, használja az `azd init` parancsot egy meglévő projektben a szükséges konfigurációs fájlok létrehozásához. Manuálisan kell konfigurálnia az `azure.yaml` és infrastruktúra fájlokat.

### K: Mi a különbség a hivatalos és a közösségi sablonok között?
**V**: 
- **Hivatalos sablonok**: A Microsoft által karbantartott, rendszeresen frissített, átfogó dokumentációval
- **Közösségi sablonok**: Fejlesztők által készített, speciális esetekre lehetnek optimalizálva, eltérő minőség és karbantartás mellett

### K: Hogyan frissíthetek egy sablont a projektemben?
**V**: A sablonok nem frissülnek automatikusan. Teheti:
1. Manuálisan hasonlítsa össze és egyesítse a változásokat az eredeti sablonból
2. Kezdjen tiszta lappal az `azd init` segítségével a frissített sablonnal
3. Válogassa ki konkrét fejlesztéseket a frissített sablonokból

---

## Telepítés és infrastruktúra

### K: Milyen Azure szolgáltatásokat telepíthet az azd?
**V**: Az azd bármilyen Azure szolgáltatást képes telepíteni Bicep/ARM sablonokon keresztül,beleértve:
- App Service-ket, Container App-eket, Function-öket
- Adatbázisokat (SQL, PostgreSQL, Cosmos DB)
- Tárolókat, Key Vault-ot, Application Insights-ot
- Hálózati, biztonsági és monitorozási erőforrásokat

### K: Telepíthetek több régióba?
**V**: Igen, konfigurálhat több régiót Bicep sablonjaiban, és megfelelően állíthatja be a location paramétert minden környezethez.

### K: Hogyan kezelem az adatbázis sémaváltásokat?
**V**: Használjon telepítési hook-okat az `azure.yaml`-ban:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Telepíthetek csak infrastruktúrát alkalmazások nélkül?
**V**: Igen, használja az `azd provision` parancsot, hogy csak az infrastruktúra komponenseket telepítse, melyeket a sablonok definiálnak.

### K: Hogyan telepíthetek meglévő Azure erőforrásokra?
**V**: Ez összetett és nem közvetlenül támogatott. Lehetőségek:
1. Importálja a meglévő erőforrásokat a Bicep sablonjaiba
2. Használja a meglévő erőforrás hivatkozásokat a sablonokban
3. Módosítsa a sablonokat, hogy feltételesen létrehozzanak vagy hivatkozzanak erőforrásokra

### K: Használhatom a Terraformot Bicep helyett?
**V**: Jelenleg az azd elsősorban Bicep/ARM sablonokat támogat. A Terraform hivatalos támogatása nincs, bár létezhetnek közösségi megoldások.

---

## Konfiguráció és környezetek

### K: Hogyan kezelem a különböző környezeteket (dev, staging, prod)?
**V**: Hozzon létre külön környezeteket az `azd env new <environment-name>` paranccsal, és konfiguráljon eltérő beállításokat minden egyeshez:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Hol tárolódnak a környezeti konfigurációk?
**V**: A projektkönyvtárban lévő `.azure` mappában. Minden környezetnek megvan a maga mappája konfigurációs fájlokkal.

### K: Hogyan állíthatok be környezet-specifikus konfigurációt?
**V**: Használja az `azd env set` parancsot környezeti változók beállításához:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Megoszthatom a környezeti konfigurációkat csapatként?
**V**: A `.azure` mappa érzékeny adatokat tartalmaz, ezért ne küldje verziókövetésbe. Ehelyett:
1. Dokumentálja a szükséges környezeti változókat
2. Használjon telepítési szkripteket a környezetek beállításához
3. Használjon Azure Key Vault-ot az érzékeny konfiguráció számára

### K: Hogyan írhatom felül a sablon alapértelmezett értékeit?
**V**: Állítson be környezeti változókat, amelyek megfelelnek a sablon paramétereinek:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Hibakeresés

### K: Miért nem sikerül az `azd up`?
**V**: Gyakori okok:
1. **Hitelesítési problémák**: Futtassa az `azd auth login`-t
2. **Elégtelen jogosultságok**: Ellenőrizze Azure szerepkör hozzárendeléseit
3. **Erőforrásnév ütközések**: Változtassa meg az AZURE_ENV_NAME értékét
4. **Kvóta/kapacitás problémák**: Ellenőrizze a régiós elérhetőséget
5. **Sablonhibák**: Érvényesítse a Bicep sablonokat

### K: Hogyan hibakeressem a telepítési sikertelenségeket?
**V**: 
1. Használja az `azd deploy --debug` parancsot részletes kimenetért
2. Ellenőrizze az Azure portál telepítési előzményeit
3. Tekintse át az Azure portál Tevékenységi naplóját
4. Használja az `azd show` parancsot a jelenlegi környezeti állapot megjelenítéséhez

### K: Miért nem működnek a környezeti változóim?
**V**: Ellenőrizze:
1. A változónevek pontosan egyeznek-e a sablon paramétereivel
2. Az értékek helyesen vannak idézőjelek közé téve, ha szóközt tartalmaznak
3. A megfelelő környezet van kiválasztva: `azd env select <environment>`
4. A változók a megfelelő környezetben vannak beállítva

### K: Hogyan takarítsam el a sikertelen telepítéseket?
**V**: 
```bash
azd down --force --purge
```
Ez eltávolít minden erőforrást és környezeti konfigurációt.

### K: Miért nem elérhető az alkalmazás telepítés után?
**V**: Ellenőrizze:
1. A telepítés sikeresen befejeződött-e
2. Az alkalmazás fut-e (nézze meg a naplókat az Azure portálon)
3. A hálózati biztonsági csoportok engedélyezik a forgalmat
4. A DNS/egyéni domain helyesen van-e konfigurálva

---

## Költség és számlázás

### K: Mennyibe kerül az azd-vel történő telepítés?
**V**: A költségek a következőktől függenek:
- Telepített Azure szolgáltatások
- Kiválasztott szolgáltatási szintek/SKU-k
- Régiós árkülönbségek
- Használati minták

Használja az [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) kalkulátort becsléshez.

### K: Hogyan kontrollálhatom a költségeket az azd telepítéseknél?
**V**: 
1. Használjon alacsonyabb szintű SKU-kat fejlesztési környezetekben
2. Állítson be Azure költségkeretet és riasztásokat
3. Használja az `azd down` parancsot, hogy eltávolítsa az erőforrásokat, ha nem szükségesek
4. Válassza meg a megfelelő régiókat (a költségek hely szerint változnak)
5. Használjon Azure Cost Management eszközöket

### K: Vannak ingyenes szintű opciók az azd sablonokhoz?
**V**: Számos Azure szolgáltatás kínál ingyenes szinteket:
- App Service: elérhető ingyenes szint
- Azure Functions: havi 1 millió ingyenes futtatás
- Cosmos DB: 400 RU/s ingyenes szint
- Application Insights: havonta az első 5 GB ingyenes

Állítsa be a sablonokat, hogy az ingyenes szinteket használják, ahol lehetséges.

### K: Hogyan becsülhetem előre a költségeket telepítés előtt?
**V**: 
1. Tekintse át a sablon `main.bicep` fájlját, hogy mely erőforrások jönnek létre
2. Használja az Azure Pricing Calculator-t a konkrét SKU-k alapján
3. Telepítsen először egy fejlesztői környezetbe a tényleges költségek nyomon követéséhez
4. Használja az Azure Cost Management-et a részletes költségelemzéshez

---

## Legjobb gyakorlatok

### K: Mik a legjobb gyakorlatok az azd projekt struktúrájához?
**V**: 
1. Tartsa az alkalmazáskódot külön az infrastruktúrától
2. Használjon jelentőségteljes szolgáltatásneveket az `azure.yaml`-ban
3. Valósítson meg megfelelő hibakezelést a build szkriptekben
4. Használjon környezet-specifikus konfigurációt
5. Tartalmazzon átfogó dokumentációt

### K: Hogyan szervezzem meg az azd-ben több szolgáltatást?
**V**: Használja az ajánlott struktúrát:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Kell verziókövetésbe adnom a `.azure` mappát?
**V**: **Nem!** A `.azure` mappa érzékeny adatokat tartalmaz. Adja hozzá a `.gitignore`-hoz:
```gitignore
.azure/
```

### K: Hogyan kezeljem a titkokat és az érzékeny konfigurációt?
**V**: 
1. Használjon Azure Key Vault-ot titkok kezelésére
2. Hivatkozzon a Key Vault titkokra az alkalmazás konfigurációjában
3. Soha ne tegye verziókövetésbe a titkokat
4. Használjon kezelt identitásokat szolgáltatás közötti hitelesítéshez

### K: Mi az ajánlott megközelítés CI/CD esetén az azd-vel?
**V**: 
1. Használjon külön környezeteket minden szakaszhoz (dev/staging/prod)
2. Valósítson meg automatizált tesztelést telepítés előtt
3. Használjon szolgáltatásazonosítókat hitelesítéshez
4. Tárolja az érzékeny konfigurációt pipeline titkokban/változókban
5. Valósítson meg jóváhagyási kapukat gyártási telepítésekhez

---

## Haladó témák

### K: Kiterjeszthetem az azd-t egyedi funkciókkal?
**V**: Igen, telepítési hook-okon keresztül az `azure.yaml`-ban:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Hogyan integrálhatom az azd-t meglévő DevOps folyamatokkal?
**V**: 
1. Használja az azd parancsokat meglévő pipeline szkriptekben
2. Standardizáljon az azd sablonokra a csapatok között
3. Integrálja meglévő monitorozási és riasztási eszközökkel
4. Használja az azd JSON kimenetét pipeline integrációhoz

### K: Használhatom az azd-t Azure DevOps-szal?
**V**: Igen, azd bármely CI/CD rendszerrel működik. Készítsen Azure DevOps pipeline-okat, amelyek az azd parancsokat használják.

### K: Hogyan járulhatok hozzá az azd-hez vagy készíthetek közösségi sablonokat?
**V**: 
1. **azd tool**: Közreműködés a [Azure/azure-dev](https://github.com/Azure/azure-dev) projektben  
2. **Sablonok**: Készíts sablonokat a [sablon irányelvek](https://github.com/Azure-Samples/awesome-azd) alapján  
3. **Dokumentáció**: Közreműködés a dokumentációban a [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) projektben

### K: Mi az azd ütemterve?  
**V**: Tekintsd meg a [hivatalos ütemtervet](https://github.com/Azure/azure-dev/projects), hogy megismerd a tervezett funkciókat és fejlesztéseket.

### K: Hogyan migráljak más telepítő eszközökről az azd használatára?  
**V**:  
1. Elemezd a jelenlegi telepítési architektúrát  
2. Készíts egyenértékű Bicep sablonokat  
3. Állítsd be az `azure.yaml` fájlt úgy, hogy megfeleljen a meglévő szolgáltatásoknak  
4. Alaposan teszteld fejlesztési környezetben  
5. Fokozatosan migráld a környezeteket

---

## Még mindig vannak kérdéseid?

### **Először keress**  
- Nézd át a [hivatalos dokumentációt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Keresgélj a [GitHub issue-k között](https://github.com/Azure/azure-dev/issues) hasonló problémák után

### **Kérj segítséget**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) – Közösségi támogatás  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) – Technikailag kérdések  
- [Azure Discord](https://discord.gg/azure) – Valós idejű közösségi chat

### **Jelents hibákat**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) – Hibabejelentések és funkciókérések  
- Mellékelj releváns logokat, hibaüzeneteket és reprodukálási lépéseket

### **Tanulj többet**  
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ez a GYIK rendszeresen frissül. Utolsó frissítés: 2025. szeptember 9.*

---

**Navigáció**  
- **Előző lecke**: [Szószedet](glossary.md)  
- **Következő lecke**: [Tanulmányi útmutató](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Jelen dokumentumot az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk le. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
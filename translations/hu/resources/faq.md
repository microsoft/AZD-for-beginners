<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:24:52+00:00",
  "source_file": "resources/faq.md",
  "language_code": "hu"
}
-->
# Gyakran Ismételt Kérdések (GYIK)

## Bevezetés

Ez az átfogó GYIK választ ad a leggyakoribb kérdésekre az Azure Developer CLI (azd) és az Azure telepítések kapcsán. Gyors megoldásokat találhatsz gyakori problémákra, megértheted a legjobb gyakorlatokat, és tisztázhatod az azd koncepcióit és munkafolyamatait.

## Tanulási célok

A GYIK áttekintésével:
- Gyors válaszokat találhatsz az Azure Developer CLI-vel kapcsolatos kérdésekre és problémákra
- Gyakorlati kérdés-válasz formában megértheted a kulcsfogalmakat és terminológiát
- Hozzáférhetsz hibaelhárítási megoldásokhoz gyakori problémák és hibák esetén
- Megismerheted az optimalizálással kapcsolatos legjobb gyakorlatokat
- Felfedezheted a haladó funkciókat és képességeket szakértői szintű kérdéseken keresztül
- Hatékonyan hivatkozhatsz költség-, biztonsági és telepítési stratégiákra vonatkozó útmutatásokra

## Tanulási eredmények

A GYIK rendszeres használatával képes leszel:
- Önállóan megoldani az Azure Developer CLI-vel kapcsolatos gyakori problémákat a megadott megoldások alapján
- Megalapozott döntéseket hozni a telepítési stratégiákról és konfigurációkról
- Megérteni az azd és más Azure eszközök és szolgáltatások közötti kapcsolatot
- Alkalmazni a közösségi tapasztalatok és szakértői ajánlások alapján kialakított legjobb gyakorlatokat
- Hatékonyan elhárítani hitelesítési, telepítési és konfigurációs problémákat
- Optimalizálni a költségeket és a teljesítményt a GYIK-ban található betekintések és ajánlások alapján

## Tartalomjegyzék

- [Első lépések](../../../resources)
- [Hitelesítés és hozzáférés](../../../resources)
- [Sablonok és projektek](../../../resources)
- [Telepítés és infrastruktúra](../../../resources)
- [Konfiguráció és környezetek](../../../resources)
- [Hibaelhárítás](../../../resources)
- [Költségek és számlázás](../../../resources)
- [Legjobb gyakorlatok](../../../resources)
- [Haladó témák](../../../resources)

---

## Első lépések

### K: Mi az az Azure Developer CLI (azd)?
**V**: Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások helyi fejlesztési környezetből az Azure-ba történő eljuttatásának idejét. Sablonokon keresztül biztosítja a legjobb gyakorlatokat, és segíti a teljes telepítési életciklust.

### K: Miben különbözik az azd az Azure CLI-től?
**V**: 
- **Azure CLI**: Általános célú eszköz az Azure erőforrások kezelésére
- **azd**: Fejlesztőközpontú eszköz alkalmazástelepítési munkafolyamatokhoz
- Az azd belsőleg használja az Azure CLI-t, de magasabb szintű absztrakciókat nyújt a gyakori fejlesztési forgatókönyvekhez
- Az azd tartalmaz sablonokat, környezetkezelést és telepítési automatizálást

### K: Szükségem van az Azure CLI telepítésére az azd használatához?
**V**: Igen, az azd az Azure CLI-t használja a hitelesítéshez és néhány művelethez. Először telepítsd az Azure CLI-t, majd az azd-t.

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

### K: Használhatom az azd-t meglévő projektekkel?
**V**: Igen! Két lehetőséged van:
1. Használd az `azd init` parancsot az azd konfiguráció hozzáadásához meglévő projektekhez
2. Igazítsd a meglévő projekteket az azd sablonstruktúrájához
3. Hozz létre egyedi sablonokat a meglévő architektúrád alapján

---

## Hitelesítés és hozzáférés

### K: Hogyan hitelesíthetek az Azure-ban az azd használatával?
**V**: Használd az `azd auth login` parancsot, amely megnyit egy böngészőablakot az Azure hitelesítéshez. CI/CD forgatókönyvekhez használj szolgáltatásneveket vagy kezelt identitásokat.

### K: Használhatom az azd-t több Azure-előfizetéssel?
**V**: Igen. Használd az `azd env set AZURE_SUBSCRIPTION_ID <előfizetés-azonosító>` parancsot, hogy megadd, melyik előfizetést használja az adott környezet.

### K: Milyen jogosultságokra van szükségem az azd telepítéséhez?
**V**: Általában szükséged van:
- **Hozzájáruló** szerepkörre az erőforráscsoporton vagy előfizetésen
- **Felhasználói hozzáférés adminisztrátora** szerepkörre, ha olyan erőforrásokat telepítesz, amelyekhez szerepkör-hozzárendelések szükségesek
- A konkrét jogosultságok a sablontól és a telepített erőforrásoktól függenek

### K: Használhatom az azd-t CI/CD folyamatokban?
**V**: Természetesen! Az azd CI/CD integrációra lett tervezve. Használj szolgáltatásneveket a hitelesítéshez, és állítsd be a környezeti változókat a konfigurációhoz.

### K: Hogyan kezeljem a hitelesítést a GitHub Actions-ben?
**V**: Használd az Azure Login műveletet szolgáltatásnév-hitelesítéssel:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Sablonok és projektek

### K: Hol találhatók az azd sablonok?
**V**: 
- Hivatalos sablonok: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Közösségi sablonok: GitHub keresés "azd-template" kulcsszóra
- Használd az `azd template list` parancsot az elérhető sablonok böngészéséhez

### K: Hogyan hozhatok létre egyedi sablont?
**V**: 
1. Kezdd egy meglévő sablonstruktúrával
2. Módosítsd az `azure.yaml`, infrastruktúra fájlokat és az alkalmazáskódot
3. Teszteld alaposan az `azd up` paranccsal
4. Tedd közzé a GitHubon megfelelő címkékkel

### K: Használhatom az azd-t sablon nélkül?
**V**: Igen, használd az `azd init` parancsot egy meglévő projektben a szükséges konfigurációs fájlok létrehozásához. Manuálisan kell konfigurálnod az `azure.yaml` és infrastruktúra fájlokat.

### K: Mi a különbség a hivatalos és a közösségi sablonok között?
**V**: 
- **Hivatalos sablonok**: Microsoft által karbantartott, rendszeresen frissített, átfogó dokumentációval
- **Közösségi sablonok**: Fejlesztők által készített, speciális felhasználási esetekkel, változó minőséggel és karbantartással

### K: Hogyan frissíthetem a sablont a projektben?
**V**: A sablonok nem frissülnek automatikusan. Az alábbiakat teheted:
1. Kézzel hasonlítsd össze és egyesítsd a változásokat a forrássablonból
2. Kezdd újra az `azd init` paranccsal az új sablon használatával
3. Csak a szükséges fejlesztéseket vedd át a frissített sablonokból

---

## Telepítés és infrastruktúra

### K: Milyen Azure szolgáltatásokat tud az azd telepíteni?
**V**: Az azd bármilyen Azure szolgáltatást telepíthet Bicep/ARM sablonokon keresztül, beleértve:
- App Services, Container Apps, Functions
- Adatbázisok (SQL, PostgreSQL, Cosmos DB)
- Tárhely, Key Vault, Application Insights
- Hálózat, biztonság és monitorozási erőforrások

### K: Telepíthetek több régióba?
**V**: Igen, konfiguráld a Bicep sablonjaidban a több régiót, és állítsd be megfelelően a hely paramétert minden környezethez.

### K: Hogyan kezeljem az adatbázis sémafrissítéseket?
**V**: Használj telepítési horgokat az `azure.yaml` fájlban:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Telepíthetek csak infrastruktúrát alkalmazások nélkül?
**V**: Igen, használd az `azd provision` parancsot, hogy csak az infrastruktúra komponenseket telepítsd.

### K: Hogyan telepíthetek meglévő Azure erőforrásokra?
**V**: Ez összetett és nem közvetlenül támogatott. Az alábbiakat teheted:
1. Importáld a meglévő erőforrásokat a Bicep sablonjaidba
2. Használj meglévő erőforrás hivatkozásokat a sablonokban
3. Módosítsd a sablonokat, hogy feltételesen hozzanak létre vagy hivatkozzanak erőforrásokra

### K: Használhatok Terraformot a Bicep helyett?
**V**: Jelenleg az azd elsősorban a Bicep/ARM sablonokat támogatja. A Terraform támogatása hivatalosan nem érhető el, bár közösségi megoldások létezhetnek.

---

## Konfiguráció és környezetek

### K: Hogyan kezelhetem a különböző környezeteket (fejlesztés, tesztelés, éles)?
**V**: Hozz létre külön környezeteket az `azd env new <környezet-név>` paranccsal, és konfiguráld külön a beállításokat:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Hol tárolódnak a környezetkonfigurációk?
**V**: A projektkönyvtár `.azure` mappájában. Minden környezetnek saját mappája van a konfigurációs fájlokkal.

### K: Hogyan állíthatok be környezet-specifikus konfigurációt?
**V**: Használd az `azd env set` parancsot a környezeti változók beállításához:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Megoszthatom a környezetkonfigurációkat a csapattagokkal?
**V**: A `.azure` mappa érzékeny információkat tartalmaz, ezért ne add hozzá a verziókezeléshez. Ehelyett:
1. Dokumentáld a szükséges környezeti változókat
2. Használj telepítési szkripteket a környezetek beállításához
3. Használj Azure Key Vault-ot az érzékeny konfigurációkhoz

### K: Hogyan írhatom felül a sablon alapértelmezéseit?
**V**: Állítsd be a sablon paramétereinek megfelelő környezeti változókat:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Hibaelhárítás

### K: Miért nem működik az `azd up` parancs?
**V**: Gyakori okok:
1. **Hitelesítési problémák**: Futtasd az `azd auth login` parancsot
2. **Elégtelen jogosultságok**: Ellenőrizd az Azure szerepkör-hozzárendeléseket
3. **Erőforrásnév-ütközések**: Módosítsd az AZURE_ENV_NAME értékét
4. **Kvóta/kapacitás problémák**: Ellenőrizd a regionális elérhetőséget
5. **Sablonhibák**: Ellenőrizd a Bicep sablonokat

### K: Hogyan háríthatom el a telepítési hibákat?
**V**: 
1. Használd az `azd deploy --debug` parancsot a részletes kimenethez
2. Ellenőrizd az Azure portál telepítési előzményeit
3. Nézd meg az Azure portál Tevékenységnaplóját
4. Használd az `azd show` parancsot az aktuális környezet állapotának megjelenítéséhez

### K: Miért nem működnek a környezeti változóim?
**V**: Ellenőrizd:
1. A változónevek pontosan egyeznek a sablon paramétereivel
2. Az értékek megfelelően vannak idézőjelezve, ha szóközt tartalmaznak
3. A megfelelő környezet van kiválasztva: `azd env select <környezet>`
4. A változók a megfelelő környezetben vannak beállítva

### K: Hogyan tisztíthatom meg a sikertelen telepítéseket?
**V**: 
```bash
azd down --force --purge
```
Ez eltávolítja az összes erőforrást és környezetkonfigurációt.

### K: Miért nem érhető el az alkalmazásom a telepítés után?
**V**: Ellenőrizd:
1. A telepítés sikeresen befejeződött
2. Az alkalmazás fut (ellenőrizd a naplókat az Azure portálon)
3. A hálózati biztonsági csoportok engedélyezik a forgalmat
4. A DNS/egyéni domainek megfelelően vannak konfigurálva

---

## Költségek és számlázás

### K: Mennyibe kerülnek az azd telepítések?
**V**: A költségek az alábbiaktól függenek:
- Telepített Azure szolgáltatások
- Szolgáltatási szintek/SKU-k
- Regionális árkülönbségek
- Használati minták

Használd az [Azure Árkalkulátort](https://azure.microsoft.com/pricing/calculator/) becslésekhez.

### K: Hogyan szabályozhatom az azd telepítések költségeit?
**V**: 
1. Használj alacsonyabb szintű SKU-kat fejlesztési környezetekhez
2. Állíts be Azure költségvetéseket és értesítéseket
3. Használd az `azd down` parancsot az erőforrások eltávolításához, ha nincs rájuk szükség
4. Válassz megfelelő régiókat (a költségek helyenként eltérnek)
5. Használd az Azure Költségkezelési eszközöket

### K: Vannak ingyenes szintű lehetőségek az azd sablonokhoz?
**V**: Számos Azure szolgáltatás kínál ingyenes szinteket:
- App Service: Ingyenes szint elérhető
- Azure Functions: 1M ingyenes végrehajtás/hó
- Cosmos DB: Ingyenes szint 400 RU/s kapacitással
- Application Insights: Első 5GB/hó ingyenes

Konfiguráld a sablonokat, hogy az ingyenes szinteket használják, ahol elérhetők.

### K: Hogyan becsülhetem meg a költségeket a telepítés előtt?
**V**: 
1. Nézd át a sablon `main.bicep` fájlját, hogy lásd, milyen erőforrások jönnek létre
2. Használd az Azure Árkalkulátort konkrét SKU-kkal
3. Telepítsd először egy fejlesztési környezetbe, hogy figyeld a valós költségeket
4. Használd az Azure Költségkezelést részletes költségelemzéshez

---

## Legjobb gyakorlatok

### K: Mik a legjobb gyakorlatok az azd projektstruktúrához?
**V**: 
1. Tartsd külön az alkalmazáskódot az
1. Elemezze a jelenlegi telepítési architektúrát  
2. Készítsen megfelelő Bicep sablonokat  
3. Konfigurálja az `azure.yaml` fájlt a jelenlegi szolgáltatásoknak megfelelően  
4. Tesztelje alaposan a fejlesztési környezetben  
5. Fokozatosan migrálja a környezeteket  

---

## Még mindig vannak kérdései?

### **Először keressen**
- Nézze meg az [hivatalos dokumentációt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Keressen hasonló problémákat a [GitHub issues](https://github.com/Azure/azure-dev/issues) oldalon  

### **Kérjen segítséget**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Közösségi támogatás  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technikai kérdések  
- [Azure Discord](https://discord.gg/azure) - Valós idejű közösségi chat  

### **Hibák jelentése**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hibajelentések és funkciókérések  
- Mellékelje a releváns naplókat, hibaüzeneteket és a reprodukálás lépéseit  

### **További információk**
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ez a GYIK rendszeresen frissül. Utolsó frissítés: 2025. szeptember 9.*  

---

**Navigáció**  
- **Előző lecke**: [Szójegyzék](glossary.md)  
- **Következő lecke**: [Tanulmányi útmutató](study-guide.md)  

---

**Felelősségkizárás**:  
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével fordítottuk le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt a professzionális, emberi fordítás igénybevétele. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
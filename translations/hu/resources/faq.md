# Gyakran Ismételt Kérdések (GYIK)

**Segítség fejezetenként**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../README.md)
- **🚆 Telepítési problémák**: [1. fejezet: Telepítés és beállítás](../docs/getting-started/installation.md)
- **🤖 AI kérdések**: [2. fejezet: AI-első fejlesztés](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Hibakeresés**: [7. fejezet: Hibakeresés és hibaelhárítás](../docs/troubleshooting/common-issues.md)

## Bevezetés

Ez az átfogó GYIK választ ad a leggyakoribb kérdésekre az Azure Developer CLI (azd) és az Azure telepítések kapcsán. Gyors megoldásokat találhatsz gyakori problémákra, megértheted a legjobb gyakorlatokat, és tisztázhatod az azd fogalmakat és munkafolyamatokat.

## Tanulási célok

A GYIK áttekintésével:
- Gyors válaszokat találhatsz az Azure Developer CLI-vel kapcsolatos kérdésekre és problémákra
- Gyakorlati kérdés-válasz formában megértheted a kulcsfogalmakat és terminológiát
- Hibaelhárítási megoldásokat érhetsz el gyakori problémák és hibák esetén
- Megismerheted a legjobb gyakorlatokat az optimalizálás kapcsán
- Felfedezheted az azd fejlett funkcióit és képességeit szakértői szintű kérdések révén
- Hatékonyan hivatkozhatsz költség-, biztonsági és telepítési stratégiákra vonatkozó útmutatásokra

## Tanulási eredmények

A GYIK rendszeres használatával képes leszel:
- Önállóan megoldani az Azure Developer CLI-vel kapcsolatos gyakori problémákat a megadott megoldások segítségével
- Megalapozott döntéseket hozni a telepítési stratégiákról és konfigurációkról
- Megérteni az azd és más Azure eszközök és szolgáltatások közötti kapcsolatot
- Alkalmazni a közösségi tapasztalatok és szakértői ajánlások alapján kialakított legjobb gyakorlatokat
- Hatékonyan hibaelhárítani az autentikációval, telepítéssel és konfigurációval kapcsolatos problémákat
- Optimalizálni a költségeket és teljesítményt a GYIK által nyújtott betekintések és ajánlások alapján

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

### K: Mi az Azure Developer CLI (azd)?
**V**: Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazás helyi fejlesztési környezetből Azure-ba történő eljuttatásának idejét. Sablonokon keresztül biztosítja a legjobb gyakorlatokat, és segít a teljes telepítési életciklusban.

### K: Miben különbözik az azd az Azure CLI-től?
**V**: 
- **Azure CLI**: Általános célú eszköz Azure erőforrások kezelésére
- **azd**: Fejlesztőközpontú eszköz alkalmazástelepítési munkafolyamatokhoz
- Az azd belsőleg használja az Azure CLI-t, de magasabb szintű absztrakciókat kínál gyakori fejlesztési forgatókönyvekhez
- Az azd tartalmaz sablonokat, környezetkezelést és telepítési automatizálást

### K: Szükséges az Azure CLI telepítése az azd használatához?
**V**: Igen, az azd az Azure CLI-t használja hitelesítéshez és bizonyos műveletekhez. Először telepítsd az Azure CLI-t, majd az azd-t.

### K: Milyen programozási nyelveket támogat az azd?
**V**: Az azd nyelvfüggetlen. Támogatja:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statikus weboldalak
- Konténeres alkalmazások

### K: Használhatom az azd-t meglévő projektekkel?
**V**: Igen! Két lehetőséged van:
1. Használd az `azd init` parancsot az azd konfiguráció hozzáadásához meglévő projektekhez
2. Alakítsd át meglévő projektjeidet az azd sablonstruktúrájának megfelelően
3. Hozz létre egyedi sablonokat meglévő architektúrád alapján

---

## Hitelesítés és hozzáférés

### K: Hogyan hitelesíthetek az Azure-ban az azd segítségével?
**V**: Használd az `azd auth login` parancsot, amely megnyit egy böngészőablakot az Azure hitelesítéshez. CI/CD forgatókönyvekhez használj szolgáltatásneveket vagy kezelt identitásokat.

### K: Használhatom az azd-t több Azure előfizetéssel?
**V**: Igen. Használd az `azd env set AZURE_SUBSCRIPTION_ID <előfizetés-azonosító>` parancsot, hogy megadd, melyik előfizetést használja az adott környezet.

### K: Milyen jogosultságokra van szükségem az azd telepítéséhez?
**V**: Általában szükséged van:
- **Hozzájáruló** szerepkörre az erőforráscsoporton vagy előfizetésen
- **Felhasználói hozzáférés adminisztrátora** szerepkörre, ha olyan erőforrásokat telepítesz, amelyekhez szerepkör-hozzárendelés szükséges
- A konkrét jogosultságok a sablontól és a telepített erőforrásoktól függnek

### K: Használhatom az azd-t CI/CD csővezetékekben?
**V**: Természetesen! Az azd CI/CD integrációra lett tervezve. Használj szolgáltatásneveket hitelesítéshez, és állítsd be a környezeti változókat konfigurációhoz.

### K: Hogyan kezeljem a hitelesítést GitHub Actions-ben?
**V**: Használd az Azure Login akciót szolgáltatásnév hitelesítési adatokkal:
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
2. Módosítsd az `azure.yaml`, infrastruktúra fájlokat és alkalmazáskódot
3. Teszteld alaposan az `azd up` parancs segítségével
4. Publikáld GitHub-ra megfelelő címkékkel

### K: Használhatom az azd-t sablon nélkül?
**V**: Igen, használd az `azd init` parancsot egy meglévő projektben a szükséges konfigurációs fájlok létrehozásához. Manuálisan kell konfigurálnod az `azure.yaml` és infrastruktúra fájlokat.

### K: Mi a különbség a hivatalos és közösségi sablonok között?
**V**: 
- **Hivatalos sablonok**: Microsoft által karbantartott, rendszeresen frissített, átfogó dokumentációval
- **Közösségi sablonok**: Fejlesztők által készített, lehetnek speciális felhasználási esetek, változó minőség és karbantartás

### K: Hogyan frissíthetem a sablont a projektben?
**V**: A sablonok nem frissülnek automatikusan. Lehetőségek:
1. Kézzel összehasonlíthatod és egyesítheted a változásokat a forrás sablonból
2. Újraindíthatod az `azd init` parancsot az új sablonnal
3. Kiválaszthatod az új sablonok konkrét fejlesztéseit

---

## Telepítés és infrastruktúra

### K: Milyen Azure szolgáltatásokat tud az azd telepíteni?
**V**: Az azd bármilyen Azure szolgáltatást telepíthet Bicep/ARM sablonokon keresztül, beleértve:
- App Services, Container Apps, Functions
- Adatbázisok (SQL, PostgreSQL, Cosmos DB)
- Tárhely, Key Vault, Application Insights
- Hálózat, biztonság és monitorozási erőforrások

### K: Telepíthetek több régióba?
**V**: Igen, konfiguráld a Bicep sablonjaidat több régióval, és állítsd be megfelelően a hely paramétert minden környezethez.

### K: Hogyan kezeljem az adatbázis séma migrációkat?
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
**V**: Igen, használd az `azd provision` parancsot, hogy csak az infrastruktúra elemeket telepítsd, amelyeket a sablonok definiálnak.

### K: Hogyan telepíthetek meglévő Azure erőforrásokra?
**V**: Ez összetett és nem közvetlenül támogatott. Lehetőségek:
1. Importáld a meglévő erőforrásokat a Bicep sablonjaidba
2. Használj meglévő erőforrás hivatkozásokat a sablonokban
3. Módosítsd a sablonokat, hogy feltételesen hozzanak létre vagy hivatkozzanak erőforrásokra

### K: Használhatok Terraformot Bicep helyett?
**V**: Jelenleg az azd elsősorban Bicep/ARM sablonokat támogat. A Terraform támogatás hivatalosan nem elérhető, bár közösségi megoldások létezhetnek.

---

## Konfiguráció és környezetek

### K: Hogyan kezeljem a különböző környezeteket (fejlesztés, tesztelés, éles)?
**V**: Hozz létre külön környezeteket az `azd env new <környezet-név>` parancs segítségével, és konfiguráld különböző beállításokat mindegyikhez:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Hol tárolódnak a környezetkonfigurációk?
**V**: A projektkönyvtár `.azure` mappájában. Minden környezetnek saját mappája van konfigurációs fájlokkal.

### K: Hogyan állítsak be környezet-specifikus konfigurációt?
**V**: Használd az `azd env set` parancsot környezeti változók konfigurálásához:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Megoszthatom a környezetkonfigurációkat csapattagokkal?
**V**: A `.azure` mappa érzékeny információkat tartalmaz, és nem szabad verziókezelésbe elkötelezni. Ehelyett:
1. Dokumentáld a szükséges környezeti változókat
2. Használj telepítési szkripteket a környezetek beállításához
3. Használj Azure Key Vault-ot érzékeny konfigurációhoz

### K: Hogyan írhatom felül a sablon alapértelmezéseit?
**V**: Állítsd be a sablon paramétereknek megfelelő környezeti változókat:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Hibaelhárítás

### K: Miért sikertelen az `azd up` parancs?
**V**: Gyakori okok:
1. **Hitelesítési problémák**: Futtasd az `azd auth login` parancsot
2. **Elégtelen jogosultságok**: Ellenőrizd az Azure szerepkör-hozzárendeléseket
3. **Erőforrás névütközések**: Módosítsd az AZURE_ENV_NAME értékét
4. **Kvóta/kapacitás problémák**: Ellenőrizd a regionális elérhetőséget
5. **Sablonhibák**: Érvényesítsd a Bicep sablonokat

### K: Hogyan hibakereshetem a telepítési hibákat?
**V**: 
1. Használd az `azd deploy --debug` parancsot részletes kimenethez
2. Ellenőrizd az Azure portál telepítési előzményeit
3. Tekintsd meg az Azure portál tevékenységnaplóját
4. Használd az `azd show` parancsot az aktuális környezet állapotának megjelenítéséhez

### K: Miért nem működnek a környezeti változóim?
**V**: Ellenőrizd:
1. A változónevek pontosan egyeznek a sablon paraméterekkel
2. Az értékek megfelelően idézőjelezve vannak, ha szóközt tartalmaznak
3. A környezet ki van választva: `azd env select <környezet>`
4. A változók a megfelelő környezetben vannak beállítva

### K: Hogyan tisztítsam meg a sikertelen telepítéseket?
**V**: 
```bash
azd down --force --purge
```
Ez eltávolítja az összes erőforrást és környezetkonfigurációt.

### K: Miért nem érhető el az alkalmazásom telepítés után?
**V**: Ellenőrizd:
1. A telepítés sikeresen befejeződött
2. Az alkalmazás fut (ellenőrizd a naplókat az Azure portálon)
3. A hálózati biztonsági csoportok engedik a forgalmat
4. A DNS/egyedi domainek megfelelően vannak konfigurálva

---

## Költségek és számlázás

### K: Mennyibe kerülnek az azd telepítések?
**V**: A költségek függnek:
- A telepített Azure szolgáltatásoktól
- A szolgáltatási szintektől/SKU-któl
- Regionális árkülönbségektől
- Használati mintáktól

Használd az [Azure Árkalkulátort](https://azure.microsoft.com/pricing/calculator/) becslésekhez.

### K: Hogyan kontrollálhatom az azd telepítések költségeit?
**V**: 
1. Használj alacsonyabb szintű SKU-kat fejlesztési környezetekhez
2. Állíts be Azure költségkereteket és értesítéseket
3. Használd az `azd down` parancsot az erőforrások eltávolításához, amikor nincs rájuk szükség
4. Válassz megfelelő régiókat (a költségek helyenként eltérőek)
5. Használd az Azure Költségkezelési eszközöket

### K: Vannak ingyenes szintű opciók az azd sablonokhoz?
**V**: Számos Azure szolgáltatás kínál ingyenes szintet:
- App Service: Ingyenes szint elérhető
- Azure Functions: Havonta 1M ingyenes végrehajtás
- Cosmos DB: Ingyenes szint 400 RU/s kapacitással
- Application Insights: Havonta az első 5GB ingyenes

Konfiguráld a sablonokat, hogy az ingyenes szinteket használják, ahol elérhető.

### K: Hogyan becsülhetem meg a költségeket telepítés előtt?
**V**: 
1. Tekintsd át a sablon `main.bicep` fájlját
2. **Sablonok**: Készíts sablonokat a [sablon irányelvek](https://github.com/Azure-Samples/awesome-azd) alapján  
3. **Dokumentáció**: Járulj hozzá a dokumentációhoz itt: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### K: Mi az azd ütemterve?  
**V**: Nézd meg az [hivatalos ütemtervet](https://github.com/Azure/azure-dev/projects) a tervezett funkciók és fejlesztések listájáért.  

### K: Hogyan migrálhatok más telepítési eszközökről az azd-re?  
**V**:  
1. Elemezd a jelenlegi telepítési architektúrát  
2. Készíts egyenértékű Bicep sablonokat  
3. Konfiguráld az `azure.yaml` fájlt, hogy illeszkedjen a jelenlegi szolgáltatásokhoz  
4. Teszteld alaposan a fejlesztési környezetben  
5. Fokozatosan migráld a környezeteket  

---

## Még mindig vannak kérdéseid?  

### **Először keress rá**  
- Nézd meg az [hivatalos dokumentációt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Keress hasonló problémákat a [GitHub issues](https://github.com/Azure/azure-dev/issues) között  

### **Kérj segítséget**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Közösségi támogatás  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technikai kérdések  
- [Azure Discord](https://discord.gg/azure) - Valós idejű közösségi chat  

### **Jelents problémákat**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hibajelentések és funkciókérések  
- Mellékeld a releváns naplókat, hibaüzeneteket és a reprodukálás lépéseit  

### **Tudj meg többet**  
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ez a GYIK rendszeresen frissül. Utolsó frissítés: 2025. szeptember 9.*  

---

**Navigáció**  
- **Előző lecke**: [Szószedet](glossary.md)  
- **Következő lecke**: [Tanulmányi útmutató](study-guide.md)  

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
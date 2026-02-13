# Sageli Küsitud Küsimused (KKK)

**Abi peatükkide kaupa**
- **📚 Kursuse koduleht**: [AZD algajatele](../README.md)
- **🚆 Paigaldusprobleemid**: [1. peatükk: paigaldus ja seadistamine](../docs/getting-started/installation.md)
- **🤖 Tehisintellekti küsimused**: [2. peatükk: AI-esimese arendamine](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Tõrkeotsing**: [7. peatükk: tõrkeotsing ja silumine](../docs/troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik KKK annab vastused kõige sagedasematele Azure Developer CLI (azd) ja Azure juurutustega seotud küsimustele. Leia kiireid lahendusi levinud probleemidele, mõista parimaid praktikaid ning saa selgust azd mõistete ja tööprotsesside osas.

## Õppe eesmärgid

Selle KKK läbi vaatades:
- Leiad kiireid vastuseid Azure Developer CLI sagedastele küsimustele ja probleemidele
- Mõistad põhikontseptsioone ja termineid praktilise Q&A formaadis
- Saad ligipääsu tõrkeotsingu lahendustele sagedastele vigadele ja probleemidele
- Õpid parimaid praktikaid optimeerimise valdkonnas enamlevinud küsimuste põhjal
- Avastad edasijõudnute taseme funktsioone ja võimeid ekspertküsimuste kaudu
- Saad efektiivseid viiteid kulude, turvalisuse ja juurutusstrateegiate juhendamiseks

## Õpitulemused

Korrapäraselt sellele KKK-le viidates suudad sa:
- Iseseisvalt lahendada Azure Developer CLI üldiseid probleeme pakutud lahenduste abil
- Teha informeeritud otsuseid juurutusstrateegiate ja konfiguratsioonide osas
- Mõista seost azd ja teiste Azure tööriistade ning teenuste vahel
- Rakendada parimaid praktikaid vastavalt kogukonna kogemusele ja ekspertide soovitustele
- Efektiivselt tõrkeotsinguid teha autentimise, juurutuse ja seadistuse probleemide korral
- Optimeerida kulusid ja jõudlust kasutades KKK infot ja soovitusi

## Sisukord

- [Alustamine](../../../resources)
- [Autentimine ja Ligipääs](../../../resources)
- [Mallid ja Projektid](../../../resources)
- [Juurutus ja Taristu](../../../resources)
- [Seadistamine ja Keskkonnad](../../../resources)
- [Tõrkeotsing](../../../resources)
- [Kulud ja Arveldus](../../../resources)
- [Parimad Praktikad](../../../resources)
- [Edasijõudnud Teemad](../../../resources)

---

## Alustamine

### K: Mis on Azure Developer CLI (azd)?
**V**: Azure Developer CLI (azd) on arendajasõbralik käsureatööriist, mis kiirendab sinu rakenduse jõudmist lokaalsest arenduskeskkonnast Azure'i. See pakub parimaid praktikaid mallide kaudu ja aitab kogu juurutustsükli vältel.

### K: Kuidas erineb azd Azure CLI-st?
**V**: 
- **Azure CLI**: Üldotstarbeline tööriist Azure ressursside haldamiseks
- **azd**: Arendajale suunatud tööriist rakenduste juurutuse töövoogude jaoks
- azd kasutab sisemiselt Azure CLI-d, kuid pakub kõrgema taseme abstraktsioone tavapäraste arendusstsenaariumite jaoks
- azd sisaldab malle, keskkondade haldust ja juurutuse automatiseerimist

### K: Kas azd kasutamiseks peab Azure CLI olema installitud?
**V**: Jah, azd vajab autentimiseks ja mõnedeks toiminguteks Azure CLI-d. Paigalda esmalt Azure CLI, seejärel azd.

### K: Milliseid programmeerimiskeeli azd toetab?
**V**: azd ei ole keeltesõltuv. Toetatud on:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Staatilised veebilehed
- Konteineritud rakendused

### K: Kas ma saan kasutada azd olemasolevate projektidega?
**V**: Jah! Võid kas:
1. Kasutada `azd init`, et lisada azd konfiguratsioon olemasolevatesse projektidesse
2. Kohandada olemasolevaid projekte, et sobitada azd malli struktuuriga
3. Luua kohandatud malle oma olemasoleva arhitektuuri põhjal

---

## Autentimine ja Ligipääs

### K: Kuidas azd-ga Azure'i autentida?
**V**: Kasuta käsku `azd auth login`, mis avab brauseriakna Azure'i autentimiseks. CI/CD stsenaariumite korral kasuta teenusprincipaale või hallatud identiteete.

### K: Kas azd saab kasutada mitme Azure tellimusega?
**V**: Jah. Kasuta käsku `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, et määrata iga keskkonna jaoks sobiv tellimus.

### K: Milliseid õiguseid on azd-ga juurutamiseks vaja?
**V**: Tavaliselt on vaja:
- **Contributor** rolli ressursside grupis või tellimuses
- **User Access Administrator** rolli, kui juurutatakse ressursse, mis vajavad rolli määramist
- Konkreetseid õiguseid nõuab mall ning juurutatud ressursid

### K: Kas azd-d saab kasutada CI/CD torujuhtmetes?
**V**: Absoluutselt! azd on loodud CI/CD süsteemidega integreerimiseks. Kasuta autentimiseks teenusprincipaale ja seadista konfiguratsiooni keskkonnamuutujate kaudu.

### K: Kuidas toimida autentimisega GitHub Actionsis?
**V**: Kasuta Azure Login actionit teenusprinstriandi volitustega:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mallid ja Projektid

### K: Kus ma leian azd malle?
**V**: 
- Ametlikud mallid: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Kogukonna mallid: otsi GitHubist "azd-template"
- Kasuta `azd template list`, et vaadata saadaolevaid malle

### K: Kuidas luua kohandatud mall?
**V**: 
1. Alusta olemasoleva malli struktuurist
2. Muuda `azure.yaml`, taristu faile ja rakenduse koodi
3. Testi põhjalikult käsuga `azd up`
4. Avalda GitHubis koos sobivate siltidega

### K: Kas ma saan kasutada azd-d malli ilma?
**V**: Jah, kasuta `azd init` olemasolevas projektis vajalike konfiguratsioonifailide loomiseks. Sa pead käsitsi seadistama `azure.yaml` ja taristufailid.

### K: Mis vahe on ametlikel ja kogukonna mallidel?
**V**: 
- **Ametlikud mallid**: Microsofti hallatavad, regulaarselt uuendatud, põhjalik dokumentatsioon
- **Kogukonna mallid**: Arendajate loodud, võivad olla spetsiifilisemate kasutusjuhtumitega, kvaliteet ja hooldus varieeruvad

### K: Kuidas uuendada malli oma projektis?
**V**: Mallid ei uuene automaatselt. Võid:
1. Käsi võrrelda ja ühendada muudatusi allikmalliga
2. Alustada uuesti käsuga `azd init`, kasutades uuendatud malli
3. Valikuliselt rakendada konkreetseid täiustusi uuendatud mallidest

---

## Juurutus ja Taristu

### K: Milliseid Azure teenuseid azd saab juurutada?
**V**: azd saab juurutada kõiki Azure teenuseid Bicep/ARM mallide kaudu, sh:
- App Services, Container Apps, Functions
- Andmebaasid (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Võrgustik, turvalisus ja monitooringu ressursid

### K: Kas saan juurutada mitmesse piirkonda?
**V**: Jah, seadista mitu piirkonda oma Bicep mallides ja määra parameeter location vastavalt keskkonnale.

### K: Kuidas lahendada andmebaasi skeemi migratsioone?
**V**: Kasuta juurutuse konksusid `azure.yaml` failis:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Kas saan juurutada ainult taristu ilma rakendusteta?
**V**: Jah, kasuta `azd provision` ainult taristu komponentide juurutamiseks, mis on defineeritud mallides.

### K: Kuidas juurutada olemasolevatele Azure ressurssidele?
**V**: See on keeruline ja mitte otseselt toetatud. Võid:
1. Impordida olemasolevad ressursid oma Bicep mallidesse
2. Kasutada malli olemasolevate ressursside viiteid
3. Muuta malle tingimuslikuks ressursside loomise või viitamise jaoks

### K: Kas ma saan kasutada Terraformi Bicep asemel?
**V**: Praegu toetab azd peamiselt Bicep/ARM malle. Terraformi toe ametlik puudumine, kuigi kogukonnal võivad olla lahendused.

---

## Seadistamine ja Keskkonnad

### K: Kuidas hallata erinevaid keskkondi (dev, staging, prod)?
**V**: Loo eraldi keskkonnad käsuga `azd env new <keskkonna_nimi>` ja seadista igaühele erinevad sätted:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Kus asuvad keskkondade konfiguratsioonid?
**V**: Projekti kaustas `.azure` kaustas. Igal keskkonnal on oma kaust konfiguratsioonifailidega.

### K: Kuidas seada keskkonnipõhiseid konfiguratsioone?
**V**: Kasuta `azd env set` keskkonnamuutujate seadistamiseks:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Kas keskkonnapäringuid saab jagada meeskonnaliikmete vahel?
**V**: `.azure` kaust sisaldab tundlikku infot ja seda ei tohiks versioonihaldusesse panna. Selle asemel:
1. Dokumenteeri vajalikud keskkonnamuutujad
2. Kasuta juurutusskripte keskkondade seadistamiseks
3. Kasuta Azure Key Vaulti tundliku konfiguratsiooni jaoks

### K: Kuidas ületada mallide vaikeväärtusi?
**V**: Sea keskkonnamuutujad, mis vastavad malliparameetritele:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Tõrkeotsing

### K: Miks `azd up` ebaõnnestub?
**V**: Levinumad põhjused:
1. **Autentimise probleemid**: Käivita `azd auth login`
2. **Ebapiisavad õigused**: Kontrolli Azure rollimäärajate seadeid
3. **Ressursside nimede konfliktid**: Muuda AZURE_ENV_NAME väärtust
4. **Kvoodi/mahu probleemid**: Kontrolli piirkondlikku saadavust
5. **Mallide vead**: Kontrolli Bicep mallide korrektseid valideerimisi

### K: Kuidas siluda juurutuse ebaõnnestumisi?
**V**: 
1. Kasuta `azd deploy --debug` detailsemaks väljundiks
2. Vaata Azure portaalis juurutuse ajalugu
3. Sirvi tegevuste logi Azure portaali kaudu
4. Kasuta `azd show`, et kuvada praeguse keskkonna seisundit

### K: Miks minu keskkonnamuutujad ei toimi?
**V**: Kontrolli:
1. Muutujate nimed peavad täpselt vastama malliparameetritele
2. Väärtused peavad olema korrektselt tsiteeritud, kui need sisaldavad tühikuid
3. On valitud õige keskkond: `azd env select <keskkond>`
4. Muutujad on seadmest sobivas keskkonnas

### K: Kuidas puhastada ebaõnnestunud juurutusi?
**V**: 
```bash
azd down --force --purge
```
See eemaldab kõik ressursid ja keskkonna konfiguratsiooni.

### K: Miks minu rakendus pole pärast juurutust kättesaadav?
**V**: Kontrolli:
1. Juurutus lõppes edukalt
2. Rakendus töötab (kontrolli logisid Azure portaali kaudu)
3. Võrgu turvarühmad lubavad liiklust
4. DNS/kohandatud domeenid on õigesti konfigureeritud

---

## Kulud ja Arveldus

### K: Kui palju maksavad azd juurutused?
**V**: Kulud sõltuvad:
- Juhtutatud Azure teenustest
- Valitud teenuse tasemest/SKUdest
- Piirkondlikest hinnavahedest
- Kasutusmustritest

Kasutage [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) hinnangu saamiseks.

### K: Kuidas kontrollida kulusid azd juurutustel?
**V**: 
1. Kasuta arenduskeskkondades madalama taseme SKU-sid
2. Seadista Azure eelarved ja hoiatused
3. Kasuta `azd down` mittevajalikeks ressursside eemaldamiseks
4. Valige sobivad piirkonnad (kulud piirkonniti erinevad)
5. Kasuta Azure Cost Management tööriistu

### K: Kas azd mallidele on saadaval tasuta tasemed?
**V**: Paljud Azure teenused pakuvad tasuta tasemeid:
- App Service: tasuta tase olemas
- Azure Functions: 1M tasuta käivitust kuus
- Cosmos DB: tasuta tase 400 RU/s
- Application Insights: esimesed 5GB kuus tasuta

Seadista mallid tasuta tasemete kasutamiseks, kus võimalik.

### K: Kuidas hinnata kulusid enne juurutust?
**V**: 
1. Vaata malli `main.bicep` faili, et näha, milliseid ressursse luuakse
2. Kasuta Azure Pricing Calculator kindlate SKU-dega
3. Juuruta esmalt arenduskeskkonda, et jälgida tegelikke kulusid
4. Kasuta Azure Cost Management detailseks kulude analüüsiks

---

## Parimad Praktikad

### K: Millised on parimad praktikad azd projekti struktuuri jaoks?
**V**: 
1. Hoia rakenduse kood eraldi taristust
2. Kasuta `azure.yaml` failis tähenduslikke teenusenimesid
3. Rakenda vigade korrektne käsitlemine build-skriptides
4. Kasuta keskkonnapõhist konfiguratsiooni
5. Lisa põhjalik dokumentatsioon

### K: Kuidas organiseerida mitut teenust azd's?
**V**: Kasuta soovitatud struktuuri:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Kas ma peaksin `.azure` kausta versioonihaldusse panema?
**V**: **Ei!** `.azure` kaust sisaldab tundlikku infot. Lisa ta `.gitignore` faili:
```gitignore
.azure/
```

### K: Kuidas käituda saladuste ja tundliku konfiguratsiooniga?
**V**: 
1. Kasuta saladuste haldamiseks Azure Key Vaulti
2. Viita Key Vaulti saladustele rakenduse konfiguratsioonis
3. Ära kunagi pane saladusi versioonihaldusse
4. Kasuta teenuste autentimiseks hallatud identiteete

### K: Milline on soovituslik lähenemine CI/CD-le azd-s?
**V**: 
1. Kasuta iga etapi (dev/staging/prod) jaoks eraldi keskkondi
2. Rakenda automatiseeritud testimist enne juurutust
3. Kasuta autentimiseks teenusprincipaale
4. Hoia tundlik konfiguratsioon torujuhtme saladustes/muutujates
5. Rakenda heakskiidu väravaid tootmisele juurutamisel

---

## Edasijõudnud Teemad

### K: Kas ma saan laiendada azd-d kohandatud funktsionaalsusega?
**V**: Jah, `azure.yaml` failis juurutuse konksude kaudu:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Kuidas integreerida azd olemasolevate DevOps protsessidega?
**V**: 
1. Kasuta azd käske olemasolevates pipeline skriptides
2. Standardiseeri azd mallid meeskondade vahel
3. Integreeri olemasoleva monitooringu ja alarmide süsteemiga
4. Kasuta azd JSON väljundit torujuhtme integratsiooniks

### K: Kas azd-d saab kasutada Azure DevOpsiga?
**V**: Jah, azd töötab iga CI/CD süsteemiga. Loo Azure DevOps torujuhtmed, mis kasutavad azd käske.

### K: Kuidas panustada azd arendusse või luua kogukonna malle?
**V**: 
1. **azd tööriist**: Panusta aadressil [Azure/azure-dev](https://github.com/Azure/azure-dev)  
2. **Mallid**: Loo malle järgides [mallide juhendeid](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentatsioon**: Panusta dokumentatsiooni aadressil [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### K: Milline on azd arengukava?  
**V**: Vaata [ametlikku arengukava](https://github.com/Azure/azure-dev/projects), et näha planeeritud funktsioone ja täiustusi.  

### K: Kuidas ma migreerin teistest paigaldustööriistadest azd-le?  
**V**:  
1. Analüüsi praegust paigaldusarhitektuuri  
2. Loo ekvivalentne Bicep mall  
3. Konfigureeri `azure.yaml` sobivaks praeguste teenustega  
4. Testi põhjalikult arenduskeskkonnas  
5. Migreeri järk-järgult keskkonnad  

---

## Kas Sul on endiselt küsimusi?

### **Otsi esmalt**  
- Vaata [ametlikku dokumentatsiooni](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Otsi sarnaseid probleeme [GitHub'i probleemidest](https://github.com/Azure/azure-dev/issues)  

### **Saada abi**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) – Ühiskondlik tugi  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) – Tehnilised küsimused  
- [Azure Discord](https://discord.gg/azure) – Otseühendus kogukonnaga  

### **Teata probleemidest**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) – Veaaruanded ja uute funktsioonide ettepanekud  
- Lisa asjakohased logid, veateated ja sammud vea kordamiseks  

### **Õpi rohkem**  
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure hästi arhitektuuri juhend](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Seda korduma kippuvate küsimuste nimekirja uuendatakse regulaarselt. Viimane uuendus: 9. september 2025*  

---

**Navigatsioon**  
- **Eelmine peatükk**: [Terminid](glossary.md)  
- **Järgmine peatükk**: [Õpijuhend](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüdleme täpsuse poole, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse ega valesti mõistmise eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
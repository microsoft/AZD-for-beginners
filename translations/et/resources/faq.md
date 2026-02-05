# Korduma kippuvad küsimused (KKK)

**Abi saamine peatükkide kaupa**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **🚆 Paigaldusprobleemid**: [Peatükk 1: Paigaldus ja seadistamine](../docs/getting-started/installation.md)
- **🤖 AI küsimused**: [Peatükk 2: AI-põhine arendus](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Tõrkeotsing**: [Peatükk 7: Tõrkeotsing ja silumine](../docs/troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik KKK annab vastused kõige levinumatele küsimustele Azure Developer CLI (azd) ja Azure'i juurutuste kohta. Leia kiireid lahendusi tavaprobleemidele, mõista parimaid praktikaid ja saa selgust azd kontseptsioonide ja töövoogude osas.

## Õppimise eesmärgid

Selle KKK ülevaatamisega saad:
- Leida kiireid vastuseid tavapärastele Azure Developer CLI küsimustele ja probleemidele
- Mõista olulisi kontseptsioone ja terminoloogiat praktilise küsimuste-vastuste formaadi kaudu
- Juurdepääsu tõrkeotsingu lahendustele sagedaste probleemide ja veastsenaariumide korral
- Õppida parimaid praktikaid optimeerimise kohta levinud küsimuste kaudu
- Avastada edasijõudnud funktsioone ja võimalusi ekspertide tasemel küsimuste kaudu
- Viidata kulude, turvalisuse ja juurutusstrateegia juhistele tõhusalt

## Õpitulemused

Selle KKK regulaarse kasutamisega suudad:
- Lahendada tavapäraseid Azure Developer CLI probleeme iseseisvalt, kasutades pakutud lahendusi
- Teha teadlikke otsuseid juurutusstrateegiate ja konfiguratsioonide kohta
- Mõista azd ja teiste Azure'i tööriistade ja teenuste vahelist seost
- Rakendada parimaid praktikaid, mis põhinevad kogukonna kogemustel ja ekspertide soovitustel
- Tõrkeotsingut teha autentimise, juurutuse ja konfiguratsiooniprobleemide korral tõhusalt
- Optimeerida kulusid ja jõudlust, kasutades KKK teadmisi ja soovitusi

## Sisukord

- [Alustamine](../../../resources)
- [Autentimine ja juurdepääs](../../../resources)
- [Mallid ja projektid](../../../resources)
- [Juurutus ja infrastruktuur](../../../resources)
- [Konfiguratsioon ja keskkonnad](../../../resources)
- [Tõrkeotsing](../../../resources)
- [Kulud ja arveldus](../../../resources)
- [Parimad praktikad](../../../resources)
- [Edasijõudnud teemad](../../../resources)

---

## Alustamine

### Q: Mis on Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) on arendajakeskne käsurea tööriist, mis kiirendab rakenduse viimist kohalikust arenduskeskkonnast Azure'i. See pakub parimaid praktikaid mallide kaudu ja aitab kogu juurutustsüklis.

### Q: Kuidas erineb azd Azure CLI-st?
**A**: 
- **Azure CLI**: Üldotstarbeline tööriist Azure'i ressursside haldamiseks
- **azd**: Arendajatele suunatud tööriist rakenduste juurutusvoogude jaoks
- azd kasutab Azure CLI-d sisemiselt, kuid pakub kõrgema taseme abstraktsioone tavapäraste arendussenaariumide jaoks
- azd sisaldab malle, keskkonnahaldust ja juurutuse automatiseerimist

### Q: Kas azd kasutamiseks on vaja Azure CLI-d?
**A**: Jah, azd vajab Azure CLI-d autentimiseks ja mõnede toimingute jaoks. Paigalda esmalt Azure CLI, seejärel azd.

### Q: Milliseid programmeerimiskeeli azd toetab?
**A**: azd on keeleagnostiline. See töötab:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Staatilised veebilehed
- Konteineripõhised rakendused

### Q: Kas saan kasutada azd-d olemasolevate projektidega?
**A**: Jah! Sa saad:
1. Kasutada `azd init`, et lisada azd konfiguratsioon olemasolevatele projektidele
2. Kohandada olemasolevaid projekte, et need vastaksid azd mallistruktuurile
3. Luua kohandatud malle, mis põhinevad sinu olemasoleval arhitektuuril

---

## Autentimine ja juurdepääs

### Q: Kuidas autentida Azure'is azd abil?
**A**: Kasuta `azd auth login`, mis avab brauseriakna Azure'i autentimiseks. CI/CD stsenaariumide jaoks kasuta teenusepõhimõtteid või hallatud identiteete.

### Q: Kas azd-d saab kasutada mitme Azure'i tellimusega?
**A**: Jah. Kasuta `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, et määrata, millist tellimust iga keskkonna jaoks kasutada.

### Q: Milliseid õigusi on vaja azd abil juurutamiseks?
**A**: Tavaliselt on vaja:
- **Kaastöötaja** rolli ressursigrupil või tellimusel
- **Kasutaja juurdepääsu administraator**, kui juurutatakse ressursse, mis vajavad rollide määramist
- Spetsiifilised õigused sõltuvad mallist ja juurutatavatest ressurssidest

### Q: Kas azd-d saab kasutada CI/CD torujuhtmetes?
**A**: Absoluutselt! azd on loodud CI/CD integratsiooniks. Kasuta autentimiseks teenusepõhimõtteid ja seadista keskkonnamuutujad konfiguratsiooniks.

### Q: Kuidas hallata autentimist GitHub Actionsis?
**A**: Kasuta Azure Login actionit teenusepõhimõtte mandaadiga:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mallid ja projektid

### Q: Kust leida azd malle?
**A**: 
- Ametlikud mallid: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Kogukonna mallid: GitHubi otsing "azd-template"
- Kasuta `azd template list`, et sirvida saadaolevaid malle

### Q: Kuidas luua kohandatud malli?
**A**: 
1. Alusta olemasoleva mallistruktuuriga
2. Muuda `azure.yaml`, infrastruktuurifaile ja rakenduse koodi
3. Testi põhjalikult `azd up` abil
4. Avalda GitHubis sobivate siltidega

### Q: Kas azd-d saab kasutada ilma mallita?
**A**: Jah, kasuta `azd init` olemasolevas projektis, et luua vajalikud konfiguratsioonifailid. Pead käsitsi seadistama `azure.yaml` ja infrastruktuurifailid.

### Q: Mis vahe on ametlikel ja kogukonna mallidel?
**A**: 
- **Ametlikud mallid**: Microsofti hallatud, regulaarselt uuendatud, põhjalik dokumentatsioon
- **Kogukonna mallid**: Arendajate loodud, võivad olla spetsialiseeritud kasutusjuhtumid, erinev kvaliteet ja hooldus

### Q: Kuidas uuendada malli oma projektis?
**A**: Mallid ei uuene automaatselt. Sa saad:
1. Käsitsi võrrelda ja ühendada muudatusi algmallist
2. Alustada uuesti `azd init` abil, kasutades uuendatud malli
3. Valikuliselt lisada konkreetseid täiustusi uuendatud mallidest

---

## Juurutus ja infrastruktuur

### Q: Milliseid Azure'i teenuseid saab azd abil juurutada?
**A**: azd saab juurutada kõiki Azure'i teenuseid Bicep/ARM mallide kaudu, sealhulgas:
- Rakendusteenused, konteinerirakendused, funktsioonid
- Andmebaasid (SQL, PostgreSQL, Cosmos DB)
- Salvestusruum, Key Vault, Application Insights
- Võrgustik, turvalisus ja jälgimisressursid

### Q: Kas saan juurutada mitmesse piirkonda?
**A**: Jah, konfigureeri mitu piirkonda oma Bicep mallides ja määra asukoha parameeter vastavalt igale keskkonnale.

### Q: Kuidas hallata andmebaasi skeemi migratsioone?
**A**: Kasuta juurutuskonksusid `azure.yaml`-is:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Kas saan juurutada ainult infrastruktuuri ilma rakendusteta?
**A**: Jah, kasuta `azd provision`, et juurutada ainult mallides määratletud infrastruktuurikomponendid.

### Q: Kuidas juurutada olemasolevatele Azure'i ressurssidele?
**A**: See on keeruline ja otseselt ei toetata. Sa saad:
1. Importida olemasolevad ressursid oma Bicep mallidesse
2. Kasutada mallides olemasolevate ressursside viiteid
3. Muuta malle, et tingimuslikult luua või viidata ressurssidele

### Q: Kas saan kasutada Terraformi Bicepi asemel?
**A**: Hetkel toetab azd peamiselt Bicep/ARM malle. Terraformi tugi ei ole ametlikult saadaval, kuigi kogukonna lahendused võivad eksisteerida.

---

## Konfiguratsioon ja keskkonnad

### Q: Kuidas hallata erinevaid keskkondi (arendus, testimine, tootmine)?
**A**: Loo eraldi keskkonnad `azd env new <environment-name>` abil ja konfigureeri igaühe jaoks erinevad seaded:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Kus hoitakse keskkonna konfiguratsioone?
**A**: `.azure` kaustas sinu projekti kataloogis. Igal keskkonnal on oma kaust konfiguratsioonifailidega.

### Q: Kuidas seadistada keskkonnaspetsiifilist konfiguratsiooni?
**A**: Kasuta `azd env set`, et konfigureerida keskkonnamuutujaid:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Kas keskkonna konfiguratsioone saab jagada meeskonnaliikmete vahel?
**A**: `.azure` kaust sisaldab tundlikku teavet ja seda ei tohiks versioonihaldusse lisada. Selle asemel:
1. Dokumenteeri vajalikud keskkonnamuutujad
2. Kasuta juurutusskripte keskkondade seadistamiseks
3. Kasuta Azure Key Vaulti tundliku konfiguratsiooni jaoks

### Q: Kuidas muuta malli vaikeseadeid?
**A**: Määra keskkonnamuutujad, mis vastavad malliparameetritele:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Tõrkeotsing

### Q: Miks `azd up` ebaõnnestub?
**A**: Levinud põhjused:
1. **Autentimisprobleemid**: Käivita `azd auth login`
2. **Ebapiisavad õigused**: Kontrolli oma Azure'i rollide määramisi
3. **Ressursinimede konfliktid**: Muuda AZURE_ENV_NAME
4. **Kvoodi/mahuprobleemid**: Kontrolli piirkondlikku saadavust
5. **Mallivead**: Valideeri Bicep mallid

### Q: Kuidas siluda juurutuse tõrkeid?
**A**: 
1. Kasuta `azd deploy --debug` üksikasjaliku väljundi jaoks
2. Kontrolli Azure'i portaali juurutusajalugu
3. Vaata tegevuslogi Azure'i portaalis
4. Kasuta `azd show`, et kuvada praeguse keskkonna olek

### Q: Miks minu keskkonnamuutujad ei tööta?
**A**: Kontrolli:
1. Muutujanimed vastavad täpselt malliparameetritele
2. Väärtused on õigesti tsitaatides, kui need sisaldavad tühikuid
3. Keskkond on valitud: `azd env select <environment>`
4. Muutujad on määratud õiges keskkonnas

### Q: Kuidas puhastada ebaõnnestunud juurutusi?
**A**: 
```bash
azd down --force --purge
```
See eemaldab kõik ressursid ja keskkonna konfiguratsiooni.

### Q: Miks minu rakendus ei ole pärast juurutust kättesaadav?
**A**: Kontrolli:
1. Juurutus on edukalt lõpule viidud
2. Rakendus töötab (kontrolli logisid Azure'i portaalis)
3. Võrguturbegrupid lubavad liiklust
4. DNS/kohandatud domeenid on õigesti konfigureeritud

---

## Kulud ja arveldus

### Q: Kui palju azd juurutused maksavad?
**A**: Kulud sõltuvad:
- Juurutatud Azure'i teenustest
- Teenuse tasemetest/SKU-dest
- Piirkondlikest hinnavahedest
- Kasutamismustritest

Kasuta [Azure'i hinnakalkulaatorit](https://azure.microsoft.com/pricing/calculator/) hinnangute saamiseks.

### Q: Kuidas kontrollida kulusid azd juurutustes?
**A**: 
1. Kasuta madalama taseme SKU-sid arenduskeskkondade jaoks
2. Sea üles Azure'i eelarved ja hoiatused
3. Kasuta `azd down`, et eemaldada ressursid, kui neid ei vajata
4. Vali sobivad piirkonnad (kulud varieeruvad asukoha järgi)
5. Kasuta Azure'i kulude haldamise tööriistu

### Q: Kas azd mallidel on tasuta taseme valikud?
**A**: Paljudel Azure'i teenustel on tasuta tasemed:
- Rakendusteenus: Saadaval tasuta tase
- Azure Functions: 1M tasuta täitmist kuus
- Cosmos DB: Tasuta tase 400 RU/s
- Application Insights: Esimesed 5GB kuus tasuta

Konfigureeri mallid, et kasutada tasuta tasemeid, kui need on saadaval.

### Q: Kuidas hinnata kulusid enne juurutust?
**A**: 
1. Vaata malli `main.bicep`, et näha, millised ressursid luuakse
2. Kasuta Azure'i hinnakalkulaatorit konkreetsete SKU-dega
3. Juuruta esmalt arenduskeskkonda, et jälgida tegelikke kulusid
4. Kasuta Azure'i kulude haldamist üksikasjaliku kuluanalüüsi jaoks

---

## Parimad praktikad

### Q: Millised on parimad praktikad azd projekti struktuuri jaoks?
**A**: 
1. Hoia rakenduse kood infrastruktuurist eraldi
2. Kasuta tähenduslikke teenusenimesid `azure.yaml`-is
3. Rakenda korralik veakäsitlus ehitusskriptides
4. Kasuta keskkonnaspetsiifilist konfiguratsiooni
5. Lisa põhjalik dokumentatsioon

### Q: Kuidas korraldada mitut teenust azd-s?
**A**: Kasuta soovitatud struktuuri:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Kas `.azure` kausta tuleks versioonihaldusse lisada?
**A**: **Ei!** `.azure` kaust sisaldab tundlikku teavet. Lisa see `.gitignore`-i:
```gitignore
.azure/
```

### Q: Kuidas hallata paroole ja tundlikku konfiguratsiooni?
**A**: 
1. Kasuta Azure Key Vaulti paroolide jaoks
2. Viita Key Vaulti paroolidele rakenduse konfiguratsioonis
3. Ära kunagi lisa paroole versioonihaldusse
4. Kasuta hallatud identiteete teenustevaheliseks autentimiseks

### Q: Milline on soovitatav lähenemine CI/CD-le azd-ga?
**A**: 
1. Kasuta eraldi keskkondi iga etapi jaoks (arendus/testimine/tootmine)
2. Rakenda automatiseeritud testimine enne juurutust
3. Kasuta autentimiseks teenusepõhimõtteid
4. Hoia tundlik konfiguratsioon torujuhtme salajastes/muutujates
5. Rakenda tootmise juurutuste jaoks kinnitamisväravaid

---

## Edasijõudnud teemad

### Q: Kas azd-d saab laiendada kohandatud funktsionaalsusega?
**A**: Jah, juurutuskonksude kaudu `azure.yaml`-is:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Kuidas integreerida azd olemasolevate DevOps protsessidega?
**A**: 
1. Kasuta azd käske olemasolevates torujuhtmeskriptides
2. Standardiseeri azd mallid meeskondade vahel
3. Integreeri olemasoleva jälgimise ja hoiatamisega
4. Kasuta azd JSON-väljundit torujuhtme integratsiooniks

### Q: Kas azd-d saab kasutada Azure DevOpsiga?
**A**
1. **azd tööriist**: Panusta [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallid**: Loo malle vastavalt [mallide juhistele](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentatsioon**: Panusta dokumentatsiooni [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### K: Mis on azd tööriista teekaart?
**V**: Vaata [ametlikku teekaarti](https://github.com/Azure/azure-dev/projects), et näha planeeritud funktsioone ja täiustusi.

### K: Kuidas migreerida teistelt juurutustööriistadelt azd-le?
**V**: 
1. Analüüsi praegust juurutusstruktuuri
2. Loo samaväärsed Bicep-mallid
3. Konfigureeri `azure.yaml`, et see vastaks praegustele teenustele
4. Testi põhjalikult arenduskeskkonnas
5. Migreeri keskkonnad järk-järgult

---

## Kas sul on veel küsimusi?

### **Otsi esmalt**
- Vaata [ametlikku dokumentatsiooni](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Otsi [GitHubi probleemide](https://github.com/Azure/azure-dev/issues) hulgast sarnaseid küsimusi

### **Küsi abi**
- [GitHubi arutelud](https://github.com/Azure/azure-dev/discussions) - Kogukonna tugi
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnilised küsimused
- [Azure Discord](https://discord.gg/azure) - Reaalajas kogukonna vestlus

### **Teata probleemidest**
- [GitHubi probleemid](https://github.com/Azure/azure-dev/issues/new) - Vigade raportid ja funktsioonide soovid
- Lisa asjakohased logid, veateated ja sammud probleemi taastamiseks

### **Õpi rohkem**
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*See KKK uuendatakse regulaarselt. Viimati uuendatud: 9. september 2025*

---

**Navigeerimine**
- **Eelmine õppetund**: [Sõnastik](glossary.md)
- **Järgmine õppetund**: [Õppejuhend](study-guide.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
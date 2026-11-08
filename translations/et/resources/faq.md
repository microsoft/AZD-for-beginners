# Sageli esitatavad küsimused (KKK)

**Saage abi peatükkide kaupa**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **🚆 Paigaldusprobleemid**: [Peatükk 1: Paigaldus ja seadistus](../docs/chapter-01-foundation/installation.md)
- **🤖 Tehisintellekti küsimused**: [Peatükk 2: AI-esimene arendus](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Tõrkeotsing**: [Peatükk 7: Tõrkeotsing ja silumine](../docs/chapter-07-troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik KKK pakub vastuseid kõige levinumatele Azure Developer CLI (azd) ja Azure'i juurutamisega seotud küsimustele. Leidke kiired lahendused sagedastele probleemidele, mõistke parimaid tavasid ning selgitusi azd kontseptsioonide ja töövoogude kohta.

## Õpieesmärgid

Selle KKK ülevaatamisel:
- Leiate kiired vastused sagedastele Azure Developer CLI küsimustele ja probleemidele
- Mõistate võtmekontseptsioone ja terminoloogiat praktilises küsimuste ja vastuste formaadis
- Saate ligipääsu tõrkeotsingu lahendustele korduvate probleemide ja vigade korral
- Õpite parimaid tavasid optimeerimise kohta sagedaste küsimuste põhjal
- Avastate edasijõudnute funktsioone ja võimalusi ekspertide tasemel küsimuste kaudu
- Kasutate tõhusalt juhendit kulude, turvalisuse ja juurutamisstrateegiate kohta

## Õpitulemused

Selle KKK regulaarse kasutamisega:
- Suudate iseseisvalt lahendada tavalisi Azure Developer CLI probleeme pakutud lahenduste abil
- Teete teadlikke otsuseid juurutamisstrateegiate ja konfiguratsioonide kohta
- Mõistate azdi ja teiste Azure tööriistade ning teenuste vahelist seost
- Rakendate parimaid tavasid kogukonna kogemuste ja ekspertide soovituste põhjal
- Lahendate autentimis-, juurutamis- ja konfiguratsiooniprobleeme tõhusalt
- Optimeerite kulusid ja jõudlust KKK teadmiste ja soovituste abil

## Sisukord

- [Alustamine](#getting-started)
- [Autentimine & Juurdepääs](#authentication--access)
- [Mallid & Projektid](#templates--projects)
- [Juurutamine & Taristu](#deployment--infrastructure)
- [Konfiguratsioon & Keskkonnad](#configuration--environments)
- [Tõrkeotsing](#troubleshooting)
- [Kulud & Arveldamine](#cost--billing)
- [Parimad tavad](#best-practices)
- [Edasijõudnud teemad](#advanced-topics)

---

## Alustamine

### K: Mis on Azure Developer CLI (azd)?
**V**: Azure Developer CLI (azd) on arendajakeskne käsureatööriist, mis kiirendab teie rakenduse toomist kohalikust arenduskeskkonnast Azuresse. See pakub parimaid tavasid mallide kaudu ja aitab kogu juurutustsüklil.

### K: Kuidas erineb azd Azure CLI-st?
**V**: 
- **Azure CLI**: Üldotstarbeline tööriist Azure'i ressursside haldamiseks
- **azd**: Arendajatele suunatud tööriist rakenduste juurutamise töövoogude jaoks
- azd-l on oma autentimis- ja juurutustöövoog; Azure CLI on eraldiseisev, täiendav tööriist
- azd sisaldab malle, keskkonna haldust ja juurutamise automatiseerimist

### K: Kas pean azd kasutamiseks paigaldama Azure CLI?
**V**: Ei pea põhijooksu jaoks. Autentimiseks kasuta `azd auth login`. Paigalda Azure CLI eraldi, kui mallis õppetükk või harjutus kasutab selgesõnaliselt `az` käsku.

### K: Milliseid programmeerimiskeeli azd toetab?
**V**: azd on keeltest sõltumatu. Toetab:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Staatilisi veebisaite
- Konteineripõhiseid rakendusi

### K: Kas saan kasutada azd olemasolevate projektidega?
**V**: Jah! Võite:
1. Kasutada `azd init`, et lisada azd konfiguratsioon olemasolevatesse projektidesse
2. Kohandada olemasolevaid projekte vastavaks azd mallistruktuurile
3. Luua kohandatud malle oma olemasoleva arhitektuuri põhjal

---

## Autentimine & Juurdepääs

### K: Kuidas autentida Azure'is azd abil?
**V**: Kasutage `azd auth login`, mis avab brauseris Azure autentimise jaoks. CI/CD stsenaariumides kasutage teenuse Identiteete või haldusrakendusi.

### K: Kas saan kasutada azd mitme Azure tellimusega?
**V**: Jah. Kasutage `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, et määrata, millist tellimust iga keskkonnas kasutada.

### K: Millised õigused on vajalikud azd-ga juurutamiseks?
**V**: Tavaliselt vajate:
- **Contributor** rolli ressurssigrupis või tellimuses
- **User Access Administrator** juhul, kui juurutatakse ressursse, mis nõuavad rollide määramist
- Spetsiifilised õigused sõltuvad mallist ja juurutatavatest ressurssidest

### K: Kas saan kasutada azd CI/CD torujuhtmetes?
**V**: Muidugi! azd on loodud CI/CD integreerimiseks. Kasutage autentimiseks teenuse identiteete ja seadistage konfiguratsiooniks keskkonnamuutujad.

### K: Kuidas käsitleda autentimist GitHub Actions-is?
**V**: Eelistage töökoormuse identiteedi liidestust (OIDC), mis on konfigureeritud `azd pipeline config` abil. Selle workflow käivitab AZD paigalduse ning autentib AZD otse liidestatud identiteediga. Üksnes `azure/login` etapp ei loo AZD sisselogimist. Sisselogimine olemasolevas töös on:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Pärast sisselogimist juurutage või varustage kavandatud AZD keskkond, tellimus ja asukoht. Liidestatud identiteedi volikiri peab usaldama töövoo hoidlat/refi või GitHubi keskkonda ning Azure rollid peavad lubama taotletud toimingud.

---

## Mallid & Projektid

### K: Kus leian azd malle?
**V**: 
- Ametlikud ja kogukonna mallid: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Kogukonna mallid: otsige GitHubist märksõnaga "azd-template"
- Kasutage `azd template list`, et sirvida saadaolevaid malle

### K: Kuidas luua kohandatud malli?
**V**: 
1. Alustage olemasolevast mallistruktuurist
2. Muutke `azure.yaml`, taristu faile ja rakenduse koodi
3. Testige põhjalikult `azd up` abil
4. Avaldage GitHubis vastavate siltidega

### K: Kas saan kasutada azd ilma mallita?
**V**: Jah, kasutage `azd init` olemasolevas projektis vajalike konfiguratsioonifailide loomiseks. Peate käsitsi seadistama `azure.yaml` ja taristu failid.

### K: Mis vahe on ametlike ja kogukonna mallide vahel?
**V**: 
- **Ametlikud mallid**: Hooldatud Microsofti poolt, regulaarselt uuendatud, põhjalik dokumentatsioon
- **Kogukonna mallid**: Loodud arendajate poolt, võivad olla spetsialiseeritud kasutusjuhtumitega, kvaliteet ja hooldus varieeruvad

### K: Kuidas uuendada projekti malli?
**V**: Mallid ei uuene automaatselt. Võite:
1. Käsitsi võrrelda ja ühendada muudatusi lähte malliga
2. Alustada värskelt `azd init` abil uuendatud malliga
3. Valida spetsiifilisi täiustusi uuendatud mallidest

---

## Juurutamine & Taristu

### K: Milliseid Azure teenuseid azd saab juurutada?
**V**: azd saab juurutada ükskõik millist Azure teenust, kasutades Bicep/ARM malle, sealhulgas:
- Rakendusteenused, konteineriteenused, funktsioonid
- Andmebaasid (SQL, PostgreSQL, Cosmos DB)
- Salvestus, võtmekirst, Application Insights
- Võrgu, turvalisuse ja jälgimise ressursid

### K: Kas saan juurutada mitmesse piirkonda?
**V**: Jah, seadistage mitmed piirkonnad oma Bicep mallides ja määrake asukoha parameeter vastavalt iga keskkonna jaoks.

### K: Kuidas käsitleda andmebaasi skeemi migratsioone?
**V**: Kasutage juurutamise haake `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Kas saan juurutada ainult taristut ilma rakendusteta?
**V**: Jah, kasutage `azd provision`, et juurutada ainult mallides määratletud taristu komponendid.

### K: Kuidas juurutada olemasolevatele Azure ressurssidele?
**V**: Jah, kui mall seda toetab. Viidake olemasolevatele ressurssidele Bicepi `existing` deklaratsioonidega või malli dokumenteeritud olemasolevate ressursside parameetritega ning siduge rakenduse teenused nende ette nähtud sihtkohtadega. See ei impordi omandit ega loo automaatselt puuduvaid õigusi. Kontrollige malli enne juurutamist.

### K: Kas saan Bicepi asemel kasutada Terraformi?
**V**: Jah. AZD toetab nii Terraformi kui Bicepi. Valige Terraformil põhinev mall või seadistage `infra.provider: terraform` failis `azure.yaml` koos sobivate Terraformi failide ning oleku/hoidla konfiguratsiooniga. Vaadake [Terraformi töövoogu](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguratsioon & Keskkonnad

### K: Kuidas hallata erinevaid keskkondi (arendus, katsetus, tootmine)?
**V**: Looge eraldi keskkonnad kasutades `azd env new <environment-name>` ja seadistage igaühe jaoks erinevad sätted:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Kus hoitakse keskkonna konfiguratsioone?
**V**: Projekti kataloogis asuvas kaustas `.azure`. Igal keskkonnal on oma kaust konfiguratsioonifailidega.

### K: Kuidas määrata keskkonnapõhist konfiguratsiooni?
**V**: Kasutage `azd env set` keskkonnamuutujate seadistamiseks:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Kas saan jagada keskkonna konfiguratsioone meeskonnaliikmete vahel?
**V**: Kaust `.azure` sisaldab tundlikku infot ega tohiks olla versioonihalduses. Selle asemel:
1. Dokumenteerige vajalikud keskkonnamuutujad
2. Kasutage juurutusskripte keskkondade seadistamiseks
3. Kasutage tundliku konfiguratsiooni jaoks Azure Key Vault-i

### K: Kuidas üle kirjutada malli vaikeväärtusi?
**V**: Määrake keskkonnamuutujad, mis vastavad malli parameetritele:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Deployimise käigus mõjutavad vaid muutujad, mida mall kasutab. Ülaltoodud `SKU_NAME` on näide kohandatud sisendist, mitte universaalne AZD seade.

---

## Tõrkeotsing

### K: Miks ebaõnnestub `azd up`?
**V**: Levinud põhjused:
1. **Autentimisprobleemid**: Käivitage `azd auth login`
2. **Ebapiisavad õigused**: Kontrollige oma Azure rollimääramisi
3. **Ressursside nimekonfliktid**: Kontrollige konflikti tekitavat ressurssi ja malli nimetamissisendeid; eraldiseisva isolatsiooni saamiseks looge `azd env new` abil eraldi keskkond
4. **Kvoodi/mahu probleemid**: Kontrollige piirkondlikku saadavust
5. **Malli vead**: Kontrollige Bicep malle kehtivuse osas

### K: Kuidas siluda juurutamise ebaõnnestumisi?
**V**: 
1. Kasutage detailset väljundit `azd deploy --debug`
2. Kontrollige Azure portaali juurutamisajalugu
3. Uurige Azure portaali tegevuste logi
4. Kuvage praegune keskkonna olek `azd show` abil

### K: Miks minu keskkonnamuutujad ei tööta?
**V**: Kontrollige:
1. Muutujate nimed täpselt vastavad malli parameetritele
2. Väärtused on korrektselt tsitaaditud, kui sisaldavad tühikuid
3. Õige keskkond on valitud: `azd env select <environment>`
4. Muutujad on määratud õiges keskkonnas

### K: Kuidas puhastada ebaõnnestunud juurutused?
**V**: 
```bash
azd down
```
 Kontrollige esmalt valitud keskkonda ja kustutamise kinnitust. See kustutab juurutatud Azure ressursid, mitte kohalikku `.azure` keskkonna konfiguratsiooni. `--purge` taotleb lisaks toetatud pehmelt kustutatud ressursside püsivat kustutust ja võib olla blokeeritud säilituse/kustutuskaitse poolt; see ei ole tavaline taastamise samm.

### K: Miks minu rakendus pärast juurutamist ei ole kättesaadav?
**V**: Kontrollige:
1. Juurutamine lõpetati edukalt
2. Rakendus töötab (kontrollige logisid Azure portaalis)
3. Võrgu turvagrupid lubavad liiklust
4. DNS/kohandatud domeenid on õigesti seadistatud

---

## Kulud & Arveldamine

### K: Kui palju maksavad azd juurutused?
**V**: Kulud sõltuvad:
- Juhtinud Azure teenustest
- Valitud teenuse tasemetest/SKU-dest
- Piirkondlikest hinnavahedega
- Kasutusmustritest

Hinnangute jaoks kasutage [Azure hinnakalkulaatorit](https://azure.microsoft.com/pricing/calculator/).

### K: Kuidas hallata kulusid azd juurutustes?
**V**: 
1. Kasutage arenduskeskkondades madalama tasemega SKU-sid
2. Seadistage Azure eelarved ja hoiatused
3. Kasutage `azd down` ressursside eemaldamiseks, kui neid ei vajata
4. Valige sobivad piirkonnad (kulud varieeruvad asukohtade järgi)
5. Kasutage Azure kulude halduse tööriistu

### K: Kas azd mallide jaoks on tasuta taseme võimalusi?
**V**: Mõned teenused pakuvad tasuta SKU-sid või kuutasulisi toetusi, millele kehtivad õigustamise nõuded, majutusplaan, piirkond ja tellimuse piirangud. Need ei tee kogu malli tasuta: andmebaasid, otsing, võrgustik, register, telemeetria ja mudeli järeldus võivad põhjustada iseseisvaid tasusid. Kontrollige enne juurutamist [Azure tasuta teenuste nimekirja](https://azure.microsoft.com/free/) ja iga ressursi kehtivat hinda.

### K: Kuidas hinnata kulusid enne juurutamist?
**V**: 
1. Vaadake malli `main.bicep`, et näha, milliseid ressursse luuakse
2. Kasutage Azure hinnakalkulaatorit konkreetsete SKU-dega
3. Juurutage esmalt arenduskeskkonda tegelike kulude jälgimiseks
4. Kasutage Azure kulude haldust üksikasjalikuks kulude analüüsiks

---

## Parimad tavad

### K: Millised on parimad tavad azd projektistruktuuri korraldamisel?
**V**: 
1. Hoidke rakenduse kood eraldi taristust
2. Kasutage `azure.yaml` teenuste tähendusrikkaid nimesid
3. Rakendage korrektset veahaldust ehitusskriptides
4. Kasutage keskkonnapõhist konfiguratsiooni
5. Lisage põhjalik dokumentatsioon

### K: Kuidas korraldada mitut teenust azd-s?
**V**: Kasutage soovitatud struktuuri:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Kas peaksin kaasama `.azure` kausta versioonihaldusesse?
**V**: **Ei!** Kaust `.azure` sisaldab tundlikku infot. Lisage see `.gitignore`:
```gitignore
.azure/
```

### K: Kuidas ma käsitlen salasõnu ja tundlikku konfiguratsiooni?
**V**: 
1. Kasuta saladuste jaoks Azure Key Vaulti
2. Viita Key Vaulti saladustele rakenduse konfiguratsioonis
3. Ära kunagi püüa saladusi versioonihaldusesse
4. Kasuta teenustevahelises autentimises hallatavaid identiteete

### K: Milline on soovitatud lähenemine CI/CD-le azd-ga?
**V**: 
1. Kasuta iga etapi jaoks eraldi keskkondi (dev/staging/prod)
2. Rakenda automatiseeritud testimine enne juurutamist
3. Kasuta autentimiseks teenusepõhiseid kontosid
4. Hoia tundlikku konfiguratsiooni torujuhtme saladustes/muutujates
5. Rakenda tootmisse juurutamiseks kinnituse väravad

---

## Täpsemad teemad

### K: Kas ma saan azd funktsionaalsust kohandada?
**V**: Jah, kasutades juurutuse konksusid `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Kuidas ma integreerin azd olemasolevatesse DevOps protsessidesse?
**V**: 
1. Kasuta azd käske olemasolevates torujuhtme skriptides
2. Standardiseeri azd mallid meeskondade vahel
3. Integreeri olemasoleva järelevalve ja häiretega
4. Kasuta azd JSON väljundit torujuhtme integratsiooniks

### K: Kas ma saan azd kasutada Azure DevOpsiga?
**V**: Jah, azd töötab iga CI/CD süsteemiga. Loo Azure DevOps torujuhtmed, mis kasutavad azd käske.

### K: Kuidas ma panustan azd-sse või loon kogukonna malle?
**V**: 
1. **azd tööriist**: Panusta [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallid**: Järgi [Awesome AZD galeriile panustamise juhiseid](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentatsioon**: Panusta dokumentidesse aadressil [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### K: Milline on azd teekaart?
**V**: Vaata [ametlikku teekaarti](https://github.com/Azure/azure-dev/projects), et näha planeeritud funktsioone ja parandusi.

### K: Kuidas ma migrerin teistest juurutustööriistadest azd peale?
**V**: 
1. Analüüsi praegust juurutusarhitektuuri
2. Loo vastavad Bicep mallid
3. Konfigureeri `azure.yaml` vastavaks praeguste teenustega
4. Testi põhjalikult arenduskeskkonnas
5. Migreeri keskkonnad järk-järgult

---

## Veel küsimusi?

### **Otsi esmalt**
- Vaata [ametlikku dokumentatsiooni](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Otsi [GitHub probleemide](https://github.com/Azure/azure-dev/issues) hulgast sarnaseid küsimusi

### **Saavuta abi**
- [GitHub arutelud](https://github.com/Azure/azure-dev/discussions) - Kogukonna tugi
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnilised küsimused
- [Azure Discord](https://discord.gg/azure) - Otsekohene kogukonna jututuba

### **Teata probleemidest**
- [GitHub probleemid](https://github.com/Azure/azure-dev/issues/new) - Vead ja funktsiooninõuded
- Lisa asjakohased logid, veateated ja taastekstid

### **Õpi rohkem**
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tehnilisi juhiseid vaadati üle: 4. november 2026. Pilveteenuste saadavust ja hinnaandmeid tuleb kontrollida teie tellimuse ja regiooni jaoks.*

---

**Navigeerimine**
- **Eelmine õppetund**: [Glossary](glossary.md)
- **Järgmine õppetund**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Dažniausiai užduodami klausimai (DUK)

**Pagalbos skyrius pagal skyrių**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **🚆 Diegimo problemos**: [1 skyrius: Diegimas ir nustatymas](../docs/chapter-01-foundation/installation.md)
- **🤖 Dirbtinio intelekto klausimai**: [2 skyrius: AI-pirmas vystymas](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Gedimų šalinimas**: [7 skyrius: Gedimų šalinimas ir derinimas](../docs/chapter-07-troubleshooting/common-issues.md)

## Įvadas

Ši išsami DUK skiltis pateikia atsakymus į dažniausiai užduodamus klausimus apie Azure Developer CLI (azd) ir Azure diegimą. Raskite greitus sprendimus dažnoms problemoms, supraskite geriausias praktikas ir išsiaiškinkite azd koncepcijas bei darbo eigas.

## Mokymosi tikslai

Peržiūrėję šią DUK skiltį, jūs:
- Rasite greitus atsakymus į dažniausiai užduodamus Azure Developer CLI klausimus ir problemas
- Suprasite pagrindines sąvokas ir terminus per praktinius klausimų ir atsakymų formatus
- Turėsite prieigą prie gedimų šalinimo sprendimų dažnoms problemoms ir klaidų scenarijams
- Išmoksite geriausias praktikas per dažnai užduodamus klausimus apie optimizavimą
- Atraskite pažangias funkcijas ir galimybes per ekspertų lygio klausimus
- Norėdami efektyviai naudotis kainų, saugumo ir diegimo strategijų gairėmis

## Mokymosi rezultatai

Reguliariai naudodamiesi šia DUK skiltimi, galėsite:
- Nepriklausomai išspręsti bendras Azure Developer CLI problemas naudodamiesi pateiktais sprendimais
- Priimti pagrįstus sprendimus dėl diegimo strategijų ir konfigūracijų
- Suprasti ryšį tarp azd ir kitų Azure įrankių bei paslaugų
- Taikyti geriausias praktikas, atsižvelgiant į bendruomenės patirtį ir ekspertų rekomendacijas
- Efektyviai šalinti autentifikavimo, diegimo ir konfigūravimo problemas
- Optimizuoti išlaidas ir našumą naudodami DUK įžvalgas ir rekomendacijas

## Turinys

- [Pradžia](#getting-started)
- [Autentifikavimas ir prieiga](#authentication--access)
- [Šablonai ir projektai](#templates--projects)
- [Diegimas ir infrastruktūra](#deployment--infrastructure)
- [Konfigūracija ir aplinkos](#configuration--environments)
- [Gedimų šalinimas](#troubleshooting)
- [Kainos ir sąskaitos](#cost--billing)
- [Geriausios praktikos](#best-practices)
- [Pažangios temos](#advanced-topics)

---

## Pradžia

### K: Kas yra Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) yra kūrėjams orientuotas komandų eilutės įrankis, kuris pagreitina laiką nuo programos vietinės kūrimo aplinkos iki Azure. Jis teikia geriausias praktikas per šablonus ir padeda viso diegimo ciklo metu.

### K: Kuo skiriasi azd nuo Azure CLI?
**A**: 
- **Azure CLI**: Bendros paskirties įrankis Azure išteklių valdymui
- **azd**: Kūrėjams skirta priemonė programų diegimo darbo eigoms
- azd turi savo autentifikavimo ir diegimo darbo eigą; Azure CLI yra atskiras, papildomas įrankis
- azd apima šablonus, aplinkos valdymą ir diegimo automatizavimą

### K: Ar reikia įdiegti Azure CLI, norint naudoti azd?
**A**: Ne pagrindinei AZD darbo eigai. Autentifikuokitės su `azd auth login`. Įdiekite Azure CLI atskirai, kai šablono kabliukas ar pratimas aiškiai vykdo `az` komandas.

### K: Kokias programavimo kalbas palaiko azd?
**A**: azd yra kalboms nepriklausomas. Jis veikia su:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiniais tinklalapiais
- Konteinerizuotomis programomis

### K: Ar galiu naudoti azd su esamais projektais?
**A**: Taip! Jūs galite:
1. Naudoti `azd init`, kad pridėtumėte azd konfigūraciją prie esamų projektų
2. Pritaikyti esamus projektus, kad atitiktų azd šablono struktūrą
3. Kurti pasirinktinius šablonus pagal savo esamą architektūrą

---

## Autentifikavimas ir prieiga

### K: Kaip autentifikuotis Azure naudojant azd?
**A**: Naudokite `azd auth login`, kuris atvers naršyklės langą Azure autentifikavimui. CI/CD scenarijams naudokite paslaugų principus arba valdomas tapatybes.

### K: Ar galiu naudoti azd su keliais Azure prenumeratomis?
**A**: Taip. Naudokite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, kad nurodytumėte, kurią prenumeratą naudoti kiekvienai aplinkai.

### K: Kokios teisės reikalingos diegimui naudojant azd?
**A**: Paprastai jums reikalinga:
- **Dalyvio (Contributor)** rolė išteklių grupėje arba prenumeratoje
- **Vartotojo prieigos administratorius (User Access Administrator)**, jei diegiate išteklius, kuriems reikalingi vaidmenų priskyrimai
- Konkretūs leidimai priklauso nuo šablono ir diegiamų išteklių

### K: Ar galiu naudoti azd CI/CD procesuose?
**A**: Absoliučiai! azd yra sukurtas CI/CD integracijai. Naudokite paslaugų principus autentifikavimui ir nustatykite aplinkos kintamuosius konfigūracijai.

### K: Kaip valdyti autentifikavimą GitHub Actions?
**A**: Geriausia naudoti darbo krūvio tapatybės federaciją (OIDC), sukonfigūruotą su `azd pipeline config`. Sugeneruota darbo eiga įdiegia AZD ir autentifikuoja AZD tiesiogiai su federuota tapatybe. `azure/login` žingsnis vienas negali įsteigti AZD prisijungimo. Prisijungimo žingsnis esamoje užduotyje yra:
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

Teikite arba diekite po prisijungimo, su tinkamai sukonfigūruota AZD aplinka, prenumerata ir vieta. Tapatybės federuotas kredencialas turi pasitikėti darbo eigos repozitorija/ref arba GitHub aplinka, o jos Azure vaidmenys turi leisti prašomas operacijas.

---

## Šablonai ir projektai

### K: Kur galiu rasti azd šablonus?
**A**: 
- Oficialūs ir bendruomenės šablonai: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Bendruomenės šablonai: GitHub paieška "azd-template"
- Naudokite `azd template list`, kad naršytumėte prieinamus šablonus

### K: Kaip sukurti pasirinktinius šablonus?
**A**: 
1. Pradėkite nuo esamos šablono struktūros
2. Modifikuokite `azure.yaml`, infrastruktūros failus ir programos kodą
3. Atlikite išsamų testavimą su `azd up`
4. Paskelbkite GitHub su tinkamais žymėjimais

### K: Ar galiu naudoti azd be šablono?
**A**: Taip, naudokite `azd init` esamame projekte, kad sukurtumėte būtinus konfigūracijos failus. Reikės rankiniu būdu konfigūruoti `azure.yaml` ir infrastruktūros failus.

### K: Kuo skiriasi oficialūs ir bendruomenės šablonai?
**A**: 
- **Oficialūs šablonai**: Prižiūrimi Microsoft, reguliariai atnaujinami, išsami dokumentacija
- **Bendruomenės šablonai**: Sukurti kūrėjų, gali turėti specializuotų panaudojimo atvejų, skirtinga kokybė ir priežiūra

### K: Kaip atnaujinti šabloną savo projekte?
**A**: Šablonai nėra automatiškai atnaujinami. Jūs galite:
1. Rankiniu būdu palyginti ir sujungti pakeitimus iš šablono šaltinio
2. Pradėti iš naujo su `azd init` naudodami atnaujintą šabloną
3. Pasirinkti konkrečius patobulinimus iš atnaujintų šablonų

---

## Diegimas ir infrastruktūra

### K: Kokias Azure paslaugas gali diegti azd?
**A**: azd gali diegti bet kurią Azure paslaugą per Bicep/ARM šablonus, įskaitant:
- Programų paslaugas, konteinerių programas, funkcijas
- Duomenų bazes (SQL, PostgreSQL, Cosmos DB)
- Saugyklą, raktų saugyklą, programos įžvalgas
- Tinklų, saugumo ir stebėjimo išteklius

### K: Ar galiu diegti keliuose regionuose?
**A**: Taip, sukonfigūruokite kelis regionus savo Bicep šablonuose ir nustatykite vietos parametrą tinkamai kiekvienai aplinkai.

### K: Kaip tvarkyti duomenų bazės schemos migracijas?
**A**: Naudokite diegimo kabliukus `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Ar galiu diegti tik infrastruktūrą be programų?
**A**: Taip, naudokite `azd provision`, kad diegtumėte tik infrastruktūros komponentus, apibrėžtus šablonuose.

### K: Kaip diegti į esamus Azure išteklius?
**A**: Taip, kai šablonas tai palaiko. Nurodykite esamus išteklius naudodami Bicep `existing` deklaracijas arba šablono dokumentuotus parametrus esamiems ištekliams ir priskirkite programų paslaugas jiems. Tai neperkelia nuosavybės teisės ir automatiškai nesukuria trūkstamų leidimų. Peržiūrėkite šabloną prieš diegimą.

### K: Ar galiu naudoti Terraform vietoj Bicep?
**A**: Taip. AZD palaiko Terraform kartu su Bicep. Pasirinkite Terraform pagrindu sukurtą šabloną arba konfigūruokite `infra.provider: terraform` faile `azure.yaml` su tinkamais Terraform failais ir būsenos/backend konfigūracija. Žr. [Terraform darbo eiga](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigūracija ir aplinkos

### K: Kaip valdyti skirtingas aplinkas (dev, staging, prod)?
**A**: Sukurkite atskiras aplinkas naudodami `azd env new <environment-name>` ir sukonfigūruokite skirtingus nustatymus kiekvienai:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Kur saugomos aplinkos konfigūracijos?
**A**: `.azure` kataloge jūsų projekto aplanke. Kiekviena aplinka turi savo katalogą su konfigūracijos failais.

### K: Kaip nustatyti aplinkai specifinę konfigūraciją?
**A**: Naudokite `azd env set`, kad nustatytumėte aplinkos kintamuosius:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Ar galiu dalintis aplinkos konfigūracijomis tarp komandos narių?
**A**: `.azure` katalogas turi jautrią informaciją ir neturėtų būti įtrauktas į versijų valdymą. Vietoj to:
1. Dokumentuokite reikalingus aplinkos kintamuosius
2. Naudokite diegimo scenarijus aplinkų paruošimui
3. Naudokite Azure Key Vault jautrioms konfigūracijoms

### K: Kaip perrašyti į šabloną numatytas reikšmes?
**A**: Nustatykite aplinkos kintamuosius, atitinkančius šablono parametrus:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Tik kintamieji, kuriuos naudoja šablonas, veikia diegimą. `SKU_NAME` aukščiau yra pavyzdys pritaikyto įvesties, o ne universalus AZD nustatymas.

---

## Gedimų šalinimas

### K: Kodėl nepavyksta `azd up`?
**A**: Dažnos priežastys:
1. **Autentifikavimo problemos**: Vykdykite `azd auth login`
2. **Nepakankamos teisės**: Patikrinkite savo Azure vaidmenų priskyrimus
3. **Išteklių pavadinimų konfliktai**: Peržiūrėkite konfliktuojančio išteklio ir šablono pavadinimų įvestis; jei reikia izoliacijos, sukurkite atskirą aplinką su `azd env new`
4. **Kvotos/kapaciteto problemos**: Patikrinkite regioninį pasiekiamumą
5. **Šablono klaidos**: Patikrinkite Bicep šablonus

### K: Kaip derinti diegimo klaidas?
**A**: 
1. Naudokite `azd deploy --debug` praplėstam išvedimui
2. Patikrinkite Azure portal diegimų istoriją
3. Peržiūrėkite veiklos žurnalą Azure portale
4. Naudokite `azd show`, kad parodytumėte esamą aplinkos būseną

### K: Kodėl mano aplinkos kintamieji neveikia?
**A**: Patikrinkite:
1. Kintamųjų pavadinimai tiksliai atitinka šablono parametrus
2. Reikšmės tinkamai apgaubtos kabutėmis, jei jose yra tarpų
3. Pasirinkta aplinka: `azd env select <environment>`
4. Kintamieji nustatyti teisingoje aplinkoje

### K: Kaip išvalyti nepavykusius diegimus?
**A**: 
```bash
azd down
```
Pirmiausia peržiūrėkite pasirinktą aplinką ir patvirtinkite ištrynimą. Tai ištrina įdiegtus Azure išteklius, bet ne vietinę `.azure` aplinkos konfigūraciją. `--purge` taip pat reikalauja nuolatinio palaikomų minkštai ištrintų išteklių ištrynimo ir gali būti blokuojamas saugojimo/valymo apsaugos; tai nėra įprasta atkūrimo procedūra.

### K: Kodėl mano programa nėra pasiekiama po diegimo?
**A**: Patikrinkite:
1. Diegimas sėkmingai užbaigtas
2. Programa veikia (patikrinkite žurnalus Azure portale)
3. Tinklo saugumo grupės leidžia srautą
4. DNS/naudotojų domenai tinkamai sukonfigūruoti

---

## Kainos ir sąskaitos

### K: Kiek kainuos azd diegimai?
**A**: Kaina priklauso nuo:
- Diegiamų Azure paslaugų
- Pasirinktų paslaugų lygių/SKU
- Regioninių kainų skirtumų
- Naudojimo įpročių

Naudokite [Azure kainoraštį](https://azure.microsoft.com/pricing/calculator/) kainų įvertinimui.

### K: Kaip valdyti išlaidas azd diegimuose?
**A**: 
1. Naudokite žemesnio lygio SKU kūrimo aplinkoms
2. Nustatykite Azure biudžetus ir aliarmus
3. Naudokite `azd down`, kad pašalintumėte išteklius, kai jų nereikia
4. Pasirinkite tinkamus regionus (kainos priklauso nuo vietos)
5. Naudokite Azure išlaidų valdymo įrankius

### K: Ar yra nemokamų lygių azd šablonams?
**A**: Kai kurios paslaugos turi nemokamus SKU ar mėnesinius limitus, priklausomai nuo tinkamumo, hostingo plano, regiono ir prenumeratos ribų. Tai nepadaro viso šablono nemokamu: duomenų bazės, paieška, tinklai, registrai, telemetrija ir modelių inferencija gali būti apmokestinami atskirai. Pasitikrinkite [Azure nemokamų paslaugų sąrašą](https://azure.microsoft.com/free/) ir dabartines kiekvieno išteklio kainas prieš diegdami.

### K: Kaip įvertinti išlaidas prieš diegimą?
**A**: 
1. Peržiūrėkite šablono `main.bicep`, kad pamatytumėte sukuriamus išteklius
2. Naudokite Azure kainoraštį su konkrečiais SKU
3. Pirmiausia diegkite į kūrimo aplinką, kad stebėtumėte faktines išlaidas
4. Naudokite Azure išlaidų valdymą detalesnei išlaidų analizei

---

## Geriausios praktikos

### K: Kokios yra geriausios praktikos azd projekto struktūrai?
**A**: 
1. Laikykite programos kodą atskirai nuo infrastruktūros
2. Naudokite prasmingus paslaugų pavadinimus `azure.yaml`
3. Įgyvendinkite tinkamą klaidų tvarkymą statybos skriptuose
4. Naudokite aplinkai specifinę konfigūraciją
5. Įtraukite išsamią dokumentaciją

### K: Kaip turėčiau organizuoti kelias paslaugas azd?
**A**: Naudokite rekomenduojamą struktūrą:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Ar turėčiau pridėti `.azure` katalogą į versijų valdymą?
**A**: **Ne!** `.azure` katalogas talpina jautrią informaciją. Pridėkite jį prie `.gitignore`:
```gitignore
.azure/
```

### K: Kaip tvarkyti slaptus duomenis ir jautrią konfigūraciją?
**A**: 
1. Naudokite Azure Key Vault slaptiems duomenims
2. Nuoroda į Key Vault slaptus duomenis programos konfigūracijoje
3. Niekada nekelkite slaptų duomenų į versijų valdymą
4. Naudokite valdomas tapatybes serviso tarpusavio autentifikacijai

### K: Koks yra rekomenduojamas CI/CD būdas naudojant azd?
**A**: 
1. Naudokite atskiras aplinkas kiekvienam etapui (dev/staging/prod)
2. Įgyvendinkite automatinius testus prieš diegimą
3. Autentifikacijai naudokite serviso principus
4. Laikykite jautrią konfigūraciją pipeline slaptuose/ kintamuosiuose
5. Įgyvendinkite patvirtinimo vartus produkcijos diegimams

---

## Pažengusios Temos

### K: Ar galiu praplėsti azd su pasirinktine funkcionalumu?
**A**: Taip, per diegimo kablius `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Kaip integruoti azd į esamus DevOps procesus?
**A**: 
1. Naudokite azd komandas esamuose pipeline skriptuose
2. Standartizuokite azd šablonus komandose
3. Integruokite su esama stebėsena ir įspėjimais
4. Naudokite azd JSON išvestį pipeline integracijai

### K: Ar galiu naudoti azd su Azure DevOps?
**A**: Taip, azd veikia su bet kokia CI/CD sistema. Kurkite Azure DevOps pipelines, naudojančius azd komandas.

### K: Kaip prisidėti prie azd arba sukurti bendruomenės šablonus?
**A**: 
1. **azd įrankis**: Prisidėkite prie [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablonai**: Sekite [Awesome AZD galerijos prisidėjimo nurodymus](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacija**: Prisidėkite prie dokumentacijos [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### K: Koks yra azd veiklos planas?
**A**: Patikrinkite [oficialų veiklos planą](https://github.com/Azure/azure-dev/projects), kuriame yra planuojamos funkcijos ir patobulinimai.

### K: Kaip pereiti nuo kitų diegimo įrankių prie azd?
**A**: 
1. Išanalizuokite esamą diegimo architektūrą
2. Sukurkite atitinkamus Bicep šablonus
3. Suconfigūruokite `azure.yaml`, kad atitiktų esamas paslaugas
4. Kruopščiai išbandykite vystymo aplinkoje
5. Laipsniškai migruokite aplinkas

---

## Vis dar turite klausimų?

### **Ieškokite Pirmiausia**
- Patikrinkite [oficialią dokumentaciją](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Ieškokite [GitHub problemų](https://github.com/Azure/azure-dev/issues) dėl panašių problemų

### **Gaukite Pagalbą**
- [GitHub diskusijos](https://github.com/Azure/azure-dev/discussions) - Bendruomenės palaikymas
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Techniniai klausimai
- [Azure Discord](https://discord.gg/azure) - Realaus laiko bendruomenės pokalbiai

### **Praneškite apie problemas**
- [GitHub problemos](https://github.com/Azure/azure-dev/issues/new) - Klaidų pranešimai ir funkcijų prašymai
- Pateikite atitinkamus žurnalus, klaidų pranešimus ir atkartojimo veiksmus

### **Sužinokite Daugiau**
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerai suprojektuota sistema](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Techninis gidas peržiūrėtas: 2026 m. lapkričio 4 d. Debesų pasiekiamumas ir kainos turi būti patikrintos pagal jūsų prenumeratą ir regioną.*

---

**Navigacija**
- **Ankstesnis pamoka**: [Žodynas](glossary.md)
- **Kitas pamoka**: [Studijų vadovas](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
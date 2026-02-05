# Dažniausiai užduodami klausimai (DUK)

**Pagalba pagal skyrių**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **🚆 Diegimo problemos**: [1 skyrius: Diegimas ir nustatymas](../docs/getting-started/installation.md)
- **🤖 AI klausimai**: [2 skyrius: AI-pirmasis kūrimas](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Trikčių šalinimas**: [7 skyrius: Trikčių šalinimas ir derinimas](../docs/troubleshooting/common-issues.md)

## Įvadas

Šis išsamus DUK pateikia atsakymus į dažniausiai užduodamus klausimus apie „Azure Developer CLI“ (azd) ir „Azure“ diegimus. Čia rasite greitus sprendimus įprastoms problemoms, geriausią praktiką ir paaiškinimus apie azd koncepcijas bei darbo eigas.

## Mokymosi tikslai

Peržiūrėdami šį DUK, jūs:
- Rasite greitus atsakymus į dažniausiai pasitaikančius „Azure Developer CLI“ klausimus ir problemas
- Suprasite pagrindines sąvokas ir terminus per praktinį klausimų-atsakymų formatą
- Pasieksite trikčių šalinimo sprendimus dažnoms problemoms ir klaidų scenarijams
- Išmoksite geriausią praktiką per dažniausiai užduodamus klausimus apie optimizavimą
- Atraskite pažangias funkcijas ir galimybes per ekspertų lygio klausimus
- Efektyviai naudositės informacija apie išlaidas, saugumą ir diegimo strategijas

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo DUK, galėsite:
- Savarankiškai spręsti dažniausiai pasitaikančias „Azure Developer CLI“ problemas naudodamiesi pateiktais sprendimais
- Priimti pagrįstus sprendimus dėl diegimo strategijų ir konfigūracijų
- Suprasti azd ryšį su kitais „Azure“ įrankiais ir paslaugomis
- Taikyti geriausią praktiką, remiantis bendruomenės patirtimi ir ekspertų rekomendacijomis
- Efektyviai šalinti autentifikavimo, diegimo ir konfigūracijos problemas
- Optimizuoti išlaidas ir našumą, naudodamiesi DUK įžvalgomis ir rekomendacijomis

## Turinys

- [Pradžia](../../../resources)
- [Autentifikavimas ir prieiga](../../../resources)
- [Šablonai ir projektai](../../../resources)
- [Diegimas ir infrastruktūra](../../../resources)
- [Konfigūracija ir aplinkos](../../../resources)
- [Trikčių šalinimas](../../../resources)
- [Išlaidos ir sąskaitos](../../../resources)
- [Geriausia praktika](../../../resources)
- [Pažangios temos](../../../resources)

---

## Pradžia

### K: Kas yra „Azure Developer CLI“ (azd)?
**A**: „Azure Developer CLI“ (azd) yra kūrėjams skirtas komandų eilutės įrankis, kuris pagreitina jūsų programos perkėlimą iš vietinės kūrimo aplinkos į „Azure“. Jis siūlo geriausią praktiką per šablonus ir padeda viso diegimo ciklo metu.

### K: Kaip azd skiriasi nuo „Azure CLI“?
**A**: 
- **Azure CLI**: Bendros paskirties įrankis „Azure“ išteklių valdymui
- **azd**: Kūrėjams skirtas įrankis programų diegimo darbo eigoms
- azd naudoja „Azure CLI“ viduje, bet siūlo aukštesnio lygio abstrakcijas dažniems kūrimo scenarijams
- azd apima šablonus, aplinkos valdymą ir diegimo automatizavimą

### K: Ar man reikia įdiegti „Azure CLI“, kad galėčiau naudoti azd?
**A**: Taip, azd reikalauja „Azure CLI“ autentifikavimui ir kai kurioms operacijoms. Pirmiausia įdiekite „Azure CLI“, tada azd.

### K: Kokias programavimo kalbas palaiko azd?
**A**: azd yra nepriklausomas nuo kalbos. Jis veikia su:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statinės svetainės
- Konteinerizuotos programos

### K: Ar galiu naudoti azd su esamais projektais?
**A**: Taip! Galite:
1. Naudoti `azd init`, kad pridėtumėte azd konfigūraciją prie esamų projektų
2. Pritaikyti esamus projektus, kad atitiktų azd šablonų struktūrą
3. Kurti pasirinktinius šablonus, remiantis jūsų esama architektūra

---

## Autentifikavimas ir prieiga

### K: Kaip autentifikuotis su „Azure“ naudojant azd?
**A**: Naudokite `azd auth login`, kuris atidarys naršyklės langą „Azure“ autentifikavimui. CI/CD scenarijams naudokite paslaugų principus arba valdomas tapatybes.

### K: Ar galiu naudoti azd su keliais „Azure“ prenumeratais?
**A**: Taip. Naudokite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, kad nurodytumėte, kurią prenumeratą naudoti kiekvienai aplinkai.

### K: Kokius leidimus man reikia turėti, kad galėčiau diegti su azd?
**A**: Paprastai jums reikia:
- **Contributor** vaidmens išteklių grupėje arba prenumeratoje
- **User Access Administrator**, jei diegiate išteklius, kuriems reikia vaidmenų priskyrimo
- Konkretūs leidimai priklauso nuo šablono ir diegiamų išteklių

### K: Ar galiu naudoti azd CI/CD vamzdynuose?
**A**: Žinoma! azd yra sukurtas CI/CD integracijai. Naudokite paslaugų principus autentifikavimui ir nustatykite aplinkos kintamuosius konfigūracijai.

### K: Kaip tvarkyti autentifikavimą „GitHub Actions“?
**A**: Naudokite „Azure Login“ veiksmą su paslaugų principo kredencialais:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Šablonai ir projektai

### K: Kur galiu rasti azd šablonus?
**A**: 
- Oficialūs šablonai: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Bendruomenės šablonai: „GitHub“ paieška „azd-template“
- Naudokite `azd template list`, kad peržiūrėtumėte galimus šablonus

### K: Kaip sukurti pasirinktą šabloną?
**A**: 
1. Pradėkite nuo esamos šablono struktūros
2. Pakeiskite `azure.yaml`, infrastruktūros failus ir programos kodą
3. Kruopščiai išbandykite su `azd up`
4. Publikuokite „GitHub“ su tinkamomis žymomis

### K: Ar galiu naudoti azd be šablono?
**A**: Taip, naudokite `azd init` esamame projekte, kad sukurtumėte reikiamus konfigūracijos failus. Jums reikės rankiniu būdu konfigūruoti `azure.yaml` ir infrastruktūros failus.

### K: Kuo skiriasi oficialūs ir bendruomenės šablonai?
**A**: 
- **Oficialūs šablonai**: Prižiūrimi „Microsoft“, reguliariai atnaujinami, išsamiai dokumentuoti
- **Bendruomenės šablonai**: Sukurti kūrėjų, gali turėti specializuotus naudojimo atvejus, skirtingą kokybę ir priežiūrą

### K: Kaip atnaujinti šabloną savo projekte?
**A**: Šablonai nėra automatiškai atnaujinami. Galite:
1. Rankiniu būdu palyginti ir sujungti pakeitimus iš šaltinio šablono
2. Pradėti iš naujo su `azd init`, naudojant atnaujintą šabloną
3. Pasirinkti konkrečius patobulinimus iš atnaujintų šablonų

---

## Diegimas ir infrastruktūra

### K: Kokias „Azure“ paslaugas gali diegti azd?
**A**: azd gali diegti bet kokias „Azure“ paslaugas per Bicep/ARM šablonus, įskaitant:
- App Services, Container Apps, Functions
- Duomenų bazes (SQL, PostgreSQL, Cosmos DB)
- Saugyklą, Key Vault, Application Insights
- Tinklo, saugumo ir stebėjimo išteklius

### K: Ar galiu diegti į kelis regionus?
**A**: Taip, konfigūruokite kelis regionus savo Bicep šablonuose ir tinkamai nustatykite vietos parametrą kiekvienai aplinkai.

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
**A**: Taip, naudokite `azd provision`, kad diegtumėte tik infrastruktūros komponentus, apibrėžtus jūsų šablonuose.

### K: Kaip diegti į esamus „Azure“ išteklius?
**A**: Tai sudėtinga ir nėra tiesiogiai palaikoma. Galite:
1. Importuoti esamus išteklius į savo Bicep šablonus
2. Naudoti esamų išteklių nuorodas šablonuose
3. Pakeisti šablonus, kad sąlygiškai sukurtų arba nurodytų išteklius

### K: Ar galiu naudoti „Terraform“ vietoj Bicep?
**A**: Šiuo metu azd daugiausia palaiko Bicep/ARM šablonus. „Terraform“ palaikymas nėra oficialiai prieinamas, nors bendruomenės sprendimai gali egzistuoti.

---

## Konfigūracija ir aplinkos

### K: Kaip valdyti skirtingas aplinkas (dev, staging, prod)?
**A**: Sukurkite atskiras aplinkas su `azd env new <environment-name>` ir konfigūruokite skirtingus nustatymus kiekvienai:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Kur saugomos aplinkos konfigūracijos?
**A**: `.azure` aplanke jūsų projekto kataloge. Kiekviena aplinka turi savo aplanką su konfigūracijos failais.

### K: Kaip nustatyti aplinkai specifinę konfigūraciją?
**A**: Naudokite `azd env set`, kad konfigūruotumėte aplinkos kintamuosius:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Ar galiu dalintis aplinkos konfigūracijomis su komandos nariais?
**A**: `.azure` aplankas turi jautrią informaciją ir neturėtų būti įtrauktas į versijų kontrolę. Vietoj to:
1. Dokumentuokite reikiamus aplinkos kintamuosius
2. Naudokite diegimo scenarijus aplinkoms nustatyti
3. Naudokite „Azure Key Vault“ jautriai konfigūracijai

### K: Kaip pakeisti šablono numatytuosius nustatymus?
**A**: Nustatykite aplinkos kintamuosius, kurie atitinka šablono parametrus:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Trikčių šalinimas

### K: Kodėl `azd up` nepavyksta?
**A**: Dažniausios priežastys:
1. **Autentifikavimo problemos**: Paleiskite `azd auth login`
2. **Nepakankami leidimai**: Patikrinkite savo „Azure“ vaidmenų priskyrimus
3. **Išteklių pavadinimų konfliktai**: Pakeiskite AZURE_ENV_NAME
4. **Kvotos/pajėgumo problemos**: Patikrinkite regioninį prieinamumą
5. **Šablono klaidos**: Patikrinkite Bicep šablonus

### K: Kaip derinti diegimo klaidas?
**A**: 
1. Naudokite `azd deploy --debug` išsamiai informacijai
2. Patikrinkite „Azure“ portalo diegimo istoriją
3. Peržiūrėkite veiklos žurnalą „Azure“ portale
4. Naudokite `azd show`, kad parodytumėte dabartinę aplinkos būseną

### K: Kodėl mano aplinkos kintamieji neveikia?
**A**: Patikrinkite:
1. Kintamųjų pavadinimai tiksliai atitinka šablono parametrus
2. Vertės tinkamai įrašytos, jei jos turi tarpus
3. Pasirinkta aplinka: `azd env select <environment>`
4. Kintamieji nustatyti tinkamoje aplinkoje

### K: Kaip išvalyti nepavykusius diegimus?
**A**: 
```bash
azd down --force --purge
```
Tai pašalina visus išteklius ir aplinkos konfigūraciją.

### K: Kodėl mano programa nepasiekiama po diegimo?
**A**: Patikrinkite:
1. Diegimas sėkmingai baigtas
2. Programa veikia (patikrinkite žurnalus „Azure“ portale)
3. Tinklo saugumo grupės leidžia srautą
4. DNS/pasirinktiniai domenai tinkamai sukonfigūruoti

---

## Išlaidos ir sąskaitos

### K: Kiek kainuos azd diegimai?
**A**: Išlaidos priklauso nuo:
- Diegiamų „Azure“ paslaugų
- Paslaugų lygių/SKU pasirinkimo
- Regioninių kainų skirtumų
- Naudojimo modelių

Naudokite [„Azure“ kainų skaičiuoklę](https://azure.microsoft.com/pricing/calculator/) sąmatoms.

### K: Kaip kontroliuoti išlaidas azd diegimuose?
**A**: 
1. Naudokite žemesnio lygio SKU kūrimo aplinkoms
2. Nustatykite „Azure“ biudžetus ir įspėjimus
3. Naudokite `azd down`, kad pašalintumėte išteklius, kai jų nereikia
4. Pasirinkite tinkamus regionus (išlaidos skiriasi pagal vietą)
5. Naudokite „Azure“ išlaidų valdymo įrankius

### K: Ar yra nemokamų lygių azd šablonams?
**A**: Daugelis „Azure“ paslaugų siūlo nemokamus lygius:
- App Service: Galimas nemokamas lygis
- Azure Functions: 1M nemokamų vykdymų per mėnesį
- Cosmos DB: Nemokamas lygis su 400 RU/s
- Application Insights: Pirmieji 5GB/mėn nemokami

Konfigūruokite šablonus, kad naudotumėte nemokamus lygius, kur jie yra.

### K: Kaip įvertinti išlaidas prieš diegimą?
**A**: 
1. Peržiūrėkite šablono `main.bicep`, kad pamatytumėte, kokie ištekliai sukuriami
2. Naudokite „Azure“ kainų skaičiuoklę su konkrečiais SKU
3. Pirmiausia diegkite į kūrimo aplinką, kad stebėtumėte faktines išlaidas
4. Naudokite „Azure“ išlaidų valdymą detaliai išlaidų analizei

---

## Geriausia praktika

### K: Kokios yra geriausios praktikos azd projekto struktūrai?
**A**: 
1. Laikykite programos kodą atskirai nuo infrastruktūros
2. Naudokite prasmingus paslaugų pavadinimus `azure.yaml`
3. Įgyvendinkite tinkamą klaidų tvarkymą kūrimo scenarijuose
4. Naudokite aplinkai specifinę konfigūraciją
5. Įtraukite išsamią dokumentaciją

### K: Kaip organizuoti kelias paslaugas azd?
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

### K: Ar turėčiau įtraukti `.azure` aplanką į versijų kontrolę?
**A**: **Ne!**
2. **Šablonai**: Kurkite šablonus laikydamiesi [šablonų gairių](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentacija**: Prisidėkite prie dokumentacijos [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### Klausimas: Koks yra azd planas?  
**A**: Peržiūrėkite [oficialų planą](https://github.com/Azure/azure-dev/projects), kuriame pateikiamos numatytos funkcijos ir patobulinimai.  

### Klausimas: Kaip pereiti nuo kitų diegimo įrankių prie azd?  
**A**:  
1. Išanalizuokite dabartinę diegimo architektūrą  
2. Sukurkite lygiaverčius Bicep šablonus  
3. Suformuokite `azure.yaml`, kad atitiktų dabartines paslaugas  
4. Kruopščiai išbandykite vystymo aplinkoje  
5. Palaipsniui perkelkite aplinkas  

---

## Vis dar turite klausimų?  

### **Pirmiausia ieškokite**  
- Peržiūrėkite [oficialią dokumentaciją](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Ieškokite [GitHub problemų](https://github.com/Azure/azure-dev/issues) dėl panašių situacijų  

### **Gaukite pagalbos**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Bendruomenės pagalba  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Techniniai klausimai  
- [Azure Discord](https://discord.gg/azure) - Bendruomenės pokalbiai realiu laiku  

### **Praneškite apie problemas**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Pranešimai apie klaidas ir funkcijų užklausos  
- Įtraukite atitinkamus žurnalus, klaidų pranešimus ir veiksmus, kaip atkurti problemą  

### **Sužinokite daugiau**  
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure gerai suprojektuotos architektūros pagrindai](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Šis DUK yra reguliariai atnaujinamas. Paskutinį kartą atnaujinta: 2025 m. rugsėjo 9 d.*  

---

**Navigacija**  
- **Ankstesnė pamoka**: [Žodynėlis](glossary.md)  
- **Kita pamoka**: [Mokymosi vadovas](study-guide.md)  

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
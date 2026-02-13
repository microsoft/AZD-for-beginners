# Dažniausiai užduodami klausimai (DUK)

**Pagalba pagal skyrių**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **🚆 Diegimo problemos**: [1 skyrius: Diegimas ir nustatymas](../docs/getting-started/installation.md)
- **🤖 AI klausimai**: [2 skyrius: AI-pirmasis vystymas](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Gedimų šalinimas**: [7 skyrius: Gedimų šalinimas ir derinimas](../docs/troubleshooting/common-issues.md)

## Introduction

Ši išsami DUK (dažniausiai užduodamų klausimų) dalis pateikia atsakymus į dažniausiai pasitaikančius klausimus apie Azure Developer CLI (azd) ir diegimus Azure. Rasite greitus sprendimus dažnoms problemoms, suprasite geriausias praktikas ir gausite paaiškinimus apie azd sąvokas ir darbo eigas.

## Learning Goals

Peržiūrėję šią DUK, jūs:
- Greitai rasite atsakymus į dažniausiai pasitaikančius Azure Developer CLI klausimus ir problemas
- Suprasite pagrindines sąvokas ir terminologiją per praktinį klausimų ir atsakymų formatą
- Gaunate prieigą prie trikčių šalinimo sprendimų dažnoms problemoms ir klaidų scenarijams
- Išmoksite geriausių praktikų optimizavimo klausimais
- Atraskite pažangias funkcijas ir galimybes per ekspertų lygio klausimus
- Efektyviai rasite informaciją apie kainas, saugumą ir diegimo strategijas

## Learning Outcomes

Reguliariai naudojantis šia DUK, jūs sugebėsite:
- Savarankiškai spręsti dažniausias Azure Developer CLI problemas, pasinaudodami pateiktais sprendimais
- Priimti pagrįstus sprendimus dėl diegimo strategijų ir konfigūracijų
- Suprasti azd ryšį su kitais Azure įrankiais ir paslaugomis
- Taikyti geriausias praktikas, remiantis bendruomenės patirtimi ir ekspertų rekomendacijomis
- Efektyviai spręsti autentifikacijos, diegimo ir konfigūracijos problemas
- Optimizuoti išlaidas ir našumą pasinaudodami DUK įžvalgomis ir rekomendacijomis

## Table of Contents

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) yra į kūrėją orientuotas komandų eilutės įrankis, kuris pagreitina jūsų programos nuo vietinės kūrimo aplinkos perkėlimą į Azure. Jis teikia geriausias praktikas per šablonus ir padeda visame diegimo gyvenimo cikle.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Bendros paskirties įrankis Azure ištekliams valdyti
- **azd**: Į kūrėją orientuotas įrankis programų diegimo darbo eigai
- azd naudoja Azure CLI viduje, bet suteikia aukštesnio lygio abstrakcijas dažnai pasitaikančioms kūrimo situacijoms
- azd apima šablonus, aplinkų valdymą ir diegimo automatizavimą

### Q: Do I need Azure CLI installed to use azd?
**A**: Taip, azd reikalauja Azure CLI autentifikacijai ir kai kurioms operacijoms. Pirmiausia įdiekite Azure CLI, tada įdiekite azd.

### Q: What programming languages does azd support?
**A**: azd nepriklauso nuo konkrečios kalbos. Jis veikia su:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiniais tinklalapiais
- Docker konteinerizuotomis programomis

### Q: Can I use azd with existing projects?
**A**: Taip! Galite arba:
1. Naudoti `azd init`, kad pridėtumėte azd konfigūraciją esamiems projektams
2. Pritaikyti esamus projektus, kad jie atitiktų azd šablonų struktūrą
3. Kurti pasirinktinius šablonus, paremtus jūsų esama architektūra

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Naudokite `azd auth login`, kuris atidarys naršyklės langą Azure autentifikacijai. CI/CD scenarijams naudokite paslaugų principus (service principals) arba valdomas tapatybes (managed identities).

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Taip. Naudokite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, kad nurodytumėte, kuri prenumerata naudoti kiekvienai aplinkai.

### Q: What permissions do I need to deploy with azd?
**A**: Paprastai reikalinga:
- **Contributor** rolė resursų grupei arba prenumeratai
- **User Access Administrator**, jei diegiate išteklius, kuriems reikalingi rolės priskyrimai
- Konkretūs leidimai priklauso nuo šablono ir diegiamų išteklių

### Q: Can I use azd in CI/CD pipelines?
**A**: Absoliučiai! azd yra sukurtas CI/CD integracijai. Naudokite paslaugų principus autentifikacijai ir nustatykite aplinkos kintamuosius konfigūracijai.

### Q: How do I handle authentication in GitHub Actions?
**A**: Naudokite Azure Login veiksmą su paslaugų principo kredencialais:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Oficialūs šablonai: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Bendruomenės šablonai: GitHub paieška pagal "azd-template"
- Naudokite `azd template list`, kad peržiūrėtumėte prieinamus šablonus

### Q: How do I create a custom template?
**A**: 
1. Pradėkite nuo esamos šablono struktūros
2. Modifikuokite `azure.yaml`, infrastruktūros failus ir programos kodą
3. Kruopščiai išbandykite su `azd up`
4. Paskelbkite GitHub su tinkamais žymėmis

### Q: Can I use azd without a template?
**A**: Taip, naudokite `azd init` esamame projekte, kad sukurtumėte reikalingus konfigūracijos failus. Reikės rankiniu būdu sukonfigūruoti `azure.yaml` ir infrastruktūros failus.

### Q: What's the difference between official and community templates?
**A**: 
- **Oficialūs šablonai**: Prižiūrimi Microsoft, reguliariai atnaujinami, išsami dokumentacija
- **Bendruomenės šablonai**: Sukuriami kūrėjų, gali būti specializuoti, kokybė ir priežiūra gali skirtis

### Q: How do I update a template in my project?
**A**: Šablonai nėra atnaujinami automatiškai. Galite:
1. Rankiniu būdu palyginti ir sujungti pakeitimus iš šaltinio šablono
2. Pradėti iš naujo su `azd init`, naudojant atnaujintą šabloną
3. Išrinkti (cherry-pick) konkrečius patobulinimus iš atnaujintų šablonų

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd gali diegti bet kurią Azure paslaugą per Bicep/ARM šablonus, įskaitant:
- App Services, Container Apps, Functions
- Duomenų bazių sprendimus (SQL, PostgreSQL, Cosmos DB)
- Saugyklą, Key Vault, Application Insights
- Tinklo, saugumo ir stebėjimo išteklius

### Q: Can I deploy to multiple regions?
**A**: Taip, sukonfigūruokite kelis regionus savo Bicep šablonuose ir nustatykite location parametrą tinkamai kiekvienai aplinkai.

### Q: How do I handle database schema migrations?
**A**: Naudokite diegimo kabliukus (deployment hooks) `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Taip, naudokite `azd provision`, kad diegtumėte tik infrastruktūros komponentus, apibrėžtus jūsų šablonuose.

### Q: How do I deploy to existing Azure resources?
**A**: Tai sudėtinga ir nėra tiesiogiai palaikoma. Galite:
1. Importuoti esamus išteklius į savo Bicep šablonus
2. Naudoti esamų išteklių nuorodas šablonuose
3. Modifikuoti šablonus, kad sąlygiškai kurtų arba nuorodintųsi į išteklius

### Q: Can I use Terraform instead of Bicep?
**A**: Šiuo metu azd iš esmės palaiko Bicep/ARM šablonus. Oficiali Terraform parama nėra prieinama, nors gali būti bendruomenės sprendimų.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Sukurkite atskiras aplinkas su `azd env new <environment-name>` ir sukonfigūruokite skirtingus nustatymus kiekvienai:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: `.azure` aplanke jūsų projekto kataloge. Kiekviena aplinka turi savo aplanką su konfigūracijos failais.

### Q: How do I set environment-specific configuration?
**A**: Naudokite `azd env set`, kad sukonfigūruotumėte aplinkos kintamuosius:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure` aplankas talpina jautrią informaciją ir neturėtų būti įtrauktas į versijų valdymą. Vietoje to:
1. Dokumentuokite reikalingus aplinkos kintamuosius
2. Naudokite diegimo skriptus aplinkų nustatymui
3. Naudokite Azure Key Vault jautriai konfigūracijai

### Q: How do I override template defaults?
**A**: Nustatykite aplinkos kintamuosius, atitinkančius šablono parametrus:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Dažni priežastys:
1. **Autentifikacijos problemos**: Vykdykite `azd auth login`
2. **Nepakankamos teisės**: Patikrinkite savo Azure rolės priskyrimus
3. **Išteklių vardų konfliktai**: Pakeiskite AZURE_ENV_NAME
4. **Kvotų/pajėgumų problemos**: Patikrinkite regiono prieinamumą
5. **Šablonų klaidos**: Patvirtinkite Bicep šablonus

### Q: How do I debug deployment failures?
**A**: 
1. Naudokite `azd deploy --debug` detalizuotam išvedimui
2. Patikrinkite Azure portal diegimo istoriją
3. Peržiūrėkite Activity Log Azure portale
4. Naudokite `azd show`, kad parodytumėte dabartinės aplinkos būseną

### Q: Why are my environment variables not working?
**A**: Patikrinkite:
1. Kintamųjų pavadinimai tiksliai atitinka šablono parametrus
2. Reikšmės tinkamai užbrauktos kabutėmis, jei jose yra tarpai
3. Aplinka pasirinkta: `azd env select <environment>`
4. Kintamieji nustatyti teisingoje aplinkoje

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why is my application not accessible after deployment?
**A**: Patikrinkite:
1. Ar diegimas sėkmingai užbaigtas
2. Ar programa veikia (patikrinkite žurnalus Azure portale)
3. Ar tinklo saugumo grupės leidžia srautą
4. Ar DNS / pritaikyti domenai sukonfigūruoti teisingai

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Išlaidos priklauso nuo:
- Diegiamų Azure paslaugų
- Pasirinktų paslaugų lygių/SKU
- Regioninių kainų skirtumų
- Naudojimo modelių

Naudokite [Azure kainų skaičiuoklę](https://azure.microsoft.com/pricing/calculator/) apskaičiavimams.

### Q: How do I control costs in azd deployments?
**A**: 
1. Naudokite mažesnio lygio SKU kūrimo aplinkoms
2. Nustatykite Azure biudžetus ir įspėjimus
3. Naudokite `azd down`, kad pašalintumėte išteklius, kai jų nereikia
4. Pasirinkite tinkamus regionus (kainos skiriasi pagal vietą)
5. Naudokite Azure Cost Management įrankius

### Q: Are there free tier options for azd templates?
**A**: Daugelis Azure paslaugų siūlo nemokamus lygius:
- App Service: prieinama nemokama pakopa
- Azure Functions: 1M nemokamų vykdymų per mėnesį
- Cosmos DB: nemokamas lygis su 400 RU/s
- Application Insights: pirmi 5GB/mėn nemokamai

Suformuokite šablonus, kad naudotų nemokamus lygius, kai jie yra prieinami.

### Q: How do I estimate costs before deployment?
**A**: 
1. Peržiūrėkite šablono `main.bicep`, kad pamatytumėte, kokie ištekliai bus sukurti
2. Naudokite Azure kainų skaičiuoklę su konkrečiais SKU
3. Pirmiausia diegkite į kūrimo aplinką, kad stebėtumėte faktines išlaidas
4. Naudokite Azure Cost Management detaliai išlaidų analizei

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Laikykite programos kodą atskirai nuo infrastruktūros
2. Naudokite prasmingus paslaugų pavadinimus `azure.yaml`
3. Įgyvendinkite tinkamą klaidų tvarkymą build skriptuose
4. Naudokite aplinkai specifinę konfigūraciją
5. Įtraukite išsamią dokumentaciją

### Q: How should I organize multiple services in azd?
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

### Q: Should I commit the `.azure` folder to version control?
**A**: **Ne!** `.azure` aplanke yra jautri informacija. Įtraukite jį į `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Naudokite Azure Key Vault slapties informacijai
2. Nurodykite Key Vault slaptį programos konfigūracijoje
3. Niekada neįkelkite slaptos informacijos į versijų valdymą
4. Naudokite valdomas tapatybes paslaugų tarpusavio autentifikacijai

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Naudokite atskiras aplinkas kiekvienam etapui (dev/staging/prod)
2. Įgyvendinkite automatizuotus testus prieš diegimą
3. Naudokite paslaugų principus autentifikacijai
4. Laikykite jautrią konfigūraciją pipeline slaptuose kintamuosiuose / variabluose
5. Įgyvendinkite patvirtinimo vartus produkciniams diegimams

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Taip, per diegimo kabliukus `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Naudokite azd komandas esamuose pipeline skriptuose
2. Standartizuokite azd šablonus tarp komandų
3. Integruokite su esama stebėsena ir įspėjimais
4. Naudokite azd JSON išvestį pipeline integracijai

### Q: Can I use azd with Azure DevOps?
**A**: Taip, azd veikia su bet kuriuo CI/CD sistema. Kurkite Azure DevOps pipelines, kurie naudoja azd komandas.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd įrankis**: Prisidėkite prie [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablonai**: Kurkite šablonus pagal [šablonų gaires](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentacija**: Prisidėkite prie dokumentacijos projekte [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Kokia yra azd plėtros gairė?
**A**: Patikrinkite [oficialų veiksmų planą](https://github.com/Azure/azure-dev/projects) dėl planuojamų funkcijų ir patobulinimų.

### Q: Kaip migruoti iš kitų diegimo įrankių į azd?
**A**: 
1. Išanalizuokite esamą diegimo architektūrą
2. Sukurkite ekvivalentinius Bicep šablonus
3. Sukonfigūruokite `azure.yaml` taip, kad atitiktų esamas paslaugas
4. Išsamiai išbandykite kūrimo aplinkoje
5. Palaipsniui perkelkite aplinkas

---

## Vis dar turite klausimų?

### **Pirmiausia ieškokite**
- Patikrinkite [oficialią dokumentaciją](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Ieškokite [GitHub issues](https://github.com/Azure/azure-dev/issues) panašių problemų

### **Gaukite pagalbą**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Bendruomenės palaikymas
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Techniniai klausimai
- [Azure Discord](https://discord.gg/azure) - Bendruomenės pokalbis realiu laiku

### **Praneškite apie problemas**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Klaidų pranešimai ir funkcijų prašymai
- Įtraukite atitinkamus žurnalus, klaidų pranešimus ir veiksmus, kaip atkurti problemą

### **Sužinokite daugiau**
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Šis DUK reguliariai atnaujinamas. Paskutinį kartą atnaujinta: 2025 m. rugsėjo 9 d.*

---

**Navigacija**
- **Ankstesnė pamoka**: [Žodynas](glossary.md)
- **Kita pamoka**: [Studijų vadovas](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:42:05+00:00",
  "source_file": "README.md",
  "language_code": "lt"
}
-->
# AZD Pradedantiesiems

![AZD-pradedantiesiems](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.lt.png) 

Sekite šiuos žingsnius, kad pradėtumėte naudotis šiais ištekliais:
1. **Fork'uokite saugyklą**: Spustelėkite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite saugyklą**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Prisijunkite prie Azure Discord bendruomenių ir susipažinkite su ekspertais bei kitais kūrėjais**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Daugiakalbė parama

#### Palaikoma per GitHub Action (Automatizuota ir visada atnaujinta)

[Prancūzų](../fr/README.md) | [Ispanų](../es/README.md) | [Vokiečių](../de/README.md) | [Rusų](../ru/README.md) | [Arabų](../ar/README.md) | [Persų (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinų (Supaprastinta)](../zh/README.md) | [Kinų (Tradicinė, Makao)](../mo/README.md) | [Kinų (Tradicinė, Honkongas)](../hk/README.md) | [Kinų (Tradicinė, Taivanas)](../tw/README.md) | [Japonų](../ja/README.md) | [Korėjiečių](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalų](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalų](../ne/README.md) | [Pundžabi (Gurmukhi)](../pa/README.md) | [Portugalų (Portugalija)](../pt/README.md) | [Portugalų (Brazilija)](../br/README.md) | [Italų](../it/README.md) | [Lenkų](../pl/README.md) | [Turkų](../tr/README.md) | [Graikų](../el/README.md) | [Tajų](../th/README.md) | [Švedų](../sv/README.md) | [Danų](../da/README.md) | [Norvegų](../no/README.md) | [Suomių](../fi/README.md) | [Olandų](../nl/README.md) | [Hebrajų](../he/README.md) | [Vietnamiečių](../vi/README.md) | [Indoneziečių](../id/README.md) | [Malajų](../ms/README.md) | [Tagalog (Filipiniečių)](../tl/README.md) | [Svahilių](../sw/README.md) | [Vengrų](../hu/README.md) | [Čekų](../cs/README.md) | [Slovakų](../sk/README.md) | [Rumunų](../ro/README.md) | [Bulgarų](../bg/README.md) | [Serbų (Kirilica)](../sr/README.md) | [Kroatų](../hr/README.md) | [Slovėnų](../sl/README.md) | [Ukrainiečių](../uk/README.md) | [Birmos (Mianmaras)](../my/README.md)

**Jei norite, kad būtų palaikomos papildomos kalbos, sąrašą rasite [čia](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Įvadas

Sveiki atvykę į išsamų Azure Developer CLI (azd) vadovą. Ši saugykla skirta padėti kūrėjams, nepriklausomai nuo jų patirties lygio – nuo studentų iki profesionalų – išmokti ir įvaldyti Azure Developer CLI efektyviems debesų diegimams. Šis struktūrizuotas mokymosi šaltinis suteikia praktinės patirties su Azure debesų diegimais, dažniausiai pasitaikančių problemų sprendimu ir geriausių praktikų įgyvendinimu sėkmingiems AZD šablonų diegimams.

## Mokymosi tikslai

Dirbdami su šia saugykla, jūs:
- Įvaldysite Azure Developer CLI pagrindus ir pagrindines sąvokas
- Išmoksite diegti ir kurti Azure išteklius naudodami infrastruktūrą kaip kodą
- Ugdysite problemų sprendimo įgūdžius, susijusius su AZD diegimo problemomis
- Suprasite prieš diegimą atliekamą patikrą ir pajėgumų planavimą
- Įgyvendinsite saugumo geriausias praktikas ir išlaidų optimizavimo strategijas
- Įgysite pasitikėjimo diegiant gamybai paruoštas programas į Azure

## Mokymosi rezultatai

Baigę šį kursą, jūs galėsite:
- Sėkmingai įdiegti, sukonfigūruoti ir naudoti Azure Developer CLI
- Kurti ir diegti programas naudodami AZD šablonus
- Spręsti autentifikavimo, infrastruktūros ir diegimo problemas
- Atlikti prieš diegimą atliekamas patikras, įskaitant pajėgumų planavimą ir SKU pasirinkimą
- Įgyvendinti stebėjimo, saugumo ir išlaidų valdymo geriausias praktikas
- Integruoti AZD darbo eigas į CI/CD procesus

## Turinys

- [Kas yra Azure Developer CLI?](../..)
- [Greitas startas](../..)
- [Dokumentacija](../..)
- [Pavyzdžiai ir šablonai](../..)
- [Ištekliai](../..)
- [Prisidėjimas](../..)

## Kas yra Azure Developer CLI?

Azure Developer CLI (azd) yra kūrėjams pritaikyta komandinės eilutės sąsaja, kuri pagreitina programų kūrimo ir diegimo procesą Azure platformoje. Ji siūlo:

- **Šablonais pagrįsti diegimai** - Naudokite iš anksto paruoštus šablonus dažniausiai pasitaikančioms programų struktūroms
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudodami Bicep arba Terraform
- **Integruotos darbo eigos** - Sklandžiai kurkite, diekite ir stebėkite programas
- **Draugiška kūrėjams** - Optimizuota kūrėjų produktyvumui ir patirčiai

## Greitas startas

### Būtinos sąlygos
- Azure prenumerata
- Įdiegtas Azure CLI
- Git (šablonų klonavimui)

### Įdiegimas
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Pirmasis diegimas
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentacija

### Pradžia
- [**AZD pagrindai**](docs/getting-started/azd-basics.md) - Pagrindinės sąvokos ir terminologija
- [**Įdiegimas ir nustatymas**](docs/getting-started/installation.md) - Platformai pritaikyti įdiegimo vadovai
- [**Konfigūracija**](docs/getting-started/configuration.md) - Aplinkos nustatymas ir autentifikacija
- [**Pirmasis projektas**](docs/getting-started/first-project.md) - Žingsnis po žingsnio pamoka

### Diegimas ir išteklių kūrimas
- [**Diegimo vadovas**](docs/deployment/deployment-guide.md) - Pilnos diegimo darbo eigos
- [**Išteklių kūrimas**](docs/deployment/provisioning.md) - Azure išteklių valdymas

### Prieš diegimą atliekamos patikros
- [**Pajėgumų planavimas**](docs/pre-deployment/capacity-planning.md) - Azure išteklių pajėgumų patvirtinimas
- [**SKU pasirinkimas**](docs/pre-deployment/sku-selection.md) - Tinkamų Azure SKU pasirinkimas
- [**Prieš diegimą atliekamos patikros**](docs/pre-deployment/preflight-checks.md) - Automatiniai patvirtinimo scenarijai

### Problemų sprendimas
- [**Dažnos problemos**](docs/troubleshooting/common-issues.md) - Dažniausiai pasitaikančios problemos ir jų sprendimai
- [**Derinimo vadovas**](docs/troubleshooting/debugging.md) - Žingsnis po žingsnio derinimo strategijos

## Pavyzdžiai ir šablonai

### Pradiniai šablonai
- [**Paprasta interneto programa**](../../examples/simple-web-app) - Pagrindinis Node.js interneto programos diegimas
- [**Statinė svetainė**](../../examples/static-website) - Statinės svetainės talpinimas Azure Storage
- [**Konteinerinė programa**](../../examples/container-app) - Konteinerizuotos programos diegimas
- [**Duomenų bazės programa**](../../examples/database-app) - Interneto programa su duomenų bazės integracija

### Sudėtingesni scenarijai
- [**Mikropaslaugos**](../../examples/microservices) - Daugiafunkcinės programos architektūra
- [**Serverless funkcijos**](../../examples/serverless-function) - Azure Functions diegimas
- [**Konfigūracijų pavyzdžiai**](../../examples/configurations) - Naudojamos konfigūracijų struktūros

## Ištekliai

### Greitos nuorodos
- [**Komandų atmintinė**](resources/cheat-sheet.md) - Esminės azd komandos
- [**Žodynėlis**](resources/glossary.md) - Azure ir azd terminologija
- [**DUK**](resources/faq.md) - Dažniausiai užduodami klausimai
- [**Mokymosi vadovas**](resources/study-guide.md) - Išsamūs mokymosi tikslai ir praktikos užduotys

### Išoriniai ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure būsenos puslapis](https://status.azure.com/)

## Mokymosi kelias

### Studentams ir pradedantiesiems
1. Pradėkite nuo [AZD pagrindų](docs/getting-started/azd-basics.md)
2. Sekite [Įdiegimo vadovą](docs/getting-started/installation.md)
3. Užbaikite [Pirmąjį projektą](docs/getting-started/first-project.md)
4. Praktikuokitės su [Paprastos interneto programos pavyzdžiu](../../examples/simple-web-app)

### Kūrėjams
1. Peržiūrėkite [Konfigūracijos vadovą](docs/getting-started/configuration.md)
2. Išstudijuokite [Diegimo vadovą](docs/deployment/deployment-guide.md)
3. Dirbkite su [Duomenų bazės programos pavyzdžiu](../../examples/database-app)
4. Išbandykite [Konteinerinės programos pavyzdį](../../examples/container-app)

### DevOps inžinieriams
1. Įvaldykite [Išteklių kūrimą](docs/deployment/provisioning.md)
2. Įgyvendinkite [Prieš diegimą atliekamas patikras](docs/pre-deployment/preflight-checks.md)
3. Praktikuokitės [Pajėgumų planavimą](docs/pre-deployment/capacity-planning.md)
4. Išbandykite [Mikropaslaugų pavyzdį](../../examples/microservices)

## Prisidėjimas

Mes laukiame jūsų indėlio! Prašome perskaityti mūsų [Prisidėjimo vadovą](CONTRIBUTING.md), kuriame rasite informaciją apie:
- Kaip pateikti problemas ir funkcijų užklausas
- Kodo prisidėjimo gaires
- Dokumentacijos tobulinimą
- Bendruomenės standartus

## Palaikymas

- **Problemos**: [Praneškite apie klaidas ir pateikite funkcijų užklausas](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskusijos**: [Microsoft Azure Discord bendruomenės klausimai ir diskusijos](https://discord.gg/microsoft-azure)
- **El. paštas**: Privatiems užklausimams
- **Microsoft Learn**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licencija

Šis projektas licencijuotas pagal MIT licenciją - detales rasite [LICENSE](../../LICENSE) faile.

## 🎒 Kiti kursai

Mūsų komanda kuria kitus kursus! Peržiūrėkite:

- [**NAUJAS** Model Context Protocol (MCP) pradedantiesiems](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI agentai pradedantiesiems](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatyvinė AI pradedantiesiems naudojant .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatyvinė AI pradedantiesiems](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatyvinė AI pradedantiesiems naudojant Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML pradedantiesiems](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Duomenų mokslas pradedantiesiems](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI pradedantiesiems](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kibernetinis saugumas pradedantiesiems](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Pradedantiesiems: Tinklalapių kūrimas](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [Pradedantiesiems: Daiktų internetas (IoT)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Pradedantiesiems: XR kūrimas](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot įvaldymas AI poriniam programavimui](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot įvaldymas C#/.NET programuotojams](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Pasirinkite savo Copilot nuotykį](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigacija**
- **Kita pamoka**: [AZD pagrindai](docs/getting-started/azd-basics.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
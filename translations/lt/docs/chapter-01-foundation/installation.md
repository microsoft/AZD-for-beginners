# Diegimo ir nustatymo vadovas

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md)
- **➡️ Kitas**: [Jūsų pirmas projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: DI pirmoji plėtra](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite kelis diegimo būdus skirtingoms operacinėms sistemoms, autentifikacijos nustatymą ir pradinę konfigūraciją, kad pasiruoštumėte vystymo aplinką Azure diegimams.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Sėkmingai įdiegsite Azure Developer CLI jūsų operacinėje sistemoje
- Konfigūruosite autentifikaciją su Azure naudojant kelis metodus
- Paruošite vystymo aplinką su reikiamomis priklausomybėmis
- Suprasite skirtingas diegimo parinktis ir kada jas naudoti
- Spręsite dažniausias diegimo ir nustatymo problemas

## Mokymosi rezultatai

Baigę šią pamoką galėsite:
- Įdiegti azd naudodami tinkamą metodą jūsų platformai
- Autentifikuotis su Azure naudojant azd auth login
- Patikrinti diegimą ir išbandyti bazines azd komandas
- Konfigūruoti vystymo aplinką optimaliam azd naudojimui
- Savarankiškai spręsti dažnas diegimo problemas

Šis vadovas padės įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, nepriklausomai nuo operacinės sistemos ar vystymo aplinkos.

## Prieš diegiant

Prieš diegiant azd, įsitikinkite, kad turite:
- **Azure prenumeratą** - [Sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** - autentifikacijai ir išteklių valdymui
- **Git** - šablonų klonavimui ir versijų kontrolei
- **Docker** (pasirinktinai) - konteinerizuotoms programoms

## Diegimo būdai

### Windows

#### Parinktis 1: Windows Package Manager (rekomenduojama)
```cmd
winget install microsoft.azd
```

#### Parinktis 2: PowerShell diegimo skriptas
```powershell
# Naudinga, kai winget nėra pasiekiamas
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Parinktis 3: Chocolatey
```cmd
choco install azd
```

#### Parinktis 4: Rankinis diegimas
1. Atsisiųskite naujausią versiją iš [GitHub](https://github.com/Azure/azure-dev/releases)
2. Išskleiskite į `C:\Program Files\azd\`
3. Pridėkite prie PATH aplinkos kintamojo

### macOS

#### Parinktis 1: Homebrew (rekomenduojama)
```bash
brew tap azure/azd
brew install azd
```

#### Parinktis 2: Diegimo skriptas
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Parinktis 3: Rankinis diegimas
```bash
# Atsisiųsti ir įdiegti
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Parinktis 1: Diegimo skriptas (rekomenduojama)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Parinktis 2: Paketų tvarkyklės

**Rankinis diegimas iš leidimų paketų:**
```bash
# Atsisiųskite naujausią archyvą savo Linux architektūrai iš:
# https://github.com/Azure/azure-dev/releases
# Tada išarchyvuokite ir pridėkite azd vykdomąjį failą prie savo PATH.
```

### GitHub Codespaces

Kai kurios Codespaces ir vystymo konteinerių aplinkos jau turi `azd`, tačiau rekomenduojama tai patikrinti, o ne tik manyti:

```bash
azd version
```

Jei `azd` trūksta, įdiekite standartiniu skriptu atitinkamai aplinkai.

### Docker

```bash
# Vykdyti azd konteineryje
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Sukurti alias patogesniam naudojimui
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Diegimo patikrinimas

Įdiegus, patikrinkite ar azd veikia tinkamai:

```bash
# Patikrinti versiją
azd version

# Peržiūrėti pagalbą
azd --help

# Išvardinti galimus šablonus
azd template list
```

Numatomas išvestis:
```
azd version 1.x.x (commit xxxxxx)
```

**Pastaba**: Versijos numeris gali skirtis. Naujausias versijas žr. [Azure Developer CLI leidimai](https://github.com/Azure/azure-dev/releases).

**✅ Įdiegimo sėkmės sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` pateikia komandų dokumentaciją
- [ ] `azd template list` rodo prieinamus šablonus
- [ ] Galite sukurti testinį katalogą ir sėkmingai paleisti `azd init`

**Jei visi patikrinimai praėjo, galite tęsti prie [Jūsų pirmo projekto](first-project.md)!**

## Autentifikacijos nustatymas

### Rekomenduojamas pradedančiųjų nustatymas

AZD pagrindiniams darbo procesams prisijunkite su `azd auth login`.

```bash
# Būtina AZD komandoms, tokioms kaip azd up
azd auth login

# Patvirtinkite AZD autentifikacijos būseną
azd auth login --check-status
```

Naudokite Azure CLI prisijungimą tik jei ketinate kursas vykdydami patys vykdyti `az` komandas.

### Azure CLI autentifikacija (pasirinktinai)
```bash
# Įdiekite Azure CLI, jei dar nėra įdiegta
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: peržiūrėkite Azure CLI diegimo dokumentus savo distribucijai

# Prisijunkite prie Azure
az login

# Patvirtinkite autentifikaciją
az account show
```

### Kurį prisijungimo būdą rinktis?

- Naudokite `azd auth login`, jei laikotės pradinio AZD kelio ir daugiausia naudojate `azd` komandas.
- Taip pat naudokite `az login`, jei norite vykdyti Azure CLI komandas, pvz., `az account show` arba tiesiogiai tikrinti išteklius.
- Jei užduotyje yra abi komandos `azd` ir `az`, paleiskite abu prisijungimo komandas pradžioje.

### Įrenginio kodo autentifikacija
Jei naudojate bevadinę sistemą ar kyla naršyklės problemų:
```bash
azd auth login --use-device-code
```

### Paslaugų principas (CI/CD)
Automatizuotoms aplinkoms:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Patikrinkite pilną savo nustatymą

Jei norite greito paruošimo patikrinimo prieš 1 skyrių:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigūracija

### Globali konfigūracija
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription <subscription-id>

# Nustatyti numatytąją vietą
azd config set defaults.location eastus2

# Peržiūrėti visą konfigūraciją
azd config show
```

### Aplinkos kintamieji
Pridėkite prie savo šerlo profilio (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfigūracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfigūracija
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Įgalinti derinimo žurnalo įrašymą
```

## IDE integracija

### Visual Studio Code
Įdiekite Azure Developer CLI papildinį:
1. Atidarykite VS Code
2. Eikite į Priedus (Ctrl+Shift+X)
3. Ieškokite „Azure Developer CLI“
4. Įdiekite priedą

Funkcijos:
- IntelliSense azure.yaml failams
- Integruotas terminalas komandoms
- Šablonų naršymas
- Diegimų stebėjimas

### GitHub Codespaces
Sukurkite `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Įdiekite Azure plėtinį
2. Sukonfigūruokite Azure kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo trikčių šalinimas

### Dažnos problemos

#### Leidimų klaida (Windows)
```powershell
# Paleiskite PowerShell kaip administratorius
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problemos
Rankiniu būdu pridėkite azd prie savo PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Tinklo / Proxy problemos
```bash
# Konfigūruoti proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Praleisti SSL patikrinimą (nerekomenduojama produkcijoje)
azd config set http.insecure true
```

#### Versijų konfliktai
```bash
# Pašalinti senas diegimo versijas
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: pašalinkite ankstesnį azd binarinį failą arba simbolinę nuorodą prieš diegdami iš naujo

# Išvalyti konfigūraciją
rm -rf ~/.azd
```

### Papildoma pagalba
```bash
# Įgalinti derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug

# Peržiūrėti dabartinę konfigūraciją
azd config show

# Peržiūrėti dabartinę diegimo būseną
azd show
```

## azd atnaujinimas

### Atnaujinimo patikra
azd įspėja, kai yra naujesnė versija, ir galite patikrinti dabartinę su:
```bash
azd version
```

### Rankiniai atnaujinimai

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Dažnai užduodami klausimai

<details>
<summary><strong>Kuo skiriasi azd ir az CLI?</strong></summary>

**Azure CLI (az)**: žemo lygio įrankis atskirų Azure išteklių valdymui
- `az webapp create`, `az storage account create`
- Vienas išteklius vienu metu
- Infrastruktūros valdymo fokusas

**Azure Developer CLI (azd)**: aukšto lygio įrankis visoms programų diegimo sritims
- `azd up` diegia visą programą su visais ištekliais
- Šablonais paremti darbo procesai
- Vystymo produktyvumo fokusas

**Reikia abiejų**: azd naudoja az CLI autentifikacijai
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure ištekliais?</strong></summary>

Taip! Galite:
1. Importuoti esamus išteklius į azd aplinkas
2. Nurodyti esamus išteklius savo Bicep šablonuose
3. Naudoti azd naujiems diegimams kartu su esama infrastruktūra

Daugiau žr. [Konfigūracijos vadovas](configuration.md).
</details>

<details>
<summary><strong>Ar azd veikia su Azure Government arba Azure China?</strong></summary>

Taip, sukonfigūruokite debesį:
```bash
# Azure Vyriausybė
az cloud set --name AzureUSGovernment
az login

# Azure Kinija
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Ar galiu naudoti azd CI/CD vamzdynuose?</strong></summary>

Tikrai! azd sukurtas automatizavimui:
- GitHub Actions integracija
- Azure DevOps palaikymas
- Paslaugų principo autentifikacija
- Neinteraktyvus režimas

Daugiau CI/CD pavyzdžių žr. [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kokia yra azd naudojimo kaina?</strong></summary>

azd yra **visiškai nemokamas** ir atviro kodo. Mokate tik už:
- Azure išteklius, kuriuos diegiate
- Azure naudojimo kaštus (kompiuterija, saugykla ir kt.)

Naudokite `azd provision --preview`, kad įvertintumėte kaštus prieš diegdami.
</details>

## Tolimesni žingsniai

1. **Užbaikite autentifikaciją**: įsitikinkite, kad turite prieigą prie Azure prenumeratos
2. **Išbandykite pirmąjį diegimą**: sekite [Pirmojo projekto vadovą](first-project.md)
3. **Naršykite šablonus**: peržiūrėkite galimus šablonus su `azd template list`
4. **Konfigūruokite IDE**: pasiruoškite vystymo aplinką

## Pagalba

Jei susiduriate su problemomis:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Praneškite apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure palaikymas](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Gaukite Azure komandų pagalbą tiesiai savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmas projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: DI pirmoji plėtra](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Diegimas baigtas!** Toliau tęskite prie [Jūsų pirmo projekto](first-project.md), kad pradėtumėte kurti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, turėkite omenyje, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas pagrindiniu šaltiniu. Esant svarbiai informacijai, rekomenduojama pasinaudoti profesionalaus žmogaus vertimu. Mes neatsakome už bet kokius nesusipratimus ar klaidingus interpretavimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
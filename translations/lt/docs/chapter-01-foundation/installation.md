# Diegimo ir Nustatymo Vadovas

**Dalis Navigacija:**
- **📚 Kurso Titulinis**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinė Dalis**: 1 Dalis - Pagrindai ir Greitas Paleidimas
- **⬅️ Ankstesnė**: [AZD Pagrindai](azd-basics.md)
- **➡️ Tolimesnė**: [Jūsų Pirmas Projektas](first-project.md)
- **🚀 Kita Dalis**: [2 Dalis: AI-Pirmoji Kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite kelis diegimo būdus skirtingoms operacinėms sistemoms, autentifikacijos nustatymą ir pradinę konfigūraciją, kad pasiruoštumėte kūrimo aplinką Azure diegimams.

## Mokymosi Tikslai

Baigę šią pamoką, jūs:
- Sėkmingai įdiegsite Azure Developer CLI savo operacinėje sistemoje
- Konfigūruosite autentifikaciją su Azure naudojant kelis metodus
- Paruošite savo kūrimo aplinką su reikalingomis išankstinėmis sąlygomis
- Suprasite skirtingas diegimo galimybes ir kada kurį metodą naudoti
- Išspręsite dažnas diegimo ir nustatymų problemas

## Mokymosi Rezultatai

Baigę pamoką, galėsite:
- Įdiegti azd naudodami tinkamą metodą jūsų platformoje
- Autentifikuotis su Azure naudojant azd auth login
- Patikrinti diegimą ir išbandyti pagrindines azd komandas
- Suformuoti savo kūrimo aplinką optimaliai azd naudojimui
- Savarankiškai išspręsti dažnas diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, nepriklausomai nuo jūsų operacinės sistemos ar kūrimo aplinkos.

## Išankstiniai Reikalavimai

Prieš diegdami azd, įsitikinkite, kad turite:
- **Azure prenumeratą** - [Sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** (pasirinktinai) - Pavyzdžiams, kuriuose aiškiai naudojamas `az`; azd autentifikuojasi savarankiškai
- **Git** - Šablonų klonavimui ir versijų kontrolei
- **Docker** (pasirinktinai) - Konteinerizuotoms programoms

## Įdiegimo Būdai

### Windows

#### 1 variantas: Windows Paketų Valdymas (Rekomenduojama)
```cmd
winget install microsoft.azd
```

#### 2 variantas: PowerShell Įdiegimo Skriptas
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 3 variantas: Chocolatey
```cmd
choco install azd
```

#### 4 variantas: Rankinis Įdiegimas
1. Atsisiųskite naujausią versiją iš [GitHub](https://github.com/Azure/azure-dev/releases)
2. Išarchyvuokite į `C:\Program Files\azd\`
3. Įtraukite į PATH aplinkos kintamąjį

### macOS

#### 1 variantas: Homebrew (Rekomenduojama)
```bash
brew tap azure/azd
brew install azd
```

#### 2 variantas: Įdiegimo Skriptas
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3 variantas: Rankinis Įdiegimas
Atsisiųskite archyvą savo macOS architektūrai iš [išleidimo resursų](https://github.com/Azure/azure-dev/releases), išarchyvuokite ir pridėkite `azd` binarinį failą į savo `PATH`.

### Linux

#### 1 variantas: Įdiegimo Skriptas (Rekomenduojama)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2 variantas: Paketų Valdymo Sistemos

**Rankinis įdiegimas iš išleidimo resursų:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Kai kurios Codespaces ir kūrimo konteinerių aplinkos jau turi `azd`, tačiau turėtumėte tai patikrinti, o ne manyti:

```bash
azd version
```

Jei `azd` nėra įdiegta, įdiekite ją naudodami standartinį aplinkos scenarijų.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Šis laikinas konteineris neišsaugo prisijungimo būsenos tarp paleidimų. Jei diegimas vykdomas kelis kartus, naudokite [kūrimo konteinerio nustatymą](dev-containers.md); konteinerio kūrimui taip pat reikalingas Docker demonas, prieinamas iš konteinerio viduje.

## ✅ Patikrinkite diegimą

Po įdiegimo patikrinkite, ar azd veikia tinkamai:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Tikėtinas išvesties rezultatas:
```
azd version 1.x.x (commit xxxxxx)
```

**Pastaba**: Faktinis versijos numeris gali skirtis. Patikrinkite [Azure Developer CLI leidimus](https://github.com/Azure/azure-dev/releases) dėl naujausios versijos.

**✅ Diegimo sėkmės kontrolinis sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` pateikia komandų dokumentaciją
- [ ] `azd template list` rodo turimus šablonus
- [ ] Galite sukurti bandomąjį katalogą ir sėkmingai vykdyti `azd init`

**Jei visi patikrinimai sėkmingi, galite pereiti prie [Jūsų pirmojo projekto](first-project.md)!**

## Autentifikacijos nustatymai

### Rekomenduojamas pradedančiųjų nustatymas

AZD pirmojo darbo eigoje prisijunkite naudodami `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Naudokite Azure CLI prisijungimą tik tuo atveju, jei ketinate patys vykdyti `az` komandas kurso metu.

### Azure CLI autentifikacija (pasirinktinai)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Kokią prisijungimo eigą turėtumėte naudoti?

- Naudokite `azd auth login`, jei sekate pradedančiųjų AZD kelią ir daugiausia vykdote `azd` komandas.
- Taip pat naudokite `az login`, kai norite vykdyti Azure CLI komandas, tokias kaip `az account show` ar tiesiogiai peržiūrėti išteklius.
- Jei pratime yra tiek `azd`, tiek `az` komandos, paleiskite abu prisijungimo komandų kartus pradžioje.

### Įrenginio kodo autentifikacija
Jei naudojatės be galvos sistemos arba kyla naršyklės problemų:
```bash
azd auth login --use-device-code
```

### Serviso paskyra (CI/CD)
Automatizuotose aplinkose:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Patikrinkite savo sąrankos pilnumą

Jei norite greitai patikrinti parengtį prieš pradedant 1 skyrių:

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
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Aplinkos kintamieji
Pridėkite prie savo shell profilio (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE integracija

### Visual Studio Code
Įdiekite Azure Developer CLI plėtinį:
1. Atidarykite VS Code
2. Eikite į plėtinius (Ctrl+Shift+X)
3. Ieškokite „Azure Developer CLI“
4. Įdiekite plėtinį

Funkcijos:
- IntelliSense azure.yaml
- Integruotos terminalo komandos
- Šablonų naršymas
- Diegimo stebėjimas

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
1. Įdiekite Azure įskiepį
2. Suconfigūruokite Azure kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo problemų sprendimas

### Dažnos problemos

#### Leidimo klaida (Windows)
```powershell
# Run PowerShell as Administrator
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

#### Tinklo/proxy problemos
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versijų konfliktai
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Papildoma pagalba
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## atnaujinimas azd

### Atnaujinimo patikra
azd perspėja, kai yra naujesnis leidimas, ir galite patvirtinti savo dabartinę versiją naudodami:
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

## 💡 Dažniausiai užduodami klausimai

<details>
<summary><strong>Kuo skiriasi azd ir az CLI?</strong></summary>

**Azure CLI (az)**: Žemo lygio įrankis atskirų Azure išteklių valdymui
- `az webapp create`, `az storage account create`
- Po vieną išteklių vienu metu
- Infrastruktūros valdymo orientacija

**Azure Developer CLI (azd)**: Aukšto lygio įrankis pilniems programų diegimams
- `azd up` diegia visą programą su visais ištekliais
- Šablonais pagrįsti darbo procesai
- Kūrėjų našumo orientacija

**Jie yra nepriklausomi**: azd pagal nutylėjimą naudoja savo autentifikavimą. Įdiekite ir prisijunkite prie Azure CLI tik dėl `az` komandų arba aiškiai pasirinkite `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure ištekliais?</strong></summary>

Taip! Jūs galite:
1. Importuoti esamus išteklius į azd aplinkas
2. Nurodyti esamus išteklius savo Bicep šablonuose
3. Naudoti azd naujiems diegimams šalia esamos infrastruktūros

Daugiau informacijos žr. [Konfigūracijos gide](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Ar azd veikia su Azure Government arba Azure China?</strong></summary>

Taip, sukonfigūruokite debesį:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jei taip pat naudojate Azure CLI, atskirai sukonfigūruokite `az cloud set --name ...`. Šablonų paslaugos ir modelių prieinamumas skiriasi pagal debesį.
</details>

<details>
<summary><strong>Ar galiu naudoti azd CI/CD procesuose?</strong></summary>

Žinoma! azd yra sukurtas automatizavimui:
- Integracija su GitHub Actions
- Azure DevOps palaikymas
- Aptarnavimo principal autentifikavimas
- Neinteraktyvus režimas

Daugiau apie CI/CD modelius žr. [Diegimo gide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kiek kainuoja azd naudojimas?</strong></summary>

pats azd yra **visiškai nemokamas** ir atviro kodo. Mokate tik už:
- Azure išteklius, kuriuos diegiate
- Azure naudojimo išlaidas (skaičiavimas, saugojimas ir pan.)

Naudokite `azd provision --preview`, kad apžvelgtumėte siūlomus išteklius, tada apskaičiuokite jų kainas su [Azure kainų skaičiuokle](https://azure.microsoft.com/pricing/calculator/). Peržiūros režimas kainų nesuskaičiuoja.
</details>

## Kita eiga

1. **Užbaikite autentifikavimą**: Įsitikinkite, kad galite pasiekti savo Azure prenumeratą
2. **Išbandykite pirmąjį diegimą**: Sekite [Pirmojo projekto gidu](first-project.md)
3. **Naršykite šablonus**: Peržiūrėkite turimus šablonus su `azd template list`
4. **Sukonfigūruokite savo IDE**: Paruoškite savo kūrimo aplinką

## Pagalba

Jei kyla problemų:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pranešti apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure pagalba](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Gaukite Azure komandų nurodymus tiesiai redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmas projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmoji plėtra](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Įdiegta!** Tęskite į [Jūsų pirmą projektą](first-project.md), kad pradėtumėte kurti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
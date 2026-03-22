# Diegimo ir nustatymo vadovas

**Skyriaus navigacija:**
- **📚 Kursų pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas pradžia
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md)
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas žingsnis po žingsnio parodys, kaip įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite kelis diegimo būdus skirtingoms operacinėms sistemoms, autentifikacijos nustatymus ir pradinę konfigūraciją, kad paruoštumėte savo kūrimo aplinką Azure diegimams.

## Mokymosi tikslai

Baigę šią pamoką jūs:
- Sėkmingai įdiegsit Azure Developer CLI savo operacinėje sistemoje
- Sukonfigūruosite autentifikaciją su Azure įvairiais būdais
- Paruošite savo kūrimo aplinką su reikalingais išankstiniais reikalavimais
- Suprasite skirtingus diegimo variantus ir kada naudoti kiekvieną
- Gebėsite išspręsti dažniausiai pasitaikančias diegimo ir nustatymų problemas

## Mokymosi rezultatai

Užbaigę šią pamoką, galėsite:
- Diegti azd naudojant jūsų platformai tinkamą metodą
- Autentifikuotis su Azure naudojant azd auth login
- Patikrinti diegimą ir išbandyti pagrindines azd komandas
- Sukonfigūruoti savo kūrimo aplinką optimaliai azd naudojimui
- Savarankiškai išspręsti dažniausias diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, nepriklausomai nuo operacinės sistemos ar kūrimo aplinkos.

## Reikalavimai

Prieš diegiant azd, įsitikinkite, kad turite:
- **Azure prenumerata** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentifikacijai ir išteklių valdymui
- **Git** - Šablonų klonavimui ir versijų valdymui
- **Docker** (pasirinktinai) - Konteinerizuotoms programoms

## Diegimo būdai

### Windows

#### Parinktis 1: PowerShell (rekomenduojama)
```powershell
# Paleisti kaip administratorius arba su padidintomis teisėmis
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Parinktis 2: Windows paketų tvarkyklė (winget)
```cmd
winget install Microsoft.Azd
```

#### Parinktis 3: Chocolatey
```cmd
choco install azd
```

#### Parinktis 4: Rankinis diegimas
1. Atsisiųskite naujausią leidimą iš [GitHub](https://github.com/Azure/azure-dev/releases)
2. Išarchyvuokite į `C:\Program Files\azd\`
3. Pridėkite į PATH aplinkos kintamąjį

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

#### Parinktis 2: Paketų tvarkytuvės

**Ubuntu/Debian:**
```bash
# Pridėti Microsoft paketų saugyklą
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Įdiegti azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Pridėti Microsoft paketų saugyklą
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd yra iš anksto įdiegtas GitHub Codespaces. Tiesiog sukurkite codespace ir pradėkite naudoti azd iš karto.

### Docker

```bash
# Paleisti azd konteineryje
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Sukurti trumpinį patogesniam naudojimui
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Diegimo patikrinimas

Po diegimo patikrinkite, ar azd veikia teisingai:

```bash
# Patikrinti versiją
azd version

# Peržiūrėti pagalbą
azd --help

# Išvardyti prieinamus šablonus
azd template list
```

Tikėtina išvestis:
```
azd version 1.x.x (commit xxxxxx)
```

**Pastaba**: Faktinis versijos numeris gali skirtis. Patikrinkite [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) dėl naujausios versijos.

**✅ Diegimo sėkmės kontrolinis sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` rodo komandų dokumentaciją
- [ ] `azd template list` rodo prieinamus šablonus
- [ ] `az account show` rodo jūsų Azure prenumeratą
- [ ] Galite sukurti testinį katalogą ir sėkmingai paleisti `azd init`

**Jei visi patikrinimai sėkmingi, galite tęsti į [Jūsų pirmą projektą](first-project.md)!**

## Autentifikacijos nustatymas

### Azure CLI autentifikacija (rekomenduojama)
```bash
# Įdiekite Azure CLI, jei jis dar neįdiegtas
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prisijunkite prie Azure
az login

# Patikrinkite autentifikaciją
az account show
```

### Įrenginio kodo autentifikacija
Jei naudojate beekranę sistemą arba kyla naršyklės problemų:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automatizuotoms aplinkoms:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigūracija

### Globali konfigūracija
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription <subscription-id>

# Nustatyti numatytąją vietą
azd config set defaults.location eastus2

# Peržiūrėti visą konfigūraciją
azd config list
```

### Aplinkos kintamieji
Pridėkite į savo apvalkalo profilį (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfigūracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfigūracija
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Įjungti derinimo žurnalavimą
```

## IDE integracija

### Visual Studio Code
Įdiekite Azure Developer CLI plėtinį:
1. Atidarykite VS Code
2. Eikite į Išplėtimai (Ctrl+Shift+X)
3. Ieškokite "Azure Developer CLI"
4. Įdiekite plėtinį

Funkcijos:
- IntelliSense azure.yaml failams
- Integruotas terminalas komandoms
- Šablonų peržiūra
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
2. Sukonfigūruokite Azure kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo trikčių šalinimas

### Dažnos problemos

#### Leidimo klaida (Windows)
```powershell
# Paleiskite PowerShell kaip administratorių
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problemos
Rankiniu būdu pridėkite azd į savo PATH:

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
# Konfigūruoti tarpinį serverį
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Praleisti SSL patikrinimą (nerekomenduojama naudoti gamyboje)
azd config set http.insecure true
```

#### Versijų konfliktai
```bash
# Pašalinti senas instaliacijas
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Išvalyti konfigūraciją
rm -rf ~/.azd
```

### Gaukite daugiau pagalbos
```bash
# Įjungti derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug

# Peržiūrėti esamą konfigūraciją
azd config list

# Peržiūrėti dabartinę diegimo būseną
azd show
```

## azd atnaujinimas

### Automatiniai atnaujinimai
azd praneš, kai bus pasiekiami atnaujinimai:
```bash
azd version --check-for-updates
```

### Rankiniai atnaujinimai

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
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

**Azure CLI (az)**: Žemo lygio įrankis atskiriems Azure ištekliams valdyti
- `az webapp create`, `az storage account create`
- Vienu metu valdo vieną išteklių
- Infrastruktūros valdymo fokusas

**Azure Developer CLI (azd)**: Aukšto lygio įrankis pilniems programų diegimams
- `azd up` diegia visą programą su visais ištekliais
- Darbų eigos, pagrįstos šablonais
- Akcentuojama kūrėjo produktyvumas

**Reikia abiejų**: azd naudoja az CLI autentifikacijai
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure ištekliais?</strong></summary>

Taip! Jūs galite:
1. Importuoti esamus išteklius į azd aplinkas
2. Nurodyti esamus išteklius savo Bicep šablonuose
3. Naudoti azd naujiems diegimams kartu su esama infrastruktūra

Žr. [Configuration Guide](configuration.md) dėl išsamesnės informacijos.
</details>

<details>
<summary><strong>Ar azd veikia Azure Government arba Azure China aplinkose?</strong></summary>

Taip, sukonfigūruokite debesį:
```bash
# Azure vyriausybė
az cloud set --name AzureUSGovernment
az login

# Azure Kinija
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Ar galiu naudoti azd CI/CD procesuose?</strong></summary>

Absoliučiai! azd sukurtas automatizavimui:
- GitHub Actions integracija
- Azure DevOps palaikymas
- Service principal autentifikacija
- Neinteraktyvus režimas

Žr. [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) dėl CI/CD modelių.
</details>

<details>
<summary><strong>Kiek kainuoja naudoti azd?</strong></summary>

azd pats yra **visiškai nemokamas** ir atviro kodo. Mokėsite tik už:
- Azure išteklius, kuriuos diegiate
- Azure suvartojimo išlaidas (skaičiavimas, saugykla ir kt.)

Naudokite `azd provision --preview`, kad įvertintumėte išlaidas prieš diegimą.
</details>

## Kiti žingsniai

1. **Užbaikite autentifikaciją**: Įsitikinkite, kad turite prieigą prie Azure prenumeratos
2. **Išbandykite pirmą diegimą**: Sekite [Pirmojo projekto vadovą](first-project.md)
3. **Tyrinėkite šablonus**: Peržiūrėkite prieinamus šablonus su `azd template list`
4. **Sukonfigūruokite IDE**: Paruoškite savo kūrimo aplinką

## Palaikymas

Jei susiduriate su problemomis:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pranešti apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure palaikymas](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Gaukite Azure komandų patarimus tiesiai savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus navigacija:**
- **📚 Kursų pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas pradžia
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Diegimas baigtas!** Tęskite į [Jūsų pirmą projektą](first-project.md), kad pradėtumėte kurti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas savo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
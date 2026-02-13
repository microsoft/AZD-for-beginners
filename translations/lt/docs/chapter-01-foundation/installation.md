# Diegimo ir nustatymo vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [AZD Basics](azd-basics.md)
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Sekantis skyrius**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite kelis diegimo metodus skirtingoms operacinėms sistemoms, autentifikacijos nustatymą ir pradinę konfigūraciją, kad paruoštumėte savo kūrimo aplinką Azure diegimams.

## Mokymosi tikslai

Baigę šią pamoką, jūs:
- Sėkmingai įdiegsite Azure Developer CLI savo operacinėje sistemoje
- Sukonfigūruosite autentifikaciją su Azure keliais metodais
- Paruošite savo kūrimo aplinką su reikiamais išankstiniais reikalavimais
- Suprasite skirtingus diegimo variantus ir kada naudoti kurį
- Išspręsite dažniausias diegimo ir nustatymo problemas

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Įdiegti azd naudodami tinkamą jūsų platformai metodą
- Autentifikuotis su Azure naudojant azd auth login
- Patikrinti diegimą ir išbandyti pagrindines azd komandas
- Sukonfigūruoti savo kūrimo aplinką optimaliam azd naudojimui
- Nepriklausomai išspręsti dažniausias diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, neatsižvelgiant į operacinę sistemą ar kūrimo aplinką.

## Išankstiniai reikalavimai

Prieš diegdami azd, įsitikinkite, kad turite:
- **Azure prenumerata** - [Sukurti nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** - autentifikacijai ir resursų valdymui
- **Git** - šablonų klonavimui ir versijų kontrolei
- **Docker** (neprivaloma) - konteinerizuotoms programoms

## Diegimo būdai

### Windows

#### Parinktis 1: PowerShell (rekomenduojama)
```powershell
# Paleiskite kaip administratorius arba su padidintomis teisėmis
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

# Sukurti aliasą patogesniam naudojimui
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Patikrinkite diegimą

Po diegimo patikrinkite, ar azd veikia teisingai:

```bash
# Patikrinti versiją
azd version

# Peržiūrėti pagalbą
azd --help

# Išvardinti prieinamus šablonus
azd template list
```

Tikėtinas išvestis:
```
azd version 1.x.x (commit xxxxxx)
```

**Pastaba**: tikras versijos numeris gali skirtis. Patikrinkite [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) dėl naujausios versijos.

**✅ Diegimo sėkmės kontrolinis sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` rodo komandų dokumentaciją
- [ ] `azd template list` rodo prieinamus šablonus
- [ ] `az account show` rodo jūsų Azure prenumeratą
- [ ] Galite sukurti testinį katalogą ir sėkmingai paleisti `azd init`

**Jei visi patikrinimai praėjo, esate pasiruošę tęsti prie [Jūsų pirmojo projekto](first-project.md)!**

## Autentifikacijos nustatymas

### Azure CLI autentifikacija (rekomenduojama)
```bash
# Įdiekite Azure CLI, jei jis dar nėra įdiegtas
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prisijunkite prie Azure
az login

# Patikrinkite autentifikaciją
az account show
```

### Įrenginio kodo autentifikacija
Jei esate be grafinės sąsajos arba kyla problemų su naršykle:
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
Pridėkite prie savo shell profilio (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfigūracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfigūracija
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Įjungti derinimo žurnavimą
```

## IDE integracija

### Visual Studio Code
Įdiekite Azure Developer CLI plėtinį:
1. Atidarykite VS Code
2. Eikite į Plėtinius (Ctrl+Shift+X)
3. Ieškokite "Azure Developer CLI"
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
1. Įdiekite Azure papildinį
2. Sukonfigūruokite Azure prisijungimo duomenis
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Trikčių šalinimas diegiant

### Dažnos problemos

#### Prieiga uždrausta (Windows)
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

#### Tinklo/proxy problemos
```bash
# Konfigūruoti tarpinį serverį
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Praleisti SSL patikrinimą (nerekomenduojama gamybinėje aplinkoje)
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

### Daugiau pagalbos
```bash
# Įjungti derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug

# Peržiūrėti dabartinę konfigūraciją
azd config list

# Peržiūrėti dabartinę diegimo būseną
azd show
```

## azd atnaujinimas

### Automatiniai atnaujinimai
azd praneš, kai bus prieinami atnaujinimai:
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

## 💡 Dažnai užduodami klausimai

<details>
<summary><strong>Kuo skiriasi azd ir az CLI?</strong></summary>

**Azure CLI (az)**: Žemo lygio įrankis atskirų Azure išteklių valdymui
- `az webapp create`, `az storage account create`
- Valdo po vieną išteklių vienu metu
- Sutelktas į infrastruktūros valdymą

**Azure Developer CLI (azd)**: Aukšto lygio įrankis pilniems programų diegimams
- `azd up` diegia visą programą su visais ištekliais
- Darbo eiga paremta šablonais
- Sutelktas į kūrėjo produktyvumą

**Jums reikia abiejų**: azd naudoja az CLI autentifikacijai
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure ištekliais?</strong></summary>

Taip! Galite:
1. Importuoti esamus išteklius į azd aplinkas
2. Nurodyti esamus išteklius savo Bicep šablonuose
3. Naudoti azd naujiems diegimams kartu su esama infrastruktūra

Daugiau informacijos rasite [Konfigūracijos vadove](configuration.md).
</details>

<details>
<summary><strong>Ar azd veikia su Azure Government arba Azure China?</strong></summary>

Taip, konfigūruokite debesį:
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
- Service principal autentifikacija
- Beinteraktyvus režimas

Žr. [Diegimo vadovą](../chapter-04-infrastructure/deployment-guide.md) dėl CI/CD šablonų.
</details>

<details>
<summary><strong>Kiek kainuoja naudoti azd?</strong></summary>

azd pats yra **visiškai nemokamas** ir atviro kodo. Mokate tik už:
- Azure išteklius, kuriuos diegiate
- Azure vartojimo išlaidas (skaičiavimo, saugojimo ir kt.)

Naudokite `azd provision --preview`, kad įvertintumėte išlaidas prieš diegiant.
</details>

## Tolimesni žingsniai

1. **Užbaikite autentifikaciją**: Įsitikinkite, kad galite pasiekti savo Azure prenumeratą
2. **Išbandykite pirmą diegimą**: Sekite [Pirmojo projekto vadovą](first-project.md)
3. **Tyrinėkite šablonus**: Naršykite prieinamus šablonus su `azd template list`
4. **Sukonfigūruokite IDE**: Paruoškite savo kūrimo aplinką

## Pagalba

Jei susiduriate su problemomis:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pranešti apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure palaikymas](https://azure.microsoft.com/support/)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [AZD Basics](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Sekantis skyrius**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Diegimas baigtas!** Tęskite prie [Jūsų pirmojo projekto](first-project.md), kad pradėtumėte kurti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas pagrindiniu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
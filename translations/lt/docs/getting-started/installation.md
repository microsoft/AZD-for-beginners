<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:06:31+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "lt"
}
-->
# Diegimo ir nustatymo vadovas

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti „Azure Developer CLI“ (azd) jūsų sistemoje. Sužinosite apie įvairius diegimo būdus skirtingoms operacinėms sistemoms, autentifikavimo nustatymus ir pradinę konfigūraciją, kad paruoštumėte savo kūrimo aplinką „Azure“ diegimams.

## Mokymosi tikslai

Šios pamokos pabaigoje jūs:
- Sėkmingai įdiegsite „Azure Developer CLI“ savo operacinėje sistemoje
- Sužinosite, kaip autentifikuotis „Azure“ naudojant kelis metodus
- Nustatysite savo kūrimo aplinką su reikalingomis priklausomybėmis
- Suprasite skirtingas diegimo parinktis ir kada jas naudoti
- Išmoksite spręsti dažniausiai pasitaikančias diegimo ir nustatymo problemas

## Mokymosi rezultatai

Baigę šią pamoką, jūs galėsite:
- Įdiegti azd naudodami tinkamiausią metodą savo platformai
- Autentifikuotis „Azure“ naudodami komandą `azd auth login`
- Patikrinti savo diegimą ir išbandyti pagrindines azd komandas
- Suprasti, kaip optimizuoti savo kūrimo aplinką azd naudojimui
- Savarankiškai spręsti dažniausiai pasitaikančias diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti „Azure Developer CLI“ jūsų sistemoje, nepriklausomai nuo jūsų operacinės sistemos ar kūrimo aplinkos.

## Reikalavimai

Prieš diegdami azd, įsitikinkite, kad turite:
- **Azure prenumeratą** – [Sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** – Autentifikavimui ir išteklių valdymui
- **Git** – Šablonų klonavimui ir versijų valdymui
- **Docker** (neprivaloma) – Konteinerizuotoms programoms

## Diegimo būdai

### Windows

#### 1 variantas: PowerShell (rekomenduojama)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 2 variantas: Windows paketų tvarkyklė (winget)
```cmd
winget install Microsoft.Azd
```

#### 3 variantas: Chocolatey
```cmd
choco install azd
```

#### 4 variantas: Rankinis diegimas
1. Atsisiųskite naujausią versiją iš [GitHub](https://github.com/Azure/azure-dev/releases)
2. Išskleiskite į `C:\Program Files\azd\`
3. Pridėkite prie PATH aplinkos kintamojo

### macOS

#### 1 variantas: Homebrew (rekomenduojama)
```bash
brew tap azure/azd
brew install azd
```

#### 2 variantas: Diegimo scenarijus
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3 variantas: Rankinis diegimas
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1 variantas: Diegimo scenarijus (rekomenduojama)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2 variantas: Paketų tvarkyklės

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd jau yra iš anksto įdiegtas „GitHub Codespaces“. Tiesiog sukurkite „codespace“ ir iškart pradėkite naudoti azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Patikrinkite diegimą

Po diegimo patikrinkite, ar azd veikia tinkamai:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Tikėtinas rezultatas:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Autentifikavimo nustatymas

### Azure CLI autentifikavimas (rekomenduojama)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Autentifikavimas naudojant įrenginio kodą
Jei naudojate sistemą be grafinės sąsajos arba kyla naršyklės problemų:
```bash
az login --use-device-code
```

### Paslaugos pagrindinis vardas (CI/CD)
Automatizuotoms aplinkoms:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Konfigūracija

### Bendroji konfigūracija
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Aplinkos kintamieji
Pridėkite prie savo apvalkalo profilio (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE integracija

### Visual Studio Code
Įdiekite „Azure Developer CLI“ plėtinį:
1. Atidarykite VS Code
2. Eikite į Plėtinius (Ctrl+Shift+X)
3. Ieškokite „Azure Developer CLI“
4. Įdiekite plėtinį

Funkcijos:
- IntelliSense azure.yaml failams
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
1. Įdiekite „Azure“ plėtinį
2. Suveskite „Azure“ kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo trikčių šalinimas

### Dažniausios problemos

#### Leidimų trūkumas (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problemos
Rankiniu būdu pridėkite azd prie PATH:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versijų konfliktai
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Papildoma pagalba
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
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

## Kiti žingsniai

1. **Užbaikite autentifikavimą**: Įsitikinkite, kad galite pasiekti savo „Azure“ prenumeratą
2. **Išbandykite pirmąjį diegimą**: Sekite [Pirmojo projekto vadovą](first-project.md)
3. **Naršykite šablonus**: Peržiūrėkite galimus šablonus naudodami `azd template list`
4. **Konfigūruokite savo IDE**: Nustatykite savo kūrimo aplinką

## Pagalba

Jei susiduriate su problemomis:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Praneškite apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure pagalba](https://azure.microsoft.com/support/)

---

**Navigacija**
- **Ankstesnė pamoka**: [AZD pagrindai](azd-basics.md)
- **Kita pamoka**: [Konfigūracija](configuration.md)

**Diegimas baigtas!** Tęskite [Pirmasis projektas](first-project.md), kad pradėtumėte kurti su azd.

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
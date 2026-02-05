# Diegimo ir nustatymo vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md)
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../microsoft-foundry/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite apie įvairius diegimo būdus skirtingoms operacinėms sistemoms, autentifikacijos nustatymą ir pradinę konfigūraciją, kad paruoštumėte savo vystymo aplinką Azure diegimams.

## Mokymosi tikslai

Šios pamokos pabaigoje jūs:
- Sėkmingai įdiegsite Azure Developer CLI savo operacinėje sistemoje
- Su Azure sukonfigūruosite autentifikaciją naudodami kelis metodus
- Paruošite savo vystymo aplinką su būtinais reikalavimais
- Suprasite skirtingas diegimo galimybes ir kada jas naudoti
- Išspręsite dažniausiai pasitaikančias diegimo ir nustatymo problemas

## Mokymosi rezultatai

Baigę šią pamoką, jūs galėsite:
- Įdiegti azd naudodami tinkamą metodą savo platformai
- Autentifikuotis su Azure naudodami azd auth login
- Patikrinti savo diegimą ir išbandyti pagrindines azd komandas
- Suprasti, kaip optimizuoti savo vystymo aplinką azd naudojimui
- Savarankiškai išspręsti dažniausiai pasitaikančias diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, nepriklausomai nuo jūsų operacinės sistemos ar vystymo aplinkos.

## Reikalavimai

Prieš diegdami azd, įsitikinkite, kad turite:
- **Azure prenumeratą** - [Sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentifikacijai ir resursų valdymui
- **Git** - Šablonų klonavimui ir versijų valdymui
- **Docker** (neprivaloma) - Konteinerizuotoms programoms

## Diegimo būdai

### Windows

#### 1 variantas: PowerShell (rekomenduojama)
```powershell
# Vykdykite kaip administratorius arba su padidintomis privilegijomis
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 2 variantas: Windows Package Manager (winget)
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

#### 2 variantas: Diegimo skriptas
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3 variantas: Rankinis diegimas
```bash
# Atsisiųsti ir įdiegti
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1 variantas: Diegimo skriptas (rekomenduojama)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2 variantas: Paketų valdymo sistemos

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

azd jau yra iš anksto įdiegtas GitHub Codespaces. Tiesiog sukurkite kodų erdvę ir pradėkite naudoti azd iš karto.

### Docker

```bash
# Paleiskite azd konteineryje
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Sukurkite alias patogesniam naudojimui
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Diegimo patikrinimas

Po diegimo patikrinkite, ar azd veikia tinkamai:

```bash
# Patikrinti versiją
azd version

# Peržiūrėti pagalbą
azd --help

# Peržiūrėti galimus šablonus
azd template list
```

Tikėtinas rezultatas:
```
azd version 1.5.0 (commit abc123)
```

**✅ Diegimo sėkmės kontrolinis sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` rodo komandų dokumentaciją
- [ ] `azd template list` rodo galimus šablonus
- [ ] `az account show` rodo jūsų Azure prenumeratą
- [ ] Galite sukurti testinį katalogą ir sėkmingai paleisti `azd init`

**Jei visi punktai pažymėti, galite tęsti prie [Jūsų pirmasis projektas](first-project.md)!**

## Autentifikacijos nustatymas

### Azure CLI autentifikacija (rekomenduojama)
```bash
# Įdiekite Azure CLI, jei dar neįdiegta
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prisijunkite prie Azure
az login

# Patikrinkite autentifikaciją
az account show
```

### Įrenginio kodo autentifikacija
Jei naudojate sistemą be grafinės sąsajos arba turite problemų su naršykle:
```bash
az login --use-device-code
```

### Paslaugos pagrindinis (CI/CD)
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
# Nustatyti numatytąjį prenumeratą
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
export AZD_DEBUG=true  # Įjungti derinimo žurnalavimą
```

## IDE integracija

### Visual Studio Code
Įdiekite Azure Developer CLI plėtinį:
1. Atidarykite VS Code
2. Eikite į Plėtinius (Ctrl+Shift+X)
3. Ieškokite "Azure Developer CLI"
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
1. Įdiekite Azure plėtinį
2. Suveskite Azure kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo trikčių šalinimas

### Dažniausios problemos

#### Leidimų trūkumas (Windows)
```powershell
# Paleiskite PowerShell kaip administratorius
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
# Konfigūruoti tarpinį serverį
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Praleisti SSL patikrinimą (nerekomenduojama gamybai)
azd config set http.insecure true
```

#### Versijų konfliktai
```bash
# Pašalinti senas diegimo versijas
# Windows: winget pašalinti Microsoft.Azd
# macOS: brew pašalinti azd
# Linux: sudo apt pašalinti azd

# Išvalyti konfigūraciją
rm -rf ~/.azd
```

### Papildoma pagalba
```bash
# Įjungti derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug

# Peržiūrėti detalius žurnalus
azd logs

# Patikrinti sistemos informaciją
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

## 💡 Dažniausiai užduodami klausimai

<details>
<summary><strong>Kuo skiriasi azd ir az CLI?</strong></summary>

**Azure CLI (az)**: Žemo lygio įrankis atskirų Azure resursų valdymui
- `az webapp create`, `az storage account create`
- Vienas resursas vienu metu
- Dėmesys infrastruktūros valdymui

**Azure Developer CLI (azd)**: Aukšto lygio įrankis visos programos diegimui
- `azd up` diegia visą programą su visais resursais
- Šablonais pagrįsti darbo srautai
- Dėmesys kūrėjų produktyvumui

**Jums reikia abiejų**: azd naudoja az CLI autentifikacijai
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure resursais?</strong></summary>

Taip! Galite:
1. Importuoti esamus resursus į azd aplinkas
2. Nurodyti esamus resursus savo Bicep šablonuose
3. Naudoti azd naujiems diegimams kartu su esama infrastruktūra

Žr. [Konfigūracijos vadovą](configuration.md) dėl detalių.
</details>

<details>
<summary><strong>Ar azd veikia su Azure Government ar Azure China?</strong></summary>

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

Žinoma! azd sukurtas automatizavimui:
- GitHub Actions integracija
- Azure DevOps palaikymas
- Paslaugos pagrindinio autentifikacija
- Neinteraktyvus režimas

Žr. [Diegimo vadovą](../deployment/deployment-guide.md) dėl CI/CD modelių.
</details>

<details>
<summary><strong>Kiek kainuoja azd naudojimas?</strong></summary>

Pats azd yra **visiškai nemokamas** ir atvirojo kodo. Mokate tik už:
- Azure resursus, kuriuos diegiate
- Azure naudojimo išlaidas (skaičiavimai, saugykla ir kt.)

Naudokite `azd provision --preview`, kad įvertintumėte išlaidas prieš diegimą.
</details>

## Kiti žingsniai

1. **Užbaikite autentifikaciją**: Įsitikinkite, kad galite pasiekti savo Azure prenumeratą
2. **Išbandykite pirmąjį diegimą**: Sekite [Pirmojo projekto vadovą](first-project.md)
3. **Naršykite šablonus**: Peržiūrėkite galimus šablonus su `azd template list`
4. **Sukonfigūruokite savo IDE**: Paruoškite savo vystymo aplinką

## Pagalba

Jei susiduriate su problemomis:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pranešti apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure pagalba](https://azure.microsoft.com/support/)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Diegimas baigtas!** Tęskite prie [Jūsų pirmasis projektas](first-project.md), kad pradėtumėte dirbti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
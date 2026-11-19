# Diegimo ir sąrankos vadovas

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md)
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Sekantis skyrius**: [2 skyrius: AI-pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI (azd) jūsų sistemoje. Sužinosite kelis diegimo metodus skirtingoms operacinėms sistemoms, autentifikacijos nustatymą ir pradines konfigūracijas, kad paruoštumėte vystymo aplinką Azure diegimams.

## Mokymosi tikslai

Užbaigus šią pamoką, jūs:
- Sėkmingai įdiegtumėte Azure Developer CLI savo operacinėje sistemoje
- Sužinotumėte, kaip nustatyti autentifikaciją naudojant kelis metodus
- Paruoštumėte vystymo aplinką su reikalingais išankstiniais reikalavimais
- Suprasite skirtingas diegimo galimybes ir kada jas naudoti
- Išspręstumėte įprastas diegimo ir sąrankos problemas

## Mokymosi rezultatai

Užbaigę šią pamoką, galėsite:
- Įdiegti azd naudodami tinkamą jūsų platformai metodą
- Autentifikuotis su Azure naudojant azd auth login
- Patikrinti savo diegimą ir išbandyti pagrindines azd komandas
- Sukonfigūruoti savo vystymo aplinką optimaliai azd naudojimui
- Savarankiškai spręsti įprastas diegimo problemas

Šis vadovas padės jums įdiegti ir sukonfigūruoti Azure Developer CLI jūsų sistemoje, nepaisant operacinės sistemos ar vystymo aplinkos.

## Reikalavimai

Prieš diegiant azd, įsitikinkite, kad turite:
- **Azure prenumeratą** - [Sukurti nemokamą paskyrą](https://azure.microsoft.com/free/)
- **Azure CLI** (pasirinktinai) – pavyzdžiams, kurie aiškiai vykdo `az`; azd autentifikuojasi nepriklausomai
- **Git** – šablonų kopijavimui ir versijų valdymui
- **Docker** (pasirinktinai) – konteinerizuotoms programoms

**2 skyriaus Foundry GA kelias:** Naudokite AZD **1.37.0 ar naujesnę** versiją, įdiekite paketą su `azd ext install microsoft.foundry` ir naudokite Python **3.13+** bei dabartinį **uv** hostingo agento pavyzdžiui. Jo kodo diegimo režimas kuria nuotoliniu būdu, tad vietinis Docker kūrimas nereikalingas. Reikalingos Foundry teisės, regioninis modelių prieinamumas ir kvotos; plačiau žr. [hosted-agent sąranką](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Diegimo metodai

### Windows

#### 1 variantas: Windows Package Manager (rekomenduojama)
```cmd
winget install microsoft.azd
```

#### 2 variantas: PowerShell diegimo scenarijus
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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
Atsisiųskite archyvą savo macOS architektūrai iš [išleidimo failų](https://github.com/Azure/azure-dev/releases), išskleiskite ir pridėkite `azd` dvejetainį failą į savo `PATH`.

### Linux

#### 1 variantas: Diegimo scenarijus (rekomenduojama)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2 variantas: Paketų tvarkyklės

**Rankinis diegimas iš išleidimo failų:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Kai kuriose Codespaces ir devkonteinerių aplinkose jau įdiegta `azd`, bet tai verta patikrinti, o ne manyti automatiškai:

```bash
azd version
```

Jei trūksta `azd`, įdiekite naudodami standartinį scenarijų aplinkai.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Šis laikinas konteineris neišsaugo prisijungimo būsenos tarp vykdymų. Kartotiniems diegimams naudokite [devkontainerio sąranką](dev-containers.md); konteineriams kurti taip pat reikalingas Docker demonas, pasiekiamas iš konteinerio viduje.

## ✅ Diegimo patikrinimas

Po diegimo patikrinkite, ar azd veikia tinkamai:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Laukiamas rezultatas:
```
azd version 1.x.x (commit xxxxxx)
```

**Pastaba**: faktinis versijos numeris gali skirtis. Patikrinkite [Azure Developer CLI leidimus](https://github.com/Azure/azure-dev/releases) dėl naujausios versijos.

**✅ Diegimo užbaigimo kontrolinis sąrašas:**
- [ ] `azd version` rodo versijos numerį be klaidų
- [ ] `azd --help` atvaizduoja komandų dokumentaciją
- [ ] `azd template list` parodo prieinamus šablonus
- [ ] Galite sukurti testinį katalogą ir sėkmingai paleisti `azd init`

**Jei visi patikrinimai sėkmingi, galite tęsti į [Jūsų pirmąjį projektą](first-project.md)!**

## Autentifikacijos nustatymai

### Rekomenduojama pradedančiųjų sąranka

AZD-pirmuose darbo srautuose prisijunkite su `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Azure CLI prisijungimą naudokite tik jei planuojate per kurso metu vykdyti `az` komandas patys.

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

### Kurią prisijungimo eigą naudoti?

- Naudokite `azd auth login`, jei sekate pradedančiųjų AZD keliu ir daugiausia vykdote `azd` komandas.
- Taip pat naudokite `az login` kai norite kažkuriuo metu vykdyti Azure CLI komandas, pvz., `az account show` arba tiesiogiai peržiūrėti išteklius.
- Jei pratime yra parinkčių su `azd` ir `az` komandomis, paleiskite abu prisijungimo komandų kartus pradžioje.

### Įrenginio kodo autentifikacija
Jei naudojate begalvę sistemą arba kyla naršyklės problemų:
```bash
azd auth login --use-device-code
```

### Tarnybinis principalas (CI/CD)
Automatizuotoms aplinkoms:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Patikrinkite visą sąranką

Norėdami greitai patikrinti paruošimą prieš pradedant 1 skyrių:

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
Pridėkite į savo apvalkalo profilį (`.bashrc`, `.zshrc`, `.profile`):
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
- IntelliSense azure.yaml failams
- Integruotos terminalo komandos
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
1. Įdiekite Azure papildinį
2. Sukonfigūruokite Azure kredencialus
3. Naudokite integruotą terminalą azd komandoms

## 🐛 Diegimo problemų sprendimas

### Dažniausios problemos

#### Leidimų klaida (Windows)
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

### Daugiau pagalbos gavimas
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## azd atnaujinimas

### Atnaujinimo patikrinimas
azd įspėja, jei yra naujesnė versija, o dabartinę versiją galite patikrinti su:
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

**Azure CLI (az)**: žemos pakopos įrankis atskirų Azure išteklių valdymui
- `az webapp create`, `az storage account create`
- Vienu metu vienas išteklius
- Infrastruktūros valdymo dėmesys

**Azure Developer CLI (azd)**: aukštesnės pakopos įrankis pilnaverčiams programų diegimams
- `azd up` diegia visą programą su visais ištekliais
- Šablonais grįsti darbo srautai
- Vystytojo produktyvumo dėmesys

**Nepriklausomi**: azd pagal nutylėjimą naudoja savo autentifikaciją. Įdiekite ir prisijunkite prie Azure CLI tik jei vykdote `az` komandas, arba aiškiai pasirinkite `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Ar galiu naudoti azd su esamais Azure ištekliais?</strong></summary>

Taip! Galite:
1. Importuoti esamus išteklius į azd aplinkas
2. Nurodyti esamus išteklius savo Bicep šablonuose
3. Naudoti azd naujiems diegimams šalia esamos infrastruktūros

Daugiau informacijos rasite [Konfigūracijos vadove](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Ar azd veikia su Azure Government ar Azure China?</strong></summary>

Taip, sukonfigūruokite debesį:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jei naudojate ir Azure CLI, atskirai sukonfigūruokite `az cloud set --name ...`. Šablonų paslaugos ir modelių prieinamumas skiriasi pagal debesį.
</details>

<details>
<summary><strong>Ar galiu naudoti azd CI/CD procesuose?</strong></summary>

Žinoma! azd sukurtas automatizavimui:
- Integracija su GitHub Actions
- Azure DevOps palaikymas
- Tarnybinio principalo autentifikacija
- Neinteraktyvus režimas

Plačiau žr. [Diegimo vadove](../chapter-04-infrastructure/deployment-guide.md) CI/CD naudojimo pavyzdžius.
</details>

<details>
<summary><strong>Kokios yra azd naudojimo sąnaudos?</strong></summary>

azd yra **visiškai nemokamas** ir atviro kodo. Mokate tik už:
- Azure išteklius, kuriuos diegiate
- Azure suvartojimo išlaidas (skaičiavimus, saugyklą ir kt.)

Naudokite `azd provision --preview`, kad peržiūrėtumėte siūlomus išteklius, tada įvertinkite jų kainas su [Azure Kainų skaičiuokle](https://azure.microsoft.com/pricing/calculator/). Peržiūra nekalkuliuoja kainų.
</details>

## Tolimesni žingsniai

1. **Užbaikite autentifikaciją**: Įsitikinkite, kad turite prieigą prie Azure prenumeratos
2. **Išbandykite pirmąjį diegimą**: Sekite [Pirmojo projekto vadovą](first-project.md)
3. **Naršykite šablonus**: Peržiūrėkite prieinamus šablonus su `azd template list`
4. **Sukonfigūruokite IDE**: Paruoškite savo vystymo aplinką

## Pagalba

Jei kyla problemų:
- [Oficiali dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Praneškite apie problemas](https://github.com/Azure/azure-dev/issues)
- [Bendruomenės diskusijos](https://github.com/Azure/azure-dev/discussions)
- [Azure palaikymas](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) – gaukite Azure komandų pagalbą tiesiai savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [AZD pagrindai](azd-basics.md) 
- **➡️ Kitas**: [Jūsų pirmasis projektas](first-project.md)
- **🚀 Sekantis skyrius**: [2 skyrius: AI-pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Diegimas baigtas!** Tęskite į [Jūsų pirmąjį projektą](first-project.md) ir pradėkite kurti su azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
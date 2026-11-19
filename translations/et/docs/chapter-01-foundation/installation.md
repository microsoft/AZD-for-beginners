# Installimise ja seadistamise juhend

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [AZD põhitõed](azd-basics.md)
- **➡️ Järgmine**: [Teie esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekt-eelne arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend viib teid läbi Azure Developer CLI (azd) installimise ja konfiguratsiooni teie süsteemis. Õpite erinevaid installimismeetodeid erinevate operatsioonisüsteemide jaoks, autentimise seadistust ning esmase konfiguratsiooni, et valmistada oma arenduskeskkond ette Azure'i juurutusteks.

## Õpieesmärgid

Selle tunni lõpuks saate:
- Azure Developer CLI edukalt installida oma operatsioonisüsteemi
- Azure'i autentimise seadistada mitme meetodi abil
- Seada üles oma arenduskeskkond vajalike eeltingimustega
- Mõista erinevaid installimisvõimalusi ja millal igaüht kasutada
- Lahendada tavalisi installi- ja seadistusprobleeme

## Õppe tulemused

Pärast selle õppetüki lõpetamist suudate:
- Installida azd oma platvormi jaoks sobival meetodil
- Autentida Azure'i kasutades käsu azd auth login abil
- Kontrollida oma installatsiooni ja testida põhilisi azd käske
- Seada oma arenduskeskkond optimaalseks azd kasutuseks
- Lahendada iseseisvalt tavalisi installiprobleeme

See juhend aitab teil Azure Developer CLI installida ja konfigureerida sõltumata teie operatsioonisüsteemist või arenduskeskkonnast.

## Eeltingimused

Enne azd installimist veenduge, et teil oleks:
- **Azure’i tellimus** - [Loo tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valikuline) - Näidete jaoks, mis selgelt kasutavad `az`; azd autentib siiski iseseisvalt
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Konteineripõhiste rakenduste jaoks

**Peatükk 2 Foundry GA rada:** Kasutage AZD **1.37.0 või uuemat**, installige komplekt käsuga `azd ext install microsoft.foundry`, kasutage Pythonit **3.13+** ja praegust **uv** hostitud agendi näite jaoks. Koodi juurutus toimub kaugtöötlusena, seega kohalikku Docker build’i pole vaja. Foundry õigused, piirkondlik mudeli saadavus ja kvoodid on endiselt vajalikud; vaadake [hostitud agendi seadistust](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Installatsioonimeetodid

### Windows

#### Valik 1: Windows Package Manager (Soovitatav)
```cmd
winget install microsoft.azd
```

#### Valik 2: PowerShell installiskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Valik 3: Chocolatey
```cmd
choco install azd
```

#### Valik 4: Käsitsi installimine
1. Laadige alla uusim versioon [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Pakkige lahti kataloogi `C:\Program Files\azd\`
3. Lisage see PATH keskkonnamuutujasse

### macOS

#### Valik 1: Homebrew (Soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Valik 2: Installatsiooniskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 3: Käsitsi installimine
Laadige oma macOS arhitektuurile sobiv arhiiv alla [vabastuse failidest](https://github.com/Azure/azure-dev/releases), pakkige välja ja lisage `azd` binaarfail oma `PATH`.

### Linux

#### Valik 1: Installatsiooniskript (Soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 2: Paketihaldurid

**Käsitsi installimine vabastuse failidest:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Mõned Codespaces ja dev konteinerikeskkonnad sisaldavad juba `azd`, kuid kontrollige seda kindlasti, mitte ainult ärge eeldage:

```bash
azd version
```

Kui `azd` puudub, installige see vastava standardse skriptiga.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

See ajutine konteiner ei säilita sisselogimise olekut jooksude vahel. Korduvateks juurutusteks kasutage [dev konteineri seadistust](dev-containers.md); konteinerit ehitades peab Docker'i teenus konteineri sees olema ligipääsetav.

## ✅ Installatsiooni kontroll

Pärast installi veenduge, et azd töötab korrektselt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Oodatav väljund:
```
azd version 1.x.x (commit xxxxxx)
```

**Märkus**: Tegelik versiooninumber võib erineda. Vaadake uusima versiooni jaoks [Azure Developer CLI väljalasked](https://github.com/Azure/azure-dev/releases).

**✅ Installatsiooni õnnestumise kontrollnimekiri:**
- [ ] `azd version` kuvab versiooninumbri ilma vigadeta
- [ ] `azd --help` näitab käsu dokumentatsiooni
- [ ] `azd template list` kuvab olemasolevad mallid
- [ ] Saate luua testkataloogi ja edukalt käivitada `azd init`

**Kui kõik kontrollid läbivad, olete valmis minema edasi [Teie esimese projekti](first-project.md) juurde!**

## Autentimise seadistamine

### Soovitatav algajate seadistus

AZD-esimesed töövood nõuavad sisselogimist käsuga `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Kasutage Azure CLI sisselogimist ainult siis, kui plaanite kursuse jooksul ise käivitada käske `az`.

### Azure CLI autentimine (valikuline)
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

### Millist sisselogimisvoogu valida?

- Kasutage `azd auth login`, kui järgisite algajate AZD rada ja peamiselt käivitate käske `azd`.
- Kasutage `az login` ka siis, kui soovite käivitada Azure CLI käske nagu `az account show` või kontrollida ressursse otse.
- Kui harjutus sisaldab nii `azd` kui ka `az` käske, käivitage mõlemad sisselogimiskäsud korraga alguses.

### Seadme koodi autentimine
Kui kasutate peakset või teil esineb brauseri probleeme:
```bash
azd auth login --use-device-code
```

### Teenusprintsiip (CI/CD)
Automaatsetes keskkondades:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Kontrollige oma täituvat seadistust

Kui soovite kiire valmisoleku kontrolli enne peatüki 1 alustamist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguratsioon

### Globaalne konfiguratsioon
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Keskkonnamuutujad
Lisage oma terminali profiilile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE integratsioon

### Visual Studio Code
Paigaldage Azure Developer CLI laiend:
1. Avage VS Code
2. Minge laienduste menüüsse (Ctrl+Shift+X)
3. Otsige "Azure Developer CLI"
4. Paigaldage laiendus

Omadused:
- IntelliSense azure.yaml jaoks
- Integreeritud terminalikäsud
- Mallide sirvimine
- Juurutuse jälgimine

### GitHub Codespaces
Looge `.devcontainer/devcontainer.json`:
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
1. Paigaldage Azure plugin
2. Seadistage Azure volitused
3. Kasutage integreeritud terminali azd käskude jaoks

## 🐛 Installatsiooniprobleemide lahendamine

### Levinumad probleemid

#### Luba keeldus (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH probleemid
Lisage azd käsitsi PATH-i:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Võrgu-/prookside probleemid
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versioonikonfliktid
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Kust saada lisatuge
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## azd uuendamine

### Uuenduste kontroll
azd annab märku, kui uus versioon ilmub, ja saate oma praegust ehitust kontrollida käsuga:
```bash
azd version
```

### Käsitsi uuendamine

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

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Mis vahe on azd ja az CLI-l?</strong></summary>

**Azure CLI (az)**: Madala taseme tööriist üksikute Azure ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Infrastruktuuri haldusele keskendunud

**Azure Developer CLI (azd)**: Kõrge taseme tööriist täielike rakenduste juurutamiseks
- `azd up` juurutab kogu rakenduse kõigi ressurssidega
- Mallipõhised töövood
- Arendaja tootlikkuse fookus

**Need on sõltumatud**: azd kasutab vaikimisi oma autentimist. Azure CLI installige ja logige sisse ainult `az` käskude jaoks või valige selgesõnaliselt `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kas ma saan azd kasutada olemasolevate Azure ressurssidega?</strong></summary>

Jah! Saate:
1. Impordida olemasolevad ressursid azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd uuteks juurutusteks olemasoleva infrastruktuuri kõrval

Vaadake üksikasju [Konfiguratsiooni juhendist](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Kas azd töötab Azure Government või Azure Chinaga?</strong></summary>

Jah, seadistage pilv:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Kui kasutate ka Azure CLI-d, seadistage `az cloud set --name ...` eraldi. Malliteenused ja mudeli saadavus varieeruvad pilve kaupa.
</details>

<details>
<summary><strong>Kas azd sobib CI/CD torujuhtmikega?</strong></summary>

Absoluutselt! azd on loodud automatiseerimiseks:
- GitHub Actions integreerimine
- Azure DevOpsi tugi
- Teenusprintsiibi autentimine
- Mitteinteraktiivne režiim

Vaadake CI/CD mustreid [Juurutamise juhendist](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kui palju maksab azd kasutamine?</strong></summary>

Azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Tasute ainult:
- Azure ressursid, mida juurutate
- Azure kasutuskulud (arvutusvõimsus, salvestus jne)

Kasutage oma ettepanekute vaatamiseks `azd provision --preview` ja hinnake nende kulusid [Azure hinnakalkulaatori](https://azure.microsoft.com/pricing/calculator/) abil. Eelvaade hinda ei arvesta.
</details>

## Järgmised sammud

1. **Viige läbi autentimine**: Veenduge, et pääsete juurde oma Azure tellimusele
2. **Proovige oma esimene juurutus**: Järgige [Esimese projekti juhendit](first-project.md)
3. **Uurige malle**: Sirvige saadaolevaid malle käsuga `azd template list`
4. **Seadistage oma IDE**: Koostage oma arenduskeskkond

## Tugi

Kui teil tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Teata probleemidest](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure tugi](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Saate Azure käsu juhiseid otse oma redaktoris käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [AZD põhitõed](azd-basics.md) 
- **➡️ Järgmine**: [Teie esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekt-eelne arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installatsioon lõpule viidud!** Jätkake [Teie esimese projektiga](first-project.md), et alustada azd kasutamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
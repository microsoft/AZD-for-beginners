# Installi ja seadistamise juhend

**Peatüki navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Jooksev peatükk**: Peatükk 1 - Vundament ja kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md)
- **➡️ Järgmine**: [Teie esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-esmalt arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend viib teid läbi Azure Developer CLI (azd) paigaldamise ja seadistamise teie süsteemis. Õpite erinevaid paigaldusmeetodeid erinevate operatsioonisüsteemide jaoks, autentimise seadistamist ja esialgset konfiguratsiooni, et valmistada oma arenduskeskkond Azure juurutusteks ette.

## Õpieesmärgid

Selle tunni lõpuks suudate:
- Õnnestunult paigaldada Azure Developer CLI oma operatsioonisüsteemile
- Konfigureerida autentimist Azure’iga mitmete meetodite abil
- Seadistada oma arenduskeskkond vajalike eeldustega
- Mõista erinevaid paigaldusvalikuid ja millal mida kasutada
- Lahendada levinud paigaldus- ja seadistusprobleeme

## Õpitulemused

Pärast selle tunni läbimist suudate:
- Paigaldada azd sobiva meetodi abil vastavalt oma platvormile
- Autentida Azure’iga kasutades azd auth login käsku
- Kontrollida paigaldust ja testida põhilisi azd käske
- Seadistada oma arenduskeskkond azd optimaalseks kasutamiseks
- Sõltumatult lahendada sagedased paigaldusprobleemid

See juhend aitab teil paigaldada ja seadistada Azure Developer CLI oma süsteemis, olenemata teie operatsioonisüsteemist või arenduskeskkonnast.

## Eeldused

Enne azd paigaldamist veenduge, et teil on:
- **Azure tellimus** - [Loo tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valikuline) - Näidete jaoks, mis otseselt kasutavad `az`; azd autentib iseseisvalt
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Konteinerirakenduste jaoks

## Paigaldusmeetodid

### Windows

#### Valik 1: Windowsi pakihaldur (Soovitatav)
```cmd
winget install microsoft.azd
```

#### Valik 2: PowerShell paigaldusskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Valik 3: Chocolatey
```cmd
choco install azd
```

#### Valik 4: Manuaalne paigaldus
1. Laadige alla viimane versioon [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Pakkige lahti kausta `C:\Program Files\azd\`
3. Lisage PATH keskkonnamuutujasse

### macOS

#### Valik 1: Homebrew (Soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Valik 2: Paigaldusskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 3: Manuaalne paigaldus
Laadige arhiveeritud fail alla oma macOS arhitektuuri jaoks [vabastuse varadest](https://github.com/Azure/azure-dev/releases), pakkige see lahti ja lisage `azd` binaarfail oma `PATH`-sse.

### Linux

#### Valik 1: Paigaldusskript (Soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 2: Pakihaldurid

**Manuaalne paigaldus vabastuse varadest:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Mõned Codespaces ja arenduskonteineri keskkonnad sisaldavad juba `azd`, kuid peaksite selle üle kontrollima, mitte eeldama seda:

```bash
azd version
```

Kui `azd` puudub, paigaldage see vastava keskkonna tavapärase skripti abil.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

See ajutine konteiner ei säilita sisselogimisseisundit sessioonide vahel. Korduvate juurutuste jaoks kasutage [dev konteineri seadistust](dev-containers.md); konteineri ehitamiseks on samuti vajalik konteinerist ligipääsetav Docker daemon.

## ✅ Paigalduse kontrollimine

Pärast paigaldamist kontrollige, et azd toimib korrektselt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Oodatud väljund:
```
azd version 1.x.x (commit xxxxxx)
```

**Märkus**: Tõeline versiooninumber võib erineda. Vaadake uusimat versiooni [Azure Developer CLI väljaannetest](https://github.com/Azure/azure-dev/releases).

**✅ Eduka paigalduse kontrollnimekiri:**
- [ ] `azd version` kuvab versiooninumbri ilma vigadeta
- [ ] `azd --help` kuvab käsu dokumentatsiooni
- [ ] `azd template list` kuvab saadavalolevad mallid
- [ ] Saate luua testi kausta ja edukalt käivitada `azd init`

**Kui kõik kontrollid on läbinud, olete valmis liikuma edasi [Teie esimese projekti](first-project.md) juurde!**

## Autentimise seadistamine

### Soovitatav algajatele mõeldud seadistus

AZD-esmase töövoo jaoks logige sisse kasutades `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Kasutage Azure CLI sisselogimist ainult siis, kui kavatsete ise kursuse jooksul käivitada `az` käske.

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

### Millist sisselogimisvoogu kasutada?

- Kasutage `azd auth login`, kui järgite algajale mõeldud AZD rada ja peamiselt käivitate `azd` käske.
- Kasutage ka `az login`, kui soovite käivitada Azure CLI käske nagu `az account show` või vaadata ressursse otse.
- Kui harjutus sisaldab nii `azd` kui ka `az` käske, käivitage mõlemad sisselogimiskäsud ühe korra alguses.

### Seadme koodi autentimine
Kui olete peata süsteemis või teil on brauseri probleeme:
```bash
azd auth login --use-device-code
```

### Teenuse põhiarendaja (CI/CD)
Automaatsete keskkondade jaoks:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Kontrollige oma täielikku seadistust

Kui soovite kiiret valmisoleku kontrolli enne Peatüki 1 alustamist:

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
Lisage need oma kestaprofiili (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE integreerimine

### Visual Studio Code
Paigaldage Azure Developer CLI laiendus:
1. Avage VS Code
2. Minge Laienduste juurde (Ctrl+Shift+X)
3. Otsige "Azure Developer CLI"
4. Paigaldage laiendus

Omadused:
- IntelliSense azure.yaml jaoks
- Integreeritud terminali käsud
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
2. Seadistage Azure mandaadid
3. Kasutage azd käskude jaoks integreeritud terminali

## 🐛 Paigalduse veaotsing

### Levinud probleemid

#### Luba keelatud (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH probleemid
Lisage azd käsitsi oma PATH-i:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Võrgu/proksi probleemid
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

### Rohkem abi saamine
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
azd annab hoiatuse, kui saadaval on uuem versioon, ja saate oma praeguse versiooni kontrollida käsuga:
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

## 💡 Sageli küsitud küsimused

<details>
<summary><strong>Mis vahe on azd ja az CLI vahel?</strong></summary>

**Azure CLI (az)**: Madala taseme tööriist üksikute Azure ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Taristu halduse fookus

**Azure Developer CLI (azd)**: Kõrgema taseme tööriist täielike rakenduste juurutamiseks
- `azd up` juurutab kogu rakenduse koos kõigi ressurssidega
- Mallipõhised töövood
- Arendajate tootlikkusele keskendunud

**Need on iseseisvad**: azd kasutab vaikimisi oma autentimist. Paigaldage ja logige sisse Azure CLI-sse ainult `az` käskude jaoks või valige selgesõnaliselt `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kas ma saan kasutada azd olemasolevate Azure ressurssidega?</strong></summary>

Jah! Saate:
1. Importida olemasolevaid ressursse azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd uuteks juurutusteks koos olemasoleva taristuga

Täpsemale infole vaadake [Seadistamise juhendit](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Kas azd töötab Azure Governmenti või Azure China’ga?</strong></summary>

Jah, seadistage pilv:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Kui kasutate ka Azure CLI-d, seadistage `az cloud set --name ...` eraldi. Malliteenuste ja mudeli saadavus varieerub pilvest olenevalt.
</details>

<details>
<summary><strong>Kas ma saan kasutada azd CI/CD torudes?</strong></summary>

Absoluutselt! azd on loodud automatiseerimiseks:
- GitHub Actions integratsioon
- Azure DevOpsi tugi
- Teenuse põhipõhise autentimise tugi
- Mitteinimese-interaktiivne režiim

Vaadake [Juurutamise juhendit](../chapter-04-infrastructure/deployment-guide.md) CI/CD mustrite jaoks.
</details>

<details>
<summary><strong>Kui palju maksab azd kasutamine?</strong></summary>

azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Maksate ainult:
- Azure ressursid, mida juurutate
- Azure tarbimiskulud (arvutus, salvestus jne)

Kasutage `azd provision --preview`, et vaadata ettepanekuid ressurssidest, seejärel hinnake nende kulusid [Azure hinnakalkulaatoriga](https://azure.microsoft.com/pricing/calculator/). Eelvaade ei arvuta hindu.
</details>

## Järgmised sammud

1. **Lõpetage autentimine**: Veenduge, et pääsete ligi oma Azure tellimusele
2. **Proovige oma esimest juurutust**: Järgige [Esimese projekti juhendit](first-project.md)
3. **Uurige malle**: Sirvige saadaolevaid malle `azd template list` abil
4. **Seadistage oma IDE**: Kohandage oma arenduskeskkonda

## Tugi

Kui teil tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probleemide teatamine](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure tugi](https://azure.microsoft.com/support/)
- [**Azure'i agendi oskused**](https://skills.sh/microsoft/github-copilot-for-azure) - Saa Azure'i käsu juhised otse oma redaktoris koos `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused & Kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md) 
- **➡️ Järgmine**: [Sinu esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-Esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Paigaldamine lõpetatud!** Jätka [Sinu esimene projekt](first-project.md), et alustada ehitamist azd-ga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
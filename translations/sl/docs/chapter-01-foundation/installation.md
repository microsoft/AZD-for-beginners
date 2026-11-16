# Vodnik za namestitev in nastavitev

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [AZD Osnove](azd-basics.md)
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI v ospredju](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ta obsežen vodnik vas bo popeljal skozi namestitev in konfiguracijo Azure Developer CLI (azd) na vašem sistemu. Spoznali boste več načinov namestitve za različne operacijske sisteme, nastavitev avtentikacije in začetno konfiguracijo, da pripravite vaše razvojno okolje za Azure nameščanja.

## Cilji učenja

Ob koncu te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali avtentikacijo z Azure z več metodami
- Nastavili razvojno okolje z potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj uporabiti katero
- Odpravljali pogoste težave z namestitvijo in nastavitvijo

## Rezultati učenja

Po zaključku lekcije boste znali:
- Namestiti azd z ustrezno metodo za vašo platformo
- Avtenticirati se z Azure z uporabo azd auth login
- Preveriti namestitev in preizkusiti osnovne azd ukaze
- Konfigurirati razvojno okolje za optimalno uporabo azd
- Samostojno rešiti pogoste težave z namestitvijo

Ta vodnik vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd poskrbite, da imate:
- **Azure naročnino** - [Ustvarite brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** (neobvezno) - Za primere, ki neposredno zaženejo `az`; azd se avtenticira samostojno
- **Git** - Za kloniranje predlog in nadzor različic
- **Docker** (neobvezno) - Za kontejnerizirane aplikacije

## Metode namestitve

### Windows

#### Možnost 1: Windows Package Manager (priporočeno)
```cmd
winget install microsoft.azd
```

#### Možnost 2: PowerShell namestitveni skript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Ročna namestitev
1. Prenesite zadnjo izdajo iz [GitHub](https://github.com/Azure/azure-dev/releases)
2. Razširite v `C:\Program Files\azd\`
3. Dodajte v sistemsko okoljsko spremenljivko PATH

### macOS

#### Možnost 1: Homebrew (priporočeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Namestitveni skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Ročna namestitev
Prenesite arhiv za vašo macOS arhitekturo iz [sredstev izdaje](https://github.com/Azure/azure-dev/releases), ga razširite in dodajte izvršljivo datoteko `azd` v vaš `PATH`.

### Linux

#### Možnost 1: Namestitveni skript (priporočeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Upravljalniki paketov

**Ročna namestitev iz sredstev izdaje:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Nekateri Codespaces in razvojna okolja vsebujejo že `azd`, a to raje preverite namesto, da domnevate:

```bash
azd version
```

Če `azd` manjka, ga namestite z običajnim skriptom za okolje.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ta začasni kontejner ne ohrani prijavne seje med zagoni. Za ponavljajoče se nameščanje uporabite [nastavitev razvojnega kontejnerja](dev-containers.md); gradnje kontejnerjev tudi zahtevajo dostop do Docker demona znotraj kontejnerja.

## ✅ Preverjanje namestitve

Po namestitvi preverite, da azd deluje pravilno:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Pričakovan izhod:
```
azd version 1.x.x (commit xxxxxx)
```

**Opomba**: Dejanska številka različice se lahko razlikuje. Preverite [izdaje Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnovejšo različico.

**✅ Kontrolni seznam uspešne namestitve:**
- [ ] `azd version` prikazuje številko različice brez napak
- [ ] `azd --help` prikaže dokumentacijo ukazov
- [ ] `azd template list` prikaže razpoložljive predloge
- [ ] Lahko ustvarite testno mapo in uspešno zaženete `azd init`

**Če so vse kontrole uspešne, ste pripravljeni za [Vaš prvi projekt](first-project.md)!**

## Nastavitev avtentikacije

### Priporočena začetna nastavitev

Za delovne tokove z osredotočenostjo na AZD se prijavite z `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Uporabite prijavo z Azure CLI le, če nameravate sami med tečajem izvajati ukaze `az`.

### Azure CLI avtentikacija (neobvezno)
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

### Katero prijavno metodo uporabiti?

- Uporabite `azd auth login`, če sledite začetni poti AZD in večinoma izvajate ukaze `azd`.
- Uporabite `az login` tudi, ko želite izvajati Azure CLI ukaze, kot so `az account show` ali neposredno pregledovati vire.
- Če vaja vsebuje oba ukaza `azd` in `az`, zaženite oba ukaza za prijavo enkrat na začetku.

### Avtentikacija z napravo (Device Code)
Če uporabljate sistem brez glave ali imate težave s brskalnikom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Za avtomatizirana okolja:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Preverite celotno nastavitev

Če želite hitro preveriti pripravljenost pred začetkom Poglavja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguracija

### Globalna konfiguracija
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Okoljske spremenljivke
Dodajte v vaš profil lupine (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integracija v IDE

### Visual Studio Code
Namestite razširitev Azure Developer CLI:
1. Odprite VS Code
2. Pojdite na Razširitve (Ctrl+Shift+X)
3. Poiščite "Azure Developer CLI"
4. Namestite razširitev

Funkcionalnosti:
- IntelliSense za azure.yaml
- Integrirani terminalski ukazi
- Brskanje po predlogah
- Spremljanje nameščanja

### GitHub Codespaces
Ustvarite `.devcontainer/devcontainer.json`:
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
1. Namestite Azure vtičnik
2. Konfigurirajte Azure poverilnice
3. Uporabite integrirani terminal za azd ukaze

## 🐛 Odpravljanje težav pri namestitvi

### Pogoste težave

#### Dostop zavrnjen (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Težave s spremenljivko PATH
Ročno dodajte azd v vašo PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Omrežne/proxy težave
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Konflikti različic
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Pridobitev dodatne pomoči
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Posodabljanje azd

### Preverjanje posodobitev
azd opozori, ko je na voljo novejša izdaja, in lahko potrdite trenutno različico z:
```bash
azd version
```

### Ročne posodobitve

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

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kakšna je razlika med azd in az CLI?</strong></summary>

**Azure CLI (az)**: Orodje na nizki ravni za upravljanje posameznih Azure virov
- `az webapp create`, `az storage account create`
- Eden vir naenkrat
- Osredotočeno na upravljanje infrastrukture

**Azure Developer CLI (azd)**: Orodje na visoki ravni za celotna nameščanja aplikacij
- `azd up` namešča celotno aplikacijo z vsemi viri
- Delovni tokovi na osnovi predlog
- Osredotočeno na produktivnost razvijalcev

**Sta neodvisna**: azd privzeto uporablja svojo avtentikacijo. Namestite in se prijavite v Azure CLI le za `az` ukaze ali izrecno izberite `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Ali lahko uporabljam azd z obstoječimi Azure viri?</strong></summary>

Seveda! Lahko:
1. Uvozite obstoječe vire v azd okolja
2. Navedete obstoječe vire v vaših Bicep predlogah
3. Uporabljate azd za nova nameščanja skupaj z obstoječo infrastrukturo

Podrobnosti najdete v [Vodiču za konfiguracijo](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Ali azd deluje z Azure Government ali Azure China?</strong></summary>

Da, konfigurirajte oblak:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Če uporabljate tudi Azure CLI, konfigurirajte `az cloud set --name ...` ločeno. Storitev predlog in razpoložljivost modelov se razlikuje glede na oblak.
</details>

<details>
<summary><strong>Ali lahko uporabljam azd v CI/CD cevovodih?</strong></summary>

Seveda! azd je zasnovan za avtomatizacijo:
- Integracija z GitHub Actions
- Podpora za Azure DevOps
- Avtentikacija preko service principal
- Neinteraktivni način

Oglejte si [Vodič za nameščanje](../chapter-04-infrastructure/deployment-guide.md) za CI/CD vzorce.
</details>

<details>
<summary><strong>Kakšni so stroški uporabe azd?</strong></summary>

azd sam je **popolnoma brezplačen** in odprtokoden. Plačate samo za:
- Azure vire, ki jih nameščate
- Stroške porabe Azure (računalniške storitve, shranjevanje itd.)

Uporabite `azd provision --preview` za pregled predlaganih virov, nato ocenite stroške s [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Predogled ne izračunava cen.
</details>

## Naslednji koraki

1. **Dokončajte avtentikacijo**: Poskrbite, da imate dostop do vaše Azure naročnine
2. **Preizkusite prvo nameščanje**: Sledite [Vodiču za prvi projekt](first-project.md)
3. **Raziskujte predloge**: Prebrskajte razpoložljive predloge z `azd template list`
4. **Konfigurirajte svoj IDE**: Nastavite razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijava težav](https://github.com/Azure/azure-dev/issues)
- [Pogovori skupnosti](https://github.com/Azure/azure-dev/discussions)
- [Azure podpora](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobite navodila za Azure ukaze neposredno v urejevalniku z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [AZD Osnove](azd-basics.md) 
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI v ospredju](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Namestitev končana!** Nadaljujte na [Vaš prvi projekt](first-project.md), da začnete graditi z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
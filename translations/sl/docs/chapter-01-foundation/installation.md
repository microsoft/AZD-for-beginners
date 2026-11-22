# Vodnik za namestitev in konfiguracijo

**Navigacija po poglavjih:**
- **📚 Začetna stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Osnove AZD](azd-basics.md)
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ta obsežen vodnik vas bo popeljal skozi namestitev in konfiguracijo Azure Developer CLI (azd) na vašem sistemu. Naučili se boste več načinov namestitve za različne operacijske sisteme, nastavitev overjanja in začetne konfiguracije, da pripravite svoje razvojno okolje za uvajanje na Azure.

## Cilji učenja

Do konca te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali overjanje z Azure z več metodami
- Nastavili razvojno okolje z vsemi potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj katero uporabiti
- Rešili pogoste težave z namestitvijo in konfiguracijo

## Pričakovani rezultati

Po zaključku te lekcije boste znali:
- Namestiti azd z ustrezno metodo za vašo platformo
- Overiti se z Azure z ukazom azd auth login
- Preveriti namestitev in preizkusiti osnovne azd ukaze
- Konfigurirati razvojno okolje za optimalno uporabo azd
- Samostojno rešiti pogoste težave z namestitvijo

Ta vodnik vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd se prepričajte, da imate:
- **Azure naročnino** - [Ustvarite brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** (neobvezno) - Za primere, ki izrecno izvajajo `az`; azd se overja neodvisno
- **Git** - Za kloniranje predlog in nadzor različic
- **Docker** (neobvezno) - Za kontejnerizirane aplikacije

**Pot do izdaje poglavja 2 Foundry GA:** Uporabite AZD **1.37.0 ali novejšo različico**, namestite paket z `azd ext install microsoft.foundry` in uporabite Python **3.13+** ter trenutno **uv** za vzorec gostovanega agenta. Njegov način uvajanja kode gradi oddaljeno, zato ne zahteva lokalne Docker gradnje. Za uporabo so še vedno potrebna dovoljenja v Foundry, regionalna razpoložljivost modelov in kvota; oglejte si [namestitev gostovanega agenta](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metode namestitve

### Windows

#### Možnost 1: Windows Package Manager (priporočeno)
```cmd
winget install microsoft.azd
```

#### Možnost 2: Namestitveni skript PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Ročna namestitev
1. Prenesite najnovejšo izdajo s [GitHub](https://github.com/Azure/azure-dev/releases)
2. Razširite v `C:\Program Files\azd\`
3. Dodajte v okoljsko spremenljivko PATH

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
Prenesite arhiv za vašo macOS arhitekturo iz [release aranžmajev](https://github.com/Azure/azure-dev/releases), razširite ga in dodajte binarno datoteko `azd` v svojo `PATH`.

### Linux

#### Možnost 1: Namestitveni skript (priporočeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Upravljalniki paketov

**Ročna namestitev iz release aranžmajev:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Nekateri Codespaces in razvojna kontejnerska okolja že vključujejo `azd`, vendar najprej preverite namesto da predpostavljate:

```bash
azd version
```

Če `azd` manjka, ga namestite s standardnim skriptom za okolje.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ta začasen kontejner ne ohranja stanja prijave med zagoni. Za ponavljajoča uvajanja uporabite [namestitev razvojnega kontejnerja](dev-containers.md); gradnje kontejnerjev zahtevajo tudi dostop do Docker démona iz notranjosti kontejnerja.

## ✅ Preverjanje namestitve

Po namestitvi preverite, ali azd deluje pravilno:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Pričakovani izpis:
```
azd version 1.x.x (commit xxxxxx)
```

**Opomba**: Dejansko številko različice se bo razlikovala. Preverite [izdaje Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnovejšo različico.

**✅ Seznam za preverjanje uspešne namestitve:**
- [ ] `azd version` prikaže številko različice brez napak
- [ ] `azd --help` prikaže dokumentacijo ukazov
- [ ] `azd template list` prikaže razpoložljive predloge
- [ ] Lahko ustvarite testno mapo in uspešno zaženete `azd init`

**Če vsi preverjanja uspejo, ste pripravljeni nadaljevati na [Vaš prvi projekt](first-project.md)!**

## Nastavitev overjanja

### Priporočena začetna nastavitev

Za delovne tokove, ki temeljijo na AZD, se prijavite z `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Uporabite prijavo Azure CLI samo, če nameravate med tečajem sami izvajati ukaze `az`.

### Overjanje z Azure CLI (neobvezno)
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
- Uporabite tudi `az login`, kadar želite izvajati ukaze Azure CLI, kot so `az account show`, ali neposredno pregledati vire.
- Če vaja vključuje oba ukaza `azd` in `az`, zaženite oba prijavna ukaza na začetku.

### Overjanje z napravo kodo (Device Code)
Če ste na sistemu brez glave ali imate težave z brskalnikom:
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

### Preverite svojo popolno nastavitev

Če želite hitro preverjanje pripravljenosti pred začetkom Poglavja 1:

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
Dodajte v svoj profil lupine (`.bashrc`, `.zshrc`, `.profile`):
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
- Integrirani ukazi terminala
- Brskanje po predlogah
- Spremljanje uvajanja

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
2. Konfigurirajte poverilnice Azure
3. Uporabite integrirani terminal za azd ukaze

## 🐛 Reševanje težav z namestitvijo

### Pogoste težave

#### Zavrnjen dostop (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Težave s PATH
Ročno dodajte azd v svojo PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Težave z omrežjem/proxyjem
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

### Kako pridobiti dodatno pomoč
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
azd opozori, ko je na voljo novejša izdaja, in lahko preverite trenutno različico z:
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

## 💡 Pogosta vprašanja

<details>
<summary><strong>Kakšna je razlika med azd in az CLI?</strong></summary>

**Azure CLI (az)**: Orodje nizke ravni za upravljanje posameznih Azure virov
- `az webapp create`, `az storage account create`
- Po en vir naenkrat
- Osredotočeno na upravljanje infrastrukture

**Azure Developer CLI (azd)**: Orodje višje ravni za popolna uvajanja aplikacij
- `azd up` uvaja celotno aplikacijo z vsemi viri
- Delovni tokovi na osnovi predlog
- Osredotočeno na produktivnost razvijalcev

**Neodvisna orodja**: azd privzeto uporablja lastno overjanje. Namestite in se prijavite v Azure CLI samo za ukaze `az` ali izrecno uporabite `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Ali lahko uporabljam azd z obstoječimi Azure viri?</strong></summary>

Seveda! Lahko:
1. Uvozite obstoječe vire v azd okolja
2. Referencirate obstoječe vire v svojih Bicep predlogah
3. Uporabite azd za nova uvajanja poleg obstoječe infrastrukture

Podrobnosti najdete v [vodniku za konfiguracijo](../chapter-03-configuration/configuration.md).
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

Če uporabljate tudi Azure CLI, posebej konfigurirajte `az cloud set --name ...`. Storitve predlog in razpoložljivost modelov se razlikujejo glede na oblak.
</details>

<details>
<summary><strong>Ali lahko uporabljam azd v CI/CD poteh?</strong></summary>

Seveda! azd je zasnovan za avtomatizacijo:
- Integracija z GitHub Actions
- Podpora za Azure DevOps
- Overjanje s service principal
- Neinteraktivni način

Vzorce za CI/CD si oglejte v [vodniku za uvajanje](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kakšni so stroški uporabe azd?</strong></summary>

azd sam je **popolnoma brezplačen** in odprtokoden. Plačate samo za:
- Azure vire, ki jih uvajate
- Stroške porabe Azure (računalništvo, shranjevanje itd.)

Uporabite `azd provision --preview` za pregled predlaganih virov, nato ocenite stroške z [Azure kalkulatorjem cen](https://azure.microsoft.com/pricing/calculator/). Predogled cen ne izračuna.
</details>

## Naslednji koraki

1. **Zaključite overjanje**: Prepričajte se, da imate dostop do Azure naročnine
2. **Preizkusite prvo uvajanje**: Sledite [vodniku za prvi projekt](first-project.md)
3. **Raziščite predloge**: Brskajte po razpoložljivih predlogah z ukazom `azd template list`
4. **Konfigurirajte IDE**: Pripravite razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite težave](https://github.com/Azure/azure-dev/issues)
- [Skupnostne razprave](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobite navodila za Azure ukaze neposredno v urejevalniku z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Začetna stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Osnove AZD](azd-basics.md) 
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Namestitev uspešno zaključena!** Nadaljujte na [Vaš prvi projekt](first-project.md), da začnete ustvarjati z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
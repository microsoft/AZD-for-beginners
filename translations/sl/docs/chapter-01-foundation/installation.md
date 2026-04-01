# Namestitev in vodič za nastavitev

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Osnove AZD](azd-basics.md)
- **➡️ Next**: [Vaš prvi projekt](first-project.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ta obsežen vodič vas bo popeljal skozi namestitev in konfiguracijo Azure Developer CLI (azd) na vašem sistemu. Naučili se boste več načinov namestitve za različne operacijske sisteme, nastavitve prijave in začetne konfiguracije, da pripravite svoje razvojno okolje za nameščanje v Azure.

## Cilji učenja

Do konca te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali avtentikacijo z Azure z uporabo več metod
- Nastavili razvojno okolje z vsemi potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj uporabiti katero
- Odpravili pogoste težave pri namestitvi in konfiguraciji

## Rezultati učenja

Po zaključku te lekcije boste lahko:
- Namestili azd z ustrezno metodo za vašo platformo
- Avtenticirali z Azure z uporabo `azd auth login`
- Preverili namestitev in preizkusili osnovne ukaze azd
- Konfigurirali svoje razvojno okolje za optimalno uporabo azd
- Samostojno rešili pogoste težave pri namestitvi

Ta vodič vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd se prepričajte, da imate:
- **Naročnina na Azure** - [Ustvarite brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za avtentikacijo in upravljanje virov
- **Git** - Za kloniranje predlog in nadzor različic
- **Docker** (izbirno) - Za kontejnerizirane aplikacije

## Metode namestitve

### Windows

#### Možnost 1: Windows Package Manager (priporočeno)
```cmd
winget install microsoft.azd
```

#### Možnost 2: PowerShell skripta za namestitev
```powershell
# Uporabno, ko winget ni na voljo
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Ročna namestitev
1. Prenesite najnovejšo izdajo z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Razpakirajte v `C:\Program Files\azd\`
3. Dodajte v spremenljivko okolja PATH

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
```bash
# Prenesite in namestite
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Namestitveni skript (priporočeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Paketni upravitelji

**Ročna namestitev iz gradiv izdaje:**
```bash
# Prenesite najnovejši arhiv za vašo Linux arhitekturo s:
# https://github.com/Azure/azure-dev/releases
# Nato ga razpakirajte in dodajte izvršljivo datoteko azd v svojo spremenljivko PATH.
```

### GitHub Codespaces

Nekateri Codespaces in dev container okolja že vključujejo `azd`, vendar to preverite, namesto da bi domnevali:

```bash
azd version
```

Če `azd` manjka, ga namestite s standardnim skriptom za okolje.

### Docker

```bash
# Zaženi azd v kontejnerju
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Ustvari alias za lažjo uporabo
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Preverite namestitev

Po namestitvi preverite, ali azd deluje pravilno:

```bash
# Preveri različico
azd version

# Prikaži pomoč
azd --help

# Prikaži razpoložljive predloge
azd template list
```

Pričakovani izhod:
```
azd version 1.x.x (commit xxxxxx)
```

**Opomba**: Dejanska številka različice se lahko razlikuje. Preverite [izdaje Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnovejšo različico.

**✅ Kontrolni seznam uspešne namestitve:**
- [ ] `azd version` prikaže številko različice brez napak
- [ ] `azd --help` prikaže dokumentacijo ukazov
- [ ] `azd template list` prikaže razpoložljive predloge
- [ ] Lahko ustvarite testno mapo in uspešno zaženete `azd init`

**Če vsi preverjalni koraki uspejo, ste pripravljeni nadaljevati na [Vaš prvi projekt](first-project.md)!**

## Nastavitev avtentikacije

### Priporočena nastavitev za začetnike

Za delovne tokove, usmerjene na AZD, se prijavite z `azd auth login`.

```bash
# Potrebno za AZD ukaze, kot je azd up
azd auth login

# Preveri stanje overitve AZD
azd auth login --check-status
```

Uporabljajte prijavo Azure CLI le, če nameravate med tečajem sami uporabljati ukaze `az`.

### Avtentikacija z Azure CLI (izbirno)
```bash
# Namestite Azure CLI, če še ni nameščen
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: oglejte si dokumentacijo za namestitev Azure CLI za vašo distribucijo

# Prijavite se v Azure
az login

# Preverite overjanje pristnosti
az account show
```

### Kateri način prijave naj uporabim?

- Uporabite `azd auth login`, če sledite začetni poti AZD in večinoma izvajate ukaze `azd`.
- Uporabite tudi `az login`, ko želite zagnati Azure CLI ukaze, kot je `az account show`, ali neposredno pregledovati vire.
- Če vaja vključuje tako ukaze `azd` kot `az`, zaženite obe prijavni ukazi ob začetku.

### Avtentikacija z uporabo kode naprave
Če ste na sistemu brez grafičnega vmesnika ali imate težave z brskalnikom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Za avtomatizirana okolja:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Preverite celotno nastavitev

Če želite hitro preverjanje pripravljenosti pred začetkom poglavja 1:

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
# Nastavi privzeto naročnino
azd config set defaults.subscription <subscription-id>

# Nastavi privzeto lokacijo
azd config set defaults.location eastus2

# Prikaži vso konfiguracijo
azd config show
```

### Spremenljivke okolja
Dodajte v vaš profil lupine (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracija Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracija azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogoči beleženje za odpravljanje napak
```

## Integracija z IDE

### Visual Studio Code
Namestite razširitev Azure Developer CLI:
1. Odprite VS Code
2. Pojdite na Razširitve (Ctrl+Shift+X)
3. Poiščite "Azure Developer CLI"
4. Namestite razširitev

Funkcije:
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
3. Uporabljajte integrirano konzolo za ukaze azd

## 🐛 Odpravljanje težav pri namestitvi

### Pogoste težave

#### Dostop zavrnjen (Windows)
```powershell
# Zaženi PowerShell kot skrbnik
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Težave s PATH
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

#### Težave z omrežjem/proxyjem
```bash
# Konfiguriraj proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskoči preverjanje SSL (ni priporočljivo v produkcijskem okolju)
azd config set http.insecure true
```

#### Konflikti različic
```bash
# Odstranite stare namestitve
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: pred ponovno namestitvijo odstranite prejšnjo binarno datoteko azd ali simbolno povezavo

# Počistite konfiguracijo
rm -rf ~/.azd
```

### Kje dobiti dodatno pomoč
```bash
# Omogoči beleženje za razhroščevanje
export AZD_DEBUG=true
azd <command> --debug

# Prikaži trenutno konfiguracijo
azd config show

# Prikaži trenutno stanje nameščanja
azd show
```

## Posodabljanje azd

### Preverjanje posodobitev
azd opozori, ko je na voljo novejša izdaja, in lahko potrdite svojo trenutno verzijo z:
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

**Azure CLI (az)**: Orodje nizke ravni za upravljanje posameznih Azure virov
- `az webapp create`, `az storage account create`
- En vir naenkrat
- Osredotočeno na upravljanje infrastrukture

**Azure Developer CLI (azd)**: Orodje višje ravni za celotna nameščanja aplikacij
- `azd up` namesti celotno aplikacijo z vsemi viri
- Delovni tokovi, temelječi na predlogah
- Osredotočeno na produktivnost razvijalcev

**Potrebujete obe**: azd uporablja az CLI za avtentikacijo
</details>

<details>
<summary><strong>Ali lahko uporabljam azd z obstoječimi viri Azure?</strong></summary>

Da! Lahko:
1. Uvozite obstoječe vire v azd okolja
2. Referencirate obstoječe vire v svojih Bicep predlogah
3. Uporabljate azd za nove namestitve skupaj z obstoječo infrastrukturo

Oglejte si [Vodnik za konfiguracijo](configuration.md) za podrobnosti.
</details>

<details>
<summary><strong>Ali azd deluje z Azure Government ali Azure China?</strong></summary>

Da, konfigurirajte oblak:
```bash
# Azure za vlado
az cloud set --name AzureUSGovernment
az login

# Azure Kitajska
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Ali lahko uporabljam azd v CI/CD cevovodih?</strong></summary>

Absolutno! azd je zasnovan za avtomatizacijo:
- Integracija z GitHub Actions
- Podpora Azure DevOps
- Avtentikacija preko service principal
- Neinteraktivni način

Oglejte si [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) za vzorce CI/CD.
</details>

<details>
<summary><strong>Kakšni so stroški uporabe azd?</strong></summary>

azd je sam **popolnoma brezplačen** in odprtokoden. Plačate le za:
- Azure vire, ki jih namestite
- Stroške porabe Azure (računalniške vire, shranjevanje itd.)

Uporabite `azd provision --preview` za ocenitev stroškov pred nameščanjem.
</details>

## Naslednji koraki

1. **Dokončajte avtentikacijo**: Prepričajte se, da imate dostop do svoje Azure naročnine
2. **Preizkusite prvo nameščanje**: Sledite [Vodniku za prvi projekt](first-project.md)
3. **Raziskujte predloge**: Brskajte po razpoložljivih predlogah z `azd template list`
4. **Konfigurirajte svoj IDE**: Nastavite svoje razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavi težave](https://github.com/Azure/azure-dev/issues)
- [Skupnostne razprave](https://github.com/Azure/azure-dev/discussions)
- [Podpora za Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Pridobite navodila za Azure ukaze neposredno v urejevalniku z `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Osnove AZD](azd-basics.md) 
- **➡️ Next**: [Vaš prvi projekt](first-project.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Namestitev zaključena!** Nadaljujte na [Vaš prvi projekt](first-project.md), da začnete graditi z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
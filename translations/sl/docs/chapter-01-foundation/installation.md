# Namestitveni in nastavitveni vodič

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Osnove AZD](azd-basics.md)
- **➡️ Next**: [Vaš prvi projekt](first-project.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, ki daje prednost umetni inteligenci](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ta obsežen vodič vas bo vodil skozi namestitev in konfiguracijo Azure Developer CLI (azd) na vašem sistemu. Naučili se boste več načinov namestitve za različne operacijske sisteme, podrobnosti o nastavitvi overjanja in začetni konfiguraciji, da pripravite razvojno okolje za nameščanje v Azure.

## Cilji učenja

Do konca te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali overjanje z Azure z več metodami
- Nastavili razvojno okolje z vsemi potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj uporabiti katero
- Odpravili pogoste težave z namestitvijo in nastavitvijo

## Rezultati učenja

Po končani lekciji boste sposobni:
- Namestiti azd z ustrezno metodo za vašo platformo
- Avtorizirati se z Azure z ukazom azd auth login
- Preveriti namestitev in preizkusiti osnovne ukaze azd
- Konfigurirati razvojno okolje za optimalno uporabo azd
- Samostojno rešiti pogoste težave z namestitvijo

Ta vodič vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd poskrbite, da imate:
- **Azure subscription** - [Ustvari brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** - za overjanje in upravljanje virov
- **Git** - za kloniranje predlog in upravljanje različic
- **Docker** (neobvezno) - za aplikacije v vsebnikih

## Metode namestitve

### Windows

#### Možnost 1: PowerShell (priporočeno)
```powershell
# Zaženi kot skrbnik ali z povišanimi privilegiji
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
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

#### Možnost 2: Upravljalniki paketov

**Ubuntu/Debian:**
```bash
# Dodaj Microsoftov repozitorij paketov
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Namesti azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodaj Microsoftov repozitorij paketov
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je prednameščen v GitHub Codespaces. Preprosto ustvarite codespace in takoj začnite uporabljati azd.

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

**Opomba**: Dejansko številko različice se lahko razlikuje. Preverite [izdaje Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnovejšo različico.

**✅ Kontrolni seznam uspešne namestitve:**
- [ ] `azd version` prikaže številko različice brez napak
- [ ] `azd --help` prikaže dokumentacijo ukazov
- [ ] `azd template list` prikaže razpoložljive predloge
- [ ] `az account show` prikaže vašo Azure naročnino
- [ ] Lahko ustvarite testno mapo in uspešno zaženete `azd init`

**Če vsi preverki uspešno opravijo, ste pripravljeni nadaljevati z [Vaš prvi projekt](first-project.md)!**

## Nastavitev overjanja

### Overjanje z Azure CLI (priporočeno)
```bash
# Namestite Azure CLI, če še ni nameščen
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prijavite se v Azure
az login

# Preverite prijavo
az account show
```

### Overjanje z uporabo kode naprave
Če ste na brezglavnem sistemu ali imate težave z brskalnikom:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Za avtomatizirana okolja:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguracija

### Globalna konfiguracija
```bash
# Nastavi privzeto naročnino
azd config set defaults.subscription <subscription-id>

# Nastavi privzeto lokacijo
azd config set defaults.location eastus2

# Prikaži vso konfiguracijo
azd config list
```

### Spremenljivke okolja
Dodajte v profil lupine (`.bashrc`, `.zshrc`, `.profile`):
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
- Integriran terminal za ukaze
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
3. Uporabite integriran terminal za ukaze azd

## 🐛 Odpravljanje težav pri namestitvi

### Pogoste težave

#### Dostop zavrnjen (Windows)
```powershell
# Zaženite PowerShell kot skrbnik
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

#### Težave z omrežjem/proxyjem
```bash
# Konfiguriraj proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskoči preverjanje SSL (ni priporočljivo za produkcijo)
azd config set http.insecure true
```

#### Konflikti različic
```bash
# Odstranite stare namestitve
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Očistite konfiguracijo
rm -rf ~/.azd
```

### Kako pridobiti dodatno pomoč
```bash
# Omogoči beleženje za razhroščevanje
export AZD_DEBUG=true
azd <command> --debug

# Prikaži trenutno konfiguracijo
azd config list

# Prikaži trenutno stanje razmestitve
azd show
```

## Posodabljanje azd

### Samodejne posodobitve
azd vas bo obvestil, ko bodo na voljo posodobitve:
```bash
azd version --check-for-updates
```

### Ročne posodobitve

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

## 💡 Pogosta vprašanja

<details>
<summary><strong>Kakšna je razlika med azd in az CLI?</strong></summary>

**Azure CLI (az)**: Orodje nizke ravni za upravljanje posameznih Azure virov
- `az webapp create`, `az storage account create`
- En vir naenkrat
- Osredotočeno na upravljanje infrastrukture

**Azure Developer CLI (azd)**: Orodje višje ravni za celovite nameščanja aplikacij
- `azd up` namesti celotno aplikacijo z vsemi viri
- Deluje na osnovi predlog
- Osredotočeno na produktivnost razvijalca

**Potrebujete oba**: azd uporablja az CLI za overjanje
</details>

<details>
<summary><strong>Ali lahko uporabljam azd z obstoječimi viri Azure?</strong></summary>

Da! Lahko:
1. Uvozite obstoječe vire v azd okolja
2. Referencirate obstoječe vire v vaših Bicep predlogah
3. Uporabite azd za nove nameščanja skupaj z obstoječo infrastrukturo

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
- Podpora za Azure DevOps
- Overjanje s service principal
- Način brez interakcije

Oglejte si [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) za CI/CD vzorce.
</details>

<details>
<summary><strong>Kakšni so stroški uporabe azd?</strong></summary>

azd sam je **popolnoma brezplačen** in odprtokoden. Plačate le za:
- Azure vire, ki jih namestite
- Porabo Azure (računalniški viri, shranjevanje itd.)

Uporabite `azd provision --preview` za oceno stroškov pred nameščanjem.
</details>

## Naslednji koraki

1. **Dokončajte overjanje**: Prepričajte se, da lahko dostopate do vaše Azure naročnine
2. **Preizkusite prvo nameščanje**: Sledite [Vodniku za prvi projekt](first-project.md)
3. **Raziskujte predloge**: Brskajte po razpoložljivih predlogah z `azd template list`
4. **Konfigurirajte vaš IDE**: Nastavite razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavi težave](https://github.com/Azure/azure-dev/issues)
- [Skupnostne razprave](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Osnove AZD](azd-basics.md) 
- **➡️ Next**: [Vaš prvi projekt](first-project.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, ki daje prednost umetni inteligenci](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Namestitev zaključena!** Nadaljujte z [Vaš prvi projekt](first-project.md) , da začnete graditi z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v svojem izvirnem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo strokovni prevod, opravljen s strani usposobljenega prevajalca. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
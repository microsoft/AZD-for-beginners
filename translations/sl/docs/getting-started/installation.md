# Vodnik za namestitev in nastavitev

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Osnove AZD](azd-basics.md)
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI na prvem mestu](../microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ta obsežen vodnik vas bo korak za korakom vodil skozi namestitev in konfiguracijo Azure Developer CLI (azd) na vašem sistemu. Spoznali boste različne metode namestitve za različne operacijske sisteme, nastavitev avtentikacije in začetno konfiguracijo za pripravo vašega razvojnega okolja za Azure implementacije.

## Cilji učenja

Do konca te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali avtentikacijo z Azure z uporabo različnih metod
- Nastavili vaše razvojno okolje z vsemi potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj jih uporabiti
- Rešili pogoste težave pri namestitvi in nastavitvi

## Rezultati učenja

Po zaključku te lekcije boste sposobni:
- Namestiti azd z ustrezno metodo za vašo platformo
- Avtenticirati z Azure z uporabo `azd auth login`
- Preveriti namestitev in testirati osnovne ukaze azd
- Konfigurirati vaše razvojno okolje za optimalno uporabo azd
- Samostojno reševati pogoste težave pri namestitvi

Ta vodnik vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd se prepričajte, da imate:
- **Azure naročnino** - [Ustvarite brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za avtentikacijo in upravljanje virov
- **Git** - Za kloniranje predlog in nadzor različic
- **Docker** (neobvezno) - Za aplikacije v kontejnerjih

## Metode namestitve

### Windows

#### Možnost 1: PowerShell (Priporočeno)
```powershell
# Zaženite kot skrbnik ali z višjimi privilegiji
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
3. Dodajte v okoljsko spremenljivko PATH

### macOS

#### Možnost 1: Homebrew (Priporočeno)
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
# Prenesi in namesti
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Namestitveni skript (Priporočeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Upravljalniki paketov

**Ubuntu/Debian:**
```bash
# Dodaj Microsoftovo skladišče paketov
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Namesti azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodajte Microsoftovo skladišče paketov
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je že prednameščen v GitHub Codespaces. Preprosto ustvarite codespace in takoj začnite uporabljati azd.

### Docker

```bash
# Zaženite azd v vsebniku
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Ustvarite vzdevek za lažjo uporabo
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Preverjanje namestitve

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
azd version 1.5.0 (commit abc123)
```

**✅ Seznam za preverjanje uspešne namestitve:**
- [ ] `azd version` prikazuje številko različice brez napak
- [ ] `azd --help` prikazuje dokumentacijo ukazov
- [ ] `azd template list` prikazuje razpoložljive predloge
- [ ] `az account show` prikazuje vašo Azure naročnino
- [ ] Ustvarite testni imenik in uspešno zaženite `azd init`

**Če so vsi koraki uspešni, ste pripravljeni nadaljevati na [Vaš prvi projekt](first-project.md)!**

## Nastavitev avtentikacije

### Avtentikacija z Azure CLI (Priporočeno)
```bash
# Namestite Azure CLI, če še ni nameščen
# Windows: winget namesti Microsoft.AzureCLI
# macOS: brew namesti azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prijavite se v Azure
az login

# Preverite overjanje
az account show
```

### Avtentikacija z napravo
Če uporabljate sistem brez glave ali imate težave z brskalnikom:
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

# Prikaži vse nastavitve
azd config list
```

### Okoljske spremenljivke
Dodajte v profil vaše lupine (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracija Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracija azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogoči beleženje odpravljanja napak
```

## Integracija IDE

### Visual Studio Code
Namestite razširitev Azure Developer CLI:
1. Odprite VS Code
2. Pojdite na razširitve (Ctrl+Shift+X)
3. Poiščite "Azure Developer CLI"
4. Namestite razširitev

Funkcije:
- IntelliSense za azure.yaml
- Integrirani ukazi v terminalu
- Brskanje po predlogah
- Spremljanje implementacij

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
3. Uporabite integrirani terminal za ukaze azd

## 🐛 Odpravljanje težav pri namestitvi

### Pogoste težave

#### Dovoljenje zavrnjeno (Windows)
```powershell
# Zaženite PowerShell kot skrbnik
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Težave s PATH
Ročno dodajte azd v PATH:

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
# Odstrani stare namestitve
# Windows: winget odstrani Microsoft.Azd
# macOS: brew odstrani azd
# Linux: sudo apt odstrani azd

# Počisti konfiguracijo
rm -rf ~/.azd
```

### Pridobivanje dodatne pomoči
```bash
# Omogoči beleženje odpravljanja napak
export AZD_DEBUG=true
azd <command> --debug

# Ogled podrobnih dnevnikov
azd logs

# Preveri informacije o sistemu
azd info
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

**Azure CLI (az)**: Orodje na nizki ravni za upravljanje posameznih Azure virov
- `az webapp create`, `az storage account create`
- En vir naenkrat
- Osredotočeno na upravljanje infrastrukture

**Azure Developer CLI (azd)**: Orodje na visoki ravni za celotne implementacije aplikacij
- `azd up` implementira celotno aplikacijo z vsemi viri
- Delovni tokovi na osnovi predlog
- Osredotočeno na produktivnost razvijalcev

**Potrebujete oba**: azd uporablja az CLI za avtentikacijo
</details>

<details>
<summary><strong>Ali lahko uporabljam azd z obstoječimi Azure viri?</strong></summary>

Da! Lahko:
1. Uvozite obstoječe vire v azd okolja
2. Sklicujete obstoječe vire v vaših Bicep predlogah
3. Uporabljate azd za nove implementacije poleg obstoječe infrastrukture

Glejte [Vodnik za konfiguracijo](configuration.md) za podrobnosti.
</details>

<details>
<summary><strong>Ali azd deluje z Azure Government ali Azure China?</strong></summary>

Da, konfigurirajte oblak:
```bash
# Azure Vlada
az cloud set --name AzureUSGovernment
az login

# Azure Kitajska
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Ali lahko uporabljam azd v CI/CD procesih?</strong></summary>

Seveda! azd je zasnovan za avtomatizacijo:
- Integracija z GitHub Actions
- Podpora za Azure DevOps
- Avtentikacija s Service Principal
- Način brez interakcije

Glejte [Vodnik za implementacijo](../deployment/deployment-guide.md) za vzorce CI/CD.
</details>

<details>
<summary><strong>Kakšni so stroški uporabe azd?</strong></summary>

azd sam je **popolnoma brezplačen** in odprtokoden. Plačate le za:
- Azure vire, ki jih implementirate
- Stroške porabe Azure (računalništvo, shranjevanje itd.)

Uporabite `azd provision --preview` za oceno stroškov pred implementacijo.
</details>

## Naslednji koraki

1. **Dokončajte avtentikacijo**: Prepričajte se, da lahko dostopate do vaše Azure naročnine
2. **Preizkusite prvo implementacijo**: Sledite [Vodniku za prvi projekt](first-project.md)
3. **Raziskujte predloge**: Brskajte po razpoložljivih predlogah z `azd template list`
4. **Konfigurirajte vaš IDE**: Nastavite vaše razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijava težav](https://github.com/Azure/azure-dev/issues)
- [Skupnostne razprave](https://github.com/Azure/azure-dev/discussions)
- [Azure podpora](https://azure.microsoft.com/support/)

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Osnove AZD](azd-basics.md) 
- **➡️ Naslednje**: [Vaš prvi projekt](first-project.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI na prvem mestu](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Namestitev zaključena!** Nadaljujte na [Vaš prvi projekt](first-project.md) in začnite graditi z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
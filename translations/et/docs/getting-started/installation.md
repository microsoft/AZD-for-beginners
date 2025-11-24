<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-24T13:15:54+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "et"
}
-->
# Paigaldus- ja seadistusjuhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md)
- **➡️ Järgmine**: [Sinu esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../microsoft-foundry/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend aitab sul paigaldada ja seadistada Azure Developer CLI (azd) oma süsteemis. Õpid erinevaid paigaldusmeetodeid erinevatele operatsioonisüsteemidele, autentimise seadistamist ja esmast konfiguratsiooni, et valmistada oma arenduskeskkond ette Azure'i juurutusteks.

## Õppimise eesmärgid

Selle õppetunni lõpuks suudad:
- Edukalt paigaldada Azure Developer CLI oma operatsioonisüsteemile
- Seadistada autentimise Azure'iga, kasutades erinevaid meetodeid
- Valmistada oma arenduskeskkond ette vajalike eeldustega
- Mõista erinevaid paigaldusvõimalusi ja millal neid kasutada
- Lahendada levinud paigaldus- ja seadistusprobleeme

## Õpitulemused

Pärast selle õppetunni läbimist oskad:
- Paigaldada azd, kasutades oma platvormile sobivat meetodit
- Autentida Azure'iga, kasutades käsku `azd auth login`
- Kontrollida oma paigaldust ja testida põhilisi azd käske
- Konfigureerida oma arenduskeskkonda azd optimaalseks kasutamiseks
- Iseseisvalt lahendada levinud paigaldusprobleeme

See juhend aitab sul paigaldada ja seadistada Azure Developer CLI oma süsteemis, olenemata operatsioonisüsteemist või arenduskeskkonnast.

## Eeltingimused

Enne azd paigaldamist veendu, et sul on:
- **Azure'i tellimus** - [Loo tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentimiseks ja ressursside haldamiseks
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Konteineripõhiste rakenduste jaoks

## Paigaldusmeetodid

### Windows

#### Valik 1: PowerShell (soovitatav)
```powershell
# Käivita administraatorina või kõrgendatud õigustega
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Valik 2: Windowsi pakettihaldur (winget)
```cmd
winget install Microsoft.Azd
```

#### Valik 3: Chocolatey
```cmd
choco install azd
```

#### Valik 4: Käsitsi paigaldamine
1. Laadi alla viimane versioon [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Paki lahti kausta `C:\Program Files\azd\`
3. Lisa PATH keskkonnamuutujasse

### macOS

#### Valik 1: Homebrew (soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Valik 2: Installimisskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 3: Käsitsi paigaldamine
```bash
# Laadi alla ja installi
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Valik 1: Installimisskript (soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 2: Pakettihaldurid

**Ubuntu/Debian:**
```bash
# Lisa Microsofti paketihoidla
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Paigalda azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lisa Microsofti paketihoidla
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd on GitHub Codespaces'is eelpaigaldatud. Lihtsalt loo Codespace ja alusta azd kasutamist kohe.

### Docker

```bash
# Käivita azd konteineris
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Loo alias lihtsamaks kasutamiseks
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Paigalduse kontrollimine

Pärast paigaldamist kontrolli, kas azd töötab õigesti:

```bash
# Kontrolli versiooni
azd version

# Vaata abi
azd --help

# Loetle saadaval olevad mallid
azd template list
```

Oodatav väljund:
```
azd version 1.5.0 (commit abc123)
```

**✅ Paigalduse edukuse kontrollnimekiri:**
- [ ] `azd version` kuvab versiooninumbri ilma vigadeta
- [ ] `azd --help` kuvab käskude dokumentatsiooni
- [ ] `azd template list` kuvab saadaval olevad mallid
- [ ] `az account show` kuvab sinu Azure'i tellimuse
- [ ] Saad luua testkataloogi ja käivitada `azd init` edukalt

**Kui kõik kontrollid on edukad, oled valmis liikuma edasi peatükki [Sinu esimene projekt](first-project.md)!**

## Autentimise seadistamine

### Azure CLI autentimine (soovitatav)
```bash
# Paigalda Azure CLI, kui see pole veel installitud
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logi sisse Azure'i
az login

# Kontrolli autentimist
az account show
```

### Seadmekoodi autentimine
Kui kasutad peata süsteemi või sul on probleeme brauseriga:
```bash
az login --use-device-code
```

### Teenusepõhimõte (CI/CD)
Automatiseeritud keskkondade jaoks:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguratsioon

### Üldine konfiguratsioon
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription <subscription-id>

# Määra vaikimisi asukoht
azd config set defaults.location eastus2

# Vaata kõiki konfiguratsioone
azd config list
```

### Keskkonnamuutujad
Lisa oma shelli profiili (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguratsioon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguratsioon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Luba silumise logimine
```

## IDE integratsioon

### Visual Studio Code
Paigalda Azure Developer CLI laiendus:
1. Ava VS Code
2. Mine laienduste juurde (Ctrl+Shift+X)
3. Otsi "Azure Developer CLI"
4. Paigalda laiendus

Funktsioonid:
- IntelliSense `azure.yaml` jaoks
- Integreeritud terminalikäsud
- Mallide sirvimine
- Juurutuste jälgimine

### GitHub Codespaces
Loo `.devcontainer/devcontainer.json`:
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
1. Paigalda Azure'i plugin
2. Konfigureeri Azure'i mandaadid
3. Kasuta integreeritud terminali azd käskude jaoks

## 🐛 Paigaldusprobleemide lahendamine

### Levinud probleemid

#### Luba keelatud (Windows)
```powershell
# Käivita PowerShell administraatorina
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH probleemid
Lisa azd käsitsi PATH-i:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Võrgu/proksiprobleemid
```bash
# Konfigureeri puhverserver
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Jäta SSL-i kontroll vahele (ei ole soovitatav tootmiskeskkonnas)
azd config set http.insecure true
```

#### Versioonikonfliktid
```bash
# Eemalda vanad installatsioonid
# Windows: winget desinstalli Microsoft.Azd
# macOS: brew desinstalli azd
# Linux: sudo apt eemalda azd

# Puhasta konfiguratsioon
rm -rf ~/.azd
```

### Kust saada rohkem abi
```bash
# Luba silumise logimine
export AZD_DEBUG=true
azd <command> --debug

# Vaata üksikasjalikke logisid
azd logs

# Kontrolli süsteemi infot
azd info
```

## azd uuendamine

### Automaatne uuendamine
azd teavitab sind, kui uuendused on saadaval:
```bash
azd version --check-for-updates
```

### Käsitsi uuendamine

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

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Mis vahe on azd ja az CLI vahel?</strong></summary>

**Azure CLI (az)**: Madala taseme tööriist üksikute Azure'i ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Keskendub infrastruktuuri haldamisele

**Azure Developer CLI (azd)**: Kõrgetasemeline tööriist terviklike rakenduste juurutamiseks
- `azd up` juurutab kogu rakenduse koos kõigi ressurssidega
- Mallipõhised töövood
- Keskendub arendaja tootlikkusele

**Mõlemad on vajalikud**: azd kasutab az CLI-d autentimiseks
</details>

<details>
<summary><strong>Kas saan kasutada azd-d olemasolevate Azure'i ressurssidega?</strong></summary>

Jah! Sa saad:
1. Importida olemasolevaid ressursse azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd-d uute juurutuste jaoks koos olemasoleva infrastruktuuriga

Vaata [Konfiguratsioonijuhendit](configuration.md) detailideks.
</details>

<details>
<summary><strong>Kas azd töötab Azure Governmenti või Azure China'ga?</strong></summary>

Jah, seadista pilv:
```bash
# Azure Valitsus
az cloud set --name AzureUSGovernment
az login

# Azure Hiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kas saan kasutada azd-d CI/CD torujuhtmetes?</strong></summary>

Kindlasti! azd on loodud automatiseerimiseks:
- GitHub Actions integratsioon
- Azure DevOps tugi
- Teenusepõhimõtte autentimine
- Mitteinteraktiivne režiim

Vaata [Juurutusjuhendit](../deployment/deployment-guide.md) CI/CD mustrite jaoks.
</details>

<details>
<summary><strong>Mis on azd kasutamise maksumus?</strong></summary>

azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Maksad ainult:
- Azure'i ressursside eest, mida juurutad
- Azure'i tarbimiskulude eest (arvutusvõimsus, salvestus jne)

Kasuta `azd provision --preview`, et hinnata kulusid enne juurutamist.
</details>

## Järgmised sammud

1. **Lõpeta autentimine**: Veendu, et pääsed oma Azure'i tellimusele ligi
2. **Proovi oma esimest juurutust**: Järgi [Esimese projekti juhendit](first-project.md)
3. **Uuri malle**: Sirvi saadaval olevaid malle käsuga `azd template list`
4. **Seadista oma IDE**: Valmista oma arenduskeskkond ette

## Tugi

Kui sul tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Teata probleemidest](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure'i tugi](https://azure.microsoft.com/support/)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md) 
- **➡️ Järgmine**: [Sinu esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Paigaldus on lõpule viidud!** Jätka peatükiga [Sinu esimene projekt](first-project.md), et alustada azd-ga töötamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
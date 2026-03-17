# Paigaldus- ja seadistusjuhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Jooksev peatükk**: Peatükk 1 - Alus ja kiire alustamine
- **⬅️ Eelmine**: [AZD põhitõed](azd-basics.md)
- **➡️ Järgmine**: [Sinu esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellektil põhinev arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend juhendab sind Azure Developer CLI (azd) paigaldamisel ja seadistamisel sinu süsteemis. Õpid mitmeid paigaldusviise erinevatele operatsioonisüsteemidele, autentimise seadistamist ja esmaseid konfiguratsioone, et ette valmistada oma arenduskeskkond Azure’i juurutusteks.

## Õpieesmärgid

Selle tunni lõpuks suudad sa:
- Eduliselt paigaldada Azure Developer CLI oma operatsioonisüsteemile
- Seadistada autentimise Azure'iga mitme meetodi abil
- Seadistada oma arenduskeskkond vajalike eeltingimustega
- Mõista erinevaid paigaldusvõimalusi ja osata valida õige
- Lahendada levinumaid paigaldus- ja seadistusprobleeme

## Õpitulemused

Pärast selle tunni läbimist oskad sa:
- Paigaldada azd platvormile sobiva meetodiga
- Autentida Azure’iga kasutades azd auth login käsku
- Kontrollida paigaldust ning testida põhilisi azd käske
- Seadistada oma arenduskeskkond azd optimaalseks kasutamiseks
- Lahendada iseseisvalt levinud paigaldusprobleeme

See juhend aitab sul installida ja seadistada Azure Developer CLI oma süsteemis, olenemata operatsioonisüsteemist või arenduskeskkonnast.

## Eeltingimused

Enne azd installimist veendu, et sul on olemas:
- **Azure tellimus** - [Loo tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentimiseks ja ressursside haldamiseks
- **Git** - Mallide kloonimiseks ja versioonikontrolliks
- **Docker** (valikuline) - Konteineripõhiste rakenduste jaoks

## Paigaldusmeetodid

### Windows

#### Variant 1: PowerShell (soovitatav)
```powershell
# Käivita administraatorina või kõrgendatud õigustega
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Variant 2: Windowsi pakihaldur (winget)
```cmd
winget install Microsoft.Azd
```

#### Variant 3: Chocolatey
```cmd
choco install azd
```

#### Variant 4: Käsitsi paigaldamine
1. Laadi alla uusim versioon [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Paki lahti kausta `C:\Program Files\azd\`
3. Lisa PATH keskkonnamuutujasse

### macOS

#### Variant 1: Homebrew (soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Variant 2: Paigaldusskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Variant 3: Käsitsi paigaldamine
```bash
# Laadi alla ja paigalda
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Variant 1: Paigaldusskript (soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Variant 2: Pakihaldurid

**Ubuntu/Debian:**
```bash
# Lisa Microsofti pakettide hoidla
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Paigalda azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lisa Microsofti pakettide hoidla
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd on GitHub Codespaces eelinstalleeritud. Loo lihtsalt codespace ja alusta kohe azd kasutamist.

### Docker

```bash
# Käivitage azd konteineris
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Looge lihtsamaks kasutamiseks alias
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Paigalduse kontroll

Pärast paigaldust kontrolli, kas azd töötab korrektselt:

```bash
# Kontrolli versiooni
azd version

# Vaata abi
azd --help

# Loetle saadaolevad mallid
azd template list
```

Oodatud väljund:
```
azd version 1.x.x (commit xxxxxx)
```

**Märkus**: Tegelik versiooninumber võib erineda. Vaata [Azure Developer CLI väljalasked](https://github.com/Azure/azure-dev/releases) uusimat versiooni.

**✅ Paigalduse edukuse kontrollnimekiri:**
- [ ] käsk `azd version` näitab versiooninumbrit vigadeta
- [ ] käsk `azd --help` kuvab käsudokumentatsiooni
- [ ] käsk `azd template list` näitab saadaolevaid malle
- [ ] käsk `az account show` kuvab sinu Azure tellimuse
- [ ] saad luua testkausta ja edukalt käivitada `azd init`

**Kui kõik kontrollid läbitud, oled valmis minema edasi [Sinu esimene projekt](first-project.md)!**

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
Kui kasutad peata süsteemi või on brauseri probleemid:
```bash
az login --use-device-code
```

### Teenusepõhine autentimine (CI/CD)
Automatiseeritud keskkondades:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguratsioon

### Globaalne konfiguratsioon
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription <subscription-id>

# Määra vaikimisi asukoht
azd config set defaults.location eastus2

# Vaata kogu konfiguratsiooni
azd config list
```

### Keskkonnamuutujad
Lisa oma kestaprofiili (`.bashrc`, `.zshrc`, `.profile`):
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
2. Mine laienduste menüüsse (Ctrl+Shift+X)
3. Otsi "Azure Developer CLI"
4. Paigalda laiendus

Omadused:
- IntelliSense azure.yaml jaoks
- Integreeritud terminali käsud
- Mallide sirvimine
- Juurutuse jälgimine

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
1. Paigalda Azure plugin
2. Seadista Azure mandaadid
3. Kasuta integreeritud terminali azd käskude jaoks

## 🐛 Paigaldusprobleemide lahendamine

### Levinumad probleemid

#### Luba keelatud (Windows)
```powershell
# Käivita PowerShell administraatorina
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH probleemid
Lisa azd käsitsi oma PATHi:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Võrgu/proxy probleemid
```bash
# Konfigureeri proksi
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Jäta SSL-i kontroll vahele (ei soovitata tootmiskeskkonnas)
azd config set http.insecure true
```

#### Versioonikonfliktid
```bash
# Eemalda vanad paigaldused
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Puhasta konfiguratsioon
rm -rf ~/.azd
```

### Kuidas rohkem abi saada
```bash
# Luba silumislogimine
export AZD_DEBUG=true
azd <command> --debug

# Vaata praegust konfiguratsiooni
azd config list

# Vaata praegust juurutuse olekut
azd show
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
<summary><strong>Mis vahe on azd-l ja az CLI-l?</strong></summary>

**Azure CLI (az)**: Madalama taseme tööriist üksikute Azure ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Infrastruktuuri haldusele keskenduv

**Azure Developer CLI (azd)**: Kõrgetasemeline tööriist tervikrakenduste juurutamiseks
- `azd up` juurutab kogu rakenduse koos kõigi ressurssidega
- Mallipõhised töövood
- Arendaja tootlikkusele keskenduv

**Mõlemad on vajalikud**: azd kasutab autentimiseks az CLI-d
</details>

<details>
<summary><strong>Kas ma saan azd-d kasutada olemasolevate Azure ressurssidega?</strong></summary>

Jah! Sa võid:
1. Importida olemasolevad ressursid azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd-d uute juurutuste tegemiseks koos olemasoleva infrastruktuuriga

Vaata üksikasju vastavalt [Konfiguratsioonijuhendist](configuration.md).
</details>

<details>
<summary><strong>Kas azd töötab Azure Government või Azure China keskkondades?</strong></summary>

Jah, konfigureeri pilv:
```bash
# Azure valitsus
az cloud set --name AzureUSGovernment
az login

# Azure Hiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kas ma saan azd-d kasutada CI/CD torudes?</strong></summary>

Kindlasti! azd on loodud automatiseerimiseks:
- GitHub Actions integratsioon
- Azure DevOps tugi
- Teenusepõhine autentimine
- Mitteinteraktiivne režiim

Vaata CI/CD mustreid [Juurutusjuhendist](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kui palju maksab azd kasutamine?</strong></summary>

azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Sa maksad ainult:
- Azure ressursid, mida juurutad
- Azure kasutuskulud (arvutus, salvestus jne)

Kasutage `azd provision --preview`, et enne juurutust hinnata kulusid.
</details>

## Järgmised sammud

1. **Lõpeta autentimine**: Veendu, et pääsed ligi oma Azure tellimusele
2. **Proovi oma esimest juurutust**: Järgi [Esimese projekti juhendit](first-project.md)
3. **Uuri malle**: Sirvi saadaolevaid malle käsuga `azd template list`
4. **Seadista oma IDE**: Valmista ette arenduskeskkond

## Tugi

Kui tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Teata probleemidest](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure tugi](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Saa Azure käskude juhend otse oma redaktoris `npx skills add microsoft/github-copilot-for-azure` abil

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Jooksev peatükk**: Peatükk 1 - Alus ja kiire alustamine
- **⬅️ Eelmine**: [AZD põhitõed](azd-basics.md) 
- **➡️ Järgmine**: [Sinu esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellektil põhinev arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Paigaldus lõpetatud!** Jätka [Sinu esimese projektiga](first-project.md), et alustada azd-ga arendamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
Seda dokumenti on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
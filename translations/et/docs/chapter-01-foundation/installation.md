# Paigaldus- ja seadistusjuhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alus ja kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md)
- **➡️ Järgmine**: [Teie esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-Esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend juhendab teid Azure Developer CLI (azd) installimisel ja seadistamisel teie süsteemis. Õpite erinevaid installimismeetodeid erinevate operatsioonisüsteemide jaoks, autentimise seadistamist ning esialgset konfigureerimist, et valmistada oma arenduskeskkond ette Azure keskkonnas teha vajalikke juurutusi.

## Õpieesmärgid

Selle tunni lõpus oskate:
- Edukalt installida Azure Developer CLI oma opsüsteemi
- Seadistada Azure autentimist mitme erineva meetodiga
- Häälestada oma arenduskeskkond vajalike eeltingimustega
- Mõista erinevaid installimise võimalusi ja millal neid kasutada
- Lahendada tavalisi paigaldus- ja seadistusprobleeme

## Õpitulemused

Pärast selle tunni lõpetamist oskate:
- Installida azd sobiva meetodiga oma platvormil
- Autentida Azure'iga käsuga azd auth login
- Kontrollida oma installatsiooni ja testida põhilisi azd käske
- Häälestada oma arenduskeskkond optimaalseks azd kasutamiseks
- Iseseisvalt lahendada tavalisi paigaldusprobleeme

See juhend aitab teil installida ja konfigureerida Azure Developer CLI oma süsteemis, sõltumata teie operatsioonisüsteemist või arenduskeskkonnast.

## Eeltingimused

Enne azd installimist veenduge, et teil on:
- **Azure tellimus** - [Looge tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentimiseks ja ressursside haldamiseks
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Konteineripõhiste rakenduste jaoks

## Paigaldusmeetodid

### Windows

#### Variant 1: Windows Package Manager (Soovitatav)
```cmd
winget install microsoft.azd
```

#### Variant 2: PowerShelli paigaldusskript
```powershell
# Kasulik, kui winget pole saadaval
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Variant 3: Chocolatey
```cmd
choco install azd
```

#### Variant 4: Manuaalne paigaldus
1. Laadige alla uusim versioon lehelt [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakkige lahti kausta `C:\Program Files\azd\`
3. Lisage PATH keskkonnamuutujasse

### macOS

#### Variant 1: Homebrew (Soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Variant 2: Paigaldusskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Variant 3: Manuaalne paigaldus
```bash
# Laadi alla ja paigalda
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Variant 1: Paigaldusskript (Soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Variant 2: Paketihaldurid

**Manuaalne paigaldus vabastamise failidest:**
```bash
# Laadige alla uusim arhiiv oma Linuxi arhitektuuri jaoks aadressilt:
# https://github.com/Azure/azure-dev/releases
# Seejärel pakige see lahti ja lisage azd käivitatav fail oma PATH-i.
```

### GitHub Codespaces

Mõned Codespaces ja arenduskonteinerite keskkonnad sisaldavad juba `azd`, kuid kontrollige seda kindlasti ise:

```bash
azd version
```

Kui `azd` puudub, installige see vastava keskkonna standardse skripti abil.

### Docker

```bash
# Käivitage azd konteineris
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Looge lihtsama kasutamise jaoks alias
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kontrollige installatsiooni

Pärast paigaldamist kontrollige, et azd töötab korrektselt:

```bash
# Kontrolli versiooni
azd version

# Vaata abi
azd --help

# Kuva saadaval olevad mallid
azd template list
```

Oodatud väljund:
```
azd version 1.x.x (commit xxxxxx)
```

**Märkus**: Tegelik versiooninumber võib erineda. Vaadake [Azure Developer CLI vabastamiseid](https://github.com/Azure/azure-dev/releases) kõige uuema versiooni kohta.

**✅ Eduka paigaldamise kontrollnimekiri:**
- [ ] `azd version` kuvab versiooninumbri ilma vigadeta
- [ ] `azd --help` näitab käsu dokumentatsiooni
- [ ] `azd template list` kuvab saadaolevad mallid
- [ ] Saate luua testkataloogi ja edukalt käivitada `azd init`

**Kui kõik kontrollid on sooritatud, võite jätkata [Teie esimene projekt](first-project.md) juurde!**

## Autentimise seadistamine

### Soovitatav algaja seadistus

AZD-esimese töövoo jaoks logige sisse käsuga `azd auth login`.

```bash
# Vajalik AZD käskude jaoks nagu azd up
azd auth login

# Kontrolli AZD autentimise olekut
azd auth login --check-status
```

Kasutage Azure CLI sissekirjutumist ainult juhul, kui kavatsete kursuse ajal ise käivitada `az` käske.

### Azure CLI autentimine (valikuline)
```bash
# Paigalda Azure CLI, kui see pole veel paigaldatud
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: vaata Azure CLI paigaldusjuhiseid oma distributsiooni jaoks

# Logi sisse Azure'i
az login

# Kontrolli autentimist
az account show
```

### Millist sisselogimise meetodit peaksite kasutama?

- Kasutage `azd auth login`, kui järgite AZD algajate rada ja kasutate peamiselt `azd` käske.
- Kasutage ka `az login` kui kavatsete käivitada Azure CLI käske nagu `az account show` või uurida ressursse otse.
- Kui harjutus sisaldab nii `azd` kui `az` käske, logige mõlemaga sisse korra alguses.

### Seadmekoodi autentimine
Kui kasutate peata ja keskkonda või teil on brauseri tõrkeid:
```bash
azd auth login --use-device-code
```

### Teenusprotseduur (CI/CD)
Automaatsetes keskkondades:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Kontrollige oma täielikku seadistust

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
# Määra vaikimisi tellimus
azd config set defaults.subscription <subscription-id>

# Määra vaikimisi asukoht
azd config set defaults.location eastus2

# Vaata kogu konfiguratsiooni
azd config show
```

### Keskkonnamuutujad
Lisage oma shelli profiili (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguratsioon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguratsioon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Luba silumislogimine
```

## IDE integratsioon

### Visual Studio Code
Installige Azure Developer CLI laiendus:
1. Avage VS Code
2. Minge laiendustesse (Ctrl+Shift+X)
3. Otsige "Azure Developer CLI"
4. Installige laiendus

Funktsioonid:
- IntelliSense azure.yaml jaoks
- Integreeritud terminali käsud
- Mallide sirvimine
- Juhtimise jälgimine

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
1. Installige Azure plugin
2. Konfigureerige Azure mandaadid
3. Kasutage integreeritud terminali azd käskude jaoks

## 🐛 Paigaldusvigade tõrkeotsing

### Kõige levinumad probleemid

#### Luba keelatud (Windows)
```powershell
# Käivita PowerShell administraatorina
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

#### Võrgu / Proksiprobleemid
```bash
# Konfigureeri proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Jäta SSL kinnitamine vahele (ei soovitata tootmiskeskkonnas)
azd config set http.insecure true
```

#### Versioonikonfliktid
```bash
# Eemalda vanad installatsioonid
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: eemalda eelmine azd binaar või sümboolne link enne uuesti installimist

# Puhasta konfiguratsioon
rm -rf ~/.azd
```

### Rohkem abi saamine
```bash
# Luba silumise logimine
export AZD_DEBUG=true
azd <command> --debug

# Vaata praegust konfiguratsiooni
azd config show

# Vaata praegust juurutamise olekut
azd show
```

## azd uuendamine

### Uuenduse kontroll
azd annab märku, kui saadaval on uuem versioon, ning saate oma praeguse versiooni kontrollida käsuga:
```bash
azd version
```

### Manuaalsed uuendused

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
<summary><strong>Mis vahe on azd ja az CLI vahel?</strong></summary>

**Azure CLI (az)**: Madala taseme tööriist üksikute Azure ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Infrastruktuuri halduse fookus

**Azure Developer CLI (azd)**: Kõrgetasemeline tööriist täielike rakenduste juurutamiseks
- `azd up` juurutab kogu rakenduse koos kõigi ressurssidega
- Mallipõhised töövood
- Arendaja tootlikkuse fookus

**Mõlemat on vaja**: azd kasutab az CLI autentimiseks
</details>

<details>
<summary><strong>Kas ma saan azd kasutada olemasolevate Azure ressurssidega?</strong></summary>

Jah! Te saate:
1. Impordida olemasolevaid ressursse azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd uusi juurutusi koos olemasoleva infrastruktuuriga

Vaadake üksikasju [Konfiguratsiooni juhendist](configuration.md).
</details>

<details>
<summary><strong>Kas azd töötab Azure Governmenti või Azure Chinas?</strong></summary>

Jah, konfigureerige pilv:
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
<summary><strong>Kas saan azd kasutada CI/CD torudes?</strong></summary>

Absoluutselt! azd on loodud automatiseerimiseks:
- GitHub Actions integratsioon
- Azure DevOpsi tugi
- Teenusprotsendi autentimine
- Mitteilmnev režiim

Vaadake [Juurutamise juhendit](../chapter-04-infrastructure/deployment-guide.md) CI/CD mustrite kohta.
</details>

<details>
<summary><strong>Mis on azd kasutamise kulud?</strong></summary>

azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Maksate ainult:
- Juhtimisel kasutatavate Azure ressursside eest
- Azure tarbimiskulud (arvutus, salvestus jne)

Kasutage `azd provision --preview` kulude hindamiseks enne juurutust.
</details>

## Järgmised sammud

1. **Lõpetage autentimine**: Veenduge, et pääsete oma Azure tellimusele ligi
2. **Proovige oma esimest juurutust**: Järgige [Esimese projekti juhendit](first-project.md)
3. **Uurige malle**: Sirvige saadaolevaid malle käsuga `azd template list`
4. **Seadistage oma IDE**: Häälestage oma arenduskeskkond

## Tugiteenused

Kui teil tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Teatage vigadest](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure tugi](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Saage Azure käsu juhiseid otse oma redaktoris käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alus ja kiire algus
- **⬅️ Eelmine**: [AZD põhialused](azd-basics.md)
- **➡️ Järgmine**: [Teie esimene projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-Esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Paigaldus valmis!** Jätkake [Teie esimene projekt](first-project.md) juurde, et alustada azd-ga ehitamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
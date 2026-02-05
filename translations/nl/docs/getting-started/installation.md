# Installatie- en Configuratiehandleiding

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md)
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introductie

Deze uitgebreide handleiding begeleidt je bij het installeren en configureren van Azure Developer CLI (azd) op je systeem. Je leert verschillende installatiemethoden voor verschillende besturingssystemen, het instellen van authenticatie en de initiële configuratie om je ontwikkelomgeving voor te bereiden op Azure-implementaties.

## Leerdoelen

Aan het einde van deze les kun je:
- Azure Developer CLI succesvol installeren op je besturingssysteem
- Authenticatie met Azure configureren via meerdere methoden
- Je ontwikkelomgeving instellen met de benodigde vereisten
- Verschillende installatieopties begrijpen en weten wanneer je welke moet gebruiken
- Veelvoorkomende installatie- en configuratieproblemen oplossen

## Leerresultaten

Na het voltooien van deze les kun je:
- azd installeren met de juiste methode voor jouw platform
- Authenticeren met Azure via `azd auth login`
- Je installatie verifiëren en basis azd-commando's testen
- Je ontwikkelomgeving configureren voor optimaal gebruik van azd
- Veelvoorkomende installatieproblemen zelfstandig oplossen

Deze handleiding helpt je om Azure Developer CLI te installeren en configureren op je systeem, ongeacht je besturingssysteem of ontwikkelomgeving.

## Vereisten

Voordat je azd installeert, zorg ervoor dat je beschikt over:
- **Azure-abonnement** - [Maak een gratis account aan](https://azure.microsoft.com/free/)
- **Azure CLI** - Voor authenticatie en resourcebeheer
- **Git** - Voor het klonen van sjablonen en versiebeheer
- **Docker** (optioneel) - Voor gecontaineriseerde applicaties

## Installatiemethoden

### Windows

#### Optie 1: PowerShell (Aanbevolen)
```powershell
# Voer uit als Administrator of met verhoogde rechten
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Optie 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Optie 3: Chocolatey
```cmd
choco install azd
```

#### Optie 4: Handmatige Installatie
1. Download de nieuwste release van [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pak uit naar `C:\Program Files\azd\`
3. Voeg toe aan de PATH-omgevingsvariabele

### macOS

#### Optie 1: Homebrew (Aanbevolen)
```bash
brew tap azure/azd
brew install azd
```

#### Optie 2: Installatiescript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Optie 3: Handmatige Installatie
```bash
# Downloaden en installeren
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Optie 1: Installatiescript (Aanbevolen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Optie 2: Pakketbeheerders

**Ubuntu/Debian:**
```bash
# Voeg Microsoft-pakketrepository toe
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installeer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Voeg Microsoft-pakketrepository toe
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd is vooraf geïnstalleerd in GitHub Codespaces. Maak eenvoudig een codespace aan en begin direct met het gebruik van azd.

### Docker

```bash
# Voer azd uit in een container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Maak een alias voor eenvoudiger gebruik
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installatie Verifiëren

Na installatie, controleer of azd correct werkt:

```bash
# Controleer versie
azd version

# Bekijk hulp
azd --help

# Lijst beschikbare sjablonen
azd template list
```

Verwachte output:
```
azd version 1.5.0 (commit abc123)
```

**✅ Installatie Succes Checklist:**
- [ ] `azd version` toont het versienummer zonder fouten
- [ ] `azd --help` toont de commando-documentatie
- [ ] `azd template list` toont beschikbare sjablonen
- [ ] `az account show` toont je Azure-abonnement
- [ ] Je kunt een testmap maken en `azd init` succesvol uitvoeren

**Als alle controles slagen, ben je klaar om verder te gaan naar [Je Eerste Project](first-project.md)!**

## Authenticatie Instellen

### Azure CLI Authenticatie (Aanbevolen)
```bash
# Installeer Azure CLI als deze nog niet is geïnstalleerd
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Inloggen bij Azure
az login

# Verifieer authenticatie
az account show
```

### Authenticatie via Apparaatcode
Als je op een systeem zonder scherm werkt of browserproblemen hebt:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Voor geautomatiseerde omgevingen:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuratie

### Globale Configuratie
```bash
# Stel standaardabonnement in
azd config set defaults.subscription <subscription-id>

# Stel standaardlocatie in
azd config set defaults.location eastus2

# Bekijk alle configuratie
azd config list
```

### Omgevingsvariabelen
Voeg toe aan je shell-profiel (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuratie
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuratie
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debug-logboekregistratie inschakelen
```

## IDE Integratie

### Visual Studio Code
Installeer de Azure Developer CLI-extensie:
1. Open VS Code
2. Ga naar Extensies (Ctrl+Shift+X)
3. Zoek naar "Azure Developer CLI"
4. Installeer de extensie

Functies:
- IntelliSense voor azure.yaml
- Geïntegreerde terminalcommando's
- Sjabloonverkenning
- Implementatiemonitoring

### GitHub Codespaces
Maak een `.devcontainer/devcontainer.json`:
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
1. Installeer de Azure-plugin
2. Configureer Azure-credentials
3. Gebruik de geïntegreerde terminal voor azd-commando's

## 🐛 Problemen Oplossen bij Installatie

### Veelvoorkomende Problemen

#### Toegang Geweigerd (Windows)
```powershell
# Voer PowerShell uit als Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Problemen
Voeg azd handmatig toe aan je PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Netwerk-/Proxyproblemen
```bash
# Proxy configureren
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-verificatie overslaan (niet aanbevolen voor productie)
azd config set http.insecure true
```

#### Versieconflicten
```bash
# Verwijder oude installaties
# Windows: winget verwijder Microsoft.Azd
# macOS: brew verwijder azd
# Linux: sudo apt verwijder azd

# Schoon configuratie
rm -rf ~/.azd
```

### Meer Hulp Krijgen
```bash
# Debuglogboek inschakelen
export AZD_DEBUG=true
azd <command> --debug

# Gedetailleerde logboeken bekijken
azd logs

# Systeeminformatie controleren
azd info
```

## azd Bijwerken

### Automatische Updates
azd geeft een melding wanneer er updates beschikbaar zijn:
```bash
azd version --check-for-updates
```

### Handmatige Updates

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

## 💡 Veelgestelde Vragen

<details>
<summary><strong>Wat is het verschil tussen azd en az CLI?</strong></summary>

**Azure CLI (az)**: Laag-niveau tool voor het beheren van individuele Azure-resources
- `az webapp create`, `az storage account create`
- Eén resource tegelijk
- Focus op infrastructuurbeheer

**Azure Developer CLI (azd)**: Hoog-niveau tool voor complete applicatie-implementaties
- `azd up` implementeert een volledige app met alle resources
- Sjabloongebaseerde workflows
- Focus op ontwikkelaarsproductiviteit

**Je hebt beide nodig**: azd gebruikt az CLI voor authenticatie
</details>

<details>
<summary><strong>Kan ik azd gebruiken met bestaande Azure-resources?</strong></summary>

Ja! Je kunt:
1. Bestaande resources importeren in azd-omgevingen
2. Bestaande resources refereren in je Bicep-sjablonen
3. azd gebruiken voor nieuwe implementaties naast bestaande infrastructuur

Zie [Configuratiehandleiding](configuration.md) voor details.
</details>

<details>
<summary><strong>Werkt azd met Azure Government of Azure China?</strong></summary>

Ja, configureer de cloud:
```bash
# Azure Overheid
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan ik azd gebruiken in CI/CD-pijplijnen?</strong></summary>

Absoluut! azd is ontworpen voor automatisering:
- GitHub Actions-integratie
- Ondersteuning voor Azure DevOps
- Service principal authenticatie
- Niet-interactieve modus

Zie [Implementatiehandleiding](../deployment/deployment-guide.md) voor CI/CD-patronen.
</details>

<details>
<summary><strong>Wat kost het gebruik van azd?</strong></summary>

azd zelf is **volledig gratis** en open-source. Je betaalt alleen voor:
- Azure-resources die je implementeert
- Azure-gebruikskosten (compute, opslag, etc.)

Gebruik `azd provision --preview` om kosten te schatten vóór implementatie.
</details>

## Volgende Stappen

1. **Voltooi authenticatie**: Zorg ervoor dat je toegang hebt tot je Azure-abonnement
2. **Probeer je eerste implementatie**: Volg de [Eerste Project Handleiding](first-project.md)
3. **Verken sjablonen**: Blader door beschikbare sjablonen met `azd template list`
4. **Configureer je IDE**: Stel je ontwikkelomgeving in

## Ondersteuning

Als je problemen ondervindt:
- [Officiële Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Meld Problemen](https://github.com/Azure/azure-dev/issues)
- [Community Discussies](https://github.com/Azure/azure-dev/discussions)
- [Azure Ondersteuning](https://azure.microsoft.com/support/)

---

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md) 
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installatie Voltooid!** Ga verder naar [Je Eerste Project](first-project.md) om te beginnen met bouwen met azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
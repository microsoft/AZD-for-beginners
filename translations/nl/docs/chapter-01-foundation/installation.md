# Installatie & Setupgids

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basis](azd-basics.md)
- **➡️ Volgende**: [Je eerste project](first-project.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Inleiding

Deze uitgebreide gids leidt je door het installeren en configureren van Azure Developer CLI (azd) op je systeem. Je leert meerdere installatiemethoden voor verschillende besturingssystemen, het instellen van authenticatie en de initiële configuratie om je ontwikkelomgeving voor te bereiden op Azure-implementaties.

## Leerdoelen

Aan het einde van deze les zul je:
- Azure Developer CLI succesvol installeren op je besturingssysteem
- Authenticatie met Azure configureren met meerdere methoden
- Je ontwikkelomgeving inrichten met de benodigde vereisten
- Verschillende installatieroutes begrijpen en wanneer je welke moet gebruiken
- Veelvoorkomende installatie- en configuratieproblemen oplossen

## Leerresultaten

Na het voltooien van deze les kun je:
- azd installeren met de juiste methode voor jouw platform
- Authenticeren bij Azure met `azd auth login`
- Je installatie verifiëren en basis azd-commando's testen
- Je ontwikkelomgeving configureren voor optimaal azd-gebruik
- Veelvoorkomende installatieproblemen zelfstandig oplossen

Deze gids helpt je bij het installeren en configureren van Azure Developer CLI op je systeem, ongeacht je besturingssysteem of ontwikkelomgeving.

## Vereisten

Voordat je azd installeert, zorg dat je:
- **Azure-abonnement** - [Maak een gratis account aan](https://azure.microsoft.com/free/)
- **Azure CLI** - Voor authenticatie en resourcebeheer
- **Git** - Voor het klonen van sjablonen en versiebeheer
- **Docker** (optioneel) - Voor gecontaineriseerde applicaties

## Installatiemethoden

### Windows

#### Optie 1: PowerShell (Aanbevolen)
```powershell
# Voer uit als beheerder of met verhoogde rechten
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

#### Optie 4: Handmatige installatie
1. Download de laatste release van [GitHub](https://github.com/Azure/azure-dev/releases)
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

#### Optie 3: Handmatige installatie
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
# Voeg de Microsoft-pakketrepository toe
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

azd is vooraf geïnstalleerd in GitHub Codespaces. Maak gewoon een codespace aan en begin direct met azd.

### Docker

```bash
# Voer azd uit in een container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Maak een alias voor eenvoudiger gebruik
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Controleer installatie

Controleer na installatie of azd correct werkt:

```bash
# Controleer versie
azd version

# Bekijk hulp
azd --help

# Bekijk beschikbare sjablonen
azd template list
```

Verwachte uitvoer:
```
azd version 1.x.x (commit xxxxxx)
```

**Opmerking**: Het werkelijke versienummer kan variëren. Controleer [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) voor de nieuwste versie.

**✅ Checklist voor succesvolle installatie:**
- [ ] `azd version` toont versienummer zonder fouten
- [ ] `azd --help` geeft commando-documentatie weer
- [ ] `azd template list` toont beschikbare sjablonen
- [ ] `az account show` toont je Azure-abonnement
- [ ] Je kunt een testmap aanmaken en `azd init` met succes uitvoeren

**Als alle controles slagen, ben je klaar om door te gaan naar [Je eerste project](first-project.md)!**

## Authenticatie instellen

### Azure CLI-authenticatie (Aanbevolen)
```bash
# Installeer de Azure CLI als deze nog niet is geïnstalleerd
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Aanmelden bij Azure
az login

# Controleer de authenticatie
az account show
```

### Apparaatcode-authenticatie
Als je op een headless systeem werkt of problemen met de browser hebt:
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

### Globale configuratie
```bash
# Stel het standaardabonnement in
azd config set defaults.subscription <subscription-id>

# Stel de standaardlocatie in
azd config set defaults.location eastus2

# Bekijk alle configuratie-instellingen
azd config list
```

### Omgevingsvariabelen
Voeg toe aan je shell-profiel (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-configuratie
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-configuratie
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debuglogging inschakelen
```

## IDE-integratie

### Visual Studio Code
Installeer de Azure Developer CLI-extensie:
1. Open VS Code
2. Ga naar Extensies (Ctrl+Shift+X)
3. Zoek naar "Azure Developer CLI"
4. Installeer de extensie

Functies:
- IntelliSense voor azure.yaml
- Geïntegreerde terminalcommando's
- Bladeren door sjablonen
- Bewaking van implementaties

### GitHub Codespaces
Maak een `.devcontainer/devcontainer.json` aan:
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
1. Installeer de Azure-plug-in
2. Configureer Azure-referenties
3. Gebruik de geïntegreerde terminal voor azd-commando's

## 🐛 Problemen oplossen bij installatie

### Veelvoorkomende problemen

#### Toegang geweigerd (Windows)
```powershell
# Voer PowerShell uit als beheerder.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemen
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

#### Netwerk-/proxyproblemen
```bash
# Configureer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-verificatie overslaan (niet aanbevolen voor productie)
azd config set http.insecure true
```

#### Versieconflicten
```bash
# Verwijder oude installaties
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Configuratie opschonen
rm -rf ~/.azd
```

### Meer hulp krijgen
```bash
# Schakel debug-logging in
export AZD_DEBUG=true
azd <command> --debug

# Bekijk huidige configuratie
azd config list

# Bekijk huidige implementatiestatus
azd show
```

## azd bijwerken

### Automatische updates
azd zal je informeren wanneer updates beschikbaar zijn:
```bash
azd version --check-for-updates
```

### Handmatige updates

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

## 💡 Veelgestelde vragen

<details>
<summary><strong>Wat is het verschil tussen azd en az CLI?</strong></summary>

**Azure CLI (az)**: Laag-niveau tool voor het beheren van individuele Azure-resources
- `az webapp create`, `az storage account create`
- Eén resource per keer
- Focus op infrastructuurbeheer

**Azure Developer CLI (azd)**: Hoog-niveau tool voor volledige applicatie-implementaties
- `azd up` deployt de volledige app met alle resources
- Op sjablonen gebaseerde workflows
- Focus op ontwikkelaarproductiviteit

**Je hebt beide nodig**: azd gebruikt az CLI voor authenticatie
</details>

<details>
<summary><strong>Kan ik azd gebruiken met bestaande Azure-resources?</strong></summary>

Ja! Je kunt:
1. Bestaande resources importeren in azd-omgevingen
2. Bestaande resources refereren in je Bicep-sjablonen
3. azd gebruiken voor nieuwe implementaties naast bestaande infrastructuur

Zie de [Configuratiehandleiding](configuration.md) voor details.
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
- Integratie met GitHub Actions
- Ondersteuning voor Azure DevOps
- Authenticatie met service principal
- Niet-interactieve modus

Zie de [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md) voor CI/CD-patronen.
</details>

<details>
<summary><strong>Wat kost het gebruik van azd?</strong></summary>

azd zelf is **volledig gratis** en open-source. Je betaalt alleen voor:
- Azure-resources die je implementeert
- Azure-consumptiekosten (compute, opslag, enz.)

Gebruik `azd provision --preview` om kosten te schatten vóór implementatie.
</details>

## Volgende stappen

1. **Voltooi authenticatie**: Zorg dat je toegang hebt tot je Azure-abonnement
2. **Probeer je eerste implementatie**: Volg de [Handleiding voor het eerste project](first-project.md)
3. **Verken sjablonen**: Blader door beschikbare sjablonen met `azd template list`
4. **Configureer je IDE**: Stel je ontwikkelomgeving in

## Ondersteuning

Als je problemen tegenkomt:
- [Officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Meld problemen](https://github.com/Azure/azure-dev/issues)
- [Communitydiscussies](https://github.com/Azure/azure-dev/discussions)
- [Azure-ondersteuning](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Krijg Azure-commando-advies direct in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basis](azd-basics.md) 
- **➡️ Volgende**: [Je eerste project](first-project.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installatie voltooid!** Ga verder naar [Je eerste project](first-project.md) om te beginnen met bouwen met azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal dient als de gezaghebbende bron te worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Installatie- & Setupgids

**Hoofdstuknavigatie:**
- **📚 Cursusstartpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorig**: [AZD Basisprincipes](azd-basics.md)
- **➡️ Volgend**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Deze uitgebreide gids leidt je door het installeren en configureren van Azure Developer CLI (azd) op jouw systeem. Je leert meerdere installatiemethoden voor verschillende besturingssystemen, authenticatie-instellingen en initiële configuratie om je ontwikkelomgeving klaar te maken voor Azure-implementaties.

## Leerdoelen

Aan het einde van deze les zul je:
- Succesvol Azure Developer CLI op je besturingssysteem installeren
- Authenticatie met Azure configureren via meerdere methoden
- Je ontwikkelomgeving opzetten met de benodigde vereisten
- Verschillende installatie-opties begrijpen en weten wanneer je welke gebruikt
- Veelvoorkomende installatie- en setupproblemen oplossen

## Leerrendement

Na het voltooien van deze les kun je:
- azd installeren met de juiste methode voor jouw platform
- Authenticeren met Azure via azd auth login
- Je installatie verifiëren en basale azd-commando's testen
- Je ontwikkelomgeving configureren voor optimaal azd-gebruik
- Veelvoorkomende installatiefouten zelfstandig oplossen

Deze gids helpt je Azure Developer CLI te installeren en configureren, ongeacht je besturingssysteem of ontwikkelomgeving.

## Vereisten

Voordat je azd installeert, zorg dat je:
- **Azure-abonnement** - [Maak een gratis account aan](https://azure.microsoft.com/free/)
- **Azure CLI** (optioneel) - Voor voorbeelden die expliciet `az` draaien; azd authenticeert onafhankelijk
- **Git** - Voor het klonen van sjablonen en versiebeheer
- **Docker** (optioneel) - Voor gecontaineriseerde applicaties

## Installatiemethoden

### Windows

#### Optie 1: Windows Package Manager (Aanbevolen)
```cmd
winget install microsoft.azd
```

#### Optie 2: PowerShell Installatiescript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Optie 3: Chocolatey
```cmd
choco install azd
```

#### Optie 4: Handmatige Installatie
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

#### Optie 3: Handmatige Installatie
Download het archief voor jouw macOS-architectuur van [de release assets](https://github.com/Azure/azure-dev/releases), pak het uit en voeg de `azd` binary toe aan je `PATH`.

### Linux

#### Optie 1: Installatiescript (Aanbevolen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Optie 2: Package Managers

**Handmatige installatie vanuit release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Sommige Codespaces en dev container-omgevingen bevatten al `azd`, maar je moet dit verifiëren in plaats van ervan uitgaan:

```bash
azd version
```

Als `azd` ontbreekt, installeer het dan met het standaard script voor de omgeving.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Deze vluchtige container behoudt geen inlogstatus tussen uitvoeringen. Voor herhaalde implementaties gebruik je de [dev container setup](dev-containers.md); container builds vereisen ook een Docker daemon die van binnenuit de container toegankelijk is.

## ✅ Installatie Verifiëren

Verifieer na installatie dat azd correct werkt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Verwachte output:
```
azd version 1.x.x (commit xxxxxx)
```

**Opmerking**: Het werkelijke versienummer kan variëren. Controleer [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) voor de nieuwste versie.

**✅ Installatiesucces Checklijst:**
- [ ] `azd version` toont versienummer zonder fouten
- [ ] `azd --help` toont commando-documentatie
- [ ] `azd template list` toont beschikbare sjablonen
- [ ] Je kunt een testmap aanmaken en succesvol `azd init` uitvoeren

**Als alle controles lukken, ben je klaar om door te gaan naar [Je Eerste Project](first-project.md)!**

## Authenticatie Setup

### Aanbevolen Beginnersinstelling

Voor AZD-first workflows, log in met `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Gebruik Azure CLI-login alleen als je van plan bent zelf `az` commando's uit te voeren tijdens de cursus.

### Azure CLI Authenticatie (Optioneel)
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

### Welke Aanmeldingsmethode Moet Je Gebruiken?

- Gebruik `azd auth login` als je het beginnerstraject AZD volgt en vooral `azd` commando's draait.
- Gebruik ook `az login` wanneer je Azure CLI-commando's wilt uitvoeren zoals `az account show` of resources direct inspecteren.
- Als een oefening zowel `azd` als `az` commando's bevat, voer dan beide aanmeldcommando's één keer aan het begin uit.

### Device Code Authenticatie
Als je een headless systeem hebt of browserproblemen:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Voor geautomatiseerde omgevingen:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valideer Je Volledige Setup

Als je snel wil controleren of je klaar bent voordat je begint met Hoofdstuk 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuratie

### Globale Configuratie
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Omgevingsvariabelen
Voeg toe aan je shell-profiel (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
- Sjabloonbladeren
- Monitoring van implementaties

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
2. Configureer Azure-inloggegevens
3. Gebruik de geïntegreerde terminal voor azd-commando's

## 🐛 Problemen bij Installatie

### Veelvoorkomende Problemen

#### Toestemming geweigerd (Windows)
```powershell
# Run PowerShell as Administrator
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

#### Netwerk/Proxy-problemen
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versieconflicten
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Meer Hulp Krijgen
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## azd Bijwerken

### Updatecontrole
azd waarschuwt als een nieuwere release beschikbaar is, en je kunt je huidige build controleren met:
```bash
azd version
```

### Handmatige updates

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

## 💡 Veelgestelde Vragen

<details>
<summary><strong>Wat is het verschil tussen azd en az CLI?</strong></summary>

**Azure CLI (az)**: Laag-niveau tool voor het beheren van individuele Azure-resources
- `az webapp create`, `az storage account create`
- Eén resource per keer
- Focus op infrastructuurbeheer

**Azure Developer CLI (azd)**: Hoog-niveau tool voor complete applicatie-implementaties
- `azd up` zet hele app met alle resources uit
- Sjabloon-gebaseerde workflows
- Focus op ontwikkelaar-productiviteit

**Ze zijn onafhankelijk**: azd gebruikt standaard eigen authenticatie. Installeer en meld aan bij Azure CLI alleen voor `az` commando's, of kies expliciet voor `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan ik azd gebruiken met bestaande Azure-resources?</strong></summary>

Zeker! Je kunt:
1. Bestaande resources importeren in azd-omgevingen
2. Bestaande resources refereren in je Bicep-sjablonen
3. azd gebruiken voor nieuwe implementaties naast bestaande infrastructuur

Zie [Configuratiegids](../chapter-03-configuration/configuration.md) voor details.
</details>

<details>
<summary><strong>Werkt azd met Azure Government of Azure China?</strong></summary>

Ja, configureer de cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Als je ook Azure CLI gebruikt, configureer `az cloud set --name ...` apart. Sjabloondiensten en modelbeschikbaarheid verschillen per cloud.
</details>

<details>
<summary><strong>Kan ik azd gebruiken in CI/CD-pijplijnen?</strong></summary>

Absoluut! azd is ontworpen voor automatisering:
- GitHub Actions-integratie
- Azure DevOps-ondersteuning
- Service principal-authenticatie
- Niet-interactieve modus

Zie [Implementatiegids](../chapter-04-infrastructure/deployment-guide.md) voor CI/CD-patronen.
</details>

<details>
<summary><strong>Wat zijn de kosten voor het gebruik van azd?</strong></summary>

azd zelf is **volledig gratis** en open-source. Je betaalt alleen voor:
- Azure-resources die je uitrolt
- Azure verbruikskosten (compute, opslag, etc.)

Gebruik `azd provision --preview` om voorgestelde resources te inspecteren, en schat daarna de kosten met de [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/). Preview berekent geen prijzen.
</details>

## Volgende Stappen

1. **Voltooi authenticatie**: Zorg dat je toegang hebt tot je Azure-abonnement
2. **Probeer je eerste implementatie**: Volg de [Eerste Projectgids](first-project.md)
3. **Verken sjablonen**: Blader door beschikbare sjablonen met `azd template list`
4. **Configureer je IDE**: Zet je ontwikkelomgeving op

## Ondersteuning

Als je problemen tegenkomt:
- [Officiële Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Meld Problemen](https://github.com/Azure/azure-dev/issues)
- [Community Discussies](https://github.com/Azure/azure-dev/discussions)
- [Azure Ondersteuning](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Ontvang Azure-commandohulp direct in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuknavigatie:**
- **📚 Cursusstartpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorig**: [AZD Basisprincipes](azd-basics.md) 
- **➡️ Volgend**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installatie Voltooid!** Ga verder naar [Je Eerste Project](first-project.md) om te beginnen met bouwen met azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
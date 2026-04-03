# Installatie & Setupgids

**Chapter Navigation:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md)
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 2: AI-Eerst Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Deze uitgebreide gids leidt je door het installeren en configureren van Azure Developer CLI (azd) op je systeem. Je leert meerdere installatiemethoden voor verschillende besturingssystemen, het instellen van authenticatie en de initiële configuratie om je ontwikkelomgeving klaar te maken voor Azure-implementaties.

## Leerdoelen

Aan het einde van deze les zul je:
- Azure Developer CLI succesvol installeren op je besturingssysteem
- Authenticatie met Azure configureren met meerdere methoden
- Je ontwikkelomgeving instellen met de benodigde vereisten
- Verschillende installatiemogelijkheden begrijpen en weten wanneer je welke moet gebruiken
- Veelvoorkomende installatie- en configuratieproblemen oplossen

## Resultaten

Na het voltooien van deze les kun je:
- azd installeren met de juiste methode voor je platform
- Authenticeren met Azure met `azd auth login`
- Je installatie verifiëren en basis azd-commando's testen
- Je ontwikkelomgeving configureren voor optimaal azd-gebruik
- Veelvoorkomende installatieproblemen zelfstandig oplossen

Deze gids helpt je azd te installeren en configureren op je systeem, ongeacht je besturingssysteem of ontwikkelomgeving.

## Vereisten

Voordat je azd installeert, zorg dat je:
- **Azure-abonnement** - [Maak een gratis account](https://azure.microsoft.com/free/)
- **Azure CLI** - Voor authenticatie en resourcebeheer
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
# Handig wanneer winget niet beschikbaar is
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Optie 3: Chocolatey
```cmd
choco install azd
```

#### Optie 4: Handmatige installatie
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

**Handmatige installatie vanuit release-assets:**
```bash
# Download het nieuwste archief voor uw Linux-architectuur van:
# https://github.com/Azure/azure-dev/releases
# Pak het daarna uit en voeg het uitvoerbare bestand azd toe aan uw PATH.
```

### GitHub Codespaces

Sommige Codespaces en dev container-omgevingen bevatten al `azd`, maar je moet dat verifiëren in plaats van het aan te nemen:

```bash
azd version
```

Als `azd` ontbreekt, installeer het dan met het standaardscript voor de omgeving.

### Docker

```bash
# Voer azd uit in een container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Maak een alias voor gemakkelijker gebruik
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Controleer installatie

Controleer na installatie of azd correct werkt:

```bash
# Controleer versie
azd version

# Bekijk hulp
azd --help

# Toon beschikbare sjablonen
azd template list
```

Verwachte uitvoer:
```
azd version 1.x.x (commit xxxxxx)
```

**Opmerking**: Het daadwerkelijke versienummer zal variëren. Controleer [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) voor de nieuwste versie.

**✅ Installatie Succes-Checklist:**
- [ ] `azd version` toont versienummer zonder fouten
- [ ] `azd --help` toont commando-documentatie
- [ ] `azd template list` toont beschikbare sjablonen
- [ ] Je kunt een testmap maken en `azd init` succesvol uitvoeren

**Als alle controles slagen, ben je klaar om door te gaan naar [Je Eerste Project](first-project.md)!**

## Authenticatie instellen

### Aanbevolen beginnersconfiguratie

Voor AZD-first workflows, log in met `azd auth login`.

```bash
# Vereist voor AZD-commando's zoals azd up
azd auth login

# Controleer de AZD-authenticatiestatus
azd auth login --check-status
```

Gebruik Azure CLI-aanmelding alleen wanneer je van plan bent zelf `az`-commando's uit te voeren tijdens de cursus.

### Azure CLI-authenticatie (optioneel)
```bash
# Installeer de Azure CLI als deze nog niet is geïnstalleerd
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: zie de installatiehandleiding van de Azure CLI voor uw distributie

# Meld u aan bij Azure
az login

# Controleer de authenticatie
az account show
```

### Welk aanmeldingsproces moet je gebruiken?

- Gebruik `azd auth login` als je het beginnerstraject met AZD volgt en voornamelijk `azd`-commando's uitvoert.
- Gebruik `az login` wanneer je ook Azure CLI-commando's wilt uitvoeren zoals `az account show` of resources direct wilt inspecteren.
- Als een oefening zowel `azd` als `az`-commando's bevat, voer dan beide aanmeldingscommando's één keer aan het begin uit.

### Device Code-authenticatie
Als je op een headless systeem zit of problemen met de browser hebt:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Voor geautomatiseerde omgevingen:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valideer je volledige configuratie

Als je een snelle gereedheidscheck wilt voordat je aan Hoofdstuk 1 begint:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuratie

### Globale configuratie
```bash
# Stel standaardabonnement in
azd config set defaults.subscription <subscription-id>

# Stel standaardlocatie in
azd config set defaults.location eastus2

# Bekijk de volledige configuratie
azd config show
```

### Omgevingsvariabelen
Voeg toe aan je shellprofiel (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-configuratie
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-configuratie
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Schakel debuglogging in
```

## IDE-integratie

### Visual Studio Code
Installeer de Azure Developer CLI-extensie:
1. Open VS Code
2. Ga naar Extensies (Ctrl+Shift+X)
3. Zoek naar "Azure Developer CLI"
4. Installeer de extensie

Functionaliteiten:
- IntelliSense voor azure.yaml
- Geïntegreerde terminalcommando's
- Sjabloonverkenning
- Deployments bewaken

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
1. Installeer de Azure-plugin
2. Configureer Azure-referenties
3. Gebruik de geïntegreerde terminal voor azd-commando's

## 🐛 Problemen oplossen bij installatie

### Veelvoorkomende problemen

#### Toegang geweigerd (Windows)
```powershell
# Voer PowerShell uit als beheerder
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
# Proxy configureren
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-verificatie overslaan (niet aanbevolen voor productie)
azd config set http.insecure true
```

#### Versieconflicten
```bash
# Verwijder oude installaties
# Windows: voer uit 'winget uninstall microsoft.azd'
# macOS: voer uit 'brew uninstall azd'
# Linux: verwijder de vorige azd-binaire of symbolische link voordat u opnieuw installeert

# Configuratie opschonen
rm -rf ~/.azd
```

### Meer hulp krijgen
```bash
# Schakel debug-logging in
export AZD_DEBUG=true
azd <command> --debug

# Bekijk huidige configuratie
azd config show

# Bekijk huidige implementatiestatus
azd show
```

## azd bijwerken

### Updatecontrole
azd waarschuwt wanneer er een nieuwere release beschikbaar is, en je kunt je huidige build controleren met:
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

## 💡 Veelgestelde vragen

<details>
<summary><strong>Wat is het verschil tussen azd en az CLI?</strong></summary>

**Azure CLI (az)**: Laag-niveau tool voor het beheren van individuele Azure-resources
- `az webapp create`, `az storage account create`
- Eén resource tegelijk
- Gericht op infrastructuurbeheer

**Azure Developer CLI (azd)**: Hoog-niveau tool voor volledige applicatie-implementaties
- `azd up` implementeert de volledige app met alle resources
- Sjabloon-gebaseerde workflows
- Gericht op ontwikkelaarproductiviteit

**Je hebt beide nodig**: azd gebruikt az CLI voor authenticatie
</details>

<details>
<summary><strong>Kan ik azd gebruiken met bestaande Azure-resources?</strong></summary>

Ja! Je kunt:
1. Bestaande resources importeren in azd-omgevingen
2. Bestaande resources refereren in je Bicep-sjablonen
3. azd gebruiken voor nieuwe deployments naast bestaande infrastructuur

Zie [Configuratiegids](configuration.md) voor details.
</details>

<details>
<summary><strong>Werkt azd met Azure Government of Azure China?</strong></summary>

Ja, configureer de cloud:
```bash
# Azure overheid
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

Zie [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md) voor CI/CD-patronen.
</details>

<details>
<summary><strong>Wat kost het gebruik van azd?</strong></summary>

azd zelf is **volledig gratis** en open-source. Je betaalt alleen voor:
- Azure-resources die je implementeert
- Azure-verbruikskosten (compute, opslag, enz.)

Gebruik `azd provision --preview` om kosten te schatten voor de implementatie.
</details>

## Volgende stappen

1. **Voltooi de authenticatie**: Zorg dat je toegang hebt tot je Azure-abonnement
2. **Probeer je eerste deployment**: Volg de [Eerste Projectgids](first-project.md)
3. **Verken sjablonen**: Blader door beschikbare sjablonen met `azd template list`
4. **Configureer je IDE**: Stel je ontwikkelomgeving in

## Ondersteuning

Als je problemen tegenkomt:
- [Officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Meld problemen](https://github.com/Azure/azure-dev/issues)
- [Community Discussies](https://github.com/Azure/azure-dev/discussions)
- [Azure-ondersteuning](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Krijg Azure-commando begeleiding direct in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md) 
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 2: AI-Eerst Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installatie voltooid!** Ga door naar [Je Eerste Project](first-project.md) om te beginnen met bouwen met azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, moet u er rekening mee houden dat automatische vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
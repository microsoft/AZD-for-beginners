# Installations- och uppsättningsguide

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [Grundläggande AZD](azd-basics.md)
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande guide visar hur du installerar och konfigurerar Azure Developer CLI (azd) på ditt system. Du lär dig flera installationsmetoder för olika operativsystem, autentiseringsinställningar och initial konfiguration för att förbereda din utvecklingsmiljö för Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Framgångsrikt installera Azure Developer CLI på ditt operativsystem
- Konfigurera autentisering med Azure via flera metoder
- Ställa in din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när varje ska användas
- Felsöka vanliga installations- och uppsättningsproblem

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Installera azd med lämplig metod för din plattform
- Autentisera med Azure med azd auth login
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Självständigt lösa vanliga installationsproblem

Denna guide hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, säkerställ att du har:
- **Azure-prenumeration** - [Skapa ett gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valfritt) - För exempel som uttryckligen kör `az`; azd autentiserar självständigt
- **Git** - För att klona mallar och versionskontroll
- **Docker** (valfritt) - För containeriserade applikationer

**Kapitel 2 Foundry GA-stig:** Använd AZD **1.37.0 eller senare**, installera paketet med `azd ext install microsoft.foundry`, och använd Python **3.13+** och aktuell **uv** för hosted-agent-exemplet. Dess koddistributionsläge bygger fjärran, så lokal Docker-build krävs inte. Foundry-behörigheter, regional tillgång till modeller och kvot krävs fortfarande; se [hosted-agent-uppsättning](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Installationsmetoder

### Windows

#### Alternativ 1: Windows Package Manager (Rekommenderat)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell installationsskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell installation
1. Ladda ner senaste releasen från [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrahera till `C:\Program Files\azd\`
3. Lägg till i PATH-miljövariabeln

### macOS

#### Alternativ 1: Homebrew (Rekommenderat)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installationsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell installation
Ladda ner arkivet för din macOS-arkitektur från [release assets](https://github.com/Azure/azure-dev/releases), extrahera det, och lägg till `azd` binärfilen i din `PATH`.

### Linux

#### Alternativ 1: Installationsskript (Rekommenderat)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Paketchefer

**Manuell installation från release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Vissa Codespaces och utvecklingscontainer-miljöer inkluderar redan `azd`, men du bör verifiera det snarare än att anta det:

```bash
azd version
```

Om `azd` saknas, installera det med standardinstallationsskriptet för miljön.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Denna tillfälliga container bevarar inte inloggningsstatus mellan körningar. För upprepade distributioner, använd [dev container setup](dev-containers.md); containerbyggen kräver också en Docker-daemon som är tillgänglig från insidan av containern.

## ✅ Verifiera installation

Efter installation, verifiera att azd fungerar korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Förväntat utdata:
```
azd version 1.x.x (commit xxxxxx)
```

**Notera**: Den faktiska versionsnumret kan variera. Kontrollera [Azure Developer CLI releaser](https://github.com/Azure/azure-dev/releases) för den senaste versionen.

**✅ Checklista för lyckad installation:**
- [ ] `azd version` visar versionsnummer utan fel
- [ ] `azd --help` visar kommandodokumentation
- [ ] `azd template list` visar tillgängliga mallar
- [ ] Du kan skapa en testkatalog och köra `azd init` framgångsrikt

**Om alla kontroller passerar är du redo att fortsätta till [Ditt första projekt](first-project.md)!**

## Autentiseringsinställning

### Rekommenderad nybörjarinställning

För AZD-först arbetsflöden, logga in med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Använd Azure CLI-inloggning endast när du planerar att köra `az`-kommandon själv under kursen.

### Azure CLI-autentisering (valfritt)
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

### Vilket inloggningsflöde bör du använda?

- Använd `azd auth login` om du följer nybörjarstegen för AZD och huvudsakligen kör `azd`-kommandon.
- Använd också `az login` när du vill köra Azure CLI-kommandon som `az account show` eller inspektera resurser direkt.
- Om en övning inkluderar både `azd` och `az`-kommandon, kör båda inloggningskommandon en gång i början.

### Enhetskodautentisering
Om du är på ett headless-system eller har webbläsarproblem:
```bash
azd auth login --use-device-code
```

### Tjänsthuvudman (CI/CD)
För automatiserade miljöer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validera din kompletta uppsättning

Om du vill göra en snabb kontroll av beredskap innan du påbörjar Kapitel 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguration

### Global konfiguration
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Miljövariabler
Lägg till i din shellprofil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE-integration

### Visual Studio Code
Installera Azure Developer CLI-tillägget:
1. Öppna VS Code
2. Gå till Tillägg (Ctrl+Shift+X)
3. Sök efter "Azure Developer CLI"
4. Installera tillägget

Funktioner:
- IntelliSense för azure.yaml
- Integrerade terminalkommandon
- Mallbläddring
- Övervakning av distributioner

### GitHub Codespaces
Skapa en `.devcontainer/devcontainer.json`:
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
1. Installera Azure-plugin
2. Konfigurera Azure-behörigheter
3. Använd integrerad terminal för azd-kommandon

## 🐛 Felsökning av installation

### Vanliga problem

#### Åtkomst nekad (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problem
Lägg manuellt till azd i din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nätverks-/proxyproblem
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versionskonflikter
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Få mer hjälp
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Uppdatera azd

### Kontrollera uppdatering
azd varnar när en nyare release finns, och du kan kontrollera din aktuella version med:
```bash
azd version
```

### Manuella uppdateringar

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

## 💡 Vanliga frågor

<details>
<summary><strong>Vad är skillnaden mellan azd och az CLI?</strong></summary>

**Azure CLI (az)**: Låg nivå-verktyg för att hantera enskilda Azure-resurser
- `az webapp create`, `az storage account create`
- En resurs åt gången
- Infrastrukturhanteringsfokus

**Azure Developer CLI (azd)**: Hög nivå-verktyg för kompletta applikationsdistributioner
- `azd up` distribuerar hela appen med alla resurser
- Mallbaserade arbetsflöden
- Fokus på utvecklarproduktivitet

**De är oberoende**: azd använder egen autentisering som standard. Installera och logga in i Azure CLI endast för `az`-kommandon, eller välj explicit att använda `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan jag använda azd med befintliga Azure-resurser?</strong></summary>

Ja! Du kan:
1. Importera befintliga resurser till azd-miljöer
2. Referera befintliga resurser i dina Bicep-mallar
3. Använda azd för nya distributioner tillsammans med befintlig infrastruktur

Se [Konfigurationsguide](../chapter-03-configuration/configuration.md) för detaljer.
</details>

<details>
<summary><strong>Fungerar azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurera molnet:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Om du även använder Azure CLI, konfigurera `az cloud set --name ...` separat. Malltjänster och modelltillgång varierar beroende på molnet.
</details>

<details>
<summary><strong>Kan jag använda azd i CI/CD-pipelines?</strong></summary>

Absolut! azd är designat för automation:
- GitHub Actions-integration
- Azure DevOps-stöd
- Tjänsthuvudman-autentisering
- Icke-interaktivt läge

Se [Deploymentsguide](../chapter-04-infrastructure/deployment-guide.md) för CI/CD-mönster.
</details>

<details>
<summary><strong>Vad kostar det att använda azd?</strong></summary>

azd själv är **helt gratis** och öppen källkod. Du betalar endast för:
- Azure-resurser du distribuerar
- Azure-kostnader för konsumtion (beräkning, lagring osv.)

Använd `azd provision --preview` för att inspektera föreslagna resurser, och beräkna deras kostnader med [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Förhandsgranskning räknar inte priser.
</details>

## Nästa steg

1. **Slutför autentisering**: Säkerställ att du får åtkomst till din Azure-prenumeration
2. **Prova din första distribution**: Följ [Guiden för första projektet](first-project.md)
3. **Utforska mallar**: Bläddra bland tillgängliga mallar med `azd template list`
4. **Konfigurera ditt IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera problem](https://github.com/Azure/azure-dev/issues)
- [Communitydiskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovägledning direkt i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [Grundläggande AZD](azd-basics.md) 
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation klar!** Fortsätt till [Ditt första projekt](first-project.md) för att börja bygga med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
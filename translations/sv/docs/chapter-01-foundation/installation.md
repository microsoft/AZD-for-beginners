# Installations- och installationsguide

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grundläggande & Kom igång snabbt
- **⬅️ Föregående**: [AZD Grunder](azd-basics.md)
- **➡️ Nästa**: [Ditt Första Projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande guide leder dig genom installation och konfiguration av Azure Developer CLI (azd) på ditt system. Du kommer lära dig flera installationsmetoder för olika operativsystem, autentiseringsinställningar och initial konfiguration för att förbereda din utvecklingsmiljö för Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du:
- Framgångsrikt installera Azure Developer CLI på ditt operativsystem
- Konfigurera autentisering med Azure med flera metoder
- Ställa in din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när man ska använda varje
- Felsöka vanliga installations- och uppstartsproblem

## Läranderesultat

Efter att ha slutfört denna lektion kommer du kunna:
- Installera azd med rätt metod för din plattform
- Autentisera med Azure genom azd auth login
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Självständigt lösa vanliga installationsproblem

Denna guide hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, se till att du har:
- **Azure-prenumeration** - [Skapa ett gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valfritt) - För exempel som uttryckligen kör `az`; azd autentiserar oberoende
- **Git** - För att klona mallar och versionshantering
- **Docker** (valfritt) - För containeriserade applikationer

## Installationsmetoder

### Windows

#### Alternativ 1: Windows Package Manager (Rekommenderat)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell Installationsskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell Installation
1. Ladda ner den senaste versionen från [GitHub](https://github.com/Azure/azure-dev/releases)
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

#### Alternativ 3: Manuell Installation
Ladda ner arkivet för din macOS-arkitektur från [release assets](https://github.com/Azure/azure-dev/releases), extrahera det och lägg till `azd`-binären i din `PATH`.

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

Vissa Codespaces och utvecklingscontainer-miljöer inkluderar redan `azd`, men du bör verifiera det istället för att anta:

```bash
azd version
```

Om `azd` saknas, installera det med standard-skriptet för miljön.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Denna tillfälliga container bevarar inte inloggningsstatus mellan körningar. För upprepade distributioner, använd [dev container setup](dev-containers.md); container-byggnader kräver också en Docker-daemon som är åtkomlig från insidan av containern.

## ✅ Verifiera installationen

Efter installationen, verifiera att azd fungerar korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Förväntad utdata:
```
azd version 1.x.x (commit xxxxxx)
```

**Notera**: Den faktiska versionsnumret kommer att variera. Kontrollera [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) för den senaste versionen.

**✅ Checklista för lyckad installation:**
- [ ] `azd version` visar versionsnummer utan fel
- [ ] `azd --help` visar kommandodokumentation
- [ ] `azd template list` visar tillgängliga mallar
- [ ] Du kan skapa en testkatalog och köra `azd init` framgångsrikt

**Om alla kontroller är godkända är du redo att gå vidare till [Ditt Första Projekt](first-project.md)!**

## Autentiseringsinställning

### Rekommenderad nybörjarinställning

För AZD-först arbetsflöden, logga in med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Använd bara Azure CLI-inloggning när du planerar att själv köra `az`-kommandon under kursen.

### Autentisering med Azure CLI (Valfritt)
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

### Vilket inloggningssätt ska du använda?

- Använd `azd auth login` om du följer nybörjarspåret med AZD och främst kör `azd`-kommandon.
- Använd även `az login` när du vill köra Azure CLI-kommandon som `az account show` eller inspektera resurser direkt.
- Om en övning innehåller både `azd` och `az` kommandon, kör båda inloggningskommandona en gång i början.

### Autentisering med enhetskod
Om du är på ett system utan skärm eller har problem med webbläsare:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
För automatiserade miljöer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validera din kompletta konfiguration

Om du vill göra en snabb kontroll av beredskap innan du börjar Kapitel 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguration

### Global Konfiguration
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
Installera Azure Developer CLI extension:
1. Öppna VS Code
2. Gå till Extensions (Ctrl+Shift+X)
3. Sök efter "Azure Developer CLI"
4. Installera extensionen

Funktioner:
- IntelliSense för azure.yaml
- Integrerade terminalkommandon
- Mallbläddring
- Övervakning av distribution

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
1. Installera Azure-pluginet
2. Konfigurera Azure-uppgifter
3. Använd integrerad terminal för azd-kommandon

## 🐛 Felsöka installationen

### Vanliga problem

#### Behörighet nekad (Windows)
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

#### Nätverks-/Proxy-problem
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
azd varnar när en nyare version finns tillgänglig, och du kan bekräfta din nuvarande version med:
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

**Azure CLI (az)**: Verktyg på låg nivå för hantering av individuella Azure-resurser
- `az webapp create`, `az storage account create`
- En resurs åt gången
- Fokus på infrastrukturhantering

**Azure Developer CLI (azd)**: Verktyg på hög nivå för kompletta applikationsdistributioner
- `azd up` distribuerar hela appen med alla resurser
- Mallbaserade arbetsflöden
- Fokus på utvecklarproduktivitet

**De är oberoende**: azd använder egen autentisering som standard. Installera och logga in på Azure CLI bara för `az`-kommandon, eller välj uttryckligen `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan jag använda azd med befintliga Azure-resurser?</strong></summary>

Ja! Du kan:
1. Importera befintliga resurser till azd-miljöer
2. Referera till befintliga resurser i dina Bicep-mallar
3. Använda azd för nya distributioner parallellt med befintlig infrastruktur

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

Om du också använder Azure CLI, konfigurera `az cloud set --name ...` separat. Malltjänster och modelltillgänglighet varierar beroende på moln.
</details>

<details>
<summary><strong>Kan jag använda azd i CI/CD-pipelines?</strong></summary>

Absolut! azd är designat för automation:
- GitHub Actions-integration
- Azure DevOps-stöd
- Service principal-autentisering
- Icke-interaktivt läge

Se [Deploymentsguide](../chapter-04-infrastructure/deployment-guide.md) för CI/CD-mönster.
</details>

<details>
<summary><strong>Vad kostar det att använda azd?</strong></summary>

Själva azd är **helt gratis** och öppen källkod. Du betalar endast för:
- Azure-resurser du distribuerar
- Azure-kostnader för förbrukning (compute, lagring, etc.)

Använd `azd provision --preview` för att inspektera föreslagna resurser och uppskatta deras kostnader med [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Förhandsgranskning beräknar inte priser.
</details>

## Nästa steg

1. **Slutför autentisering**: Se till att du kan nå din Azure-prenumeration
2. **Prova din första distribution**: Följ [Första Projekt-guiden](first-project.md)
3. **Utforska mallar**: Bläddra bland tillgängliga mallar med `azd template list`
4. **Konfigurera din IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera problem](https://github.com/Azure/azure-dev/issues)
- [Community-diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få vägledning för Azure-kommandon direkt i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grundläggande & Kom igång snabbt
- **⬅️ Föregående**: [AZD Grunder](azd-basics.md) 
- **➡️ Nästa**: [Ditt Första Projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation klar!** Fortsätt till [Ditt Första Projekt](first-project.md) för att börja bygga med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
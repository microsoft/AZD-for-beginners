# Installations- & konfigurationsguide

**Kapitelnavigering:**
- **📚 Kursstartsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [AZD Basics](azd-basics.md)
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande guide leder dig genom installation och konfiguration av Azure Developer CLI (azd) på ditt system. Du lär dig flera installationsmetoder för olika operativsystem, autentiseringsinställningar och initial konfigurering för att förbereda din utvecklingsmiljö för Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Installera Azure Developer CLI framgångsrikt på ditt operativsystem
- Konfigurera autentisering med Azure med flera metoder
- Ställa in din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när du ska använda varje
- Felsöka vanliga installations- och uppsättningsproblem

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Installera azd med lämplig metod för din plattform
- Autentisera med Azure med `azd auth login`
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Lösa vanliga installationsproblem på egen hand

Denna guide hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, säkerställ att du har:
- **Azure subscription** - [Skapa ett gratiskonto](https://azure.microsoft.com/free/)
- **Azure CLI** - För autentisering och resurshantering
- **Git** - För kloning av mallar och versionshantering
- **Docker** (valfritt) - För containeriserade applikationer

## Installationsmetoder

### Windows

#### Alternativ 1: PowerShell (Rekommenderas)
```powershell
# Kör som administratör eller med förhöjda behörigheter
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
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

#### Alternativ 1: Homebrew (Rekommenderas)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installationsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell installation
```bash
# Ladda ner och installera
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installationsskript (Rekommenderas)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Paketchefer

**Ubuntu/Debian:**
```bash
# Lägg till Microsofts paketförråd
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installera azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lägg till Microsofts paketförråd
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd är förinstallerat i GitHub Codespaces. Skapa bara en codespace och börja använda azd omedelbart.

### Docker

```bash
# Kör azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Skapa ett alias för enklare användning
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiera installation

Efter installationen, verifiera att azd fungerar korrekt:

```bash
# Kontrollera versionen
azd version

# Visa hjälp
azd --help

# Lista tillgängliga mallar
azd template list
```

Förväntad utdata:
```
azd version 1.x.x (commit xxxxxx)
```

**Obs**: Det faktiska versionsnumret kommer att variera. Kontrollera [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) för den senaste versionen.

**✅ Checklista för lyckad installation:**
- [ ] `azd version` visar versionsnummer utan fel
- [ ] `azd --help` visar kommandodokumentation
- [ ] `azd template list` visar tillgängliga mallar
- [ ] `az account show` visar ditt Azure-abonnemang
- [ ] Du kan skapa en testkatalog och köra `azd init` framgångsrikt

**Om alla kontroller godkänns, är du redo att gå vidare till [Ditt första projekt](first-project.md)!**

## Autentisering

### Azure CLI-autentisering (Rekommenderas)
```bash
# Installera Azure CLI om det inte redan är installerat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logga in på Azure
az login

# Verifiera autentisering
az account show
```

### Enhetskod-autentisering
Om du använder ett headless-system eller har problem med webbläsaren:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
För automatiserade miljöer:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguration

### Global konfiguration
```bash
# Ställ in standardprenumeration
azd config set defaults.subscription <subscription-id>

# Ställ in standardplats
azd config set defaults.location eastus2

# Visa hela konfigurationen
azd config list
```

### Miljövariabler
Lägg till i din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktivera felsökningsloggning
```

## IDE-integration

### Visual Studio Code
Installera Azure Developer CLI-tillägget:
1. Öppna VS Code
2. Gå till Extensions (Ctrl+Shift+X)
3. Sök efter "Azure Developer CLI"
4. Installera tillägget

Funktioner:
- IntelliSense för azure.yaml
- Integrerade terminalkommandon
- Bläddring bland mallar
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
1. Installera Azure-pluginet
2. Konfigurera Azure-referenser
3. Använd integrerad terminal för azd-kommandon

## 🐛 Felsökning av installation

### Vanliga problem

#### Åtkomst nekad (Windows)
```powershell
# Kör PowerShell som administratör
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
# Konfigurera proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hoppa över SSL-verifiering (rekommenderas inte i produktionsmiljö)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Ta bort gamla installationer
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Rensa konfigurationen
rm -rf ~/.azd
```

### Få mer hjälp
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd <command> --debug

# Visa aktuell konfiguration
azd config list

# Visa aktuell driftsättningsstatus
azd show
```

## Uppdatera azd

### Automatiska uppdateringar
azd meddelar dig när uppdateringar är tillgängliga:
```bash
azd version --check-for-updates
```

### Manuella uppdateringar

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

## 💡 Vanliga frågor

<details>
<summary><strong>Vad är skillnaden mellan azd och az CLI?</strong></summary>

**Azure CLI (az)**: Ett låg-nivåverktyg för att hantera enskilda Azure-resurser
- `az webapp create`, `az storage account create`
- En resurs åt gången
- Fokus på infrastrukturhantering

**Azure Developer CLI (azd)**: Ett verktyg på högre nivå för kompletta applikationsdistributioner
- `azd up` distribuerar hela appen med alla resurser
- Mallbaserade arbetsflöden
- Fokus på utvecklarproduktivitet

**Du behöver båda**: azd använder az CLI för autentisering
</details>

<details>
<summary><strong>Kan jag använda azd med befintliga Azure-resurser?</strong></summary>

Ja! Du kan:
1. Importera befintliga resurser till azd-miljöer
2. Referera befintliga resurser i dina Bicep-mallar
3. Använda azd för nya distributioner tillsammans med befintlig infrastruktur

Se [Konfigurationsguiden](configuration.md) för detaljer.
</details>

<details>
<summary><strong>Fungerar azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurera molnet:
```bash
# Azure för myndigheter
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan jag använda azd i CI/CD-pipelines?</strong></summary>

Absolut! azd är utformat för automation:
- GitHub Actions-integration
- Stöd för Azure DevOps
- Autentisering med service principal
- Icke-interaktivt läge

Se [Distributionsguiden](../chapter-04-infrastructure/deployment-guide.md) för CI/CD-mönster.
</details>

<details>
<summary><strong>Vad kostar det att använda azd?</strong></summary>

azd i sig är **helt gratis** och öppen källkod. Du betalar endast för:
- Azure-resurser du distribuerar
- Azureförbrukningskostnader (compute, lagring osv.)

Använd `azd provision --preview` för att uppskatta kostnader innan distribution.
</details>

## Nästa steg

1. **Slutför autentisering**: Säkerställ att du kan komma åt ditt Azure-abonnemang
2. **Prova din första distribution**: Följ [Guiden för ditt första projekt](first-project.md)
3. **Utforska mallar**: Bläddra tillgängliga mallar med `azd template list`
4. **Konfigurera din IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera problem](https://github.com/Azure/azure-dev/issues)
- [Community-diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure-support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovägledning direkt i din redigerare med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstartsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [AZD Basics](azd-basics.md) 
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installationen är klar!** Fortsätt till [Ditt första projekt](first-project.md) för att börja bygga med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på dess ursprungliga språk ska anses utgöra den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
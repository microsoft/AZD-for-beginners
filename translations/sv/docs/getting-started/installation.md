<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-21T08:45:10+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sv"
}
-->
# Installations- och Setupguide

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [AZD Grunder](azd-basics.md)
- **➡️ Nästa**: [Ditt Första Projekt](first-project.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Den här omfattande guiden hjälper dig att installera och konfigurera Azure Developer CLI (azd) på ditt system. Du kommer att lära dig olika installationsmetoder för olika operativsystem, autentiseringsinställningar och initial konfiguration för att förbereda din utvecklingsmiljö för Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Framgångsrikt installera Azure Developer CLI på ditt operativsystem
- Konfigurera autentisering med Azure med flera metoder
- Ställa in din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när du ska använda dem
- Felsöka vanliga installations- och setupproblem

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Installera azd med rätt metod för din plattform
- Autentisera med Azure med hjälp av azd auth login
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Lösa vanliga installationsproblem självständigt

Denna guide hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, se till att du har:
- **Azure-abonnemang** - [Skapa ett gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - För autentisering och resursadministration
- **Git** - För att klona mallar och versionskontroll
- **Docker** (valfritt) - För containerbaserade applikationer

## Installationsmetoder

### Windows

#### Alternativ 1: PowerShell (Rekommenderas)
```powershell
# Kör som administratör eller med förhöjda privilegier
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

#### Alternativ 4: Manuell Installation
1. Ladda ner den senaste versionen från [GitHub](https://github.com/Azure/azure-dev/releases)
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

#### Alternativ 3: Manuell Installation
```bash
# Ladda ner och installera
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installationsskript (Rekommenderas)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Paketadministratörer

**Ubuntu/Debian:**
```bash
# Lägg till Microsoft-paketförråd
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installera azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lägg till Microsoft-paketförråd
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd är förinstallerat i GitHub Codespaces. Skapa bara en codespace och börja använda azd direkt.

### Docker

```bash
# Kör azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Skapa ett alias för enklare användning
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiera Installation

Efter installationen, verifiera att azd fungerar korrekt:

```bash
# Kontrollera version
azd version

# Visa hjälp
azd --help

# Lista tillgängliga mallar
azd template list
```

Förväntad utdata:
```
azd version 1.5.0 (commit abc123)
```

**✅ Installationschecklista:**
- [ ] `azd version` visar versionsnummer utan fel
- [ ] `azd --help` visar kommandodokumentation
- [ ] `azd template list` visar tillgängliga mallar
- [ ] `az account show` visar ditt Azure-abonnemang
- [ ] Du kan skapa en testkatalog och köra `azd init` framgångsrikt

**Om alla kontroller passerar är du redo att gå vidare till [Ditt Första Projekt](first-project.md)!**

## Autentiseringsinställningar

### Azure CLI Autentisering (Rekommenderas)
```bash
# Installera Azure CLI om det inte redan är installerat
# Windows: winget installera Microsoft.AzureCLI
# macOS: brew installera azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logga in på Azure
az login

# Verifiera autentisering
az account show
```

### Enhetskod Autentisering
Om du använder ett system utan skärm eller har problem med webbläsaren:
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

### Global Konfiguration
```bash
# Ställ in standardabonnemang
azd config set defaults.subscription <subscription-id>

# Ställ in standardplats
azd config set defaults.location eastus2

# Visa all konfiguration
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

## IDE Integration

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
- Distributionsövervakning

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
2. Konfigurera Azure-uppgifter
3. Använd integrerad terminal för azd-kommandon

## 🐛 Felsökning av Installation

### Vanliga Problem

#### Åtkomst Nekad (Windows)
```powershell
# Kör PowerShell som administratör
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problem
Lägg till azd manuellt till din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nätverks-/Proxyproblem
```bash
# Konfigurera proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hoppa över SSL-verifiering (rekommenderas inte för produktion)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Ta bort gamla installationer
# Windows: winget avinstallera Microsoft.Azd
# macOS: brew avinstallera azd
# Linux: sudo apt ta bort azd

# Rensa konfiguration
rm -rf ~/.azd
```

### Få Mer Hjälp
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd <command> --debug

# Visa detaljerade loggar
azd logs

# Kontrollera systeminformation
azd info
```

## Uppdatera azd

### Automatiska Uppdateringar
azd meddelar dig när uppdateringar är tillgängliga:
```bash
azd version --check-for-updates
```

### Manuella Uppdateringar

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

## 💡 Vanliga Frågor

<details>
<summary><strong>Vad är skillnaden mellan azd och az CLI?</strong></summary>

**Azure CLI (az)**: Låg-nivå verktyg för att hantera individuella Azure-resurser
- `az webapp create`, `az storage account create`
- En resurs åt gången
- Fokus på infrastrukturhantering

**Azure Developer CLI (azd)**: Hög-nivå verktyg för kompletta applikationsdistributioner
- `azd up` distribuerar hela appen med alla resurser
- Mallbaserade arbetsflöden
- Fokus på utvecklarproduktivitet

**Du behöver båda**: azd använder az CLI för autentisering
</details>

<details>
<summary><strong>Kan jag använda azd med befintliga Azure-resurser?</strong></summary>

Ja! Du kan:
1. Importera befintliga resurser till azd-miljöer
2. Referera till befintliga resurser i dina Bicep-mallar
3. Använda azd för nya distributioner tillsammans med befintlig infrastruktur

Se [Konfigurationsguide](configuration.md) för detaljer.
</details>

<details>
<summary><strong>Fungerar azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurera molnet:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan jag använda azd i CI/CD-pipelines?</strong></summary>

Absolut! azd är designat för automatisering:
- GitHub Actions-integration
- Azure DevOps-stöd
- Service principal-autentisering
- Icke-interaktivt läge

Se [Distributionsguide](../deployment/deployment-guide.md) för CI/CD-mönster.
</details>

<details>
<summary><strong>Vad kostar det att använda azd?</strong></summary>

azd i sig är **helt gratis** och öppen källkod. Du betalar endast för:
- Azure-resurser du distribuerar
- Azure konsumtionskostnader (beräkning, lagring, etc.)

Använd `azd provision --preview` för att uppskatta kostnader innan distribution.
</details>

## Nästa Steg

1. **Slutför autentisering**: Se till att du kan komma åt ditt Azure-abonnemang
2. **Prova din första distribution**: Följ [Första Projektguiden](first-project.md)
3. **Utforska mallar**: Bläddra bland tillgängliga mallar med `azd template list`
4. **Konfigurera din IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera Problem](https://github.com/Azure/azure-dev/issues)
- [Community Diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [AZD Grunder](azd-basics.md) 
- **➡️ Nästa**: [Ditt Första Projekt](first-project.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installation Klar!** Fortsätt till [Ditt Första Projekt](first-project.md) för att börja bygga med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
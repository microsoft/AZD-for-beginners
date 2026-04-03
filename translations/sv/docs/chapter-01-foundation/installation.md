# Installations- och uppstartsguide

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [AZD-grunderna](azd-basics.md)
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först-utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande guide visar hur du installerar och konfigurerar Azure Developer CLI (azd) på ditt system. Du får lära dig flera installationsmetoder för olika operativsystem, hur du ställer in autentisering och grundläggande konfiguration för att förbereda din utvecklingsmiljö för distributioner till Azure.

## Lärandemål

I slutet av denna lektion kommer du att:
- Installera Azure Developer CLI framgångsrikt på ditt operativsystem
- Konfigurera autentisering mot Azure med flera metoder
- Sätta upp din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när man ska använda dem
- Felsöka vanliga installations- och uppstartsproblem

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Installera azd med lämplig metod för din plattform
- Autentisera mot Azure med azd auth login
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Åtgärda vanliga installationsproblem självständigt

Denna guide hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, se till att du har:
- **Azure-prenumeration** - [Skapa ett gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - För autentisering och resursadministration
- **Git** - För kloning av mallar och versionskontroll
- **Docker** (valfritt) - För containeriserade applikationer

## Installationsmetoder

### Windows

#### Alternativ 1: Windows Package Manager (rekommenderas)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell-installationsskript
```powershell
# Användbart när winget inte är tillgängligt
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell installation
1. Ladda ner den senaste releasen från [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrahera till `C:\Program Files\azd\`
3. Lägg till i PATH-miljövariabeln

### macOS

#### Alternativ 1: Homebrew (rekommenderas)
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

#### Alternativ 1: Installationsskript (rekommenderas)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Paketchefer

**Manuell installation från release-artifakter:**
```bash
# Ladda ner det senaste arkivet för din Linux-arkitektur från:
# https://github.com/Azure/azure-dev/releases
# Extrahera det och lägg sedan till azd-binären i din PATH.
```

### GitHub Codespaces

Vissa Codespaces och devcontainer-miljöer inkluderar redan `azd`, men du bör verifiera det istället för att anta det:

```bash
azd version
```

Om `azd` saknas, installera det med standardskriptet för miljön.

### Docker

```bash
# Kör azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Skapa ett alias för enklare användning
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiera installationen

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

**Obs**: Den faktiska versionsnumret kommer att variera. Kontrollera [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) för den senaste versionen.

**✅ Kontrollista för lyckad installation:**
- [ ] `azd version` visar versionsnummer utan fel
- [ ] `azd --help` visar kommandodokumentation
- [ ] `azd template list` visar tillgängliga mallar
- [ ] Du kan skapa en testkatalog och köra `azd init` framgångsrikt

**Om alla kontroller godkänns är du redo att gå vidare till [Ditt första projekt](first-project.md)!**

## Autentiseringsinställningar

### Rekommenderad nybörjarinställning

För AZD-först-arbetsflöden, logga in med `azd auth login`.

```bash
# Krävs för AZD-kommandon som till exempel azd up
azd auth login

# Verifiera AZD-autentiseringsstatus
azd auth login --check-status
```

Använd Azure CLI-inloggning endast när du planerar att köra `az`-kommandon själv under kursen.

### Azure CLI-autentisering (valfritt)
```bash
# Installera Azure CLI om det inte redan är installerat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: se dokumentationen för installation av Azure CLI för din distribution

# Logga in på Azure
az login

# Verifiera autentisering
az account show
```

### Vilket inloggningsflöde bör du använda?

- Använd `azd auth login` om du följer nybörjarspåret för AZD och huvudsakligen kör `azd`-kommandon.
- Använd även `az login` när du vill köra Azure CLI-kommandon som `az account show` eller inspektera resurser direkt.
- Om en övning innehåller både `azd`- och `az`-kommandon, kör båda inloggningarna en gång i början.

### Enhetskodautentisering
Om du är på ett system utan grafiskt gränssnitt eller har problem med webbläsaren:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
För automatiserade miljöer:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validera din kompletta konfiguration

Om du vill göra en snabb beredskapskontroll innan du börjar Kapitel 1:

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
# Ställ in standardprenumeration
azd config set defaults.subscription <subscription-id>

# Ställ in standardplats
azd config set defaults.location eastus2

# Visa hela konfigurationen
azd config show
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
2. Gå till Tillägg (Ctrl+Shift+X)
3. Sök efter "Azure Developer CLI"
4. Installera tillägget

Funktioner:
- IntelliSense för azure.yaml
- Integrerade terminalkommandon
- Bläddra i mallar
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

# Hoppa över SSL-verifiering (rekommenderas inte i produktion)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Ta bort gamla installationer
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: ta bort den tidigare azd-binären eller symlinken innan du installerar om

# Rensa konfigurationen
rm -rf ~/.azd
```

### Få mer hjälp
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd <command> --debug

# Visa aktuell konfiguration
azd config show

# Visa aktuell distributionsstatus
azd show
```

## Uppdatera azd

### Kontrollera uppdatering
azd varnar när en nyare release finns tillgänglig, och du kan bekräfta din nuvarande build med:
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

**Azure CLI (az)**: Verktyg på låg nivå för att hantera enskilda Azure-resurser
- `az webapp create`, `az storage account create`
- En resurs åt gången
- Fokus på infrastrukturhantering

**Azure Developer CLI (azd)**: Verktyg på hög nivå för kompletta applikationsdistributioner
- `azd up` distribuerar hela appen med alla resurser
- Mallbaserade arbetsflöden
- Fokus på utvecklareffektivitet

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

Absolut! azd är designat för automation:
- Integration med GitHub Actions
- Stöd för Azure DevOps
- Autentisering med service principal
- Icke-interaktivt läge

Se [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md) för CI/CD-mönster.
</details>

<details>
<summary><strong>Vad kostar det att använda azd?</strong></summary>

azd i sig är **helt gratis** och öppen källkod. Du betalar endast för:
- Azure-resurser du distribuerar
- Azure-konsumtionskostnader (compute, lagring etc.)

Använd `azd provision --preview` för att uppskatta kostnader innan distribution.
</details>

## Nästa steg

1. **Slutför autentiseringen**: Se till att du kan komma åt din Azure-prenumeration
2. **Pröva din första distribution**: Följ [Guiden för första projektet](first-project.md)
3. **Utforska mallar**: Bläddra bland tillgängliga mallar med `azd template list`
4. **Konfigurera din IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera problem](https://github.com/Azure/azure-dev/issues)
- [Community-diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure-support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovägledning direkt i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [AZD-grunderna](azd-basics.md) 
- **➡️ Nästa**: [Ditt första projekt](first-project.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först-utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation slutförd!** Fortsätt till [Ditt första projekt](first-project.md) för att börja bygga med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungsspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell, mänsklig översättning. Vi ansvarar inte för missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
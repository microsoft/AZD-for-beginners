# Installations- og opsætningsvejledning

**Kaptelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md)
- **➡️ Næste**: [Dit første projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-første udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende vejledning vil guide dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du vil lære flere installationsmetoder til forskellige operativsystemer, opsætning af autentificering og initial konfiguration for at forberede dit udviklingsmiljø til Azure-udrulninger.

## Læringsmål

Ved lektionens afslutning vil du kunne:
- Installere Azure Developer CLI på dit operativsystem med succes
- Konfigurere autentificering med Azure via flere metoder
- Sætte dit udviklingsmiljø op med nødvendige forudsætninger
- Forstå forskellige installationsmuligheder og hvornår hver skal bruges
- Fejlsøge almindelige installations- og opsætningsproblemer

## Læringsresultater

Efter at have gennemført denne lektion vil du være i stand til at:
- Installere azd ved hjælp af den passende metode for din platform
- Autentificere med Azure ved hjælp af azd auth login
- Verificere din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø for optimal brug af azd
- Selvstændigt løse almindelige installationsproblemer

Denne vejledning hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset operativsystem eller udviklingsmiljø.

## Forudsætninger

Før du installerer azd, sørg for at have:
- **Azure-abonnement** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valgfrit) - Til eksempler, der eksplicit kører `az`; azd autentificerer uafhængigt
- **Git** - Til at klone skabeloner og versionskontrol
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installationsmetoder

### Windows

#### Valgmulighed 1: Windows Package Manager (Anbefalet)
```cmd
winget install microsoft.azd
```

#### Valgmulighed 2: PowerShell-installationsscript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Valgmulighed 3: Chocolatey
```cmd
choco install azd
```

#### Valgmulighed 4: Manuel installation
1. Download den nyeste udgivelse fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Udpak til `C:\Program Files\azd\`
3. Tilføj til PATH miljøvariablen

### macOS

#### Valgmulighed 1: Homebrew (Anbefalet)
```bash
brew tap azure/azd
brew install azd
```

#### Valgmulighed 2: Installationsscript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valgmulighed 3: Manuel installation
Download arkivet for din macOS-arkitektur fra [udgivelsesfilerne](https://github.com/Azure/azure-dev/releases), udpakk det, og tilføj `azd` binærfilen til din `PATH`.

### Linux

#### Valgmulighed 1: Installationsscript (Anbefalet)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valgmulighed 2: Pakkehåndteringer

**Manuel installation fra udgivelsesfiler:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Nogle Codespaces og udviklingscontainer-miljøer inkluderer allerede `azd`, men du bør verificere det i stedet for at antage det:

```bash
azd version
```

Hvis `azd` mangler, installer det med standardscriptet for miljøet.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Denne midlertidige container bevarer ikke login-status mellem kørsel. Til gentagne udrulninger, brug [udviklingscontainer-opsætningen](dev-containers.md); containeropbygninger kræver også en Docker-daemon tilgængelig inde i containeren.

## ✅ Verificer installation

Efter installation skal du verificere, at azd fungerer korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Forventet output:
```
azd version 1.x.x (commit xxxxxx)
```

**Bemærk**: Det faktiske versionsnummer vil variere. Tjek [Azure Developer CLI-udgivelser](https://github.com/Azure/azure-dev/releases) for den nyeste version.

**✅ Tjekliste for installationssucces:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommandodokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek er bestået, er du klar til at fortsætte til [Dit første projekt](first-project.md)!**

## Opsætning af autentificering

### Anbefalet begynderopsætning

For AZD-første arbejdsprocesser, log ind med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Brug kun Azure CLI-login, når du planlægger at køre `az` kommandoer selv under kurset.

### Azure CLI-autentificering (valgfrit)
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

### Hvilken login-flow bør du bruge?

- Brug `azd auth login`, hvis du følger begyndervenlige AZD-vejen og primært kører `azd` kommandoer.
- Brug også `az login`, når du vil køre Azure CLI-kommandoer som `az account show` eller inspicere ressourcer direkte.
- Hvis en øvelse inkluderer både `azd` og `az` kommandoer, så kør begge login-kommandoer én gang i starten.

### Enhedskodeautentificering
Hvis du er på et hovedløst system eller har browserproblemer:
```bash
azd auth login --use-device-code
```

### Serviceprincipal (CI/CD)
Til automatiserede miljøer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valider din komplette opsætning

Hvis du ønsker en hurtig parathedskontrol inden Kapitel 1:

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

### Miljøvariabler
Tilføj til dit shellprofil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE-integration

### Visual Studio Code
Installer Azure Developer CLI-udvidelsen:
1. Åbn VS Code
2. Gå til Udvidelser (Ctrl+Shift+X)
3. Søg efter "Azure Developer CLI"
4. Installer udvidelsen

Funktioner:
- IntelliSense til azure.yaml
- Integrerede terminalkommandoer
- Skabelon-gennemgang
- Overvågning af udrulning

### GitHub Codespaces
Opret en `.devcontainer/devcontainer.json`:
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
1. Installer Azure-plugin
2. Konfigurer Azure-legitimationsoplysninger
3. Brug integreret terminal til azd-kommandoer

## 🐛 Fejlsøgning af installation

### Almindelige problemer

#### Tilladelse nægtet (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Tilføj manuelt azd til din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Netværks-/proxyproblemer
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

### Få mere hjælp
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Opdatering af azd

### Tjek for opdateringer
azd advarer, når en nyere version er tilgængelig, og du kan bekræfte din nuværende build med:
```bash
azd version
```

### Manuelle opdateringer

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

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvad er forskellen mellem azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavniveauværktøj til administration af individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturadministration

**Azure Developer CLI (azd)**: Højniveauværktøj til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Arbejdsgange baseret på skabeloner
- Fokus på udviklerproduktivitet

**De er uafhængige**: azd bruger sin egen autentificering som standard. Installer og log kun ind på Azure CLI for `az` kommandoer, eller vælg eksplicit `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan jeg bruge azd med eksisterende Azure-ressourcer?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressourcer til azd-miljøer
2. Referere til eksisterende ressourcer i dine Bicep-skabeloner
3. Bruge azd til nye udrulninger sammen med eksisterende infrastruktur

Se [Konfigurationsvejledning](../chapter-03-configuration/configuration.md) for detaljer.
</details>

<details>
<summary><strong>Virker azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Hvis du også bruger Azure CLI, konfigurer `az cloud set --name ...` separat. Skabelontjenester og modeltilgængelighed varierer efter sky.
</details>

<details>
<summary><strong>Kan jeg bruge azd i CI/CD-pipelines?</strong></summary>

Helt sikkert! azd er designet til automatisering:
- GitHub Actions-integration
- Azure DevOps-support
- Serviceprincipal-autentificering
- Ikke-interaktiv tilstand

Se [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

selve azd er **helt gratis** og open source. Du betaler kun for:
- Azure-ressourcer du udruller
- Azure-forbrugsomkostninger (compute, storage osv.)

Brug `azd provision --preview` til at inspicere foreslåede ressourcer, og estimer derefter deres omkostninger med [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/). Preview beregner ikke priser.
</details>

## Næste skridt

1. **Afslut autentificering**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Første projekt vejledning](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer dit IDE**: Opsæt dit udviklingsmiljø

## Support

Hvis du støder på problemer:
- [Officiel dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Fællesskabsdiskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovejledning direkte i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md) 
- **➡️ Næste**: [Dit første projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-første udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation fuldført!** Fortsæt til [Dit første projekt](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
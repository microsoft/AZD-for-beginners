# Installations- & opsætningsvejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Fundament & Hurtig start
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md)
- **➡️ Næste**: [Dit Første Projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-Først Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende vejledning vil guide dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du lærer flere installationsmetoder for forskellige operativsystemer, opsætning af autentificering samt den indledende konfiguration, der forbereder dit udviklingsmiljø til Azure-udrulninger.

## Læringsmål

Ved afslutningen af denne lektion vil du:
- Med succes installere Azure Developer CLI på dit operativsystem
- Konfigurere autentificering med Azure ved brug af flere metoder
- Opsætte dit udviklingsmiljø med nødvendige forudsætninger
- Forstå forskellige installationsmuligheder og hvornår du skal bruge hver
- Fejlsøge almindelige installations- og opsætningsproblemer

## Læringsresultater

Efter at have gennemført denne lektion vil du kunne:
- Installere azd ved brug af den passende metode til din platform
- Autentificere med Azure via azd auth login
- Verificere din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø til optimal brug af azd
- Selvstændigt løse almindelige installationsproblemer

Denne vejledning hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset hvilket operativsystem eller udviklingsmiljø du bruger.

## Forudsætninger

Før du installerer azd, skal du sikre dig, at du har:
- **Azure-abonnement** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valgfrit) - Til eksempler, der eksplicit kører `az`; azd autentificerer uafhængigt
- **Git** - Til kloning af skabeloner og versionskontrol
- **Docker** (valgfrit) - Til containeriserede applikationer

**Kapitel 2 Foundry GA vej:** Brug AZD **1.37.0 eller senere**, installer bundtet med `azd ext install microsoft.foundry`, og brug Python **3.13+** og nuværende **uv** til hosted-agent-eksemplet. Dets kodeudrulningstilstand bygger eksternt, så det kræver ikke lokal Docker-bygning. Foundry-tilladelser, regional modeltilgængelighed og kvoter er stadig påkrævet; se [hosted-agent opsætning](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Installationsmetoder

### Windows

#### Mulighed 1: Windows Package Manager (Anbefalet)
```cmd
winget install microsoft.azd
```

#### Mulighed 2: PowerShell Installationsscript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Mulighed 3: Chocolatey
```cmd
choco install azd
```

#### Mulighed 4: Manuel installation
1. Download den seneste version fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pak ud til `C:\Program Files\azd\`
3. Tilføj til PATH miljøvariablen

### macOS

#### Mulighed 1: Homebrew (Anbefalet)
```bash
brew tap azure/azd
brew install azd
```

#### Mulighed 2: Installationsscript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 3: Manuel installation
Download arkivet til din macOS-arkitektur fra [udgivelsesfilerne](https://github.com/Azure/azure-dev/releases), pak det ud, og tilføj `azd` binærfilen til din `PATH`.

### Linux

#### Mulighed 1: Installationsscript (Anbefalet)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 2: Pakkehåndteringer

**Manuel installation fra udgivelsesfiler:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Nogle Codespaces og dev-container-miljøer inkluderer allerede `azd`, men du bør bekræfte det fremfor at antage det:

```bash
azd version
```

Hvis `azd` mangler, installer det med standardscriptet til miljøet.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Denne flygtige container bevarer ikke login-status mellem kørsel. Til gentagne udrulninger, brug [dev container opsætning](dev-containers.md); containerbygninger kræver også en Docker-daemon, der er tilgængelig inde i containeren.

## ✅ Bekræft installation

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

**Bemærk**: Det faktiske versionsnummer kan variere. Tjek [Azure Developer CLI-udgivelser](https://github.com/Azure/azure-dev/releases) for den seneste version.

**✅ Installations-tjekliste:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommando-dokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek passerer, er du klar til at fortsætte til [Dit Første Projekt](first-project.md)!**

## Autentificeringsopsætning

### Anbefalet begyndeopsætning

Til AZD-første arbejdsflow, log ind med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Brug Azure CLI-log ind kun, hvis du planlægger selv at køre `az`-kommandoer under kurset.

### Azure CLI-autentificering (valgfri)
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

### Hvilken log-ind-flow bør du bruge?

- Brug `azd auth login`, hvis du følger begynder-AZD-vej og hovedsageligt kører `azd`-kommandoer.
- Brug `az login` også, når du vil køre Azure CLI-kommandoer som `az account show` eller inspicere ressourcer direkte.
- Hvis en øvelse inkluderer både `azd` og `az`-kommandoer, så kør begge log-ind-kommandoer en gang i starten.

### Enhedskode-autentificering
Hvis du er på et hovedløst system eller har browserproblemer:
```bash
azd auth login --use-device-code
```

### Service-principal (CI/CD)
Til automatiserede miljøer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valider din komplette opsætning

Hvis du vil have en hurtig parathedskontrol før start på Kapitel 1:

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
Tilføj til din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
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
- Udrulningsovervågning

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
1. Installer Azure-pluginet
2. Konfigurer Azure-legitimationsoplysninger
3. Brug integreret terminal til azd-kommandoer

## 🐛 Fejlfinding af installation

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

#### Netværk/Proxy-problemer
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

### Opdateringskontrol
azd advarer, når en nyere version er tilgængelig, og du kan bekræfte din aktuelle build med:
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

**Azure CLI (az)**: Lav-niveau værktøj til at administrere individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturadministration

**Azure Developer CLI (azd)**: Høj-niveau værktøj til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Skabelonbaserede workflows
- Fokus på udviklerproduktivitet

**De er uafhængige**: azd bruger som standard sin egen autentificering. Installer og log ind på Azure CLI kun for `az`-kommandoer, eller vælg eksplicit `azd config set auth.useAzCliAuth true`.
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
<summary><strong>Fungerer azd med Azure Government eller Azure Kina?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Hvis du også bruger Azure CLI, konfigurer `az cloud set --name ...` separat. Skabelontjenester og modellernes tilgængelighed varierer efter sky.
</details>

<details>
<summary><strong>Kan jeg bruge azd i CI/CD-pipelines?</strong></summary>

Absolut! azd er designet til automatisering:
- GitHub Actions-integration
- Azure DevOps-support
- Service principal-autentificering
- Ikke-interaktiv tilstand

Se [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

azd selv er **helt gratis** og open source. Du betaler kun for:
- Azure-ressourcer, du udruller
- Azure-forbrugsomkostninger (compute, lager osv.)

Brug `azd provision --preview` til at inspicere foreslåede ressourcer og anslå derefter omkostningerne med [Azure Priskalkulator](https://azure.microsoft.com/pricing/calculator/). Preview beregner ikke priser.
</details>

## Næste trin

1. **Færdiggør autentificering**: Sørg for, at du kan tilgå dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Første Projekt Vejledning](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer din IDE**: Opsæt dit udviklingsmiljø

## Support

Hvis du støder på problemer:
- [Officiel Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter Problemer](https://github.com/Azure/azure-dev/issues)
- [Community Diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommando-guidance direkte i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Fundament & Hurtig start
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md) 
- **➡️ Næste**: [Dit Første Projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-Først Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Fuldført!** Fortsæt til [Dit Første Projekt](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
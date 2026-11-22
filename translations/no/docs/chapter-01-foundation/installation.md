# Installasjons- og Oppsettguide

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md)
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende guiden vil lede deg gjennom installasjon og konfigurering av Azure Developer CLI (azd) på ditt system. Du vil lære flere installasjonsmetoder for ulike operativsystemer, autentiseringsoppsett, og initial konfigurasjon for å forberede utviklingsmiljøet ditt for Azure-distribusjoner.

## Læringsmål

Innen slutten av denne leksjonen vil du:
- Lykkes med å installere Azure Developer CLI på ditt operativsystem
- Konfigurere autentisering med Azure ved hjelp av flere metoder
- Sette opp utviklingsmiljøet ditt med nødvendige forutsetninger
- Forstå ulike installasjonsalternativer og når hver bør brukes
- Feilsøke vanlige installasjons- og oppsettproblemer

## Læringsresultater

Etter å ha fullført denne leksjonen, vil du kunne:
- Installere azd med riktig metode for din plattform
- Autentisere med Azure ved å bruke azd auth login
- Verifisere installasjonen og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet ditt for optimal azd-bruk
- Løse vanlige installasjonsproblemer på egen hånd

Denne guiden hjelper deg med å installere og konfigurere Azure Developer CLI på ditt system, uansett operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valgfritt) - For eksempler som eksplisitt kjører `az`; azd autentiserer uavhengig
- **Git** - For kloning av maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

**Kapittel 2 Foundry GA sti:** Bruk AZD **1.37.0 eller senere**, installer pakken med `azd ext install microsoft.foundry`, og bruk Python **3.13+** og nåværende **uv** for hosted-agent-eksemplet. Dets kode-distribusjonsmodus bygges eksternt, så det krever ikke lokal Docker-build. Foundry-tillatelser, regional modelltilgjengelighet og kvote er fortsatt nødvendig; se [hosted-agent oppsett](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Installasjonsmetoder

### Windows

#### Alternativ 1: Windows Pakkehåndterer (Anbefalt)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell Installasjonsskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell Installasjon
1. Last ned siste versjon fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH miljøvariabel

### macOS

#### Alternativ 1: Homebrew (Anbefalt)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installasjonsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell Installasjon
Last ned arkivet for din macOS-arkitektur fra [release assets](https://github.com/Azure/azure-dev/releases), pakk det ut, og legg `azd` binæren til i din `PATH`.

### Linux

#### Alternativ 1: Installasjonsskript (Anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkebehandlere

**Manuell installasjon fra release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Noen Codespaces og dev-container-miljøer inkluderer allerede `azd`, men du bør verifisere det i stedet for å anta det:

```bash
azd version
```

Hvis `azd` mangler, installer det med standard skript for miljøet.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Denne flyktige containeren bevarer ikke innloggingsstatus mellom kjøringer. For gjentatte distribusjoner, bruk [dev container oppsett](dev-containers.md); containerbygg krever også en Docker daemon som er tilgjengelig inne i containeren.

## ✅ Verifiser Installasjon

Etter installasjon, verifiser at azd fungerer som det skal:

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

**Merk**: Den faktiske versjonsnummeret kan variere. Sjekk [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for siste versjon.

**✅ Sjekkliste for vellykket installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommandodokumentasjon
- [ ] `azd template list` viser tilgjengelige maler
- [ ] Du kan lage en testmappe og kjøre `azd init` uten problemer

**Hvis alle sjekker går bra, er du klar til å gå videre til [Ditt Første Prosjekt](first-project.md)!**

## Autentiseringsoppsett

### Anbefalt Oppsett for Nybegynnere

For AZD-første arbeidsflyter, logg inn med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Bruk Azure CLI-innlogging kun når du planlegger å kjøre `az`-kommandoer selv i løpet av kurset.

### Azure CLI Autentisering (Valgfritt)
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

### Hvilken Innloggingsflyt Skal Du Bruke?

- Bruk `azd auth login` hvis du følger nybegynner AZD-løypa og hovedsakelig kjører `azd`-kommandoer.
- Bruk også `az login` når du vil kjøre Azure CLI-kommandoer som `az account show` eller inspisere ressurser direkte.
- Hvis en øvelse inkluderer både `azd` og `az`-kommandoer, kjør begge innloggingskommandoene én gang ved start.

### Enhetskode Autentisering
Hvis du er på et system uten skjerm eller har nettleserproblemer:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automatiserte miljøer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valider Ditt Fullstendige Oppsett

Hvis du vil ha en rask beredskapsjekk før du starter Kapittel 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurasjon

### Global Konfigurasjon
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Miljøvariabler
Legg til i ditt shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE-integrasjon

### Visual Studio Code
Installer Azure Developer CLI-utvidelsen:
1. Åpne VS Code
2. Gå til Extensions (Ctrl+Shift+X)
3. Søk etter "Azure Developer CLI"
4. Installer utvidelsen

Funksjoner:
- IntelliSense for azure.yaml
- Integrerte terminal-kommandoer
- Bla i maler
- Overvåkning av distribusjon

### GitHub Codespaces
Lag en `.devcontainer/devcontainer.json`:
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
2. Konfigurer Azure-legitimasjon
3. Bruk integrert terminal for azd-kommandoer

## 🐛 Feilsøking av installasjon

### Vanlige Problemer

#### Tillatelse Nektes (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Legg manuelt til azd i PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nettverks-/Proxy-problemer
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versjonskonflikter
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Få Mer Hjelp
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Oppdatering av azd

### Sjekk for Oppdatering
azd varsler når en nyere utgave er tilgjengelig, og du kan bekrefte din nåværende versjon med:
```bash
azd version
```

### Manuelle Oppdateringer

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

## 💡 Ofte Stilte Spørsmål

<details>
<summary><strong>Hva er forskjellen mellom azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavnivåverktøy for å administrere individuelle Azure-ressurser
- `az webapp create`, `az storage account create`
- Én ressurs om gangen
- Fokus på infrastrukturadministrasjon

**Azure Developer CLI (azd)**: Høynivåverktøy for komplette applikasjonsdistribusjoner
- `azd up` distribuerer hele appen med alle ressurser
- Malbaserte arbeidsflyter
- Fokus på utviklerproduktivitet

**De er uavhengige**: azd bruker sin egen autentisering som standard. Installer og logg inn i Azure CLI bare for `az`-kommandoer, eller velg eksplisitt `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan jeg bruke azd med eksisterende Azure-ressurser?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressurser til azd-miljøer
2. Referere til eksisterende ressurser i dine Bicep-maler
3. Bruke azd for nye distribusjoner sammen med eksisterende infrastruktur

Se [Konfigurasjonsguide](../chapter-03-configuration/configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyløsningen:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Hvis du også bruker Azure CLI, konfigurer `az cloud set --name ...` separat. Maltjenester og modelltilgjengelighet varierer per sky.
</details>

<details>
<summary><strong>Kan jeg bruke azd i CI/CD pipelines?</strong></summary>

Absolutt! azd er designet for automatisering:
- Integrasjon med GitHub Actions
- Støtte for Azure DevOps
- Service principal autentisering
- Ikke-interaktiv modus

Se [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD mønstre.
</details>

<details>
<summary><strong>Hva koster det å bruke azd?</strong></summary>

azd selv er **helt gratis** og åpen kildekode. Du betaler kun for:
- Azure-ressurser du distribuerer
- Azure-forbrukskostnader (beregning, lagring, osv.)

Bruk `azd provision --preview` for å inspisere foreslåtte ressurser, og estimer deretter kostnadene med [Azure Pris Kalkulator](https://azure.microsoft.com/pricing/calculator/). Forhåndsvisning beregner ikke priser.
</details>

## Neste Steg

1. **Fullfør autentisering**: Sørg for at du kan få tilgang til ditt Azure-abonnement
2. **Prøv din første distribusjon**: Følg [Første Prosjekt Guide](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer din IDE**: Sett opp utviklingsmiljøet ditt

## Støtte

Hvis du støter på problemer:
- [Offisiell Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter Problemer](https://github.com/Azure/azure-dev/issues)
- [Fellesskapsdiskusjoner](https://github.com/Azure/azure-dev/discussions)
- [Azure Støtte](https://azure.microsoft.com/support/)
- [**Azure Agent Ferdigheter**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommando-veiledning direkte i editoren din med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md) 
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installasjon Fullført!** Fortsett til [Ditt Første Prosjekt](first-project.md) for å begynne bygging med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
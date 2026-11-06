# Installering og Oppsettsveiledning

**Kapittelnavigasjon:**
- **📚 Kursstartside**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md)
- **➡️ Neste**: [Ditt Første Projekt](first-project.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende veiledningen vil lede deg gjennom installasjon og konfigurering av Azure Developer CLI (azd) på ditt system. Du vil lære flere installasjonsmetoder for ulike operativsystemer, oppsett av autentisering, og den første konfigurasjonen for å forberede ditt utviklingsmiljø for Azure-distribusjoner.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Vellykket installere Azure Developer CLI på ditt operativsystem
- Konfigurere autentisering med Azure ved hjelp av flere metoder
- Sette opp utviklingsmiljøet ditt med nødvendige forutsetninger
- Forstå ulike installasjonsalternativer og når du bør bruke hver
- Feilsøke vanlige installasjons- og oppsettproblemer

## Læringsresultater

Etter å ha fullført denne leksjonen vil du kunne:
- Installere azd ved hjelp av riktig metode for din plattform
- Autentisere med Azure ved bruk av azd auth login
- Verifisere din installasjon og teste grunnleggende azd-kommandoer
- Konfigurere ditt utviklingsmiljø for optimal bruk av azd
- Løse vanlige installasjonsproblemer på egenhånd

Denne veiledningen vil hjelpe deg å installere og konfigurere Azure Developer CLI på ditt system, uansett hvilket operativsystem eller utviklingsmiljø du bruker.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** (valgfritt) - For eksempler som eksplisitt kjører `az`; azd autentiserer uavhengig
- **Git** - For kloning av maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installasjonsmetoder

### Windows

#### Alternativ 1: Windows Package Manager (anbefalt)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell installasjonsskript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell installasjon
1. Last ned siste utgivelse fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH-miljøvariabelen

### macOS

#### Alternativ 1: Homebrew (anbefalt)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installasjonsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell installasjon
Last ned arkivet for din macOS-arkitektur fra [utgivelsesressursene](https://github.com/Azure/azure-dev/releases), pakk det ut, og legg `azd`-binæren til din `PATH`.

### Linux

#### Alternativ 1: Installasjonsskript (anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkebehandlere

**Manuell installasjon fra utgivelsesressurser:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Noen Codespaces og dev container-miljøer inkluderer allerede `azd`, men du bør bekrefte det i stedet for å anta:

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

Denne flyktige containeren bevarer ikke innloggingsstatus mellom kjøringer. For gjentatte distribusjoner, bruk [dev container-oppsettet](dev-containers.md); containerbygg krever også at en Docker daemon er tilgjengelig fra innsiden av containeren.

## ✅ Verifiser installasjonen

Etter installasjon, verifiser at azd fungerer korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Forventet utdata:
```
azd version 1.x.x (commit xxxxxx)
```

**Merk**: Det faktiske versjonsnummeret vil variere. Sjekk [Azure Developer CLI-utgivelser](https://github.com/Azure/azure-dev/releases) for nyeste versjon.

**✅ Sjekkliste for vellykket installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommandodokumentasjon
- [ ] `azd template list` viser tilgjengelige maler
- [ ] Du kan opprette en testmappe og kjøre `azd init` uten problemer

**Hvis alle sjekker er godkjent, er du klar til å gå videre til [Ditt Første Projekt](first-project.md)!**

## Autentiseringsoppsett

### Anbefalt nybegynneroppsett

For AZD-første arbeidsflyter, logg inn med `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Bruk Azure CLI pålogging bare når du planlegger å kjøre `az`-kommandoer selv under kurset.

### Azure CLI-autentisering (valgfritt)
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

### Hvilken påloggingsflyt bør du bruke?

- Bruk `azd auth login` hvis du følger AZD-nybegynnerveien og hovedsakelig kjører `azd`-kommandoer.
- Bruk også `az login` når du vil kjøre Azure CLI-kommandoer som `az account show` eller inspisere ressurser direkte.
- Hvis en øvelse inkluderer både `azd` og `az`-kommandoer, kjør begge påloggingskommandoene en gang ved start.

### Enhetskodeautentisering
Hvis du er på et hode-løst system eller har nettleserproblemer:
```bash
azd auth login --use-device-code
```

### Tjenesteprinsipal (CI/CD)
For automatiserte miljøer:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valider ditt fullstendige oppsett

Hvis du vil ha en rask klarhetssjekk før du starter Kapittel 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurasjon

### Global konfigurasjon
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
2. Gå til Utvidelser (Ctrl+Shift+X)
3. Søk etter "Azure Developer CLI"
4. Installer utvidelsen

Funksjoner:
- IntelliSense for azure.yaml
- Integrerte terminalkommandoer
- Mal-gjennomgang
- Distribusjonsovervåking

### GitHub Codespaces
Opprett en `.devcontainer/devcontainer.json`:
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

### Vanlige problemer

#### Tillatelse nektet (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Legg manuelt til azd i PATH-en din:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nettverk/Proxy problemer
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

### Få mer hjelp
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Oppdatering av azd

### Oppdateringssjekk
azd varsler når en nyere utgivelse er tilgjengelig, og du kan bekrefte din nåværende installasjon med:
```bash
azd version
```

### Manuelle oppdateringer

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

## 💡 Ofte stilte spørsmål

<details>
<summary><strong>Hva er forskjellen mellom azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavnivåverktøy for å administrere individuelle Azure-ressurser
- `az webapp create`, `az storage account create`
- En ressurs om gangen
- Fokus på infrastrukturadministrasjon

**Azure Developer CLI (azd)**: Høynivåverktøy for komplette applikasjonsdistribusjoner
- `azd up` distribuerer hele appen med alle ressurser
- Malbaserte arbeidsflyter
- Fokus på utviklerproduktivitet

**De er uavhengige**: azd bruker sin egen autentisering som standard. Installer og logg inn i Azure CLI kun for `az`-kommandoer, eller velg eksplisitt å bruke `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Kan jeg bruke azd med eksisterende Azure-ressurser?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressurser inn i azd-miljøer
2. Referere til eksisterende ressurser i dine Bicep-maler
3. Bruke azd for nye distribusjoner sammen med eksisterende infrastruktur

Se [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Hvis du også bruker Azure CLI, må du konfigurere `az cloud set --name ...` separat. Mal-tjenester og modelltilgjengelighet varierer etter sky.
</details>

<details>
<summary><strong>Kan jeg bruke azd i CI/CD-pipelines?</strong></summary>

Absolutt! azd er designet for automatisering:
- GitHub Actions-integrasjon
- Azure DevOps-støtte
- Autentisering med tjenesteprinsipal
- Ikke-interaktiv modus

Se [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hva koster det å bruke azd?</strong></summary>

azd selv er **helt gratis** og åpen kildekode. Du betaler kun for:
- Azure-ressursene du distribuerer
- Azure-forbrukskostnader (beregning, lagring, osv.)

Bruk `azd provision --preview` til å inspisere foreslåtte ressurser, og estimer deretter deres kostnader med [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/). Forhåndsvisning beregner ikke priser.
</details>

## Neste steg

1. **Fullfør autentisering**: Sørg for at du kan få tilgang til ditt Azure-abonnement
2. **Prøv din første distribusjon**: Følg [Første Prosjekt-veiledning](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer ditt IDE**: Sett opp utviklingsmiljøet ditt

## Support

Hvis du støter på problemer:
- [Offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Fellesskapsdiskusjoner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få hjelp til Azure-kommandoer direkte i editoren din med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kursstartside**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md) 
- **➡️ Neste**: [Ditt Første Projekt](first-project.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installasjon Fullført!** Fortsett til [Ditt Første Projekt](first-project.md) for å begynne å bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
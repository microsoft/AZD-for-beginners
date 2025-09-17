<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T21:08:17+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "no"
}
-->
# Installasjons- og oppsettsveiledning

**Forrige:** [Hoveddokumentasjon](../../README.md) | **Neste:** [AZD Grunnleggende](azd-basics.md)

## Introduksjon

Denne omfattende veiledningen vil lede deg gjennom installasjon og konfigurering av Azure Developer CLI (azd) på systemet ditt. Du vil lære flere installasjonsmetoder for ulike operativsystemer, autentiseringsoppsett og grunnleggende konfigurasjon for å forberede utviklingsmiljøet ditt for Azure-utplasseringer.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Ha installert Azure Developer CLI på operativsystemet ditt
- Konfigurert autentisering med Azure ved hjelp av flere metoder
- Satt opp utviklingsmiljøet ditt med nødvendige forutsetninger
- Forstått ulike installasjonsalternativer og når du skal bruke dem
- Kunne feilsøke vanlige installasjons- og oppsettsproblemer

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Installere azd ved hjelp av riktig metode for din plattform
- Autentisere med Azure ved hjelp av `azd auth login`
- Verifisere installasjonen og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet ditt for optimal bruk av azd
- Løse vanlige installasjonsproblemer på egen hånd

Denne veiledningen vil hjelpe deg med å installere og konfigurere Azure Developer CLI på systemet ditt, uavhengig av operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, må du sørge for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - For autentisering og ressursadministrasjon
- **Git** - For kloning av maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installasjonsmetoder

### Windows

#### Alternativ 1: PowerShell (Anbefalt)
```powershell
# Run as Administrator or with elevated privileges
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

#### Alternativ 4: Manuell installasjon
1. Last ned den nyeste versjonen fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH-miljøvariabelen

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

#### Alternativ 3: Manuell installasjon
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installasjonsskript (Anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkehåndterere

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd er forhåndsinstallert i GitHub Codespaces. Opprett bare en codespace og begynn å bruke azd umiddelbart.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiser installasjonen

Etter installasjonen, verifiser at azd fungerer korrekt:

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
azd version 1.5.0 (commit abc123)
```

## Autentiseringsoppsett

### Azure CLI-autentisering (Anbefalt)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Enhetskode-autentisering
Hvis du bruker et system uten skjerm eller har problemer med nettleseren:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
For automatiserte miljøer:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasjon

### Global konfigurasjon
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Miljøvariabler
Legg til i skallets profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
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
- Malgjennomgang
- Overvåking av utplasseringer

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
1. Installer Azure-pluginen
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
Legg azd manuelt til PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nettverk/proxy-problemer
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versjonskonflikter
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Få mer hjelp
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Oppdatering av azd

### Automatiske oppdateringer
azd vil varsle deg når oppdateringer er tilgjengelige:
```bash
azd version --check-for-updates
```

### Manuelle oppdateringer

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

## Neste steg

1. **Fullfør autentisering**: Sørg for at du kan få tilgang til Azure-abonnementet ditt
2. **Prøv din første utplassering**: Følg [Første prosjektveiledning](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer IDE-en din**: Sett opp utviklingsmiljøet ditt

## Support

Hvis du støter på problemer:
- [Offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Diskusjoner i fellesskapet](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Forrige:** [Hoveddokumentasjon](../../README.md) | **Neste:** [AZD Grunnleggende](azd-basics.md)

**Installasjon fullført!** Fortsett til [Ditt første prosjekt](first-project.md) for å begynne å bygge med azd.

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
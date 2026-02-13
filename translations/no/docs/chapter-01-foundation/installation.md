# Installasjon og oppsettguide

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag og rask start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md)
- **➡️ Neste**: [Your First Project](first-project.md)
- **🚀 Neste kapittel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende guiden tar deg gjennom installasjon og konfigurasjon av Azure Developer CLI (azd) på systemet ditt. Du lærer flere installasjonsmetoder for ulike operativsystemer, autentiseringsoppsett og initial konfigurasjon for å forberede utviklingsmiljøet ditt for Azure-distribusjoner.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Installere Azure Developer CLI på ditt operativsystem
- Konfigurere autentisering mot Azure med flere metoder
- Sette opp utviklingsmiljøet med nødvendige forutsetninger
- Forstå ulike installasjonsmuligheter og når du bør bruke hver av dem
- Feilsøke vanlige installasjons- og oppsettsproblemer

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Installere azd ved å bruke passende metode for din plattform
- Autentisere mot Azure ved å bruke azd auth login
- Verifisere installasjonen og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet ditt for optimal bruk av azd
- Løse vanlige installasjonsproblemer på egen hånd

Denne guiden hjelper deg med å installere og konfigurere Azure Developer CLI på systemet ditt, uavhengig av operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For autentisering og ressursadministrasjon
- **Git** - For å klone maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installasjonsmetoder

### Windows

#### Option 1: PowerShell (Anbefalt)
```powershell
# Kjør som administrator eller med forhøyede rettigheter
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manuell installasjon
1. Last ned den nyeste utgivelsen fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH-miljøvariabelen

### macOS

#### Option 1: Homebrew (Anbefalt)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Installasjonsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manuell installasjon
```bash
# Last ned og installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Installasjonsskript (Anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Pakkebehandlere

**Ubuntu/Debian:**
```bash
# Legg til Microsofts pakkelager
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Legg til Microsofts pakkearkiv
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd kommer forhåndsinstallert i GitHub Codespaces. Opprett en codespace og begynn å bruke azd umiddelbart.

### Docker

```bash
# Kjør azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opprett et alias for enklere bruk
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiser installasjonen

Etter installasjon, verifiser at azd fungerer riktig:

```bash
# Sjekk versjon
azd version

# Vis hjelp
azd --help

# Vis tilgjengelige maler
azd template list
```

Forventet output:
```
azd version 1.x.x (commit xxxxxx)
```

**Merk**: Det faktiske versjonsnummeret vil variere. Sjekk [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for nyeste versjon.

**✅ Sjekkliste for vellykket installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommandodokumentasjon
- [ ] `azd template list` viser tilgjengelige maler
- [ ] `az account show` viser ditt Azure-abonnement
- [ ] Du kan opprette en testmappe og kjøre `azd init` vellykket

**Hvis alle sjekkene er ok, er du klar til å gå videre til [Your First Project](first-project.md)!**

## Autentiseringsoppsett

### Azure CLI-autentisering (Anbefalt)
```bash
# Installer Azure CLI hvis det ikke allerede er installert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logg inn på Azure
az login

# Bekreft autentisering
az account show
```

### Device Code-autentisering
Hvis du er på et headless-system eller har problemer med nettleseren:
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
# Angi standardabonnement
azd config set defaults.subscription <subscription-id>

# Angi standardplassering
azd config set defaults.location eastus2

# Vis hele konfigurasjonen
azd config list
```

### Miljøvariabler
Legg til i skallprofilen din (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfigurasjon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfigurasjon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktiver feilsøkingslogging
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
- Integrert terminalkommandoer
- Malutforsking
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
1. Installer Azure-pluginen
2. Konfigurer Azure-legitimasjon
3. Bruk integrert terminal for azd-kommandoer

## 🐛 Feilsøking av installasjon

### Vanlige problemer

#### Permission Denied (Windows)
```powershell
# Kjør PowerShell som administrator
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

#### Nettverk/Proxy-problemer
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hopp over SSL-verifisering (anbefales ikke i produksjon)
azd config set http.insecure true
```

#### Versjonskonflikter
```bash
# Fjern gamle installasjoner
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Rydd opp i konfigurasjonen
rm -rf ~/.azd
```

### Få mer hjelp
```bash
# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd <command> --debug

# Vis gjeldende konfigurasjon
azd config list

# Vis gjeldende utrullingsstatus
azd show
```

## Oppdatere azd

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

## 💡 Ofte stilte spørsmål

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

**Du trenger begge**: azd bruker az CLI for autentisering
</details>

<details>
<summary><strong>Kan jeg bruke azd med eksisterende Azure-ressurser?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressurser inn i azd-miljøer
2. Referere eksisterende ressurser i dine Bicep-maler
3. Bruke azd for nye distribusjoner sammen med eksisterende infrastruktur

Se [Configuration Guide](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure for myndigheter
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan jeg bruke azd i CI/CD-pipelines?</strong></summary>

Absolutt! azd er designet for automatisering:
- Integrasjon med GitHub Actions
- Støtte for Azure DevOps
- Service principal-autentisering
- Ikke-interaktiv modus

Se [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hva koster det å bruke azd?</strong></summary>

azd i seg selv er **helt gratis** og åpen kildekode. Du betaler kun for:
- Azure-ressursene du distribuerer
- Azure-forbrukskostnader (compute, lagring, osv.)

Bruk `azd provision --preview` for å estimere kostnader før distribusjon.
</details>

## Neste steg

1. **Fullfør autentisering**: Sørg for at du har tilgang til Azure-abonnementet ditt
2. **Prøv din første distribusjon**: Følg [First Project Guide](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer IDE-en din**: Sett opp utviklingsmiljøet ditt

## Støtte

Hvis du støter på problemer:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag og rask start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md) 
- **➡️ Neste**: [Your First Project](first-project.md)
- **🚀 Neste kapittel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installasjon fullført!** Fortsett til [Your First Project](first-project.md) for å begynne å bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi anstrenger oss for å være nøyaktige, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-21T15:13:07+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "no"
}
-->
# Installasjons- og Oppsettsguide

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md)
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende guiden vil veilede deg gjennom installasjon og konfigurasjon av Azure Developer CLI (azd) på systemet ditt. Du vil lære flere installasjonsmetoder for ulike operativsystemer, autentiseringsoppsett og grunnleggende konfigurasjon for å forberede utviklingsmiljøet ditt for Azure-distribusjoner.

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
- Verifisere installasjonen din og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet ditt for optimal bruk av azd
- Løse vanlige installasjonsproblemer på egen hånd

Denne guiden vil hjelpe deg med å installere og konfigurere Azure Developer CLI på systemet ditt, uavhengig av operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - For autentisering og ressursadministrasjon
- **Git** - For kloning av maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installasjonsmetoder

### Windows

#### Alternativ 1: PowerShell (Anbefalt)
```powershell
# Kjør som administrator eller med forhøyede rettigheter
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

#### Alternativ 4: Manuell Installering
1. Last ned den nyeste versjonen fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH-miljøvariabelen

### macOS

#### Alternativ 1: Homebrew (Anbefalt)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installeringsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell Installering
```bash
# Last ned og installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installeringsskript (Anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkehåndterere

**Ubuntu/Debian:**
```bash
# Legg til Microsoft-pakkerepositorium
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Legg til Microsoft-pakkelager
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd er forhåndsinstallert i GitHub Codespaces. Bare opprett en codespace og begynn å bruke azd umiddelbart.

### Docker

```bash
# Kjør azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opprett et alias for enklere bruk
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiser Installasjon

Etter installasjon, verifiser at azd fungerer korrekt:

```bash
# Sjekk versjon
azd version

# Vis hjelp
azd --help

# List tilgjengelige maler
azd template list
```

Forventet utdata:
```
azd version 1.5.0 (commit abc123)
```

**✅ Sjekkliste for Vellykket Installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommandodokumentasjon
- [ ] `azd template list` viser tilgjengelige maler
- [ ] `az account show` viser Azure-abonnementet ditt
- [ ] Du kan opprette en testmappe og kjøre `azd init` uten problemer

**Hvis alle sjekker er bestått, er du klar til å gå videre til [Ditt Første Prosjekt](first-project.md)!**

## Autentiseringsoppsett

### Azure CLI Autentisering (Anbefalt)
```bash
# Installer Azure CLI hvis ikke allerede installert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logg inn på Azure
az login

# Verifiser autentisering
az account show
```

### Enhetskode Autentisering
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

### Global Konfigurasjon
```bash
# Sett standardabonnement
azd config set defaults.subscription <subscription-id>

# Sett standardplassering
azd config set defaults.location eastus2

# Vis all konfigurasjon
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
2. Gå til Utvidelser (Ctrl+Shift+X)
3. Søk etter "Azure Developer CLI"
4. Installer utvidelsen

Funksjoner:
- IntelliSense for azure.yaml
- Integrerte terminalkommandoer
- Malgjennomgang
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

## 🐛 Feilsøking av Installasjon

### Vanlige Problemer

#### Tillatelse Nektet (Windows)
```powershell
# Kjør PowerShell som Administrator
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

#### Nettverks-/Proxyproblemer
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hopp over SSL-verifisering (ikke anbefalt for produksjon)
azd config set http.insecure true
```

#### Versjonskonflikter
```bash
# Fjern gamle installasjoner
# Windows: winget avinstaller Microsoft.Azd
# macOS: brew avinstaller azd
# Linux: sudo apt fjern azd

# Rens konfigurasjon
rm -rf ~/.azd
```

### Få Mer Hjelp
```bash
# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd <command> --debug

# Vis detaljerte logger
azd logs

# Sjekk systeminformasjon
azd info
```

## Oppdatering av azd

### Automatiske Oppdateringer
azd vil varsle deg når oppdateringer er tilgjengelige:
```bash
azd version --check-for-updates
```

### Manuelle Oppdateringer

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

## 💡 Ofte Stilte Spørsmål

<details>
<summary><strong>Hva er forskjellen mellom azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavnivåverktøy for administrasjon av individuelle Azure-ressurser
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
1. Importere eksisterende ressurser til azd-miljøer
2. Referere til eksisterende ressurser i Bicep-maler
3. Bruke azd for nye distribusjoner sammen med eksisterende infrastruktur

Se [Konfigurasjonsguide](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure Regjering
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
- GitHub Actions-integrasjon
- Støtte for Azure DevOps
- Service principal-autentisering
- Ikke-interaktiv modus

Se [Distribusjonsguide](../deployment/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hva koster det å bruke azd?</strong></summary>

azd i seg selv er **helt gratis** og åpen kildekode. Du betaler kun for:
- Azure-ressursene du distribuerer
- Azure-forbrukskostnader (databehandling, lagring, osv.)

Bruk `azd provision --preview` for å estimere kostnader før distribusjon.
</details>

## Neste Steg

1. **Fullfør autentisering**: Sørg for at du kan få tilgang til Azure-abonnementet ditt
2. **Prøv din første distribusjon**: Følg [Første Prosjekt Guide](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer IDE-en din**: Sett opp utviklingsmiljøet ditt

## Støtte

Hvis du støter på problemer:
- [Offisiell Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter Problemer](https://github.com/Azure/azure-dev/issues)
- [Diskusjoner i Fellesskapet](https://github.com/Azure/azure-dev/discussions)
- [Azure Støtte](https://azure.microsoft.com/support/)

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md) 
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installasjon Fullført!** Fortsett til [Ditt Første Prosjekt](first-project.md) for å begynne å bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
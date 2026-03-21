# Installasjons- og oppsettsveiledning

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md)
- **➡️ Neste**: [Your First Project](first-project.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-første utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende veiledningen vil lede deg gjennom installasjon og konfigurering av Azure Developer CLI (azd) på ditt system. Du vil lære flere installasjonsmetoder for forskjellige operativsystemer, oppsett av autentisering og initial konfigurasjon for å forberede ditt utviklingsmiljø for Azure-distribusjoner.

## Læringsmål

Mot slutten av denne leksjonen vil du kunne:
- Lykke til med å installere Azure Developer CLI på ditt operativsystem
- Konfigurere autentisering med Azure ved flere metoder
- Sette opp utviklingsmiljøet ditt med nødvendige forutsetninger
- Forstå ulike installasjonsalternativer og når du bør bruke hver av dem
- Feilsøke vanlige installasjons- og oppsettsproblemer

## Læringsutbytte

Etter å ha fullført denne leksjonen, vil du kunne:
- Installere azd ved hjelp av riktig metode for din plattform
- Autentisere med Azure ved hjelp av azd auth login
- Verifisere din installasjon og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet ditt for optimal bruk av azd
- Løse vanlige installasjonsproblemer på egenhånd

Denne veiledningen hjelper deg med å installere og konfigurere Azure Developer CLI på ditt system, uansett operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - For autentisering og ressursadministrasjon
- **Git** - For å klone maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installasjonsmetoder

### Windows

#### Alternativ 1: PowerShell (anbefalt)
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

#### Alternativ 4: Manuell installasjon
1. Last ned nyeste versjon fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH-miljøvariabelen

### macOS

#### Alternativ 1: Homebrew (anbefalt)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installeringsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell installasjon
```bash
# Last ned og installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installeringsskript (anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkebehandlere

**Ubuntu/Debian:**
```bash
# Legg til Microsoft pakkelager
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Legg til Microsoft-pakkelageret
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd er forhåndsinstallert i GitHub Codespaces. Bare opprett en codespace og begynn å bruke azd umiddelbart.

### Docker

```bash
# Kjør azd i en beholder
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Lag en alias for enklere bruk
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiser installasjonen

Etter installasjon, verifiser at azd fungerer riktig:

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
azd version 1.x.x (commit xxxxxx)
```

**Merk**: Den faktiske versjonsnummeret kan variere. Sjekk [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for nyeste versjon.

**✅ Sjekkliste for vellykket installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommandodokumentasjon
- [ ] `azd template list` viser tilgjengelige maler
- [ ] `az account show` viser ditt Azure-abonnement
- [ ] Du kan opprette en testmappe og kjøre `azd init` suksessfullt

**Hvis alle sjekker er gode, er du klar til å gå videre til [Your First Project](first-project.md)!**

## Autentiseringsoppsett

### Azure CLI-autentisering (anbefalt)
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
Hvis du er på et headless system eller har nettleserproblemer:
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

# Vis all konfigurasjon
azd config list
```

### Miljøvariabler
Legg til i ditt shells profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfigurasjon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfigurasjon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktiver debug-logging
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
- Integrerte terminalkommandoer
- Bla i maler
- Overvåking av distribusjoner

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

### Vanlige problemer

#### Tillatelse nektet (Windows)
```powershell
# Kjør PowerShell som administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Legg manuelt til azd i din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nettverks-/proxy-problemer
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hopp over SSL-verifisering (ikke anbefalt i produksjon)
azd config set http.insecure true
```

#### Versjonskonflikter
```bash
# Fjern gamle installasjoner
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Rens konfigurasjon
rm -rf ~/.azd
```

### Få mer hjelp
```bash
# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd <command> --debug

# Vis gjeldende konfigurasjon
azd config list

# Vis gjeldende distribusjonsstatus
azd show
```

## Oppdatering av azd

### Automatisk oppdatering
azd varsler deg når oppdateringer er tilgjengelige:
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
<summary><strong>Hva er forskjellen på azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavnivåverktøy for å administrere individuelle Azure-ressurser
- `az webapp create`, `az storage account create`
- En ressurs av gangen
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

Se [Konfigurasjonsveiledning](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
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
<summary><strong>Kan jeg bruke azd i CI/CD pipelines?</strong></summary>

Absolutt! azd er designet for automatisering:
- GitHub Actions-integrasjon
- Azure DevOps-støtte
- Service principal-autentisering
- Ikke-interaktiv modus

Se [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hva koster det å bruke azd?</strong></summary>

azd er **helt gratis** og åpen kildekode. Du betaler kun for:
- Azure-ressurser du distribuerer
- Azure-forbrukskostnader (compute, lagring, etc.)

Bruk `azd provision --preview` for å estimere kostnader før distribusjon.
</details>

## Neste steg

1. **Fullfør autentisering**: Sørg for at du har tilgang til Azure-abonnementet ditt
2. **Prøv din første distribusjon**: Følg [First Project Guide](first-project.md)
3. **Utforsk maler**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer din IDE**: Sett opp utviklingsmiljøet ditt

## Støtte

Hvis du opplever problemer:
- [Offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Diskusjoner i fellesskapet](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommando-veiledning direkte i editoren med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md) 
- **➡️ Neste**: [Your First Project](first-project.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-første utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installasjon fullført!** Fortsett til [Your First Project](first-project.md) for å begynne å bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Installations- og Opsætningsguide

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md)
- **➡️ Næste**: [Dit Første Projekt](first-project.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende guide vil føre dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du vil lære flere installationsmetoder til forskellige operativsystemer, opsætning af autentifikation og den indledende konfiguration for at forberede dit udviklingsmiljø til Azure-udrulninger.

## Læringsmål

Ved slutningen af denne lektion vil du:
- Succesfuldt have installeret Azure Developer CLI på dit operativsystem
- Konfigureret autentifikation med Azure ved hjælp af flere metoder
- Opsat dit udviklingsmiljø med nødvendige forudsætninger
- Forstået forskellige installationsmuligheder og hvornår de skal bruges
- Kunnet fejlfinde almindelige installations- og opsætningsproblemer

## Læringsresultater

Efter at have gennemført denne lektion vil du være i stand til at:
- Installere azd ved hjælp af den passende metode til din platform
- Autentificere med Azure ved hjælp af `azd auth login`
- Verificere din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø til optimal brug af azd
- Løse almindelige installationsproblemer selvstændigt

Denne guide hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset dit operativsystem eller udviklingsmiljø.

## Forudsætninger

Før du installerer azd, skal du sikre dig, at du har:
- **Azure-abonnement** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Til autentifikation og ressourcehåndtering
- **Git** - Til kloning af skabeloner og versionskontrol
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installationsmetoder

### Windows

#### Mulighed 1: PowerShell (Anbefalet)
```powershell
# Kør som Administrator eller med forhøjede rettigheder
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Mulighed 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Mulighed 3: Chocolatey
```cmd
choco install azd
```

#### Mulighed 4: Manuel Installation
1. Download den nyeste udgivelse fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Udpak til `C:\Program Files\azd\`
3. Tilføj til PATH-miljøvariablen

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

#### Mulighed 3: Manuel Installation
```bash
# Download og installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Mulighed 1: Installationsscript (Anbefalet)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 2: Pakkehåndterere

**Ubuntu/Debian:**
```bash
# Tilføj Microsoft-pakkelager
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tilføj Microsoft-pakkelager
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd er forudinstalleret i GitHub Codespaces. Opret blot en codespace og begynd at bruge azd med det samme.

### Docker

```bash
# Kør azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opret et alias for nemmere brug
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificer Installation

Efter installationen skal du verificere, at azd fungerer korrekt:

```bash
# Kontroller version
azd version

# Vis hjælp
azd --help

# Vis tilgængelige skabeloner
azd template list
```

Forventet output:
```
azd version 1.5.0 (commit abc123)
```

**✅ Installationssucces Tjekliste:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommandodokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] `az account show` viser dit Azure-abonnement
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek er bestået, er du klar til at fortsætte til [Dit Første Projekt](first-project.md)!**

## Opsætning af Autentifikation

### Azure CLI Autentifikation (Anbefalet)
```bash
# Installer Azure CLI, hvis det ikke allerede er installeret
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Log ind på Azure
az login

# Bekræft godkendelse
az account show
```

### Enhedskode Autentifikation
Hvis du bruger et system uden skærm eller har browserproblemer:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Til automatiserede miljøer:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguration

### Global Konfiguration
```bash
# Indstil standardabonnement
azd config set defaults.subscription <subscription-id>

# Indstil standardlokation
azd config set defaults.location eastus2

# Vis alle konfigurationer
azd config list
```

### Miljøvariabler
Tilføj til din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktiver fejlsøgningslogning
```

## IDE Integration

### Visual Studio Code
Installer Azure Developer CLI-udvidelsen:
1. Åbn VS Code
2. Gå til Udvidelser (Ctrl+Shift+X)
3. Søg efter "Azure Developer CLI"
4. Installer udvidelsen

Funktioner:
- IntelliSense til azure.yaml
- Integrerede terminalkommandoer
- Skabelonbrowsing
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
1. Installer Azure-pluginet
2. Konfigurer Azure-legitimationsoplysninger
3. Brug integreret terminal til azd-kommandoer

## 🐛 Fejlfinding af Installation

### Almindelige Problemer

#### Adgang nægtet (Windows)
```powershell
# Kør PowerShell som Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Problemer
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

#### Netværks-/Proxyproblemer
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Spring SSL-verifikation over (ikke anbefalet til produktion)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Fjern gamle installationer
# Windows: winget afinstaller Microsoft.Azd
# macOS: brew afinstaller azd
# Linux: sudo apt fjern azd

# Rens konfiguration
rm -rf ~/.azd
```

### Få Mere Hjælp
```bash
# Aktiver fejlsøgningslogning
export AZD_DEBUG=true
azd <command> --debug

# Se detaljerede logfiler
azd logs

# Kontroller systeminfo
azd info
```

## Opdatering af azd

### Automatiske Opdateringer
azd giver besked, når opdateringer er tilgængelige:
```bash
azd version --check-for-updates
```

### Manuelle Opdateringer

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

## 💡 Ofte Stillede Spørgsmål

<details>
<summary><strong>Hvad er forskellen mellem azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavniveauværktøj til håndtering af individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturhåndtering

**Azure Developer CLI (azd)**: Højniveauværktøj til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Skabelonbaserede arbejdsgange
- Fokus på udviklerproduktivitet

**Du har brug for begge**: azd bruger az CLI til autentifikation
</details>

<details>
<summary><strong>Kan jeg bruge azd med eksisterende Azure-ressourcer?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressourcer til azd-miljøer
2. Referere til eksisterende ressourcer i dine Bicep-skabeloner
3. Bruge azd til nye udrulninger sammen med eksisterende infrastruktur

Se [Konfigurationsguide](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure Regering
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan jeg bruge azd i CI/CD-pipelines?</strong></summary>

Absolut! azd er designet til automatisering:
- GitHub Actions-integration
- Azure DevOps-support
- Service principal-autentifikation
- Ikke-interaktiv tilstand

Se [Udrulningsguide](../deployment/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

azd er **helt gratis** og open-source. Du betaler kun for:
- Azure-ressourcer, du udruller
- Azure-forbrugsomkostninger (beregning, lager osv.)

Brug `azd provision --preview` til at estimere omkostninger før udrulning.
</details>

## Næste Skridt

1. **Fuldfør autentifikation**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Første Projekt Guide](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer din IDE**: Opsæt dit udviklingsmiljø

## Support

Hvis du støder på problemer:
- [Officiel Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter Problemer](https://github.com/Azure/azure-dev/issues)
- [Fællesskabsdiskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md) 
- **➡️ Næste**: [Dit Første Projekt](first-project.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installation Fuldført!** Fortsæt til [Dit Første Projekt](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
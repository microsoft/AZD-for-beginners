# Installation og opsætningsguide

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md)
- **➡️ Næste**: [Your First Project](first-project.md)
- **🚀 Næste kapitel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende guide vil føre dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du lærer flere installationsmetoder for forskellige styresystemer, opsætning af autentificering og initial konfiguration for at forberede dit udviklingsmiljø til Azure-distributioner.

## Læringsmål

Når du har gennemført denne lektion, vil du:
- Installere Azure Developer CLI på dit styresystem
- Konfigurere autentificering med Azure ved hjælp af flere metoder
- Sætte dit udviklingsmiljø op med nødvendige forudsætninger
- Forstå forskellige installationsmuligheder og hvornår du skal bruge hver
- Fejlfinde almindelige installations- og opsætningsproblemer

## Læringsudbytte

Efter at have gennemført denne lektion vil du være i stand til at:
- Installere azd ved hjælp af den passende metode til din platform
- Autentificere med Azure ved hjælp af azd auth login
- Bekræfte din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø for optimal brug af azd
- Løse almindelige installationsproblemer selvstændigt

Denne guide hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset dit operativsystem eller udviklingsmiljø.

## Forudsætninger

Før du installerer azd, skal du sikre dig, at du har:
- **Azure subscription** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Til autentificering og ressourceadministration
- **Git** - Til at klone skabeloner og versionskontrol
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installationsmetoder

### Windows

#### Mulighed 1: PowerShell (Anbefalet)
```powershell
# Kør som administrator eller med forhøjede privilegier
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

#### Mulighed 4: Manuel installation
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

#### Mulighed 3: Manuel installation
```bash
# Hent og installer
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
# Tilføj Microsofts pakkerepositorium
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tilføj Microsoft-pakkearkiv
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

## ✅ Bekræft installation

Efter installation, bekræft at azd fungerer korrekt:

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
azd version 1.x.x (commit xxxxxx)
```

**Bemærk**: Det faktiske versionsnummer kan variere. Tjek [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for den nyeste version.

**✅ Tjekliste for vellykket installation:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommando-dokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] `az account show` viser dit Azure-abonnement
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek passer, er du klar til at gå videre til [Your First Project](first-project.md)!**

## Autentificeringsopsætning

### Azure CLI-autentificering (Anbefalet)
```bash
# Installer Azure CLI, hvis det ikke allerede er installeret
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Log ind på Azure
az login

# Bekræft autentificering
az account show
```

### Autentificering med enhedskode
Hvis du er på et headless-system eller har browserproblemer:
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

### Global konfiguration
```bash
# Indstil standardabonnement
azd config set defaults.subscription <subscription-id>

# Indstil standardplacering
azd config set defaults.location eastus2

# Vis alle indstillinger
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
export AZD_DEBUG=true  # Aktivér fejlsøgningslogning
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
- Gennemse skabeloner
- Overvågning af deployment

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
3. Brug den integrerede terminal til azd-kommandoer

## 🐛 Fejlfinding af installationen

### Almindelige problemer

#### Tilladelse nægtet (Windows)
```powershell
# Kør PowerShell som administrator
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
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Spring SSL-verifikation over (anbefales ikke i produktion)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Fjern gamle installationer
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Ryd konfigurationen
rm -rf ~/.azd
```

### Få mere hjælp
```bash
# Aktivér fejlsøgningslogning
export AZD_DEBUG=true
azd <command> --debug

# Vis aktuel konfiguration
azd config list

# Vis aktuel udrulningsstatus
azd show
```

## Opdatering af azd

### Automatiske opdateringer
azd vil give besked, når opdateringer er tilgængelige:
```bash
azd version --check-for-updates
```

### Manuel opdatering

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

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvad er forskellen mellem azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavniveauværktøj til at administrere individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturadministration

**Azure Developer CLI (azd)**: Værktøj på højt niveau til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Skabelonbaserede workflows
- Fokus på udviklerproduktivitet

**Du har brug for begge**: azd bruger az CLI til autentificering
</details>

<details>
<summary><strong>Kan jeg bruge azd med eksisterende Azure-ressourcer?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressourcer til azd-miljøer
2. Referere eksisterende ressourcer i dine Bicep-skabeloner
3. Bruge azd til nye udrulninger sammen med eksisterende infrastruktur

Se [Configuration Guide](configuration.md) for detaljer.
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
- Azure DevOps-understøttelse
- Service principal-autentificering
- Non-interaktiv tilstand

Se [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

azd i sig selv er **fuldstændig gratis** og open-source. Du betaler kun for:
- Azure-ressourcer, du udruller
- Azure-forbrugsomkostninger (compute, storage osv.)

Brug `azd provision --preview` for at estimere omkostninger inden udrulning.
</details>

## Næste skridt

1. **Fuldfør autentificeringen**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [First Project Guide](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer dit IDE**: Sæt dit udviklingsmiljø op

## Support

Hvis du støder på problemer:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovejledning direkte i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [AZD Basics](azd-basics.md) 
- **➡️ Næste**: [Your First Project](first-project.md)
- **🚀 Næste kapitel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation fuldført!** Fortsæt til [Your First Project](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
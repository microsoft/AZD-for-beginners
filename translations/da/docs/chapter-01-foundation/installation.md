# Installation og opsætningsvejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Fundament & Hurtigstart
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md)
- **➡️ Næste**: [Dit første projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende vejledning guider dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du lærer flere installationsmetoder til forskellige operativsystemer, opsætning af autentificering og indledende konfiguration for at forberede dit udviklingsmiljø til udrulninger i Azure.

## Læringsmål

Ved slutningen af denne lektion vil du:
- Installere Azure Developer CLI på dit operativsystem
- Konfigurere autentificering med Azure ved hjælp af flere metoder
- Sætte dit udviklingsmiljø op med nødvendige forudsætninger
- Forstå forskellige installationsmuligheder og hvornår du skal bruge hver enkelt
- Fejlsøge almindelige installations- og opsætningsproblemer

## Læringsudbytte

Efter at have gennemført denne lektion vil du være i stand til at:
- Installere azd ved hjælp af den passende metode til din platform
- Autentificere med Azure ved hjælp af azd auth login
- Bekræfte din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø til optimal brug af azd
- Løse almindelige installationsproblemer selvstændigt

Denne vejledning hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset hvilket operativsystem eller udviklingsmiljø du bruger.

## Forudsætninger

Før du installerer azd, skal du sikre dig, at du har:
- **Azure-abonnement** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Til autentificering og ressourceadministration
- **Git** - Til at klone skabeloner og versionsstyring
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installationsmetoder

### Windows

#### Mulighed 1: Windows Package Manager (anbefalet)
```cmd
winget install microsoft.azd
```

#### Mulighed 2: PowerShell-installationsscript
```powershell
# Nyttig, når winget ikke er tilgængelig
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Mulighed 3: Chocolatey
```cmd
choco install azd
```

#### Mulighed 4: Manuel installation
1. Download den seneste udgivelse fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Udpak til `C:\Program Files\azd\`
3. Føj til PATH-miljøvariablen

### macOS

#### Mulighed 1: Homebrew (anbefalet)
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

#### Mulighed 1: Installationsscript (anbefalet)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 2: Pakkestyringsprogrammer

**Manuel installation fra release-artefakter:**
```bash
# Hent den seneste arkivfil til din Linux-arkitektur fra:
# https://github.com/Azure/azure-dev/releases
# Udpak den derefter og tilføj azd-binæren til din PATH.
```

### GitHub Codespaces

Nogle Codespaces og dev-container-miljøer inkluderer allerede `azd`, men du bør verificere det i stedet for at antage det:

```bash
azd version
```

Hvis `azd` mangler, installer det med standardscriptet for miljøet.

### Docker

```bash
# Kør azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opret et alias for nemmere brug
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificer installationen

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
azd version 1.x.x (commit xxxxxx)
```

**Bemærk**: Det faktiske versionsnummer kan variere. Tjek [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for den seneste version.

**✅ Installationssucces-tjekliste:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommandodokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek er bestået, er du klar til at fortsætte til [Dit første projekt](first-project.md)!**

## Autentificeringsopsætning

### Anbefalet begynderopsætning

Hvis du følger AZD-første arbejdsgange, skal du logge ind med `azd auth login`.

```bash
# Påkrævet for AZD-kommandoer såsom azd up
azd auth login

# Kontroller AZD-autentificeringsstatus
azd auth login --check-status
```

Brug Azure CLI-logon kun, når du planlægger at køre `az`-kommandoer selv under kurset.

### Azure CLI-autentificering (valgfrit)
```bash
# Installer Azure CLI, hvis det ikke allerede er installeret
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: se installationsdokumentationen for Azure CLI til din distribution

# Log ind på Azure
az login

# Bekræft autentificering
az account show
```

### Hvilken logon-flow skal du bruge?

- Brug `azd auth login`, hvis du følger begynder AZD-forløbet og primært kører `azd`-kommandoer.
- Brug også `az login`, når du vil køre Azure CLI-kommandoer som `az account show` eller inspicere ressourcer direkte.
- Hvis en øvelse inkluderer både `azd` og `az`-kommandoer, kør begge logon-kommandoer én gang i starten.

### Device code-autentificering
Hvis du er på et headless-system eller har problemer med browseren:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automatiserede miljøer:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valider din komplette opsætning

Hvis du vil have en hurtig kontrol af beredskab, før du starter Kapitel 1:

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
# Indstil standardabonnement
azd config set defaults.subscription <subscription-id>

# Indstil standardplacering
azd config set defaults.location eastus2

# Vis hele konfigurationen
azd config show
```

### Miljøvariabler
Tilføj til din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktivér debug-logning
```

## IDE-integration

### Visual Studio Code
Installer Azure Developer CLI-udvidelsen:
1. Åbn VS Code
2. Gå til Udvidelser (Ctrl+Shift+X)
3. Søg efter "Azure Developer CLI"
4. Installer udvidelsen

Funktioner:
- IntelliSense for azure.yaml
- Integrerede terminalkommandoer
- Gennemse skabeloner
- Udrulningsmonitorering

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
1. Installer Azure-plugin'et
2. Konfigurer Azure-legitimationsoplysninger
3. Brug den integrerede terminal til azd-kommandoer

## 🐛 Fejlfinding af installation

### Almindelige problemer

#### Adgang nægtet (Windows)
```powershell
# Kør PowerShell som administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Tilføj azd manuelt til din PATH:

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
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: Fjern den tidligere azd-binære fil eller symbolske link, før du geninstallerer

# Ryd konfigurationen
rm -rf ~/.azd
```

### Få mere hjælp
```bash
# Aktivér debug-logning
export AZD_DEBUG=true
azd <command> --debug

# Vis nuværende konfiguration
azd config show

# Vis nuværende udrulningsstatus
azd show
```

## Opdatering af azd

### Opdateringskontrol
azd advarer, når en nyere udgivelse er tilgængelig, og du kan bekræfte din aktuelle build med:
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

**Azure CLI (az)**: Lavniveauværktøj til at administrere individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturadministration

**Azure Developer CLI (azd)**: Højniveaoværktøj til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Skabelonbaserede arbejdsgange
- Fokus på udviklerproduktivitet

**Du har brug for begge**: azd bruger az CLI til autentificering
</details>

<details>
<summary><strong>Kan jeg bruge azd med eksisterende Azure-ressourcer?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressourcer i azd-miljøer
2. Referere til eksisterende ressourcer i dine Bicep-skabeloner
3. Bruge azd til nye udrulninger sammen med eksisterende infrastruktur

Se [Konfigurationsvejledning](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer clouden:
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

Absolut! azd er designet til automation:
- GitHub Actions-integration
- Azure DevOps-understøttelse
- Service principal-autentificering
- Ikke-interaktiv tilstand

Se [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

azd i sig selv er **helt gratis** og open source. Du betaler kun for:
- Azure-ressourcer, du udruller
- Azure-forbrugsomkostninger (compute, storage osv.)

Brug `azd provision --preview` til at estimere omkostninger før udrulning.
</details>

## Næste skridt

1. **Fuldfør autentificeringen**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Guiden til første projekt](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer dit IDE**: Opsæt dit udviklingsmiljø

## Support

Hvis du støder på problemer:
- [Officiel dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Fællesskabsdiskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure-support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommandovejledning direkte i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Fundament & Hurtigstart
- **⬅️ Forrige**: [AZD Grundlæggende](azd-basics.md) 
- **➡️ Næste**: [Dit første projekt](first-project.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation fuldført!** Fortsæt til [Dit første projekt](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
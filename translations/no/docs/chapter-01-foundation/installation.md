# Installasjons- og oppsettsveiledning

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md)
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende veiledningen vil lede deg gjennom å installere og konfigurere Azure Developer CLI (azd) på systemet ditt. Du vil lære flere installasjonsmetoder for ulike operativsystemer, oppsett av autentisering og initial konfigurasjon for å forberede utviklingsmiljøet ditt for Azure-distribusjoner.

## Læringsmål

Innen slutten av denne leksjonen vil du:
- Vellykket installere Azure Developer CLI på ditt operativsystem
- Konfigurere autentisering med Azure ved hjelp av flere metoder
- Sette opp utviklingsmiljøet ditt med nødvendige forutsetninger
- Forstå ulike installasjonsalternativer og når hvert skal brukes
- Feilsøke vanlige problemer med installasjon og oppsett

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Installere azd ved bruk av passende metode for din plattform
- Autentisere med Azure ved hjelp av azd auth login
- Verifisere installasjonen og teste grunnleggende azd-kommandoer
- Konfigurere utviklingsmiljøet for optimal bruk av azd
- Løse vanlige installasjonsproblemer selvstendig

Denne veiledningen hjelper deg med å installere og konfigurere Azure Developer CLI på systemet ditt, uavhengig av operativsystem eller utviklingsmiljø.

## Forutsetninger

Før du installerer azd, sørg for at du har:
- **Azure-abonnement** - [Opprett en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - For autentisering og ressursadministrasjon
- **Git** - For å klone maler og versjonskontroll
- **Docker** (valgfritt) - For containeriserte applikasjoner

## Installingsmetoder

### Windows

#### Alternativ 1: Windows Package Manager (Anbefalt)
```cmd
winget install microsoft.azd
```

#### Alternativ 2: PowerShell Installasjonsskript
```powershell
# Nyttig når winget ikke er tilgjengelig
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell Installasjon
1. Last ned den nyeste versjonen fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pakk ut til `C:\Program Files\azd\`
3. Legg til i PATH miljøvariabelen

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
```bash
# Last ned og installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installasjonsskript (Anbefalt)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Pakkehåndterere

**Manuell installasjon fra release assets:**
```bash
# Last ned det nyeste arkivet for din Linux-arkitektur fra:
# https://github.com/Azure/azure-dev/releases
# Pakk det deretter ut og legg til azd-binæren i PATH-en din.
```

### GitHub Codespaces

Noen Codespaces- og dev container-miljøer inkluderer allerede `azd`, men du bør verifisere det i stedet for å anta:

```bash
azd version
```

Hvis `azd` mangler, installer det med det standard skriptet for miljøet.

### Docker

```bash
# Kjør azd i en beholder
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opprett et alias for enklere bruk
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiser installasjon

Etter installasjon, verifiser at azd fungerer riktig:

```bash
# Sjekk versjon
azd version

# Vis hjelp
azd --help

# List opp tilgjengelige maler
azd template list
```

Forventet utdata:
```
azd version 1.x.x (commit xxxxxx)
```

**Merk**: Den faktiske versjonsnummeret vil variere. Sjekk [Azure Developer CLI-utgivelser](https://github.com/Azure/azure-dev/releases) for siste versjon.

**✅ Sjekkliste for vellykket installasjon:**
- [ ] `azd version` viser versjonsnummer uten feil
- [ ] `azd --help` viser kommando-dokumentasjonen
- [ ] `azd template list` viser tilgjengelige maler
- [ ] Du kan opprette en testmappe og kjøre `azd init` med suksess

**Hvis alle tester er bestått, er du klar til å gå videre til [Ditt Første Prosjekt](first-project.md)!**

## Oppsett av autentisering

### Anbefalt oppsett for nybegynnere

For AZD-først arbeidsflyter, logg inn med `azd auth login`.

```bash
# Nødvendig for AZD-kommandoer som azd up
azd auth login

# Verifiser AZD autentiseringsstatus
azd auth login --check-status
```

Bruk Azure CLI-innlogging bare når du planlegger å kjøre `az`-kommandoer selv under kurset.

### Azure CLI-autentisering (valgfritt)
```bash
# Installer Azure CLI hvis det ikke allerede er installert
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: se dokumentasjonen for Azure CLI-installasjon for din distribusjon

# Logg inn på Azure
az login

# Verifiser autentisering
az account show
```

### Hvilket påloggingsflyt bør du bruke?

- Bruk `azd auth login` hvis du følger nybegynnerstien for AZD og hovedsakelig kjører `azd`-kommandoer.
- Bruk også `az login` når du vil kjøre Azure CLI-kommandoer som `az account show` eller inspisere ressurser direkte.
- Hvis en øvelse inkluderer både `azd` og `az` kommandoer, kjør begge påloggingskommandoene én gang i starten.

### Enhetskode-autentisering
Hvis du er på et headless system eller har problemer med nettleser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automatiserte miljøer:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valider ditt komplette oppsett

Hvis du vil ha en rask sjekk før du starter Kapittel 1:

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
# Sett standard abonnement
azd config set defaults.subscription <subscription-id>

# Sett standard plassering
azd config set defaults.location eastus2

# Vis all konfigurasjon
azd config show
```

### Miljøvariabler
Legg til i ditt shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfigurasjon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfigurasjon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktiver feilsøkingsloggføring
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

#### Tilgang nektet (Windows)
```powershell
# Kjør PowerShell som Administrator
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

#### Nettverk-/Proxy-problemer
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Hopp over SSL-verifisering (anbefales ikke for produksjon)
azd config set http.insecure true
```

#### Versjonskonflikter
```bash
# Fjern gamle installasjoner
# Windows: winget avinstaller microsoft.azd
# macOS: brew avinstaller azd
# Linux: fjern den forrige azd binærfilen eller symlinken før reinstallasjon

# Rens konfigurasjon
rm -rf ~/.azd
```

### Få mer hjelp
```bash
# Aktiver feilsøkingsloggføring
export AZD_DEBUG=true
azd <command> --debug

# Vis gjeldende konfigurasjon
azd config show

# Vis gjeldende distribusjonsstatus
azd show
```

## Oppdatering av azd

### Oppdateringssjekk
azd varsler når en ny utgivelse er tilgjengelig, og du kan bekrefte gjeldende versjon med:
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
- Én ressurs om gangen
- Infrastrukturforvaltningsfokus

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
2. Referere eksisterende ressurser i Bicep-malene dine
3. Bruke azd for nye distribusjoner ved siden av eksisterende infrastruktur

Se [Konfigurasjonsveiledning](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Fungerer azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer skyen:
```bash
# Azure-regjeringen
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
- Azure-ressursene du distribuerer
- Azure forbrukskostnader (compute, lagring osv.)

Bruk `azd provision --preview` for å estimere kostnader før distribusjon.
</details>

## Neste steg

1. **Fullfør autentiseringen**: Sørg for at du har tilgang til ditt Azure-abonnement
2. **Prøv din første distribusjon**: Følg [Første Prosjekt-veiledningen](first-project.md)
3. **Utforsk malene**: Bla gjennom tilgjengelige maler med `azd template list`
4. **Konfigurer din IDE**: Sett opp utviklingsmiljøet ditt

## Support

Hvis du møter problemer:
- [Offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapporter problemer](https://github.com/Azure/azure-dev/issues)
- [Diskusjoner i fellesskapet](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Få Azure-kommando-veiledning direkte i editoren din med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [AZD Grunnleggende](azd-basics.md) 
- **➡️ Neste**: [Ditt Første Prosjekt](first-project.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installasjon fullført!** Fortsett til [Ditt Første Prosjekt](first-project.md) for å begynne å bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på sitt opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
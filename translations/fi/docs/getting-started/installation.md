<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T06:34:10+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "fi"
}
-->
# Asennus- ja aloitusopas

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja pika-aloitus
- **⬅️ Edellinen**: [AZD Perusteet](azd-basics.md)
- **➡️ Seuraava**: [Ensimmäinen projekti](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-First Kehitys](../ai-foundry/azure-ai-foundry-integration.md)

## Johdanto

Tämä kattava opas opastaa sinut Azure Developer CLI:n (azd) asentamisessa ja konfiguroinnissa järjestelmääsi. Opit useita asennusmenetelmiä eri käyttöjärjestelmille, autentikoinnin asetuksia ja alkuperäistä konfigurointia, jotta kehitysympäristösi on valmis Azure-järjestelmiä varten.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Asentaa Azure Developer CLI:n käyttöjärjestelmääsi
- Konfiguroida autentikoinnin Azureen eri menetelmillä
- Valmistella kehitysympäristösi tarvittavilla edellytyksillä
- Ymmärtää eri asennusvaihtoehdot ja milloin käyttää niitä
- Ratkaista yleisiä asennus- ja konfigurointiongelmia

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Asentamaan azd:n sopivalla menetelmällä alustallesi
- Autentikoitumaan Azureen komennolla `azd auth login`
- Varmistamaan asennuksen ja testaamaan peruskomentoja
- Konfiguroimaan kehitysympäristösi optimaalista azd:n käyttöä varten
- Ratkaisemaan yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja konfiguroimaan Azure Developer CLI:n järjestelmääsi riippumatta käyttöjärjestelmästäsi tai kehitysympäristöstäsi.

## Esivaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Luo ilmainen tili](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentikointia ja resurssien hallintaa varten
- **Git** - Mallien kloonaamiseen ja versionhallintaan
- **Docker** (valinnainen) - Konttipohjaisia sovelluksia varten

## Asennusmenetelmät

### Windows

#### Vaihtoehto 1: PowerShell (suositeltu)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Vaihtoehto 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Vaihtoehto 3: Chocolatey
```cmd
choco install azd
```

#### Vaihtoehto 4: Manuaalinen asennus
1. Lataa uusin julkaisu [GitHubista](https://github.com/Azure/azure-dev/releases)
2. Pura tiedostot `C:\Program Files\azd\`-hakemistoon
3. Lisää PATH-ympäristömuuttujaan

### macOS

#### Vaihtoehto 1: Homebrew (suositeltu)
```bash
brew tap azure/azd
brew install azd
```

#### Vaihtoehto 2: Asennusskripti
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 3: Manuaalinen asennus
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Vaihtoehto 1: Asennusskripti (suositeltu)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 2: Pakettienhallinta

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

azd on esiasennettu GitHub Codespacesissa. Luo vain Codespace ja aloita azd:n käyttö välittömästi.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Asennuksen vahvistaminen

Asennuksen jälkeen varmista, että azd toimii oikein:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Odotettu tulos:
```
azd version 1.5.0 (commit abc123)
```

## Autentikoinnin asetukset

### Azure CLI -autentikointi (suositeltu)
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

### Laitteen koodiautentikointi
Jos käytät päätelaitetta ilman näyttöä tai sinulla on ongelmia selaimen kanssa:
```bash
az login --use-device-code
```

### Palveluperiaate (CI/CD)
Automaattisia ympäristöjä varten:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurointi

### Globaalit asetukset
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Ympäristömuuttujat
Lisää shell-profiiliisi (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE-integraatio

### Visual Studio Code
Asenna Azure Developer CLI -laajennus:
1. Avaa VS Code
2. Siirry Laajennuksiin (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuudet:
- IntelliSense azure.yaml-tiedostoille
- Integroitu terminaalikomennot
- Mallien selaus
- Julkaisun seuranta

### GitHub Codespaces
Luo `.devcontainer/devcontainer.json`:
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
1. Asenna Azure-laajennus
2. Konfiguroi Azure-tunnukset
3. Käytä integroituja terminaalikomentoja azd:lle

## 🐛 Asennuksen vianmääritys

### Yleiset ongelmat

#### Käyttöoikeus estetty (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-ongelmat
Lisää azd manuaalisesti PATH-muuttujaan:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Verkko/proxy-ongelmat
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versioristiriidat
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Lisäapua
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd:n päivittäminen

### Automaattiset päivitykset
azd ilmoittaa, kun päivityksiä on saatavilla:
```bash
azd version --check-for-updates
```

### Manuaaliset päivitykset

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

## Seuraavat vaiheet

1. **Viimeistele autentikointi**: Varmista, että pääset Azure-tilaukseesi
2. **Kokeile ensimmäistä julkaisua**: Seuraa [Ensimmäisen projektin opasta](first-project.md)
3. **Tutki malleja**: Selaa saatavilla olevia malleja komennolla `azd template list`
4. **Konfiguroi IDE**: Valmistele kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ilmoita ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisökeskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja pika-aloitus
- **⬅️ Edellinen**: [AZD Perusteet](azd-basics.md) 
- **➡️ Seuraava**: [Ensimmäinen projekti](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-First Kehitys](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Asennus valmis!** Jatka [Ensimmäiseen projektiin](first-project.md) ja aloita työskentely azd:n kanssa.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
# Asennus- ja käyttöönotto-opas

**Lukuvalikko:**
- **📚 Kurssin aloitussivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja pika-aloitus
- **⬅️ Edellinen**: [AZD Perusteet](azd-basics.md)
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-Ensimmäinen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas opastaa sinut Azure Developer CLI:n (azd) asentamiseen ja konfigurointiin järjestelmässäsi. Opit useita asennustapoja eri käyttöjärjestelmille, todennuksen asetuksen sekä alkukonfiguroinnin, jotta voit valmistella kehitysympäristösi Azure-järjestelmässä käyttöä varten.

## Oppimistavoitteet

Tämän oppitunnin jälkeen osaat:
- Asentaa onnistuneesti Azure Developer CLI:n käyttöjärjestelmääsi
- Määrittää todennuksen Azureen useilla eri tavoilla
- Asettaa kehitysympäristösi tarvittavilla esivaatimuksilla
- Ymmärtää erilaiset asennusvaihtoehdot ja milloin kukin sopii käytettäväksi
- Ratkaista yleisiä asennus- ja käyttöönotto-ongelmia

## Oppimistulokset

Oppitunnin jälkeen osaat:
- Asentaa azd: n sopivalla menetelmällä alustallasi
- Kirjautua sisään Azureen azd auth login -komennolla
- Varmistaa asennuksesi ja testata perus azd-komentoja
- Konfiguroida kehitysympäristösi azd:n optimaaliseen käyttöön
- Ratkaista yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja konfiguroimaan Azure Developer CLI:n järjestelmääsi, käyttöjärjestelmästäsi ja kehitysympäristöstäsi riippumatta.

## Esivaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Luo ilmainen tili](https://azure.microsoft.com/free/)
- **Azure CLI** (valinnainen) - Esimerkeissä, joissa suoritetaan nimenomaisesti `az`; azd todennetaan itsenäisesti
- **Git** - Mallien kloonaamiseen ja versionhallintaan
- **Docker** (valinnainen) - Säilöttyjä sovelluksia varten

**Luku 2 Foundry GA -reitti:** Käytä AZD:tä **1.37.0 tai uudempaa**, asenna paketti `azd ext install microsoft.foundry`:llä, ja käytä Pythonia **3.13+** ja nykyistä **uv**:tä hosted-agent-esimerkkimallissa. Sen koodin käyttöönotto tapahtuu etänä, joten paikallista Docker-rakennusta ei tarvita. Foundryn käyttöoikeudet, alueellisten mallien saatavuus ja koontikiintiö ovat edelleen tarpeen; katso [hosted-agentin asetukset](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Asennusmenetelmät

### Windows

#### Vaihtoehto 1: Windows Package Manager (Suositeltu)
```cmd
winget install microsoft.azd
```

#### Vaihtoehto 2: PowerShell -asennusskripti
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Vaihtoehto 3: Chocolatey
```cmd
choco install azd
```

#### Vaihtoehto 4: Manuaalinen asennus
1. Lataa uusin julkaisu [GitHubista](https://github.com/Azure/azure-dev/releases)
2. Pura kansioon `C:\Program Files\azd\`
3. Lisää PATH-ympäristömuuttujaan

### macOS

#### Vaihtoehto 1: Homebrew (Suositeltu)
```bash
brew tap azure/azd
brew install azd
```

#### Vaihtoehto 2: Asennusskripti
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 3: Manuaalinen asennus
Lataa arkisto macOS-arkkitehtuurillesi [julkaisun tiedostoista](https://github.com/Azure/azure-dev/releases), pura se ja lisää `azd`-binääri `PATH`-ympäristöön.

### Linux

#### Vaihtoehto 1: Asennusskripti (Suositeltu)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 2: Pakettien hallintaohjelmat

**Manuaalinen asennus julkaisun tiedostoista:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Jotkut Codespaces- ja dev container -ympäristöt sisältävät jo `azd`, mutta sinun kannattaa varmistaa tämä sen sijaan, että olettaisit:

```bash
azd version
```

Jos `azd` puuttuu, asenna se ympäristön vakiaskriptillä.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tämä tilapäinen säilö ei säilytä kirjautumistilaa suoritusten välillä. Toistuvaa käyttöönottoa varten käytä [dev container -asetuksia](dev-containers.md); säilörakennukset vaativat Docker-daemonin, johon pääsee säilön sisältä.

## ✅ Asennuksen varmistus

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
azd version 1.x.x (commit xxxxxx)
```

**Huom:** Todellinen versio vaihtelee. Tarkista [Azure Developer CLI -julkaisut](https://github.com/Azure/azure-dev/releases) saadaksesi viimeisimmän version.

**✅ Asennuksen onnistumisen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentodokumentaation
- [ ] `azd template list` näyttää käytettävissä olevat mallit
- [ ] Voit luoda testihakemiston ja suorittaa `azd init` onnistuneesti

**Jos kaikki tarkistukset menevät läpi, olet valmis siirtymään eteenpäin [Ensimmäiseen projektiin](first-project.md)!**

## Todennuksen asetus

### Suositeltu aloittelijan asetus

AZD-ensimmäisissä työnkuluissa kirjaudu sisään komennolla `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Käytä Azure CLI:n kirjautumista vain, jos aiot itse käyttää `az`-komentoja kurssin aikana.

### Azure CLI -todennus (valinnainen)
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

### Mitä kirjautumisvirtaa sinun pitäisi käyttää?

- Käytä `azd auth login`, jos seuraat aloittelijan AZD-reittiä ja ajat pääasiassa `azd`-komentoja.
- Käytä myös `az login`, kun haluat suorittaa Azure CLI -komentoja kuten `az account show` tai tarkastella resursseja suoraan.
- Jos harjoituksessa on sekä `azd` että `az` komentoja, aja molemmat kirjautumiskomennot kerran alussa.

### Laitekohtainen todennus
Jos käytössäsi on pääte ilman selainta tai selaimen ongelmia:
```bash
azd auth login --use-device-code
```

### Palveluperiaate (CI/CD)
Automaattisissa ympäristöissä:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Vahvista koko asennus

Jos haluat nopean valmiustarkistuksen ennen luvun 1 aloittamista:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurointi

### Globaalit asetukset
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Ympäristömuuttujat
Lisää shell-profiiliisi (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE-integraatio

### Visual Studio Code
Asenna Azure Developer CLI -laajennus:
1. Avaa VS Code
2. Siirry Laajennuksiin (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuudet:
- IntelliSense azure.yaml:lle
- Integroitu terminaalikäyttö
- Mallien selaus
- Julkaisun valvonta

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
1. Asenna Azure-lisäosa
2. Konfiguroi Azure-todennustiedot
3. Käytä integroitua päätettä azd-komentoihin

## 🐛 Asennuksen vianmääritys

### Yleiset ongelmat

#### Käyttöoikeus kielletty (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-ongelmat
Lisää azd manuaalisesti PATHiin:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Verkkoyhteys/proxy-ongelmat
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Versioristiriidat
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Lisäavun saaminen
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## azd:n päivittäminen

### Päivityksen tarkistus
azd varoittaa, kun uudempi julkaisu on saatavilla, ja voit tarkistaa nykyisen version seuraavasti:
```bash
azd version
```

### Manuaaliset päivitykset

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

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Mikä on ero azd:n ja az CLI:n välillä?</strong></summary>

**Azure CLI (az)**: Alhaisen tason työkalu yksittäisten Azure-resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Infrastruktuurin hallinnan painopiste

**Azure Developer CLI (azd)**: Korkean tason työkalu koko sovelluksen käyttöönottoon
- `azd up` ottaa käyttöön koko sovelluksen kaikkine resursseineen
- Mallipohjaiset työnkulut
- Kehittäjän tuottavuuden painopiste

**Ne ovat itsenäisiä**: azd käyttää oletuksena omaa todennustaan. Asenna ja kirjaudu sisään Azure CLI:hin vain `az` komentoja varten, tai valitse nimenomaisesti `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Voinko käyttää azd:tä olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuoda olemassa olevat resurssit azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:tä uusissa käyttöönotossa rinnakkain olemassa olevan infrastruktuurin kanssa

Katso lisätietoja [Konfigurointioppaasta](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Toimiiko azd Azure Governmentin tai Azure Chinan kanssa?</strong></summary>

Kyllä, konfiguroi pilvi:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jos käytät myös Azure CLI:tä, konfiguroi `az cloud set --name ...` erikseen. Mallipalvelut ja mallien saatavuus vaihtelevat pilven mukaan.
</details>

<details>
<summary><strong>Voinko käyttää azd:tä CI/CD-putkistoissa?</strong></summary>

Ehdottomasti! azd on suunniteltu automaatioon:
- GitHub Actions -integraatio
- Azure DevOps -tuki
- Palveluperiaate-todennus
- Ei-interaktiivinen tila

Katso [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md) CI/CD-kuvioista.
</details>

<details>
<summary><strong>Paljonko azd:n käyttäminen maksaa?</strong></summary>

azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Julkaisemistasi Azure-resursseista
- Azure-kulutuksesta (laskenta, tallennus jne.)

Käytä `azd provision --preview` tarkastellaksesi ehdotettuja resursseja ja arvioidaksesi kustannuksia [Azure-hinnoittelulaskurin](https://azure.microsoft.com/pricing/calculator/) avulla. Esikatselu ei laske hintoja.
</details>

## Seuraavat askeleet

1. **Viimeistele todennus**: Varmista, että pääset Azure-tilaukseesi
2. **Kokeile ensimmäistä julkaisua**: Seuraa [Ensimmäisen projektin opasta](first-project.md)
3. **Tutki malleja**: Selaa saatavilla olevia malleja `azd template list`:lla
4. **Konfiguroi IDE**: Aseta kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportoi ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisökeskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)
- [**Azure-agentin taidot**](https://skills.sh/microsoft/github-copilot-for-azure) - Saat Azure-komentojen ohjeistuksen suoraan editorissasi käyttämällä `npx skills add microsoft/github-copilot-for-azure`

---

**Lukuvalikko:**
- **📚 Kurssin koti**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & Pikaopas
- **⬅️ Edellinen**: [AZD:n perusteet](azd-basics.md) 
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensimmäinen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka kohtaan [Ensimmäinen projektisi](first-project.md) aloittaaksesi azd:n käytön.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
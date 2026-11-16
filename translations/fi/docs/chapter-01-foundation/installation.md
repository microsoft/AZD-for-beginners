# Asennus- ja käyttöönotto-opas

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja pika-aloitus
- **⬅️ Edellinen**: [AZD perusteet](azd-basics.md)
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensimmäinen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas ohjaa sinua Azure Developer CLI:n (azd) asentamisessa ja konfiguroinnissa järjestelmääsi. Opit erilaisia asennustapoja eri käyttöjärjestelmille, todennuksen käyttöönoton ja alkuasetukset kehitysympäristösi valmistamiseksi Azure-julkaisuja varten.

## Oppimistavoitteet

Tämän oppitunnin lopuksi osaat:
- Asentaa onnistuneesti Azure Developer CLI:n käyttämällesi käyttöjärjestelmälle
- Määrittää todennuksen Azureen useilla eri menetelmillä
- Valmistella kehitysympäristösi tarvittavilla edellytyksillä
- Ymmärtää erilaiset asennusvaihtoehdot ja milloin käyttää kutakin
- Ratkaista yleisiä asennus- ja käyttöönotto-ongelmia

## Oppimistulokset

Oppitunnin jälkeen pystyt:
- Asentamaan azd oikealla menetelmällä alustallesi
- Todentamaan itsesi Azureen käyttäen azd auth login -komentoa
- Varmistamaan asennuksen ja testaamaan perus azd-komentoja
- Määrittämään kehitysympäristösi optimaaliseen azd-käyttöön
- Ratkaisemaan yleisimmät asennusongelmat itsenäisesti

Tämä opas auttaa sinua asentamaan ja konfiguroimaan Azure Developer CLI:n järjestelmääsi käyttöjärjestelmästäsi tai kehitysympäristöstäsi riippumatta.

## Esivaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Luo ilmainen tili](https://azure.microsoft.com/free/)
- **Azure CLI** (valinnainen) - Esimerkeissä, jotka käyttävät nimenomaisesti `az`; azd tekee todennuksen itsenäisesti
- **Git** - Mallien kloonaamista ja versionhallintaa varten
- **Docker** (valinnainen) - Säilöttyjä sovelluksia varten

## Asennusmenetelmät

### Windows

#### Vaihtoehto 1: Windows Package Manager (Suositeltu)
```cmd
winget install microsoft.azd
```

#### Vaihtoehto 2: PowerShell-asennusskripti
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
2. Pura tiedostot kansioon `C:\Program Files\azd\`
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
Lataa macOS-arkkitehtuurillesi sopiva arkisto [julkaisun kohteista](https://github.com/Azure/azure-dev/releases), pura se ja lisää `azd`-binääri `PATH`:si.

### Linux

#### Vaihtoehto 1: Asennusskripti (Suositeltu)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 2: Paketinhallintaohjelmat

**Manuaalinen asennus julkaisun kohteista:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Jotkut Codespaces- ja dev-container -ympäristöt sisältävät jo `azd`, mutta varmista tämä äläkä ole vain varma:

```bash
azd version
```

Jos `azd` puuttuu, asenna se ympäristön vakiokäsikirjoituksella.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tämä väliaikainen säilö ei säilytä kirjautumistilaa ajojen välillä. Toistuvia julkaisuita varten käytä [dev-container -asetusta](dev-containers.md); säilörakennukset vaativat myös Docker-daemonin, johon säilön sisältä pääsee.

## ✅ Asennuksen varmennus

Asennuksen jälkeen varmista, että azd toimii oikein:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Odotettu tuloste:
```
azd version 1.x.x (commit xxxxxx)
```

**Huom:** Todellinen versionumero voi vaihdella. Tarkista uusin versio [Azure Developer CLI julkaisusta](https://github.com/Azure/azure-dev/releases).

**✅ Onnistuneen asennuksen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentojen ohjeistuksen
- [ ] `azd template list` näyttää saatavilla olevat mallit
- [ ] Voit luoda testihakemiston ja ajaa `azd init` onnistuneesti

**Jos kaikki tarkistukset menevät läpi, olet valmis siirtymään [Ensimmäiseen projektiin](first-project.md)!**

## Todennuksen määrittäminen

### Aloittelijoille suositeltu käyttöönotto

AZD-ensimmäisissä työnkuluissa kirjaudu sisään käyttäen `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Käytä Azure CLI -kirjautumista vain, jos aiot itse käyttää `az` -komentoja kurssin aikana.

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

### Mitä kirjautumisvirtaa sinun tulisi käyttää?

- Käytä `azd auth login`, jos seuraat aloittelijan AZD-polkuasi ja käytät pääasiassa `azd` -komentoja.
- Käytä myös `az login`, kun haluat käyttää Azure CLI -komentoja kuten `az account show` tai tutkia resursseja suoraan.
- Jos harjoitus sisältää sekä `azd` että `az` -komentoja, suorita molemmat kirjautumiskomennot kerran alussa.

### Laitekoodein todennus
Jos käytät järjestelmää ilman näyttöä tai sinulla on selaimen ongelmia:
```bash
azd auth login --use-device-code
```

### Palvelutunnus (CI/CD)
Automaatioympäristöihin:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Varmista täydellinen käyttöönotto

Jos haluat nopean valmiustarkistuksen ennen luvun 1 aloitusta:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguraatio

### Globaali konfiguraatio
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Ympäristömuuttujat
Lisää kuoriprofiiliisi (`.bashrc`, `.zshrc`, `.profile`):
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
2. Mene Laajennuksiin (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuuksia:
- IntelliSense azure.yaml-tiedostolle
- Integroitu päätekomentojen käyttöön
- Mallien selaus
- Julkaisujen seuranta

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
2. Määritä Azure-todennus
3. Käytä integroituja päätelaitteen azd-komentoja

## 🐛 Asennuksen vianmääritys

### Yleiset ongelmat

#### Käyttölupa estetty (Windows)
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

#### Verkko-/prokyyiongelmat
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

## Azd:n päivittäminen

### Päivitystarkistus
Azd ilmoittaa, kun uudempi julkaisu on saatavilla, ja voit tarkistaa nykyisen version komennolla:
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
<summary><strong>Mikä ero on azd:n ja az CLI:n välillä?</strong></summary>

**Azure CLI (az)**: Alhaisen tason työkalu yksittäisten Azure-resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Infrastruktuurin hallinnan painopiste

**Azure Developer CLI (azd)**: Korkean tason työkalu koko sovelluksen julkaisuihin
- `azd up` julkaisee koko sovelluksen kaikkine resursseineen
- Mallipohjaiset työnkulut
- Kehittäjien tuottavuuteen keskittyvä

**Ne ovat riippumattomia**: azd käyttää omaa todennustaan oletuksena. Asenna ja kirjaudu Azure CLI:hin vain `az` -komentoja varten tai ota erikseen käyttöön `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Voinko käyttää azd:tä olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuo olemassa olevat resurssit azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:tä uusille julkaisuille yhdessä olemassa olevan infrastruktuurin kanssa

Katso yksityiskohdat [Konfiguraatio-oppaasta](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Toimiiko azd Azure Governmentin tai Azure Chinan kanssa?</strong></summary>

Kyllä, määritä pilvi:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jos käytät myös Azure CLI:ä, määritä `az cloud set --name ...` erikseen. Mallipalveluiden ja mallien saatavuus vaihtelee pilven mukaan.
</details>

<details>
<summary><strong>Voinko käyttää azd:tä CI/CD-putkistoissa?</strong></summary>

Todellakin! azd on suunniteltu automaatioon:
- GitHub Actions -integraatio
- Azure DevOps -tuki
- Palvelutunnuksen todennus
- Ei-interaktiivinen tila

Katso CI/CD-mallit [Julkaisuoppaasta](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kuinka paljon azd:n käyttö maksaa?</strong></summary>

Azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Azure-resursseista, joita julkaiset
- Azure-käyttökustannuksista (laskenta, tallennus jne.)

Käytä `azd provision --preview` nähdäksesi ehdotetut resurssit ja arvioidaksesi niiden kustannukset [Azure-hinnoittelulaskurilla](https://azure.microsoft.com/pricing/calculator/). Esikatselu ei laske hintoja.
</details>

## Seuraavat askeleet

1. **Varmista todennus**: Varmista, että pääset Azure-tilaustilillesi
2. **Kokeile ensimmäistä julkaisua**: Seuraa [Ensimmäisen projektin opasta](first-project.md)
3. **Tutustu malleihin**: Selaa saatavilla olevia malleja komennolla `azd template list`
4. **Määritä IDE**: Valmistele kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ilmoita ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisön keskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)
- [**Azure-agentin taidot**](https://skills.sh/microsoft/github-copilot-for-azure) - Hanki Azure-komentojen ohjeet suoraan editoristasi käyttämällä `npx skills add microsoft/github-copilot-for-azure`

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & Pikaperehdytys
- **⬅️ Edellinen**: [AZD Perusteet](azd-basics.md) 
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-Ensimmäinen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka [Ensimmäiseen projektiisi](first-project.md) aloittaaksesi rakentamisen azd:llä.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
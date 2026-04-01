# Asennus- ja käyttöönotto-opas

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Luku 1 - Perusta & pika-aloitus
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas ohjaa sinut Azure Developer CLI:n (azd) asentamisessa ja määrityksessä järjestelmääsi. Opit useita asennusmenetelmiä eri käyttöjärjestelmille, todennuksen asetukset ja alkuperäisen konfiguroinnin kehitysympäristösi valmistamiseksi Azure-käyttöönottoja varten.

## Oppimistavoitteet

Oppitunnin lopussa osaat:
- Asentaa Azure Developer CLI:n käyttöjärjestelmääsi
- Määrittää todennuksen Azureen useilla tavoilla
- Valmistella kehitysympäristösi tarvittavilla esivaatimuksilla
- Ymmärtää eri asennusvaihtoehdot ja milloin käyttää kutakin
- Vianetsintä yleisissä asennus- ja käyttöönotto-ongelmissa

## Oppimistulokset

Tämän oppitunnin suorittamisen jälkeen pystyt:
- Asentamaan azd:n alustallesi sopivalla menetelmällä
- Todentamaan itsesi Azureen komennolla `azd auth login`
- Vahvistamaan asennuksen ja testaamaan perusazd-komentoja
- Konfiguroimaan kehitysympäristösi optimaalista azd-käyttöä varten
- Ratkaisemaan yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja määrittämään Azure Developer CLI:n järjestelmääsi, riippumatta käyttöjärjestelmästäsi tai kehitysympäristöstäsi.

## Edellytykset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Todentamista ja resurssien hallintaa varten
- **Git** - Mallien kloonaamiseen ja versionhallintaan
- **Docker** (valinnainen) - Konttipohjaisia sovelluksia varten

## Asennusmenetelmät

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# Hyödyllinen, kun winget ei ole käytettävissä.
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Lataa uusin julkaisu [GitHubista](https://github.com/Azure/azure-dev/releases)
2. Pura kansioon `C:\Program Files\azd\`
3. Lisää PATH-ympäristömuuttujaan

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Lataa ja asenna
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# Lataa uusin arkisto Linux-arkkitehtuurillesi osoitteesta:
# https://github.com/Azure/azure-dev/releases
# Pura se sitten ja lisää azd-binaari PATH-ympäristömuuttujaasi.
```

### GitHub Codespaces

Jotkin Codespaces- ja dev container -ympäristöt sisältävät jo `azd`:n, mutta sinun tulisi varmistaa se sen sijaan, että olettaisit sen olevan mukana:

```bash
azd version
```

Jos `azd` puuttuu, asenna se ympäristölle sopivalla standardiskriptillä.

### Docker

```bash
# Suorita azd säiliössä
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Luo alias helpompaa käyttöä varten
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Vahvista asennus

Asennuksen jälkeen varmista, että azd toimii oikein:

```bash
# Tarkista versio
azd version

# Näytä ohje
azd --help

# Luettele käytettävissä olevat mallipohjat
azd template list
```

Odotettu tuloste:
```
azd version 1.x.x (commit xxxxxx)
```

**Huom**: Todellinen versionumero voi vaihdella. Tarkista [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) saadaksesi viimeisimmän version tiedot.

**✅ Asennuksen onnistumisen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentodokumentaation
- [ ] `azd template list` näyttää saatavilla olevat mallit
- [ ] Voit tehdä testihakemiston ja suorittaa `azd init` onnistuneesti

**Jos kaikki kohdat täyttyvät, olet valmis siirtymään kohtaan [Ensimmäinen projektisi](first-project.md)!**

## Todentamisen asetukset

### Aloittelijalle suositeltu asetus

AZD-ensimmäisissä työnkuluissa kirjaudu sisään komennolla `azd auth login`.

```bash
# Tarvitaan AZD-komentoja varten, kuten azd up.
azd auth login

# Tarkista AZD:n todennustila
azd auth login --check-status
```

Käytä Azure CLI -kirjautumista vain, kun aiot itse suorittaa `az`-komentoja kurssin aikana.

### Azure CLI -todennus (valinnainen)
```bash
# Asenna Azure CLI, jos sitä ei ole jo asennettu
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: katso Azure CLI:n asennusohjeet jakelullesi

# Kirjaudu sisään Azureen
az login

# Varmista tunnistautuminen
az account show
```

### Mitä kirjautumisvirtaa sinun tulisi käyttää?

- Käytä `azd auth login`, jos seuraat aloittelijan AZD-polun ohjeita ja suoritat pääasiassa `azd`-komentoja.
- Käytä myös `az login`, kun haluat suorittaa Azure CLI -komentoja, kuten `az account show` tai tutkia resursseja suoraan.
- Jos harjoituksessa on sekä `azd`- että `az`-komentoja, suorita molemmat kirjautumiskomennot kerran alussa.

### Laitekoodin todennus
Jos käytät päätetöntä järjestelmää tai sinulla on selainongelmia:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Automatisoiduille ympäristöille:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Vahvista koko asennuksesi

Jos haluat nopean valmiustarkistuksen ennen luvun 1 aloittamista:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Määritys

### Yleinen määritys
```bash
# Aseta oletustilaus
azd config set defaults.subscription <subscription-id>

# Aseta oletussijainti
azd config set defaults.location eastus2

# Näytä kaikki asetukset
azd config show
```

### Ympäristömuuttujat
Lisää kuoriprofiiliisi (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguraatio
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguraatio
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ota debug-lokitus käyttöön
```

## IDE-integraatio

### Visual Studio Code
Asenna Azure Developer CLI -laajennus:
1. Avaa VS Code
2. Siirry laajennuksiin (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuudet:
- IntelliSense azure.yaml:lle
- Integroitu terminaali komentoja varten
- Mallien selaus
- Käyttöönoton seuranta

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
2. Määritä Azure-tunnistetiedot
3. Käytä integroitua terminaalia azd-komentoihin

## 🐛 Asennuksen vianmääritys

### Yleisiä ongelmia

#### Käyttöoikeus evätty (Windows)
```powershell
# Suorita PowerShell järjestelmänvalvojana
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-ongelmat
Lisää azd manuaalisesti PATH-ympäristömuuttujaan:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Verkko-/välityspalvelinongelmat
```bash
# Määritä välityspalvelin
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ohita SSL-varmenteen tarkistus (ei suositella tuotantokäyttöön)
azd config set http.insecure true
```

#### Versiokonfliktit
```bash
# Poista vanhat asennukset
# Windows: suorita winget uninstall microsoft.azd
# macOS: suorita brew uninstall azd
# Linux: poista aiempi azd-binaari tai symbolinen linkki ennen uudelleenasennusta

# Puhdista konfiguraatio
rm -rf ~/.azd
```

### Lisäapua
```bash
# Ota debug-lokitus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Näytä nykyinen konfiguraatio
azd config show

# Näytä nykyinen käyttöönoton tila
azd show
```

## azd:n päivittäminen

### Päivitystarkistus
azd varoittaa, kun uudempi julkaisu on saatavilla, ja voit tarkistaa nykyisen buildisi komennolla:
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

**Azure CLI (az)**: Matalan tason työkalu yksittäisten Azure-resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Infrastruktuurin hallintaan keskittyvä

**Azure Developer CLI (azd)**: Korkean tason työkalu kokonaisvaltaisiin sovelluskäyttöönottoihin
- `azd up` ottaa käyttöön koko sovelluksen kaikkine resursseineen
- Mallipohjaiset työnkulut
- Kehittäjätuottavuuteen keskittyvä

**Tarvitset molempia**: azd käyttää az CLI:tä todentamiseen
</details>

<details>
<summary><strong>Voinko käyttää azd:ta olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuoda olemassa olevia resursseja azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:ta uusissa käyttöönotossa yhdessä olemassa olevan infrastruktuurin kanssa

Katso lisätietoja [Configuration Guide](configuration.md).
</details>

<details>
<summary><strong>Toimiiko azd Azure Governmentissa tai Azure Chinassa?</strong></summary>

Kyllä, määritä pilvi:
```bash
# Azure-valtionhallinto
az cloud set --name AzureUSGovernment
az login

# Azure Kiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Voinko käyttää azd:ta CI/CD-putkissa?</strong></summary>

Aivan! azd on suunniteltu automaatioon:
- GitHub Actions -integraatio
- Azure DevOps -tuki
- Service principal -todennus
- Ei-interaktiivinen tila

Katso CI/CD-malleja kohdasta [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Paljonko azd:n käyttö maksaa?</strong></summary>

azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Azure-resursseista, jotka otat käyttöön
- Azure-kulutuksesta (laskenta, tallennus jne.)

Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa.
</details>

## Seuraavat askeleet

1. **Viimeistele todennus**: Varmista, että pääset Azure-tiliisi
2. **Kokeile ensimmäistä käyttöönottoa**: Seuraa [First Project Guide](first-project.md)
3. **Selaa malleja**: Tutki saatavilla olevia malleja komennolla `azd template list`
4. **Määritä IDE**: Valmistele kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Hanki Azure-komentojen ohjeita suoraan editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Luku 1 - Perusta & pika-aloitus
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka kohtaan [Ensimmäinen projektisi](first-project.md) aloittaaksesi työskentelyn azd:n kanssa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää luotettavana lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tästä käännöksestä johtuvista mahdollisista väärinkäsityksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
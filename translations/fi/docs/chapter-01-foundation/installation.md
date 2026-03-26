# Asennus- ja käyttöönotto-opas

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta ja pika-aloitus
- **⬅️ Edellinen**: [AZD Basics](azd-basics.md)
- **➡️ Seuraava**: [Your First Project](first-project.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas ohjaa sinut Azure Developer CLI (azd) asentamisen ja konfiguroinnin läpi järjestelmääsi varten. Opit useita asennusmenetelmiä eri käyttöjärjestelmille, todennuksen asetuksen sekä alkuperäisen konfiguroinnin kehitysympäristösi valmistamiseksi Azure‑käyttöönottoja varten.

## Oppimistavoitteet

Tämän oppitunnin aikana opit:
- Asentamaan Azure Developer CLI:n käyttöjärjestelmällesi
- Määrittämään todennuksen Azureen useilla menetelmillä
- Ottamaan kehitysympäristösi käyttöön tarvittavine esivaatimuksineen
- Ymmärtämään eri asennusvaihtoehdot ja milloin käyttää kutakin
- Ratkaisemaan yleisiä asennus- ja käyttöönotto-ongelmia

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Asentamaan azd:n alustallesi sopivalla menetelmällä
- Todentamaan itsesi Azureen käyttämällä azd auth login -komentoa
- Varmistamaan asennuksen ja testaamaan perusazd-komentoja
- Konfiguroimaan kehitysympäristösi optimoitua azd-käyttöä varten
- Ratkaisemaan yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja konfiguroimaan Azure Developer CLI:n järjestelmääsi riippumatta käyttöjärjestelmästäsi tai kehitysympäristöstäsi.

## Esivaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Luo ilmainen tili](https://azure.microsoft.com/free/)
- **Azure CLI** - Todennukseen ja resurssien hallintaan
- **Git** - Mallipohjien kloonausta ja versionhallintaa varten
- **Docker** (valinnainen) - Konttikäyttöisiä sovelluksia varten

## Asennusmenetelmät

### Windows

#### Vaihtoehto 1: PowerShell (suositeltu)
```powershell
# Suorita järjestelmänvalvojana tai korotetuilla oikeuksilla
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
1. Lataa uusin julkaisu osoitteesta [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pura kohteeseen `C:\Program Files\azd\`
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
# Lataa ja asenna
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Vaihtoehto 1: Asennusskripti (suositeltu)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Vaihtoehto 2: Pakettienhallinnat

**Ubuntu/Debian:**
```bash
# Lisää Microsoftin pakettivarasto
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Asenna azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lisää Microsoftin pakettivarasto
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd on esiasennettuna GitHub Codespaces -ympäristöissä. Luo vain codespace ja ala käyttää azd:ta välittömästi.

### Docker

```bash
# Suorita azd säiliössä
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Luo alias helpompaa käyttöä varten
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Varmista asennus

Asennuksen jälkeen varmista, että azd toimii oikein:

```bash
# Tarkista versio
azd version

# Näytä ohje
azd --help

# Listaa saatavilla olevat mallit
azd template list
```

Odotettu tuloste:
```
azd version 1.x.x (commit xxxxxx)
```

**Huom**: Todellinen versionumero voi vaihdella. Tarkista [Azure Developer CLI -julkaisut](https://github.com/Azure/azure-dev/releases) saadaksesi uusimman version.

**✅ Asennuksen onnistumisen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentodokumentaation
- [ ] `azd template list` näyttää saatavilla olevat mallipohjat
- [ ] `az account show` näyttää Azure-tilauksesi
- [ ] Voit luoda testihakemiston ja suorittaa `azd init` onnistuneesti

**Jos kaikki tarkistukset menevät läpi, olet valmis siirtymään kohtaan [Ensimmäinen projektisi](first-project.md)!**

## Todennuksen määritys

### Azure CLI -todennus (suositeltu)
```bash
# Asenna Azure CLI, jos sitä ei ole vielä asennettu
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Kirjaudu Azureen
az login

# Varmista tunnistautuminen
az account show
```

### Laitekoodin todennus
Jos olet headless-järjestelmässä tai sinulla on selaimeen liittyviä ongelmia:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automaattisissa ympäristöissä:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurointi

### Globaalit asetukset
```bash
# Aseta oletustilaus
azd config set defaults.subscription <subscription-id>

# Aseta oletussijainti
azd config set defaults.location eastus2

# Näytä kaikki asetukset
azd config list
```

### Ympäristömuuttujat
Lisää kuoriprofiiliisi (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azuren määritys
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-määritys
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ota debug-lokitus käyttöön
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
- Integroitu terminaali komentoja varten
- Mallipohjien selaus
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
3. Käytä integroitua päätettä azd-komentoja varten

## 🐛 Asennuksen vianmääritys

### Yleisiä ongelmia

#### Käyttöoikeus evätty (Windows)
```powershell
# Suorita PowerShell järjestelmänvalvojana
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

#### Verkko-/proxy-ongelmat
```bash
# Määritä välityspalvelin
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ohita SSL-tarkistus (ei suositella tuotantokäyttöön)
azd config set http.insecure true
```

#### Versio-ristiriidat
```bash
# Poista vanhat asennukset
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Puhdista konfiguraatio
rm -rf ~/.azd
```

### Lisäapua
```bash
# Ota debug-lokitus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Näytä nykyinen kokoonpano
azd config list

# Näytä nykyinen käyttöönoton tila
azd show
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

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Mikä ero on azd:lla ja az CLI:llä?</strong></summary>

**Azure CLI (az)**: Alhaisen tason työkalu yksittäisten Azure‑resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Keskittyy infrastruktuurin hallintaan

**Azure Developer CLI (azd)**: Korkean tason työkalu täydellisiin sovelluskäyttöönottoihin
- `azd up` ottaa käyttöön koko sovelluksen kaikilla resursseilla
- Mallipohjaiset työnkulut
- Keskittyy kehittäjien tuottavuuteen

**Tarvitset molempia**: azd käyttää az CLI:tä todennukseen
</details>

<details>
<summary><strong>Voinko käyttää azd:ta olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuoda olemassa olevia resursseja azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:ta uusissa käyttöönotossa yhdessä olemassa olevan infrastruktuurin kanssa

Katso lisätietoja kohdasta [Konfigurointiopas](configuration.md).
</details>

<details>
<summary><strong>Toimiiko azd Azure Governmentissa tai Azure China -ympäristöissä?</strong></summary>

Kyllä, määritä pilvi:
```bash
# Azure-hallinto
az cloud set --name AzureUSGovernment
az login

# Azure Kiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Voinko käyttää azd:ta CI/CD-putkissa?</strong></summary>

Ehdottomasti! azd on suunniteltu automaatioon:
- GitHub Actions -integraatio
- Azure DevOps -tuki
- Service principal -todennus
- Ei-interaktiivinen tila

Katso CI/CD-malleja kohdasta [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Mikä on azd:n käytön kustannus?</strong></summary>

azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Azure-resursseista, jotka otat käyttöön
- Azure-kuluista (laskenta, tallennus jne.)

Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa.
</details>

## Seuraavat askeleet

1. **Suorita todennus**: Varmista, että pääset Azure-tilaustasi
2. **Kokeile ensimmäistä käyttöönottoa**: Seuraa [Ensimmäinen projektisi](first-project.md)
3. **Tutki mallipohjia**: Selaa saatavilla olevia mallipohjia komennolla `azd template list`
4. **Määritä IDE:si**: Konfiguroi kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ilmoita ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisökeskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Saat Azure-komentojen ohjeistusta suoraan editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta ja pika-aloitus
- **⬅️ Edellinen**: [AZD Basics](azd-basics.md) 
- **➡️ Seuraava**: [Your First Project](first-project.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka kohtaan [Ensimmäinen projektisi](first-project.md) aloittaaksesi rakentamisen azd:llä.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
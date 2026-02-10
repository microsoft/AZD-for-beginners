# Asennus- ja käyttöönotto-opas

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Chapter 1 - Foundation & Quick Start
- **⬅️ Edellinen**: [AZD Basics](azd-basics.md)
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas ohjaa sinua Azure Developer CLI:n (azd) asentamisessa ja määrittämisessä järjestelmääsi. Opit useita asennustapoja eri käyttöjärjestelmille, todennuksen asetuksen sekä alkuperäisen konfiguroinnin, jotta kehitysympäristösi on valmis Azure-julkaisuihin.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Onnistuneesti asentaa Azure Developer CLI:n käyttöjärjestelmällesi
- Määrittää todennuksen Azureen useilla menetelmillä
- Valmistella kehitysympäristösi tarvittavilla esivaatimuksilla
- Ymmärtää eri asennusvaihtoehdot ja milloin käyttää kutakin
- Vianmääritystä yleisissä asennus- ja käyttöönotto-ongelmissa

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Asentamaan azd:n käyttämällä alustallesi sopivaa menetelmää
- Todentamaan Azureen käyttäen azd auth login -komentoa
- Varmistamaan asennuksen ja testaamaan perusazd-komentoja
- Konfiguroimaan kehitysympäristösi optimaalista azd-käyttöä varten
- Ratkaisemaan yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja konfiguroimaan Azure Developer CLI:n järjestelmääsi riippumatta käyttöjärjestelmästäsi tai kehitysympäristöstäsi.

## Vaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Todennusta ja resurssien hallintaa varten
- **Git** - Mallien kloonausta ja versionhallintaa varten
- **Docker** (valinnainen) - Konttipohjaisia sovelluksia varten

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
2. Pura kansioon `C:\Program Files\azd\`
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

#### Vaihtoehto 2: Paketinhallintaohjelmat

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

azd tulee esiasennettuna GitHub Codespacesiin. Luo vain codespace ja ala käyttää azd:ta välittömästi.

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

# Listaa käytettävissä olevat mallit
azd template list
```

Odotettu tuloste:
```
azd version 1.x.x (commit xxxxxx)
```

**Huom**: Todellinen versionumero voi vaihdella. Tarkista [Azure Developer CLI -julkaisut](https://github.com/Azure/azure-dev/releases) saadaksesi viimeisimmän version.

**✅ Asennuksen onnistumisen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentodokumentaation
- [ ] `azd template list` näyttää saatavilla olevat mallit
- [ ] `az account show` näyttää Azure-tilauksesi
- [ ] Voit luoda testihakemiston ja suorittaa `azd init` onnistuneesti

**Jos kaikki tarkistukset menevät läpi, olet valmis siirtymään [Ensimmäiseen projektiisi](first-project.md)!**

## Autentikoinnin asetukset

### Azure CLI -todennus (suositeltu)
```bash
# Asenna Azure CLI, jos sitä ei ole jo asennettu
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Kirjaudu Azureen
az login

# Tarkista todennus
az account show
```

### Laitekoodin todennus
Jos käytät päätettä ilman graafista käyttöliittymää tai sinulla on selainongelmia:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automaattisiin ympäristöihin:
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
Lisää shell-profiiliisi (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguraatio
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguraatio
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ota virheenkorjauslokitus käyttöön
```

## IDE-integraatio

### Visual Studio Code
Asenna Azure Developer CLI -laajennus:
1. Avaa VS Code
2. Siirry Laajennuksiin (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuudet:
- IntelliSense azure.yaml-tiedostolle
- Integroitu terminaalin komennot
- Mallien selaus
- Käyttöönoton seuranta

### GitHub Codespaces
Luo tiedosto `.devcontainer/devcontainer.json`:
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
2. Määritä Azure-tunnukset
3. Käytä integroitua terminaalia azd-komentoihin

## 🐛 Asennuksen vianmääritys

### Yleiset ongelmat

#### Käyttö estetty (Windows)
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

#### Verkko-/proksi-ongelmat
```bash
# Määritä välityspalvelin
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ohita SSL-varmenteen tarkistus (ei suositella tuotantokäyttöön)
azd config set http.insecure true
```

#### Versio-konfliktit
```bash
# Poista vanhat asennukset
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Puhdista määritykset
rm -rf ~/.azd
```

### Lisäapua
```bash
# Ota virheenkorjauslokitus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Näytä nykyinen konfiguraatio
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
<summary><strong>Mikä on ero azd:n ja az CLI:n välillä?</strong></summary>

**Azure CLI (az)**: Matalamman tason työkalu yksittäisten Azure-resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Infrastruktuurin hallintaan painottuva

**Azure Developer CLI (azd)**: Korkeamman tason työkalu koko sovellusten julkaisuihin
- `azd up` julkaisee koko sovelluksen kaikkine resursseineen
- Mallipohjaiset työnkulut
- Kehittäjätuottavuuteen painottuva

**Tarvitset molempia**: azd käyttää az CLI:tä todennukseen
</details>

<details>
<summary><strong>Voinko käyttää azd:ta olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuoda olemassa olevia resursseja azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:ta uusissa julkaisuissa yhdessä olemassa olevan infrastruktuurin kanssa

Katso [Konfigurointiopas](configuration.md) lisätietoja.
</details>

<details>
<summary><strong>Toimiiko azd Azure Governmentin tai Azure Chinan kanssa?</strong></summary>

Kyllä, määritä pilvi:
```bash
# Azure hallitus
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

Katso [Julkistusopas](../chapter-04-infrastructure/deployment-guide.md) CI/CD-malleista.
</details>

<details>
<summary><strong>Paljonko azd:n käyttäminen maksaa?</strong></summary>

azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Azure-resursseista, jotka otat käyttöön
- Azure-kulutuksesta (compute, storage jne.)

Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen julkaisua.
</details>

## Seuraavat vaiheet

1. **Vahvista autentikointi**: Varmista, että pääset Azure-tilaukseesi
2. **Kokeile ensimmäistä julkaisua**: Seuraa [Ensimmäisen projektin opas](first-project.md)
3. **Tutki malleja**: Selaa saatavilla olevia malleja komennolla `azd template list`
4. **Määritä IDE**: Valmistele kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportoi ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisökeskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Chapter 1 - Foundation & Quick Start
- **⬅️ Edellinen**: [AZD Basics](azd-basics.md) 
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka kohtaan [Ensimmäinen projektisi](first-project.md) aloittaaksesi rakentamisen azd:llä.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Tärkeän tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
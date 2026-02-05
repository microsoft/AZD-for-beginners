# Asennus- ja aloitusopas

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja nopea aloitus
- **⬅️ Edellinen**: [AZD:n perusteet](azd-basics.md)
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensimmäinen kehitys](../microsoft-foundry/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava opas opastaa sinut Azure Developer CLI:n (azd) asentamisessa ja määrittämisessä järjestelmääsi. Opit useita asennusmenetelmiä eri käyttöjärjestelmille, todennuksen asetuksia ja alkuperäisiä määrityksiä, jotta kehitysympäristösi on valmis Azure-julkaisuihin.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Asentaa Azure Developer CLI:n käyttöjärjestelmääsi
- Määrittää todennuksen Azureen useilla eri tavoilla
- Valmistella kehitysympäristösi tarvittavilla esivaatimuksilla
- Ymmärtää eri asennusvaihtoehdot ja niiden käyttötarkoitukset
- Ratkaista yleisiä asennus- ja määritysongelmia

## Oppimistulokset

Tämän oppitunnin jälkeen pystyt:
- Asentamaan azd:n oikealla menetelmällä alustallesi
- Todentamaan Azuren kanssa käyttämällä `azd auth login` -komentoa
- Varmistamaan asennuksen ja testaamaan peruskomentoja
- Määrittämään kehitysympäristösi optimaaliseen azd:n käyttöön
- Ratkaisemaan yleisiä asennusongelmia itsenäisesti

Tämä opas auttaa sinua asentamaan ja määrittämään Azure Developer CLI:n järjestelmääsi riippumatta käyttöjärjestelmästäsi tai kehitysympäristöstäsi.

## Esivaatimukset

Ennen azd:n asentamista varmista, että sinulla on:
- **Azure-tilaus** - [Luo ilmainen tili](https://azure.microsoft.com/free/)
- **Azure CLI** - Todennukseen ja resurssien hallintaan
- **Git** - Mallien kloonaamiseen ja versionhallintaan
- **Docker** (valinnainen) - Konttipohjaisille sovelluksille

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
1. Lataa uusin julkaisu [GitHubista](https://github.com/Azure/azure-dev/releases)
2. Pura tiedostot `C:\Program Files\azd\` -kansioon
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

#### Vaihtoehto 2: Pakettienhallinta

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

azd on esiasennettu GitHub Codespaces -ympäristöön. Luo vain Codespace ja aloita azd:n käyttö heti.

### Docker

```bash
# Suorita azd kontissa
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Luo alias helpompaa käyttöä varten
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Asennuksen tarkistus

Asennuksen jälkeen varmista, että azd toimii oikein:

```bash
# Tarkista versio
azd version

# Näytä ohje
azd --help

# Listaa saatavilla olevat mallipohjat
azd template list
```

Odotettu tulos:
```
azd version 1.5.0 (commit abc123)
```

**✅ Asennuksen onnistumisen tarkistuslista:**
- [ ] `azd version` näyttää versionumeron ilman virheitä
- [ ] `azd --help` näyttää komentodokumentaation
- [ ] `azd template list` näyttää saatavilla olevat mallit
- [ ] `az account show` näyttää Azure-tilauksesi
- [ ] Voit luoda testihakemiston ja suorittaa `azd init` onnistuneesti

**Jos kaikki tarkistukset onnistuvat, voit siirtyä kohtaan [Ensimmäinen projektisi](first-project.md)!**

## Todennuksen asetukset

### Azure CLI -todennus (suositeltu)
```bash
# Asenna Azure CLI, jos sitä ei ole jo asennettu
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Kirjaudu Azureen
az login

# Vahvista todennus
az account show
```

### Laitetunnuskoodi-todennus
Jos käytät päätelaitetta ilman näyttöä tai sinulla on ongelmia selaimen kanssa:
```bash
az login --use-device-code
```

### Palveluperiaate (CI/CD)
Automaattisiin ympäristöihin:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Määritykset

### Globaali määritys
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
2. Siirry Laajennukset-osioon (Ctrl+Shift+X)
3. Etsi "Azure Developer CLI"
4. Asenna laajennus

Ominaisuudet:
- IntelliSense azure.yaml-tiedostoille
- Integroitu terminaalikomentojen tuki
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
1. Asenna Azure-laajennus
2. Määritä Azure-tunnistetiedot
3. Käytä integroituja terminaalikomentoja azd:lle

## 🐛 Asennuksen vianmääritys

### Yleiset ongelmat

#### Käyttöoikeus estetty (Windows)
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

#### Verkko/proxy-ongelmat
```bash
# Määritä välityspalvelin
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ohita SSL-varmennus (ei suositella tuotantokäyttöön)
azd config set http.insecure true
```

#### Versioristiriidat
```bash
# Poista vanhat asennukset
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Puhdista kokoonpano
rm -rf ~/.azd
```

### Lisäavun saaminen
```bash
# Ota käyttöön virheenkorjauslokitus
export AZD_DEBUG=true
azd <command> --debug

# Näytä yksityiskohtaiset lokit
azd logs

# Tarkista järjestelmän tiedot
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

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Mikä ero on azd:llä ja az CLI:llä?</strong></summary>

**Azure CLI (az)**: Matala tason työkalu yksittäisten Azure-resurssien hallintaan
- `az webapp create`, `az storage account create`
- Yksi resurssi kerrallaan
- Infrastruktuurin hallintapainotteinen

**Azure Developer CLI (azd)**: Korkean tason työkalu kokonaisvaltaisiin sovellusjulkaisuihin
- `azd up` julkaisee koko sovelluksen kaikkine resursseineen
- Mallipohjaiset työnkulut
- Kehittäjän tuottavuuspainotteinen

**Tarvitset molemmat**: azd käyttää az CLI:tä todennukseen
</details>

<details>
<summary><strong>Voinko käyttää azd:tä olemassa olevien Azure-resurssien kanssa?</strong></summary>

Kyllä! Voit:
1. Tuoda olemassa olevat resurssit azd-ympäristöihin
2. Viitata olemassa oleviin resursseihin Bicep-malleissasi
3. Käyttää azd:tä uusien julkaisujen tekemiseen olemassa olevan infrastruktuurin rinnalla

Katso [Määritysopas](configuration.md) lisätietoja.
</details>

<details>
<summary><strong>Toimiiko azd Azure Government- tai Azure China -ympäristöissä?</strong></summary>

Kyllä, määritä pilvi:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure Kiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Voinko käyttää azd:tä CI/CD-putkissa?</strong></summary>

Ehdottomasti! azd on suunniteltu automaatioon:
- GitHub Actions -integraatio
- Azure DevOps -tuki
- Palveluperiaate-todennus
- Ei-interaktiivinen tila

Katso [Julkaisuopas](../deployment/deployment-guide.md) CI/CD-malleista.
</details>

<details>
<summary><strong>Mitä azd:n käyttö maksaa?</strong></summary>

azd itsessään on **täysin ilmainen** ja avoimen lähdekoodin. Maksat vain:
- Azure-resursseista, jotka julkaiset
- Azuren kulutuskustannuksista (laskenta, tallennus jne.)

Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen julkaisua.
</details>

## Seuraavat vaiheet

1. **Viimeistele todennus**: Varmista, että pääset Azure-tilaukseesi
2. **Kokeile ensimmäistä julkaisua**: Seuraa [Ensimmäinen projekti -opasta](first-project.md)
3. **Tutustu malleihin**: Selaa saatavilla olevia malleja komennolla `azd template list`
4. **Määritä IDE**: Valmistele kehitysympäristösi

## Tuki

Jos kohtaat ongelmia:
- [Virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ilmoita ongelmista](https://github.com/Azure/azure-dev/issues)
- [Yhteisökeskustelut](https://github.com/Azure/azure-dev/discussions)
- [Azure-tuki](https://azure.microsoft.com/support/)

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja nopea aloitus
- **⬅️ Edellinen**: [AZD:n perusteet](azd-basics.md) 
- **➡️ Seuraava**: [Ensimmäinen projektisi](first-project.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensimmäinen kehitys](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Asennus valmis!** Jatka kohtaan [Ensimmäinen projektisi](first-project.md) aloittaaksesi azd:n käytön.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi katsoa ensisijaiseksi lähteeksi. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
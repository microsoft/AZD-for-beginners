<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-23T19:09:19+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hr"
}
-->
# Vodič za instalaciju i postavljanje

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj usmjeren na AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni vodič provest će vas kroz instalaciju i konfiguraciju Azure Developer CLI (azd) na vašem sustavu. Naučit ćete različite metode instalacije za različite operativne sustave, postavljanje autentifikacije i početnu konfiguraciju kako biste pripremili svoje razvojno okruženje za implementaciju na Azure.

## Ciljevi učenja

Na kraju ove lekcije, moći ćete:
- Uspješno instalirati Azure Developer CLI na vaš operativni sustav
- Konfigurirati autentifikaciju s Azureom koristeći različite metode
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada ih koristiti
- Rješavati uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se s Azureom koristeći `azd auth login`
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati razvojno okruženje za optimalno korištenje azd-a
- Samostalno rješavati uobičajene probleme s instalacijom

Ovaj vodič pomoći će vam instalirati i konfigurirati Azure Developer CLI na vašem sustavu, bez obzira na operativni sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a, osigurajte da imate:
- **Azure pretplatu** - [Kreirajte besplatni račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za autentifikaciju i upravljanje resursima
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (opcionalno) - Za aplikacije u kontejnerima

## Metode instalacije

### Windows

#### Opcija 1: PowerShell (preporučeno)
```powershell
# Pokrenite kao administrator ili s povišenim privilegijama
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcija 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opcija 3: Chocolatey
```cmd
choco install azd
```

#### Opcija 4: Ručna instalacija
1. Preuzmite najnoviju verziju s [GitHub-a](https://github.com/Azure/azure-dev/releases)
2. Ekstrahirajte u `C:\Program Files\azd\`
3. Dodajte u PATH varijablu okruženja

### macOS

#### Opcija 1: Homebrew (preporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Opcija 2: Instalacijski skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 3: Ručna instalacija
```bash
# Preuzmi i instaliraj
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcija 1: Instalacijski skript (preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Paketni menadžeri

**Ubuntu/Debian:**
```bash
# Dodajte Microsoftov paketni repozitorij
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalirajte azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodajte Microsoftov paketni repozitorij
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd dolazi unaprijed instaliran u GitHub Codespaces. Jednostavno kreirajte codespace i odmah počnite koristiti azd.

### Docker

```bash
# Pokreni azd u kontejneru
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Kreiraj alias za lakše korištenje
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Provjera instalacije

Nakon instalacije, provjerite radi li azd ispravno:

```bash
# Provjeri verziju
azd version

# Pogledaj pomoć
azd --help

# Popis dostupnih predložaka
azd template list
```

Očekivani izlaz:
```
azd version 1.5.0 (commit abc123)
```

**✅ Popis za provjeru uspješne instalacije:**
- [ ] `azd version` prikazuje broj verzije bez grešaka
- [ ] `azd --help` prikazuje dokumentaciju naredbi
- [ ] `azd template list` prikazuje dostupne predloške
- [ ] `az account show` prikazuje vašu Azure pretplatu
- [ ] Možete kreirati testni direktorij i uspješno pokrenuti `azd init`

**Ako su svi provjeri uspješni, spremni ste za nastavak na [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentifikacije

### Autentifikacija putem Azure CLI (preporučeno)
```bash
# Instalirajte Azure CLI ako već nije instaliran
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prijavite se na Azure
az login

# Provjerite autentifikaciju
az account show
```

### Autentifikacija putem koda uređaja
Ako ste na sustavu bez grafičkog sučelja ili imate problema s preglednikom:
```bash
az login --use-device-code
```

### Servisni principal (CI/CD)
Za automatizirana okruženja:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguracija

### Globalna konfiguracija
```bash
# Postavi zadanu pretplatu
azd config set defaults.subscription <subscription-id>

# Postavi zadanu lokaciju
azd config set defaults.location eastus2

# Pregledaj sve konfiguracije
azd config list
```

### Varijable okruženja
Dodajte u svoj shell profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracija Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracija azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogući zapisivanje pogrešaka
```

## Integracija s IDE-om

### Visual Studio Code
Instalirajte ekstenziju Azure Developer CLI:
1. Otvorite VS Code
2. Idite na Ekstenzije (Ctrl+Shift+X)
3. Potražite "Azure Developer CLI"
4. Instalirajte ekstenziju

Značajke:
- IntelliSense za azure.yaml
- Integrirane terminalske naredbe
- Pregledavanje predložaka
- Praćenje implementacije

### GitHub Codespaces
Kreirajte `.devcontainer/devcontainer.json`:
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
1. Instalirajte Azure plugin
2. Konfigurirajte Azure vjerodajnice
3. Koristite integrirani terminal za azd naredbe

## 🐛 Rješavanje problema s instalacijom

### Uobičajeni problemi

#### Dozvola odbijena (Windows)
```powershell
# Pokrenite PowerShell kao administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi s PATH-om
Ručno dodajte azd u PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemi s mrežom/proxyjem
```bash
# Konfiguriraj proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskoči SSL provjeru (nije preporučljivo za produkciju)
azd config set http.insecure true
```

#### Sukobi verzija
```bash
# Ukloni stare instalacije
# Windows: winget deinstaliraj Microsoft.Azd
# macOS: brew deinstaliraj azd
# Linux: sudo apt ukloni azd

# Očisti konfiguraciju
rm -rf ~/.azd
```

### Dobivanje dodatne pomoći
```bash
# Omogući zapisivanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Pregledaj detaljne zapise
azd logs

# Provjeri informacije o sustavu
azd info
```

## Ažuriranje azd-a

### Automatska ažuriranja
azd će vas obavijestiti kada su dostupna ažuriranja:
```bash
azd version --check-for-updates
```

### Ručna ažuriranja

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

## 💡 Često postavljana pitanja

<details>
<summary><strong>Koja je razlika između azd i az CLI?</strong></summary>

**Azure CLI (az)**: Alat niske razine za upravljanje pojedinačnim Azure resursima
- `az webapp create`, `az storage account create`
- Jedan resurs odjednom
- Fokus na upravljanje infrastrukturom

**Azure Developer CLI (azd)**: Alat visoke razine za kompletne implementacije aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Radni tijekovi temeljeni na predlošcima
- Fokus na produktivnost developera

**Potrebni su oba**: azd koristi az CLI za autentifikaciju
</details>

<details>
<summary><strong>Mogu li koristiti azd s postojećim Azure resursima?</strong></summary>

Da! Možete:
1. Uvesti postojeće resurse u azd okruženja
2. Referencirati postojeće resurse u vašim Bicep predlošcima
3. Koristiti azd za nove implementacije uz postojeću infrastrukturu

Pogledajte [Vodič za konfiguraciju](configuration.md) za detalje.
</details>

<details>
<summary><strong>Radi li azd s Azure Government ili Azure China?</strong></summary>

Da, konfigurirajte cloud:
```bash
# Azure Vlada
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Mogu li koristiti azd u CI/CD pipeline-ovima?</strong></summary>

Naravno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentifikacija putem servisnog principala
- Način rada bez interakcije

Pogledajte [Vodič za implementaciju](../deployment/deployment-guide.md) za CI/CD obrasce.
</details>

<details>
<summary><strong>Koji su troškovi korištenja azd-a?</strong></summary>

azd je **potpuno besplatan** i open-source. Plaćate samo za:
- Azure resurse koje implementirate
- Troškove korištenja Azurea (računalna snaga, pohrana itd.)

Koristite `azd provision --preview` za procjenu troškova prije implementacije.
</details>

## Sljedeći koraci

1. **Dovršite autentifikaciju**: Osigurajte da možete pristupiti svojoj Azure pretplati
2. **Isprobajte svoju prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte svoj IDE**: Postavite svoje razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite probleme](https://github.com/Azure/azure-dev/issues)
- [Rasprave u zajednici](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md) 
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj usmjeren na AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) kako biste započeli rad s azd-om.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
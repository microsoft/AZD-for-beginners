# Vodič za instalaciju i postavljanje

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo programiranje](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni vodič vodi vas kroz instalaciju i konfiguraciju Azure Developer CLI (azd) na vašem sustavu. Naučit ćete različite metode instalacije za različite operativne sustave, postavljanje autentikacije i početnu konfiguraciju kako biste pripremili razvojno okruženje za Azure implementacije.

## Ciljevi učenja

Na kraju ove lekcije ćete:
- Uspješno instalirati Azure Developer CLI na vaš operativni sustav
- Konfigurirati autentikaciju u Azureu koristeći više metoda
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada ih koristiti
- Riješiti uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon završetka ove lekcije moći ćete:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se u Azure pomoću azd auth login
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati razvojno okruženje za optimalno korištenje azd-a
- Samostalno riješiti uobičajene probleme s instalacijom

Ovaj vodič pomoći će vam instalirati i konfigurirati Azure Developer CLI na vašem sustavu, bez obzira na operativni sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a provjerite imate li:
- **Azure pretplatu** - [Napravite besplatan račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za autentikaciju i upravljanje resursima
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (neobavezno) - Za aplikacije u kontejnerima

## Metode instalacije

### Windows

#### Opcija 1: PowerShell (Preporučeno)
```powershell
# Pokrenite kao Administrator ili s povišenim privilegijama
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
2. Raspakirajte u `C:\Program Files\azd\`
3. Dodajte u PATH varijablu okoline

### macOS

#### Opcija 1: Homebrew (Preporučeno)
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
# Preuzmite i instalirajte
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcija 1: Instalacijski skript (Preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Paketni upravitelji

**Ubuntu/Debian:**
```bash
# Dodajte Microsoft spremište paketa
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalirajte azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodajte Microsoft spremište paketa
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd dolazi predinstaliran u GitHub Codespaces okruženju. Jednostavno kreirajte codespace i odmah počnite koristiti azd.

### Docker

```bash
# Pokreni azd u spremniku
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Kreiraj alias za lakšu upotrebu
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Potvrda instalacije

Nakon instalacije provjerite radi li azd ispravno:

```bash
# Provjeri verziju
azd version

# Pogledaj pomoć
azd --help

# Prikaži dostupne predloške
azd template list
```

Očekivani ispis:
```
azd version 1.x.x (commit xxxxxx)
```

**Napomena**: Stvarna verzija će varirati. Provjerite [Azure Developer CLI izdanja](https://github.com/Azure/azure-dev/releases) za najnoviju verziju.

**✅ Popis za provjeru uspješne instalacije:**
- [ ] `azd version` prikazuje broj verzije bez grešaka
- [ ] `azd --help` prikazuje dokumentaciju naredbi
- [ ] `azd template list` prikazuje dostupne predloške
- [ ] `az account show` prikazuje vašu Azure pretplatu
- [ ] Možete kreirati testni direktorij i uspješno pokrenuti `azd init`

**Ako su svi testovi prošli, spremni ste za [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentikacije

### Autentikacija putem Azure CLI (Preporučeno)
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

### Autentikacija putem uređaja (Device Code)
Ako koristite sustav bez GUI-a ili imate problema s preglednikom:
```bash
az login --use-device-code
```

### Servisni račun (CI/CD)
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

# Prikaži svu konfiguraciju
azd config list
```

### Varijable okoline
Dodajte u profil vašeg shell-a (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguracija
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogući debug zapisivanje logova
```

## Integracija s IDE

### Visual Studio Code
Instalirajte Azure Developer CLI ekstenziju:
1. Otvorite VS Code
2. Idite na Ekstenzije (Ctrl+Shift+X)
3. Potražite "Azure Developer CLI"
4. Instalirajte ekstenziju

Značajke:
- IntelliSense za azure.yaml
- Integrirani terminal s naredbama
- Pregledavanje predložaka
- Praćenje implementacija

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

#### Odbijen pristup (Windows)
```powershell
# Pokrenite PowerShell kao administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi s PATH varijablom
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

# Preskoči SSL provjeru (nije preporučeno za produkciju)
azd config set http.insecure true
```

#### Sukobi verzija
```bash
# Ukloni stare instalacije
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Očisti konfiguraciju
rm -rf ~/.azd
```

### Dodatna pomoć
```bash
# Omogući zapisivanje debagiranja
export AZD_DEBUG=true
azd <command> --debug

# Prikaži trenutnu konfiguraciju
azd config list

# Prikaži trenutni status implementacije
azd show
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

**Azure CLI (az)**: Alat niže razine za upravljanje pojedinačnim Azure resursima
- `az webapp create`, `az storage account create`
- Jedan resurs u isto vrijeme
- Fokus na upravljanje infrastrukturom

**Azure Developer CLI (azd)**: Alat više razine za kompletnu implementaciju aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Radni tokovi temeljeni na predlošcima
- Fokus na produktivnost programera

**Potrebni su oba**: azd koristi az CLI za autentikaciju
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
<summary><strong>Mogu li koristiti azd u CI/CD pipelineovima?</strong></summary>

Apsolutno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentikacija servisnim računom
- Neinteraktivni način rada

Pogledajte [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) za CI/CD obrasce.
</details>

<details>
<summary><strong>Koliki je trošak korištenja azd-a?</strong></summary>

azd je **potpuno besplatan** i otvorenog koda. Plaćate samo:
- Azure resurse koje implementirate
- Troškove Azure potrošnje (računanje, skladištenje itd.)

Koristite `azd provision --preview` za procjenu troškova prije implementacije.
</details>

## Sljedeći koraci

1. **Dovršite autentikaciju**: Osigurajte pristup svojoj Azure pretplati
2. **Isprobajte prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte IDE**: Postavite razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavi probleme](https://github.com/Azure/azure-dev/issues)
- [Diskusije zajednice](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobijte upute za Azure naredbe direktno u vaš uređivač s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo programiranje](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacija završena!** Nastavite na [Vaš prvi projekt](first-project.md) i započnite izgradnju s azd-om.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba se smatrati autoritativnim izvorom. Za kritične informacije preporuča se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
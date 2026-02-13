# Instalacija i vodič za postavljanje

**Navigacija poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove & Brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj s fokusom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni vodič provest će vas kroz instalaciju i konfiguraciju Azure Developer CLI (azd) na vašem sustavu. Naučit ćete više načina instalacije za različite operacijske sustave, postavljanje autentikacije i početnu konfiguraciju kako biste pripremili svoje razvojno okruženje za Azure implementacije.

## Ciljevi učenja

Do kraja ovog poglavlja ćete:
- Uspješno instalirati Azure Developer CLI na vaš operacijski sustav
- Konfigurirati autentikaciju s Azureom koristeći više metoda
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite mogućnosti instalacije i kada koristiti svaku
- Rješavati uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon dovršetka ovog poglavlja moći ćete:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se s Azureom koristeći azd auth login
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati svoje razvojno okruženje za optimalno korištenje azd-a
- Neovisno riješiti uobičajene probleme s instalacijom

Ovaj vodič pomoći će vam instalirati i konfigurirati Azure Developer CLI na vašem sustavu, bez obzira na operacijski sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a, osigurajte da imate:
- **Pretplata na Azure** - [Kreirajte besplatan račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za autentikaciju i upravljanje resursima
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (neobavezno) - Za kontejnerizirane aplikacije

## Metode instalacije

### Windows

#### Opcija 1: PowerShell (Preporučeno)
```powershell
# Pokrenite kao administrator ili s povišenim ovlastima
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
1. Preuzmite najnovije izdanje s [GitHub](https://github.com/Azure/azure-dev/releases)
2. Raspakirajte u `C:\Program Files\azd\`
3. Dodajte u PATH varijablu okruženja

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

#### Opcija 2: Upravitelji paketa

**Ubuntu/Debian:**
```bash
# Dodaj Microsoftov repozitorij paketa
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instaliraj azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodajte Microsoftov repozitorij paketa
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

# Kreiraj alias za lakšu upotrebu
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Provjera instalacije

Nakon instalacije, provjerite radi li azd ispravno:

```bash
# Provjeri verziju
azd version

# Prikaži pomoć
azd --help

# Prikaži dostupne predloške
azd template list
```

Očekivani izlaz:
```
azd version 1.x.x (commit xxxxxx)
```

**Napomena**: Stvarna verzija može varirati. Provjerite [izdanja Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnoviju verziju.

**✅ Kontrolna lista za uspješnu instalaciju:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] `az account show` displays your Azure subscription
- [ ] You can create a test directory and run `azd init` successfully

**Ako su sve provjere uspješne, spremni ste nastaviti na [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentikacije

### Autentikacija putem Azure CLI (Preporučeno)
```bash
# Instalirajte Azure CLI ako već nije instaliran
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prijavite se u Azure
az login

# Provjerite autentifikaciju
az account show
```

### Autentikacija uređajskim kodom
Ako koristite sustav bez GUI-a ili imate problema s preglednikom:
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

# Prikaži svu konfiguraciju
azd config list
```

### Varijable okruženja
Dodajte u profil svoje ljuske (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracija Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracija azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogući zapisivanje za otklanjanje pogrešaka
```

## Integracija IDE-a

### Visual Studio Code
Instalirajte Azure Developer CLI proširenje:
1. Otvorite VS Code
2. Idite na Extensions (Ctrl+Shift+X)
3. Pretražite "Azure Developer CLI"
4. Instalirajte proširenje

Značajke:
- IntelliSense za azure.yaml
- Integrirane naredbe u terminalu
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
1. Instalirajte Azure dodatak
2. Konfigurirajte Azure vjerodajnice
3. Koristite integrirani terminal za azd naredbe

## 🐛 Rješavanje problema s instalacijom

### Česti problemi

#### Pristup odbijen (Windows)
```powershell
# Pokrenite PowerShell kao administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi s PATH-om
Ručno dodajte azd u svoj PATH:

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

# Preskoči provjeru SSL certifikata (nije preporučeno za produkciju)
azd config set http.insecure true
```

#### Sukobi verzija
```bash
# Uklonite stare instalacije
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Očistite konfiguraciju
rm -rf ~/.azd
```

### Dobivanje dodatne pomoći
```bash
# Omogući zapisivanje za otklanjanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Prikaži trenutnu konfiguraciju
azd config list

# Prikaži trenutno stanje implementacije
azd show
```

## Ažuriranje azd-a

### Automatska ažuriranja
azd će vas obavijestiti kada su ažuriranja dostupna:
```bash
azd version --check-for-updates
```

### Ručno ažuriranje

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

**Azure CLI (az)**: Alat niskog nivoa za upravljanje pojedinačnim Azure resursima
- `az webapp create`, `az storage account create`
- Jedan resurs odjednom
- Fokus na upravljanju infrastrukturom

**Azure Developer CLI (azd)**: Alat visokog nivoa za kompletna postavljanja aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Radni tokovi temeljeni na predlošcima
- Fokus na produktivnost programera

**Treba vam oboje**: azd koristi az CLI za autentikaciju
</details>

<details>
<summary><strong>Mogu li koristiti azd s postojećim Azure resursima?</strong></summary>

Da! Možete:
1. Uvoziti postojeće resurse u azd okruženja
2. Referencirati postojeće resurse u svojim Bicep predlošcima
3. Koristiti azd za nove implementacije uz postojeću infrastrukturu

Vidi [Vodič za konfiguraciju](configuration.md) za detalje.
</details>

<details>
<summary><strong>Radi li azd s Azure Government ili Azure China?</strong></summary>

Da, konfigurirajte cloud:
```bash
# Azure za vladu
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Mogu li koristiti azd u CI/CD cjevovodima?</strong></summary>

Apsolutno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentikacija servisnim principalom
- Neinteraktivni način

Vidi [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) za CI/CD obrasce.
</details>

<details>
<summary><strong>Koliki su troškovi korištenja azd-a?</strong></summary>

azd sam po sebi je **potpuno besplatan** i otvorenog koda. Plaćate samo:
- Azure resurse koje implementirate
- Troškove Azure potrošnje (računalni resursi, pohrana, itd.)

Upotrijebite `azd provision --preview` za procjenu troškova prije implementacije.
</details>

## Sljedeći koraci

1. **Dovršite autentikaciju**: Osigurajte pristup svojoj Azure pretplati
2. **Isprobajte svoju prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte svoj IDE**: Postavite svoje razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavi probleme](https://github.com/Azure/azure-dev/issues)
- [Diskusije zajednice](https://github.com/Azure/azure-dev/discussions)
- [Podrška za Azure](https://azure.microsoft.com/support/)

---

**Navigacija poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove & Brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md) 
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj s fokusom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) da započnete gradnju s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako se trudimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz uporabe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
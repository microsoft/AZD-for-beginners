# Vodič za instalaciju i postavljanje

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj detaljni vodič vodit će vas kroz instalaciju i konfiguraciju Azure Developer CLI (azd) na vašem sustavu. Naučit ćete nekoliko metoda instalacije za različite operacijske sustave, postavljanje autentifikacije i početnu konfiguraciju kako biste pripremili razvojno okruženje za Azure implementacije.

## Ciljevi učenja

Do kraja ove lekcije ćete:
- Uspješno instalirati Azure Developer CLI na vaš operacijski sustav
- Konfigurirati autentifikaciju s Azureom koristeći različite metode
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada koristiti svaku
- Rješavati uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon završetka ove lekcije moći ćete:
- Instalirati azd koristeći prikladnu metodu za vašu platformu
- Autentificirati se na Azure pomoću `azd auth login`
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati razvojno okruženje za optimalno korištenje azd-a
- Neovisno riješiti uobičajene probleme s instalacijom

Ovaj vodič pomoći će vam instalirati i konfigurirati Azure Developer CLI na vašem sustavu, bez obzira na vaš operacijski sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a, osigurajte da imate:
- **Azure pretplatu** - [Napravite besplatan račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za autentifikaciju i upravljanje resursima
- **Git** - Za kloniranje predložaka i upravljanje verzijama
- **Docker** (opcionalno) - Za aplikacije u kontejnerima

## Metode instalacije

### Windows

#### Opcija 1: Windows Package Manager (Preporučeno)
```cmd
winget install microsoft.azd
```

#### Opcija 2: PowerShell skripta za instalaciju
```powershell
# Korisno kada winget nije dostupan
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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

#### Opcija 2: Skripta za instalaciju
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 3: Ručna instalacija
```bash
# Preuzmite i instalirajte
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcija 1: Skripta za instalaciju (Preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Package manageri

**Ručno instaliranje iz release paketa:**
```bash
# Preuzmite najnoviji arhiv za vašu Linux arhitekturu s:
# https://github.com/Azure/azure-dev/releases
# Zatim ga raspakirajte i dodajte azd binarni program u svoj PATH.
```

### GitHub Codespaces

Neki Codespaces i razvojna okruženja već uključuju `azd`, no trebali biste to provjeriti umjesto pretpostavke:

```bash
azd version
```

Ako `azd` nedostaje, instalirajte ga standardnom skriptom za okruženje.

### Docker

```bash
# Pokrenite azd u spremniku
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Stvorite alias za lakšu upotrebu
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Provjera instalacije

Nakon instalacije, provjerite radi li azd ispravno:

```bash
# Provjeri verziju
azd version

# Prikaži pomoć
azd --help

# Popis dostupnih predložaka
azd template list
```

Očekivani ispis:
```
azd version 1.x.x (commit xxxxxx)
```

**Napomena**: Stvarna verzija varira. Pogledajte [izdanja Azure Developer CLI](https://github.com/Azure/azure-dev/releases) za najnoviju verziju.

**✅ Kontrolni popis uspješne instalacije:**
- [ ] `azd version` prikazuje verziju bez grešaka
- [ ] `azd --help` prikazuje dokumentaciju naredbi
- [ ] `azd template list` prikazuje dostupne predloške
- [ ] Možete stvoriti testni direktorij i uspješno pokrenuti `azd init`

**Ako su svi checkovi prošli, spremni ste za nastavak na [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentifikacije

### Preporučena početnička konfiguracija

Za AZD-prve tijekove rada prijavite se s `azd auth login`.

```bash
# Potrebno za AZD naredbe kao što je azd up
azd auth login

# Provjerite status AZD autentifikacije
azd auth login --check-status
```

Koristite prijavu putem Azure CLI samo ako planirate sami koristiti `az` naredbe tijekom tečaja.

### Autentifikacija putem Azure CLI (opcionalno)
```bash
# Instalirajte Azure CLI ako već nije instaliran
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: pogledajte upute za instalaciju Azure CLI-ja za vašu distribuciju

# Prijavite se u Azure
az login

# Provjerite autentifikaciju
az account show
```

### Koji način prijave koristiti?

- Koristite `azd auth login` ako pratite početnički AZD put i uglavnom koristite `azd` naredbe.
- Također koristite `az login` ako želite pokretati Azure CLI naredbe poput `az account show` ili direktno pregledavati resurse.
- Ako vježba uključuje i `azd` i `az` naredbe, pokrenite oba načina prijave jednom na početku.

### Autentifikacija putem Device Code-a
Ako koristite sustav bez sučelja ili imate probleme s preglednikom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Za automatizirana okruženja:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Provjera potpune postavke

Ako želite brzu provjeru spremnosti prije početka poglavlja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguracija

### Globalna konfiguracija
```bash
# Postavi zadanu pretplatu
azd config set defaults.subscription <subscription-id>

# Postavi zadanu lokaciju
azd config set defaults.location eastus2

# Prikaži svu konfiguraciju
azd config show
```

### Varijable okruženja
Dodajte u profil ljuske (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguracija
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Omogući zapisivanje debug podataka
```

## Integracija u IDE

### Visual Studio Code
Instalirajte Azure Developer CLI ekstenziju:
1. Otvorite VS Code
2. Idite na Ekstenzije (Ctrl+Shift+X)
3. Pretražite "Azure Developer CLI"
4. Instalirajte ekstenziju

Značajke:
- IntelliSense za azure.yaml
- Integrirani terminal i naredbe
- Pregledavanje predložaka
- Praćenje implementacije

### GitHub Codespaces
Napravite `.devcontainer/devcontainer.json`:
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

#### Zabranjen pristup (Windows)
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

# Preskoči SSL verifikaciju (nije preporučljivo za produkciju)
azd config set http.insecure true
```

#### Sukobi verzija
```bash
# Ukloni stare instalacije
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: uklonite prethodnu azd binarnu datoteku ili simboličku vezu prije ponovne instalacije

# Očisti konfiguraciju
rm -rf ~/.azd
```

### Dobivanje dodatne pomoći
```bash
# Omogući zapisivanje debug logova
export AZD_DEBUG=true
azd <command> --debug

# Prikaži trenutnu konfiguraciju
azd config show

# Prikaži trenutni status implementacije
azd show
```

## Ažuriranje azd-a

### Provjera ažuriranja
azd upozorava kada je dostupno novo izdanje, a trenutačnu verziju provjeravate s:
```bash
azd version
```

### Ručna ažuriranja

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

## 💡 Često postavljana pitanja

<details>
<summary><strong>Koja je razlika između azd i az CLI?</strong></summary>

**Azure CLI (az)**: Niskorazinski alat za upravljanje pojedinačnim Azure resursima
- `az webapp create`, `az storage account create`
- Jedan resurs u jednom trenutku
- Fokus na upravljanje infrastrukturom

**Azure Developer CLI (azd)**: Visokorazinski alat za potpunu implementaciju aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Tijek rada temeljen na predlošcima
- Fokus na produktivnost developera

**Potrebna su oba**: azd koristi az CLI za autentifikaciju
</details>

<details>
<summary><strong>Mogu li koristiti azd s postojećim Azure resursima?</strong></summary>

Da! Možete:
1. Uvesti postojeće resurse u azd okruženja
2. Referencirati postojeće resurse u vašim Bicep predlošcima
3. Koristiti azd za nove implementacije zajedno s postojećom infrastrukturom

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
<summary><strong>Mogu li koristiti azd u CI/CD pipeline-ima?</strong></summary>

Apsolutno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentifikacija putem service principala
- Neinteraktivni način rada

Pogledajte [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) za CI/CD primjere.
</details>

<details>
<summary><strong>Koji je trošak korištenja azd-a?</strong></summary>

azd sam po sebi je **potpuno besplatan** i open-source. Plaćate samo:
- Azure resurse koje implementirate
- Troškove korištenja Azure usluga (računanje, pohrana itd.)

Koristite `azd provision --preview` za procjenu troškova prije implementacije.
</details>

## Sljedeći koraci

1. **Dovršite autentifikaciju**: Provjerite imate li pristup Azure pretplati
2. **Isprobajte prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte IDE**: Postavite razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite probleme](https://github.com/Azure/azure-dev/issues)
- [Diskusije zajednice](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobijte smjernice za Azure naredbe direktno u vašem editoru s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) i započnite razvoj s azd-om.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku smatra se službenim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne preuzimamo odgovornost za bilo kakve nesporazume ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
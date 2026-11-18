# Vodič za instalaciju i postavljanje

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [AZD Osnove](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj usmjeren na umjetnu inteligenciju](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj detaljan vodič provest će vas kroz instalaciju i konfiguraciju Azure Developer CLI (azd) na vašem sustavu. Naučit ćete različite metode instalacije za različite operativne sustave, postavljanje autentikacije i početnu konfiguraciju kako biste pripremili svoje razvojno okruženje za implementacije na Azure.

## Ciljevi učenja

Do kraja ove lekcije, moći ćete:
- Uspješno instalirati Azure Developer CLI na vaš operativni sustav
- Konfigurirati autentikaciju s Azure koristeći različite metode
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada koristiti koju
- Riješiti uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon završenog učenja, moći ćete:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se na Azure pomoću azd auth login
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati razvojno okruženje za optimalnu upotrebu azd
- Samostalno riješiti česte probleme pri instalaciji

Ovaj vodič pomoći će vam da instalirate i konfigurirate Azure Developer CLI na vašem sustavu, bez obzira na vaš operacijski sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd, provjerite imate li:
- **Azure pretplatu** - [Napravite besplatan račun](https://azure.microsoft.com/free/)
- **Azure CLI** (opcionalno) - Za primjere koji izričito koriste `az`; azd se autentificira samostalno
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (opcionalno) - Za kontejnerizirane aplikacije

**Put Foundry GA za Poglavlje 2:** Koristite AZD **1.37.0 ili noviji**, instalirajte paket s `azd ext install microsoft.foundry`, te koristite Python **3.13+** i trenutni **uv** za uzorak hosted-agenta. Njegov način implementacije koda se izrađuje udaljeno, pa lokalna Docker izgradnja nije potrebna. Potrebne su i Foundry dozvole, regionalna dostupnost modela te kvote; pogledajte [postavljanje hosted-agenta](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metode instalacije

### Windows

#### Opcija 1: Windows Package Manager (preporučeno)
```cmd
winget install microsoft.azd
```

#### Opcija 2: PowerShell instalacijski skript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcija 3: Chocolatey
```cmd
choco install azd
```

#### Opcija 4: Ručna instalacija
1. Preuzmite najnovije izdanje s [GitHub](https://github.com/Azure/azure-dev/releases)
2. Raspakirajte u `C:\Program Files\azd\`
3. Dodajte u PATH varijablu okoline

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
Preuzmite arhivu za vašu macOS arhitekturu s [release assets](https://github.com/Azure/azure-dev/releases), raspakirajte je i dodajte `azd` binarnu datoteku u vaš `PATH`.

### Linux

#### Opcija 1: Instalacijski skript (preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Package Manager-i

**Ručna instalacija iz release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Neki Codespaces i razvojna kontejnerska okruženja već uključuju `azd`, ali to biste trebali provjeriti umjesto pretpostavljati:

```bash
azd version
```

Ako `azd` nedostaje, instalirajte ga standardnim skriptom za okruženje.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ovaj privremeni kontejner ne čuva stanje prijave između pokretanja. Za ponovljene implementacije koristite [postavljanje dev kontejnera](dev-containers.md); kontejnerske izrade također zahtijevaju dostupan Docker daemon iznutra kontejnera.

## ✅ Provjera instalacije

Nakon instalacije, provjerite radi li azd ispravno:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očekivani ispis:
```
azd version 1.x.x (commit xxxxxx)
```

**Napomena**: Stvarna verzija će varirati. Provjerite [Azure Developer CLI izdanja](https://github.com/Azure/azure-dev/releases) za najnoviju verziju.

**✅ Popis za provjeru uspjeha instalacije:**
- [ ] `azd version` prikazuje broj verzije bez grešaka
- [ ] `azd --help` prikazuje dokumentaciju naredbi
- [ ] `azd template list` prikazuje dostupne predloške
- [ ] Možete kreirati testni direktorij i uspješno pokrenuti `azd init`

**Ako sve provjere uspiju, spremni ste nastaviti na [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentikacije

### Preporučeno početničko postavljanje

Za AZD-prvo tijek rada, prijavite se s `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Koristite Azure CLI prijavu samo ako planirate sami pokretati `az` naredbe tijekom tečaja.

### Azure CLI autentikacija (opcionalno)
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

### Koji biste način prijave trebali koristiti?

- Koristite `azd auth login` ako pratite početnički AZD put i uglavnom pokrećete `azd` naredbe.
- Koristite također `az login` kad želite pokretati Azure CLI naredbe kao što su `az account show` ili direktno pregledavati resurse.
- Ako vježba uključuje i `azd` i `az` naredbe, pokrenite oba načina prijave jednom na početku.

### Autentikacija pomoću Device Code
Ako ste na sustavu bez GUI-a ili imate probleme s preglednikom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Za automatizirana okruženja:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Provjerite cjelokupno postavljanje

Ako želite brzu provjeru spremnosti prije početka Poglavlja 1:

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
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Varijable okoline
Dodajte u vaš shell profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integracija u IDE

### Visual Studio Code
Instalirajte Azure Developer CLI proširenje:
1. Otvorite VS Code
2. Idite na Proširenja (Ctrl+Shift+X)
3. Pretražite "Azure Developer CLI"
4. Instalirajte proširenje

Značajke:
- IntelliSense za azure.yaml
- Integrirane terminal naredbe
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

### Uobičajeni problemi

#### Dozvola odbijena (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi s PATH
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

#### Problemi s mrežom/proxy-em
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Sukobi verzija
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Dodatna pomoć
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Ažuriranje azd

### Provjera ažuriranja
azd upozorava kada je dostupna novija verzija, a možete provjeriti trenutnu verziju s:
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

**Azure CLI (az)**: Niskorazinska alatka za upravljanje pojedinačnim Azure resursima
- `az webapp create`, `az storage account create`
- Jedan resurs u jednom trenutku
- Fokus na upravljanju infrastrukturom

**Azure Developer CLI (azd)**: Visokorazinska alatka za kompletne implementacije aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Radni tok baziran na predlošcima
- Fokus na produktivnost programera

**Neovisni su**: azd prema zadanim postavkama koristi vlastitu autentikaciju. Instalirajte i prijavite se u Azure CLI samo za `az` naredbe, ili eksplicitno odlučite koristiti `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Mogu li koristiti azd s postojećim Azure resursima?</strong></summary>

Da! Možete:
1. Uvesti postojeće resurse u azd okruženja
2. Referencirati postojeće resurse u vašim Bicep predlošcima
3. Koristiti azd za nove implementacije uz postojeću infrastrukturu

Pogledajte [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md) za detalje.
</details>

<details>
<summary><strong>Radi li azd s Azure Government ili Azure China?</strong></summary>

Da, konfigurirajte oblak:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ako koristite i Azure CLI, zasebno konfigurirajte `az cloud set --name ...`. Usluge predložaka i dostupnost modela razlikuju se ovisno o oblaku.
</details>

<details>
<summary><strong>Mogu li koristiti azd u CI/CD cjevovodima?</strong></summary>

Apsolutno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentikacija putem service principala
- Neinteraktivni način rada

Pogledajte [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) za CI/CD obrasce.
</details>

<details>
<summary><strong>Koliki su troškovi korištenja azd?</strong></summary>

Sam azd je **potpuno besplatan** i open-source. Plaćate samo:
- Azure resurse koje implementirate
- Troškove potrošnje Azure (računanje, pohrana, itd.)

Koristite `azd provision --preview` za pregled predloženih resursa, a zatim procijenite njihove troškove pomoću [Azure kalkulatora cijena](https://azure.microsoft.com/pricing/calculator/). Pregled ne računa cijene.
</details>

## Sljedeći koraci

1. **Dovršite autentikaciju**: Provjerite možete li pristupiti vašoj Azure pretplati
2. **Isprobajte svoju prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte svoj IDE**: Postavite svoje razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite probleme](https://github.com/Azure/azure-dev/issues)
- [Zajedničke rasprave](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobijte pomoć za Azure naredbe direktno u vašem uređivaču s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [AZD Osnove](azd-basics.md) 
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj usmjeren na umjetnu inteligenciju](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) i započnite graditi s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
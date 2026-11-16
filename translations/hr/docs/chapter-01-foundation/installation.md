# Vodič za instalaciju i postavljanje

**Navigacija poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md)
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj s fokusom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni vodič provest će vas kroz instalaciju i konfiguraciju Azure Developer CLI-ja (azd) na vašem sustavu. Naučit ćete različite metode instalacije za različite operativne sustave, postavljanje autentifikacije te početnu konfiguraciju kako biste pripremili svoje razvojno okruženje za Azure implementacije.

## Ciljevi učenja

Do kraja ove lekcije, moći ćete:
- Uspješno instalirati Azure Developer CLI na vaš operativni sustav
- Konfigurirati autentifikaciju s Azureom koristeći različite metode
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada koristiti koju
- Riješiti uobičajene probleme s instalacijom i postavkama

## Ishodi učenja

Nakon što završite ovu lekciju, bit ćete u mogućnosti:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se u Azure pomoću naredbe azd auth login
- Provjeriti svoju instalaciju i testirati osnovne naredbe azd
- Konfigurirati razvojno okruženje za optimalnu upotrebu azd-a
- Samostalno riješiti uobičajene probleme s instalacijom

Ovaj vodič pomoći će vam da instalirate i konfigurirate Azure Developer CLI na vašem sustavu, bez obzira na operativni sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a, provjerite imate li:
- **Pretplatu na Azure** - [Kreirajte besplatan račun](https://azure.microsoft.com/free/)
- **Azure CLI** (opcionalno) - Za primjere koji eksplicitno koriste `az`; azd se autentificira neovisno
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (opcionalno) - Za aplikacije u kontejnerima

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
1. Preuzmite najnovije izdanje s [GitHub-a](https://github.com/Azure/azure-dev/releases)
2. Izdvojite u `C:\Program Files\azd\`
3. Dodajte u varijablu okoline PATH

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
Preuzmite arhivu za vašu macOS arhitekturu s [izdanja](https://github.com/Azure/azure-dev/releases), izvadite je i dodajte binarnu datoteku `azd` u svoj `PATH`.

### Linux

#### Opcija 1: Instalacijski skript (preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Paketni menadžeri

**Ručna instalacija iz izdanja:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Neki Codespaci i razvojna kontejnerska okruženja već uključuju `azd`, ali preporučuje se da to potvrdite umjesto da pretpostavljate:

```bash
azd version
```

Ako `azd` nedostaje, instalirajte ga standardnim skriptom za to okruženje.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ovaj privremeni kontejner ne čuva stanje prijave između pokretanja. Za ponovljene implementacije koristite [postavku razvojnog kontejnera](dev-containers.md); izgradnje kontejnera također zahtijevaju dostupnog Docker demona unutar kontejnera.

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

Očekivani izlaz:
```
azd version 1.x.x (commit xxxxxx)
```

**Napomena**: Stvarna verzija može varirati. Provjerite [Azure Developer CLI izdanja](https://github.com/Azure/azure-dev/releases) za najnoviju verziju.

**✅ Popis za provjeru uspješne instalacije:**
- [ ] `azd version` prikazuje broj verzije bez grešaka
- [ ] `azd --help` prikazuje dokumentaciju naredbi
- [ ] `azd template list` prikazuje dostupne predloške
- [ ] Možete kreirati testni direktorij i uspješno pokrenuti `azd init`

**Ako su svi koraci prošli, spremni ste za [Vaš prvi projekt](first-project.md)!**

## Postavljanje autentifikacije

### Preporučena početnička postavka

Za radne tokove temeljene na AZD-u, prijavite se s `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Koristite prijavu putem Azure CLI-ja samo ako planirate sami koristiti naredbe `az` tijekom tečaja.

### Azure CLI autentifikacija (opcionalno)
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

### Koji način prijave trebate koristiti?

- Koristite `azd auth login` ako slijedite početnički AZD put i uglavnom koristite naredbe `azd`.
- Koristite i `az login` ako želite koristiti Azure CLI naredbe poput `az account show` ili direktno pregledavati resurse.
- Ako vježba uključuje i `azd` i `az` naredbe, pokrenite obje naredbe za prijavu jednom na početku.

### Autentifikacija kodom uređaja
Ako koristite sustav bez sučelja ili imate probleme s preglednikom:
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

### Provjerite svoju kompletnu postavku

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
Dodajte u svoj profil ljuske (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integracija u IDE

### Visual Studio Code
Instalirajte Azure Developer CLI ekstenziju:
1. Otvorite VS Code
2. Idite na Ekstenzije (Ctrl+Shift+X)
3. Potražite "Azure Developer CLI"
4. Instalirajte ekstenziju

Značajke:
- IntelliSense za azure.yaml
- Integrirane naredbe u terminalu
- Pregled predložaka
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

#### Problemi s mrežom/proksijem
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

### Dobivanje dodatne pomoći
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Ažuriranje azd-a

### Provjera ažuriranja
azd vas upozorava kada je dostupno novije izdanje i možete provjeriti svoju trenutnu verziju s:
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
- Jedan resurs u isto vrijeme
- Fokus na upravljanje infrastrukturom

**Azure Developer CLI (azd)**: Visokorazinski alat za cjelovite implementacije aplikacija
- `azd up` implementira cijelu aplikaciju sa svim resursima
- Radni tokovi temeljeni na predlošcima
- Fokus na produktivnost programera

**Neovisni su**: azd ima vlastitu autentifikaciju prema zadanim postavkama. Instalirajte i prijavite se u Azure CLI samo za `az` naredbe, ili se eksplicitno odlučite za `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Mogu li koristiti azd s postojećim Azure resursima?</strong></summary>

Da! Možete:
1. Uvoziti postojeće resurse u azd okruženja
2. Referencirati postojeće resurse u svojim Bicep predlošcima
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

Ako koristite i Azure CLI, konfigurirajte `az cloud set --name ...` zasebno. Usluge predložaka i dostupnost modela variraju ovisno o oblaku.
</details>

<details>
<summary><strong>Mogu li koristiti azd u CI/CD pipeline-ima?</strong></summary>

Apsolutno! azd je dizajniran za automatizaciju:
- Integracija s GitHub Actions
- Podrška za Azure DevOps
- Autentifikacija putem service principala
- Način rada bez interakcije

Pogledajte [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) za CI/CD uzorke.
</details>

<details>
<summary><strong>Koliki je trošak korištenja azd-a?</strong></summary>

Sam azd je **potpuno besplatan** i otvorenog koda. Plaćate samo:
- Azure resurse koje implementirate
- Troškove potrošnje Azurea (računalna snaga, pohrana itd.)

Koristite `azd provision --preview` za pregled predloženih resursa, a zatim procijenite njihove troškove s [Azure kalkulatorom cijena](https://azure.microsoft.com/pricing/calculator/). Pregled ne izračunava cijene.
</details>

## Sljedeći koraci

1. **Dovršite autentifikaciju**: Osigurajte pristup svojoj Azure pretplati
2. **Isprobajte svoju prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte svoj IDE**: Postavite razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite probleme](https://github.com/Azure/azure-dev/issues)
- [Diskusije zajednice](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Dobijte upute za Azure naredbe direktno u svom uređivaču s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Osnove AZD-a](azd-basics.md) 
- **➡️ Sljedeće**: [Vaš prvi projekt](first-project.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: Razvoj s fokusom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) da započnete izradu uz azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
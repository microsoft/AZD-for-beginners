# Ghid de instalare și configurare

**Navigarea capitolelor:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 1 - Fundamente & Start rapid
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md)
- **➡️ Următor**: [Primul tău proiect](first-project.md)
- **🚀 Capitolul următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Acest ghid cuprinzător te va conduce prin instalarea și configurarea Azure Developer CLI (azd) pe sistemul tău. Vei învăța mai multe metode de instalare pentru diferite sisteme de operare, configurarea autentificării și configurarea inițială pentru a pregăti mediul tău de dezvoltare pentru implementări Azure.

## Obiective de învățare

Până la finalul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind metode multiple
- Configura mediul tău de dezvoltare cu precondițiile necesare
- Înțelege opțiunile diferite de instalare și când să le folosești pe fiecare
- Depana problemele comune de instalare și configurare

## Rezultate de învățare

După ce finalizezi această lecție, vei putea să:
- Instalezi azd folosind metoda potrivită pentru platforma ta
- Te autentifici cu Azure folosind azd auth login
- Verifici instalarea și testezi comenzile de bază azd
- Configurezi mediul tău de dezvoltare pentru utilizare optimă azd
- Rezolvi problemele comune de instalare independent

Acest ghid te va ajuta să instalezi și să configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul tău de dezvoltare.

## Precondiții

Înainte de a instala azd, asigură-te că ai:
- **Abonament Azure** - [Creează un cont gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** (opțional) - Pentru exemple care rulează explicit `az`; azd se autentifică independent
- **Git** - Pentru clonarea șabloanelor și controlul versiunilor
- **Docker** (opțional) - Pentru aplicații containerizate

**Calea Foundry GA Capitolul 2:** Folosește AZD **1.37.0 sau mai nou**, instalează pachetul cu `azd ext install microsoft.foundry`, și folosește Python **3.13+** și **uv** curent pentru exemplul gazdei-agent. Modul său de implementare a codului construiește de la distanță, deci nu necesită o construire Docker locală. Permisiunile Foundry, disponibilitatea modelului regional și cota sunt încă necesare; vezi [configurarea gazdei-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metode de instalare

### Windows

#### Opțiunea 1: Windows Package Manager (Recomandat)
```cmd
winget install microsoft.azd
```

#### Opțiunea 2: Script de instalare PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opțiunea 3: Chocolatey
```cmd
choco install azd
```

#### Opțiunea 4: Instalare manuală
1. Descarcă ultima versiune de pe [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrage în `C:\Program Files\azd\`
3. Adaugă în variabila de mediu PATH

### macOS

#### Opțiunea 1: Homebrew (Recomandat)
```bash
brew tap azure/azd
brew install azd
```

#### Opțiunea 2: Script de instalare
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 3: Instalare manuală
Descarcă arhiva pentru arhitectura macOS de pe [asseturile versiunii](https://github.com/Azure/azure-dev/releases), extrage-o și adaugă binarul `azd` în `PATH`.

### Linux

#### Opțiunea 1: Script de instalare (Recomandat)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de pachete

**Instalare manuală din asseturile versiunii:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Unele medi studiocode și containere dev includ deja `azd`, dar ar trebui să verifici în loc să presupui asta:

```bash
azd version
```

Dacă lipsește `azd`, instalează-l cu scriptul standard pentru mediu.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Acest container efemer nu păstrează starea de autentificare între rulări. Pentru implementări repetate, folosește [configurarea containerului dev](dev-containers.md); construirile containerelor necesită și un daemon Docker accesibil din interiorul containerului.

## ✅ Verifică instalarea

După instalare, verifică dacă azd funcționează corect:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Ieșire așteptată:
```
azd version 1.x.x (commit xxxxxx)
```

**Notă**: Numărul efectiv al versiunii poate varia. Verifică [lansările Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pentru ultima versiune.

**✅ Lista de verificare succes instalare:**
- [ ] `azd version` afișează numărul versiunii fără erori
- [ ] `azd --help` afișează documentația comenzilor
- [ ] `azd template list` afișează șabloanele disponibile
- [ ] Poți crea un director de test și rula `azd init` cu succes

**Dacă toate verificările trec, ești gata să continui spre [Primul tău proiect](first-project.md)!**

## Configurare autentificare

### Configurare recomandată pentru începători

Pentru fluxurile de lucru AZD-first, autentifică-te cu `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Folosește autentificarea Azure CLI doar când plănuiești să rulezi singur comenzile `az` pe parcursul cursului.

### Autentificare Azure CLI (Opțional)
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

### Ce flux de autentificare ar trebui să folosești?

- Folosește `azd auth login` dacă urmezi calea AZD pentru începători și rulezi în principal comenzi `azd`.
- Folosește `az login` de asemenea când vrei să rulezi comenzi Azure CLI cum ar fi `az account show` sau să inspectezi resurse direct.
- Dacă un exercițiu include atât comenzi `azd`, cât și `az`, rulează ambele comenzi de autentificare o dată la început.

### Autentificare Device Code
Dacă folosești un sistem fără interfață grafică sau ai probleme cu browserul:
```bash
azd auth login --use-device-code
```

### Principal de serviciu (CI/CD)
Pentru medii automatizate:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validează configurarea completă

Dacă vrei o verificare rapidă de pregătire înainte să începi Capitolul 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configurare

### Configurare globală
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variabile de mediu
Adaugă în profilul shell-ului tău (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrare IDE

### Visual Studio Code
Instalează extensia Azure Developer CLI:
1. Deschide VS Code
2. Mergi la Extensii (Ctrl+Shift+X)
3. Caută "Azure Developer CLI"
4. Instalează extensia

Funcționalități:
- IntelliSense pentru azure.yaml
- Comenzi terminal integrate
- Navigare șabloane
- Monitorizarea implementărilor

### GitHub Codespaces
Creează un `.devcontainer/devcontainer.json`:
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
1. Instalează pluginul Azure
2. Configurează credențialele Azure
3. Folosește terminalul integrat pentru comenzile azd

## 🐛 Depanare Instalare

### Probleme comune

#### Permisiune refuzată (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Probleme PATH
Adaugă manual azd în PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Probleme rețea/proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflicte versiune
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Obținerea de ajutor suplimentar
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Actualizarea azd

### Verificare actualizare
azd avertizează când o versiune mai nouă este disponibilă, poți confirma build-ul actual cu:
```bash
azd version
```

### Actualizări manuale

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

## 💡 Întrebări frecvente

<details>
<summary><strong>Care este diferența dintre azd și az CLI?</strong></summary>

**Azure CLI (az)**: Unealtă low-level pentru administrarea individuală a resurselor Azure
- `az webapp create`, `az storage account create`
- O resursă la un moment dat
- Concentrare pe gestionarea infrastructurii

**Azure Developer CLI (azd)**: Unealtă high-level pentru implementări complete de aplicații
- `azd up` implementează aplicația completă cu toate resursele
- Fluxuri bazate pe șabloane
- Concentrare pe productivitatea dezvoltatorului

**Sunt independente**: azd folosește propria autentificare în mod implicit. Instalează și autentifică-te în Azure CLI doar pentru comenzile `az`, sau optează explicit pentru `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Da! Poți:
1. Importa resurse existente în mediile azd
2. Referi resurse existente în șabloanele tale Bicep
3. Folosi azd pentru implementări noi alături de infrastructura existentă

Vezi [Ghidul de configurare](../chapter-03-configuration/configuration.md) pentru detalii.
</details>

<details>
<summary><strong>Funcționează azd cu Azure Government sau Azure China?</strong></summary>

Da, configurează cloud-ul:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Dacă folosești și Azure CLI, configurează `az cloud set --name ...` separat. Serviciile șabloanelor și disponibilitatea modelelor variază în funcție de cloud.
</details>

<details>
<summary><strong>Pot folosi azd în pipeline-uri CI/CD?</strong></summary>

Absolut! azd este proiectat pentru automatizare:
- Integrare GitHub Actions
- Suport Azure DevOps
- Autentificare prin principal de serviciu
- Mod non-interactiv

Vezi [Ghidul de implementare](../chapter-04-infrastructure/deployment-guide.md) pentru modele CI/CD.
</details>

<details>
<summary><strong>Cât costă utilizarea azd?</strong></summary>

Azd în sine este **complet gratuit** și open-source. Plătești doar pentru:
- Resursele Azure pe care le implementezi
- Costurile de consum Azure (calcul, stocare, etc.)

Folosește `azd provision --preview` pentru a inspecta resursele propuse, apoi estimează costurile acestora cu [Calculatorul de prețuri Azure](https://azure.microsoft.com/pricing/calculator/). Previzualizarea nu calculează prețuri.
</details>

## Pași următori

1. **Completează autentificarea**: Asigură-te că poți accesa abonamentul Azure
2. **Încearcă prima implementare**: Urmează [Ghidul primului proiect](first-project.md)
3. **Explorează șabloanele**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul**: Setează-ți mediul de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Documentație oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportează probleme](https://github.com/Azure/azure-dev/issues)
- [Discuții comunitare](https://github.com/Azure/azure-dev/discussions)
- [Suport Azure](https://azure.microsoft.com/support/)
- [**Competențe Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - Obține ghidare pentru comenzi Azure direct în editor cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigarea capitolelor:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 1 - Fundamente & Start rapid
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md) 
- **➡️ Următor**: [Primul tău proiect](first-project.md)
- **🚀 Capitolul următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalare finalizată!** Continuă la [Primul tău proiect](first-project.md) pentru a începe să construiești cu azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
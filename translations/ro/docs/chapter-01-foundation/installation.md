# Ghid de Instalare și Configurare

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Bazele & Pornire Rapidă
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md)
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Acest ghid cuprinzător te va ghida prin instalarea și configurarea Azure Developer CLI (azd) pe sistemul tău. Vei învăța mai multe metode de instalare pentru diferite sisteme de operare, configurarea autentificării și configurarea inițială pentru a pregăti mediul de dezvoltare pentru implementări în Azure.

## Obiective de învățare

La finalul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind mai multe metode
- Configura mediul tău de dezvoltare cu prerrequisitile necesare
- Înțelege diferitele opțiuni de instalare și când să folosești fiecare
- Depana probleme comune de instalare și configurare

## Rezultate de învățare

După ce parcurgi această lecție, vei putea:
- Instala azd folosind metoda corespunzătoare platformei tale
- Autentifica cu Azure folosind azd auth login
- Verifica instalarea și testa comenzile de bază azd
- Configura mediul tău de dezvoltare pentru utilizarea optimă a azd
- Rezolva probleme comune de instalare pe cont propriu

Acest ghid te va ajuta să instalezi și să configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul de dezvoltare.

## Prerrequisituri

Înainte de a instala azd, asigură-te că ai:
- **Abonament Azure** - [Creează un cont gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** (opțional) - Pentru exemple care rulează explicit `az`; azd se autentifică independent
- **Git** - Pentru clonarea șabloanelor și controlul versiunilor
- **Docker** (opțional) - Pentru aplicații containerizate

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
Descarcă arhiva pentru arhitectura macOS de pe [resursele de release](https://github.com/Azure/azure-dev/releases), extrage-o și adaugă binarul `azd` în `PATH`.

### Linux

#### Opțiunea 1: Script de instalare (Recomandat)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de pachete

**Instalare manuală din resursele de release:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Unele Codespaces și medii container dev includ deja `azd`, dar ar trebui să verifici acest fapt în loc să presupui:

```bash
azd version
```

Dacă `azd` lipsește, instalează-l cu scriptul standard pentru mediul respectiv.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Acest container efemer nu păstrează starea de autentificare între execuții. Pentru implementări repetate, folosește [configurarea containerului dev](dev-containers.md); construirea containerului necesită și un daemon Docker accesibil din interiorul containerului.

## ✅ Verificarea instalării

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

**Notă**: Numărul versiunii poate varia. Consultă [release-urile Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pentru ultima versiune.

**✅ Lista de verificare pentru succesul instalării:**
- [ ] `azd version` afișează numărul versiunii fără erori
- [ ] `azd --help` afișează documentația comenzilor
- [ ] `azd template list` afișează șabloanele disponibile
- [ ] Poți crea un director de test și rula `azd init` cu succes

**Dacă toate verificările trec, ești gata să continui cu [Primul Tău Proiect](first-project.md)!**

## Configurare autentificare

### Configurare recomandată pentru începători

Pentru fluxurile AZD-first, autentifică-te cu `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Folosește autentificarea Azure CLI doar atunci când intenționezi să rulezi tu însuți comenzile `az` pe parcursul cursului.

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
- Folosește de asemenea `az login` când vrei să rulezi comenzi Azure CLI ca `az account show` sau să inspectezi resurse direct.
- Dacă un exercițiu include ambele comenzi `azd` și `az`, rulează ambele comenzi de autentificare o dată la început.

### Autentificare cu cod de dispozitiv
Dacă ești pe un sistem fără interfață grafică sau ai probleme cu browser-ul:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Pentru medii automatizate:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validează configurația completă

Dacă dorești un test rapid de pregătire înainte de a începe Capitolul 1:

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

## Integrarea IDE

### Visual Studio Code
Instalează extensia Azure Developer CLI:
1. Deschide VS Code
2. Accesează Extensii (Ctrl+Shift+X)
3. Caută "Azure Developer CLI"
4. Instalează extensia

Funcționalități:
- IntelliSense pentru azure.yaml
- Comenzi terminal integrate
- Navigare șabloane
- Monitorizare implementare

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
1. Instalează plugin-ul Azure
2. Configurează credențialele Azure
3. Folosește terminalul integrat pentru comenzile azd

## 🐛 Depanare instalare

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

#### Probleme de rețea/proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflicte de versiune
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Obține mai mult ajutor
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
azd avertizează când o versiune nouă este disponibilă, iar poți verifica construcția curentă cu:
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

**Azure CLI (az)**: Unealtă la nivel scăzut pentru gestionarea resurselor individuale Azure
- `az webapp create`, `az storage account create`
- O resursă pe rând
- Focus pe gestionarea infrastructurii

**Azure Developer CLI (azd)**: Unealtă la nivel înalt pentru implementări complete de aplicații
- `azd up` implementează întreaga aplicație cu toate resursele
- Fluxuri de lucru bazate pe șabloane
- Focus pe productivitatea dezvoltatorului

**Sunt independente**: azd folosește propria autentificare implicit. Instalează și autentifică-te în Azure CLI doar pentru comenzile `az`, sau optează explicit pentru `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Da! Poți:
1. Importa resurse existente în mediile azd
2. Referenția resurse existente în șabloanele Bicep
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

Dacă folosești și Azure CLI, configurează `az cloud set --name ...` separat. Serviciile șablonului și disponibilitatea modelelor variază în funcție de cloud.
</details>

<details>
<summary><strong>Pot folosi azd în pipeline-uri CI/CD?</strong></summary>

Absolut! azd este conceput pentru automatizare:
- Integrare cu GitHub Actions
- Suport Azure DevOps
- Autentificare cu Service Principal
- Mod non-interactiv

Vezi [Ghidul de implementare](../chapter-04-infrastructure/deployment-guide.md) pentru modele CI/CD.
</details>

<details>
<summary><strong>Cât costă să folosesc azd?</strong></summary>

Azd în sine este **complet gratuit** și open-source. Plătești doar pentru:
- Resursele Azure pe care le implementezi
- Costurile de consum Azure (calcul, stocare, etc.)

Folosește `azd provision --preview` pentru a inspecta resursele propuse, apoi estimează costurile cu [Calculatorul de prețuri Azure](https://azure.microsoft.com/pricing/calculator/). Previzualizarea nu calculează prețurile.
</details>

## Următorii pași

1. **Finalizează autentificarea**: Asigură-te că poți accesa abonamentul Azure
2. **Încearcă prima implementare**: Urmează [Ghidul Primului Proiect](first-project.md)
3. **Explorează șabloane**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul tău**: Pregătește mediul de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Documentație oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportează probleme](https://github.com/Azure/azure-dev/issues)
- [Discuții comunitare](https://github.com/Azure/azure-dev/discussions)
- [Suport Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Primește indicații pentru comenzile Azure direct în editor cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Bazele & Pornire Rapidă
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md) 
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalare completă!** Continuă cu [Primul Tău Proiect](first-project.md) pentru a începe să construiești cu azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
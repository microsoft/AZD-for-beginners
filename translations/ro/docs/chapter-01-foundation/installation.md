# Ghid de Instalare și Configurare

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Fundament și Început Rapid
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md)
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Acest ghid cuprinzător te va conduce prin procesul de instalare și configurare a Azure Developer CLI (azd) pe sistemul tău. Vei învăța metode multiple de instalare pentru diferite sisteme de operare, configurarea autentificării și configurarea inițială pentru a-ți pregăti mediul de dezvoltare pentru implementările Azure.

## Obiective de Învățare

La sfârșitul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind mai multe metode
- Configura mediul tău de dezvoltare cu prerechizitele necesare
- Înțelege diferitele opțiuni de instalare și când să folosești fiecare
- Depana problemele comune de instalare și configurare

## Rezultate de Învățare

După finalizarea acestei lecții, vei putea:
- Instala azd folosind metoda potrivită platformei tale
- Autentifica cu Azure folosind azd auth login
- Verifica instalarea și testa comenzile azd de bază
- Configura mediul tău de dezvoltare pentru utilizare optimă a azd
- Rezolva probleme comune de instalare pe cont propriu

Acest ghid te va ajuta să instalezi și configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul de dezvoltare.

## Prerechizite

Înainte de a instala azd, asigură-te că ai:
- **Abonament Azure** - [Creează un cont gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pentru autentificare și gestionare resurse
- **Git** - Pentru clonarea șabloanelor și controlul versiunilor
- **Docker** (opțional) - Pentru aplicații containerizate

## Metode de Instalare

### Windows

#### Opțiunea 1: PowerShell (Recomandată)
```powershell
# Rulează ca administrator sau cu privilegii elevate
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opțiunea 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opțiunea 3: Chocolatey
```cmd
choco install azd
```

#### Opțiunea 4: Instalare Manuală
1. Descarcă ultima versiune de la [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrage în `C:\Program Files\azd\`
3. Adaugă la variabila de mediu PATH

### macOS

#### Opțiunea 1: Homebrew (Recomandată)
```bash
brew tap azure/azd
brew install azd
```

#### Opțiunea 2: Script de Instalare
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 3: Instalare Manuală
```bash
# Descarcă și instalează
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opțiunea 1: Script de Instalare (Recomandată)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de Pachete

**Ubuntu/Debian:**
```bash
# Adaugă depozitul de pachete Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalează azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Adăugați depozitul de pachete Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd vine preinstalat în GitHub Codespaces. Pur și simplu creează un codespace și începe să folosești azd imediat.

### Docker

```bash
# Rulează azd într-un container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Creează un alias pentru o utilizare mai ușoară
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifică Instalarea

După instalare, verifică dacă azd funcționează corect:

```bash
# Verifică versiunea
azd version

# Vizualizează ajutorul
azd --help

# Listează șabloanele disponibile
azd template list
```

Output așteptat:
```
azd version 1.x.x (commit xxxxxx)
```

**Notă**: Numărul versiunii reale va varia. Verifică [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pentru cea mai recentă versiune.

**✅ Lista de Verificare Succes Instalare:**
- [ ] `azd version` afișează numărul versiunii fără erori
- [ ] `azd --help` afișează documentația comenzilor
- [ ] `azd template list` afișează șabloanele disponibile
- [ ] `az account show` afișează abonamentul tău Azure
- [ ] Poți crea un director de test și să rulezi cu succes `azd init`

**Dacă toate verificările sunt OK, ești gata să continui la [Primul Tău Proiect](first-project.md)!**

## Configurarea Autentificării

### Autentificare Azure CLI (Recomandată)
```bash
# Instalează Azure CLI dacă nu este deja instalat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Autentifică-te în Azure
az login

# Verifică autentificarea
az account show
```

### Autentificare cu Cod Dispozitiv
Dacă folosești un sistem fără interfață grafică sau ai probleme cu browserul:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pentru medii automate:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configurare

### Configurare Globală
```bash
# Setează abonamentul implicit
azd config set defaults.subscription <subscription-id>

# Setează locația implicită
azd config set defaults.location eastus2

# Vizualizează toată configurația
azd config list
```

### Variabile de Mediu
Adaugă în profilul shell-ului tău (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configurare Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configurare azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Activează înregistrarea în modul de depanare
```

## Integrare IDE

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
Creează un fișier `.devcontainer/devcontainer.json`:
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
2. Configurează acreditările Azure
3. Folosește terminalul integrat pentru comenzile azd

## 🐛 Depanare Instalare

### Probleme Comune

#### Permisiune Refuzată (Windows)
```powershell
# Rulați PowerShell ca Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Probleme cu PATH
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

#### Probleme de Rețea/Proxy
```bash
# Configurează proxy-ul
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Sare peste verificarea SSL (nu este recomandat pentru producție)
azd config set http.insecure true
```

#### Conflicte de Versiune
```bash
# Elimină instalările vechi
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Curăță configurația
rm -rf ~/.azd
```

### Obținerea Mai Multor Ajutor
```bash
# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Vizualizează configurația curentă
azd config list

# Vizualizează starea curentă a implementării
azd show
```

## Actualizarea azd

### Actualizări Automate
azd te va notifica când sunt disponibile actualizări:
```bash
azd version --check-for-updates
```

### Actualizări Manuale

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

## 💡 Întrebări Frecvente

<details>
<summary><strong>Care este diferența dintre azd și az CLI?</strong></summary>

**Azure CLI (az)**: Unelte de nivel scăzut pentru gestionarea resurselor individuale Azure
- `az webapp create`, `az storage account create`
- O resursă pe rând
- Focus pe managementul infrastructurii

**Azure Developer CLI (azd)**: Unelte de nivel înalt pentru implementări complete de aplicații
- `azd up` implementează întreaga aplicație cu toate resursele
- Fluxuri de lucru bazate pe șabloane
- Focus pe productivitatea dezvoltatorului

**Ai nevoie de ambele**: azd utilizează az CLI pentru autentificare
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Da! Poți:
1. Importa resurse existente în mediile azd
2. Referi resurse existente în șabloanele tale Bicep
3. Folosi azd pentru implementări noi alături de infrastructura existentă

Vezi [Ghidul de Configurare](configuration.md) pentru detalii.
</details>

<details>
<summary><strong>Funcționează azd cu Azure Government sau Azure China?</strong></summary>

Da, configurează cloud-ul:
```bash
# Azure Guvernamental
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Pot folosi azd în pipeline-urile CI/CD?</strong></summary>

Absolut! azd este proiectat pentru automatizare:
- Integrare GitHub Actions
- Suport Azure DevOps
- Autentificare prin service principal
- Mod non-interactiv

Vezi [Ghidul de Implementare](../chapter-04-infrastructure/deployment-guide.md) pentru modele CI/CD.
</details>

<details>
<summary><strong>Cât costă utilizarea azd?</strong></summary>

azd în sine este **complet gratuit** și open-source. Plătești doar pentru:
- Resursele Azure pe care le implementezi
- Costurile de consum Azure (calcul, stocare, etc.)

Folosește `azd provision --preview` pentru a estima costurile înainte de implementare.
</details>

## Pașii Următori

1. **Finalizează autentificarea**: Asigură-te că poți accesa abonamentul tău Azure
2. **Încearcă prima implementare**: Urmează [Ghidul Primului Proiect](first-project.md)
3. **Explorează șabloanele**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul**: Pregătește mediul tău de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Documentație Oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportează Probleme](https://github.com/Azure/azure-dev/issues)
- [Discuții Comunitare](https://github.com/Azure/azure-dev/discussions)
- [Suport Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Primește ghidaj pentru comenzile Azure direct în editor cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Fundament și Început Rapid
- **⬅️ Anterior**: [Bazele AZD](azd-basics.md) 
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalare Finalizată!** Continuă către [Primul Tău Proiect](first-project.md) pentru a începe să folosești azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
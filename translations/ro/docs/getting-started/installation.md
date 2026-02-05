# Ghid de Instalare și Configurare

**Navigare Capitole:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 1 - Fundamente & Start Rapid
- **⬅️ Precedent**: [Bazele AZD](azd-basics.md)
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

## Introducere

Acest ghid cuprinzător te va ghida prin procesul de instalare și configurare a Azure Developer CLI (azd) pe sistemul tău. Vei învăța metode multiple de instalare pentru diferite sisteme de operare, configurarea autentificării și setările inițiale pentru a pregăti mediul de dezvoltare pentru implementările Azure.

## Obiective de Învățare

La finalul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind metode multiple
- Configura mediul de dezvoltare cu cerințele necesare
- Înțelege diferitele opțiuni de instalare și când să le folosești
- Depana probleme comune de instalare și configurare

## Rezultate de Învățare

După finalizarea acestei lecții, vei putea:
- Instala azd folosind metoda potrivită pentru platforma ta
- Autentifica cu Azure folosind `azd auth login`
- Verifica instalarea și testa comenzile de bază azd
- Configura mediul de dezvoltare pentru utilizarea optimă a azd
- Rezolva independent probleme comune de instalare

Acest ghid te va ajuta să instalezi și să configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul de dezvoltare.

## Cerințe Prealabile

Înainte de instalarea azd, asigură-te că ai:
- **Abonament Azure** - [Creează un cont gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pentru autentificare și gestionarea resurselor
- **Git** - Pentru clonarea șabloanelor și controlul versiunilor
- **Docker** (opțional) - Pentru aplicații containerizate

## Metode de Instalare

### Windows

#### Opțiunea 1: PowerShell (Recomandat)
```powershell
# Rulați ca Administrator sau cu privilegii ridicate
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
1. Descarcă cea mai recentă versiune de pe [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrage în `C:\Program Files\azd\`
3. Adaugă în variabila de mediu PATH

### macOS

#### Opțiunea 1: Homebrew (Recomandat)
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

#### Opțiunea 1: Script de Instalare (Recomandat)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de Pachete

**Ubuntu/Debian:**
```bash
# Adăugați depozitul de pachete Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalați azd
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

azd vine preinstalat în GitHub Codespaces. Creează pur și simplu un codespace și începe să folosești azd imediat.

### Docker

```bash
# Rulează azd într-un container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Creează un alias pentru utilizare mai ușoară
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificarea Instalării

După instalare, verifică dacă azd funcționează corect:

```bash
# Verifică versiunea
azd version

# Vizualizează ajutorul
azd --help

# Listează șabloanele disponibile
azd template list
```

Rezultatul așteptat:
```
azd version 1.5.0 (commit abc123)
```

**✅ Lista de Verificare pentru Succesul Instalării:**
- [ ] `azd version` afișează numărul versiunii fără erori
- [ ] `azd --help` afișează documentația comenzilor
- [ ] `azd template list` afișează șabloanele disponibile
- [ ] `az account show` afișează abonamentul tău Azure
- [ ] Poți crea un director de test și rula `azd init` cu succes

**Dacă toate verificările sunt trecute, ești gata să continui cu [Primul Tău Proiect](first-project.md)!**

## Configurarea Autentificării

### Autentificare Azure CLI (Recomandat)
```bash
# Instalați Azure CLI dacă nu este deja instalat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Conectați-vă la Azure
az login

# Verificați autentificarea
az account show
```

### Autentificare prin Cod Dispozitiv
Dacă ești pe un sistem fără interfață grafică sau ai probleme cu browserul:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pentru medii automatizate:
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

# Vizualizează toate configurațiile
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
export AZD_DEBUG=true  # Activare jurnalizare de depanare
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
- Comenzi integrate în terminal
- Navigare șabloane
- Monitorizare implementări

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
1. Instalează pluginul Azure
2. Configurează acreditivele Azure
3. Folosește terminalul integrat pentru comenzile azd

## 🐛 Depanarea Instalării

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
# Configurați proxy-ul
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Omiteți verificarea SSL (nu este recomandat pentru producție)
azd config set http.insecure true
```

#### Conflicte de Versiune
```bash
# Elimină instalările vechi
# Windows: winget dezinstalează Microsoft.Azd
# macOS: brew dezinstalează azd
# Linux: sudo apt elimină azd

# Curăță configurația
rm -rf ~/.azd
```

### Obținerea Mai Multor Ajutoare
```bash
# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Vizualizează jurnalele detaliate
azd logs

# Verifică informațiile sistemului
azd info
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
<summary><strong>Care este diferența între azd și az CLI?</strong></summary>

**Azure CLI (az)**: Instrument de nivel scăzut pentru gestionarea resurselor individuale Azure
- `az webapp create`, `az storage account create`
- O resursă la un moment dat
- Focus pe gestionarea infrastructurii

**Azure Developer CLI (azd)**: Instrument de nivel înalt pentru implementări complete de aplicații
- `azd up` implementează întreaga aplicație cu toate resursele
- Fluxuri de lucru bazate pe șabloane
- Focus pe productivitatea dezvoltatorilor

**Ai nevoie de ambele**: azd folosește az CLI pentru autentificare
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Da! Poți:
1. Importa resurse existente în medii azd
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
<summary><strong>Pot folosi azd în pipeline-uri CI/CD?</strong></summary>

Absolut! azd este conceput pentru automatizare:
- Integrare GitHub Actions
- Suport Azure DevOps
- Autentificare prin service principal
- Mod non-interactiv

Vezi [Ghidul de Implementare](../deployment/deployment-guide.md) pentru modele CI/CD.
</details>

<details>
<summary><strong>Care este costul utilizării azd?</strong></summary>

azd în sine este **complet gratuit** și open-source. Plătești doar pentru:
- Resursele Azure pe care le implementezi
- Costurile de consum Azure (compute, storage, etc.)

Folosește `azd provision --preview` pentru a estima costurile înainte de implementare.
</details>

## Pași Următori

1. **Completează autentificarea**: Asigură-te că poți accesa abonamentul tău Azure
2. **Încearcă prima ta implementare**: Urmează [Ghidul Primului Proiect](first-project.md)
3. **Explorează șabloanele**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul tău**: Setează mediul de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Documentație Oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportează Probleme](https://github.com/Azure/azure-dev/issues)
- [Discuții Comunitare](https://github.com/Azure/azure-dev/discussions)
- [Suport Azure](https://azure.microsoft.com/support/)

---

**Navigare Capitole:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 1 - Fundamente & Start Rapid
- **⬅️ Precedent**: [Bazele AZD](azd-basics.md) 
- **➡️ Următor**: [Primul Tău Proiect](first-project.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalare Completă!** Continuă cu [Primul Tău Proiect](first-project.md) pentru a începe să construiești cu azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
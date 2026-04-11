# Ghid de instalare și configurare

**Navigare capitol:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 1 - Fundamente & Pornire rapidă
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Primul tău proiect](first-project.md)
- **🚀 Next Chapter**: [Capitolul 2: Dezvoltare AI-first](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Acest ghid cuprinzător te va parcurge prin instalarea și configurarea Azure Developer CLI (azd) pe sistemul tău. Vei învăța mai multe metode de instalare pentru diferite sisteme de operare, configurarea autentificării și configurația inițială pentru a pregăti mediul tău de dezvoltare pentru implementări în Azure.

## Obiective de învățare

La finalul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind mai multe metode
- Configura mediul de dezvoltare cu prerechizitele necesare
- Înțelege diferitele opțiuni de instalare și când să folosești fiecare
- Depana probleme comune de instalare și configurare

## Rezultate de învățare

După finalizarea acestei lecții, vei fi capabil să:
- Instalezi azd folosind metoda potrivită pentru platforma ta
- Te autentifici cu Azure folosind `azd auth login`
- Verifici instalarea și testezi comenzi azd de bază
- Configurezi mediul de dezvoltare pentru utilizarea optimă a azd
- Rezolvi probleme comune de instalare în mod independent

Acest ghid te va ajuta să instalezi și să configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul de dezvoltare.

## Cerințe prealabile

Înainte de a instala azd, asigură-te că ai:
- **Abonament Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Pentru autentificare și gestionarea resurselor
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
# Util atunci când winget nu este disponibil
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opțiunea 3: Chocolatey
```cmd
choco install azd
```

#### Opțiunea 4: Instalare manuală
1. Descarcă cea mai recentă versiune de pe [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrage în `C:\Program Files\azd\`
3. Adaugă la variabila de mediu PATH

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
```bash
# Descărcați și instalați
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opțiunea 1: Script de instalare (Recomandat)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de pachete

**Instalare manuală din asset-urile de release:**
```bash
# Descarcă ultima arhivă pentru arhitectura ta Linux de la:
# https://github.com/Azure/azure-dev/releases
# Apoi extrage arhiva și adaugă binarul azd în PATH.
```

### GitHub Codespaces

Unele Codespaces și medii de containere dev includ deja `azd`, dar ar trebui să verifici asta în loc să presupui:

```bash
azd version
```

Dacă `azd` lipsește, instalează-l cu scriptul standard pentru mediul respectiv.

### Docker

```bash
# Rulează azd într-un container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Creează un alias pentru a-l folosi mai ușor
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifică instalarea

După instalare, verifică dacă azd funcționează corect:

```bash
# Verifică versiunea
azd version

# Afișează ajutor
azd --help

# Listează șabloanele disponibile
azd template list
```

Ieșire așteptată:
```
azd version 1.x.x (commit xxxxxx)
```

**Notă**: Numărul real al versiunii poate varia. Verifică [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pentru cea mai recentă versiune.

**✅ Lista de verificare pentru instalare reușită:**
- [ ] `azd version` afișează numărul versiunii fără erori
- [ ] `azd --help` afișează documentația comenzilor
- [ ] `azd template list` afișează șabloanele disponibile
- [ ] Poți crea un director de test și rula `azd init` cu succes

**Dacă toate verificările trec, ești gata să treci la [Primul tău proiect](first-project.md)!**

## Configurarea autentificării

### Configurarea recomandată pentru începători

Pentru fluxurile de lucru orientate AZD, autentifică-te cu `azd auth login`.

```bash
# Necesare pentru comenzile AZD, de exemplu azd up
azd auth login

# Verificați starea autentificării AZD
azd auth login --check-status
```

Folosește autentificarea Azure CLI doar când intenționezi să execuți comenzi `az` tu însuți în timpul cursului.

### Autentificare Azure CLI (Opțional)
```bash
# Instalați Azure CLI dacă nu este deja instalat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: consultați documentația de instalare Azure CLI pentru distribuția dvs.

# Conectați-vă la Azure
az login

# Verificați autentificarea
az account show
```

### Ce flux de autentificare ar trebui să folosești?

- Folosește `azd auth login` dacă urmezi traseul pentru începători AXD și rulezi în principal comenzi `azd`.
- Folosește `az login` și când vrei să rulezi comenzi Azure CLI, cum ar fi `az account show` sau să inspectezi resursele direct.
- Dacă un exercițiu include atât comenzi `azd`, cât și `az`, rulează ambele comenzi de autentificare o singură dată la început.

### Autentificare cu cod de dispozitiv
Dacă ești pe un sistem fără interfață grafică sau ai probleme cu browserul:
```bash
azd auth login --use-device-code
```

### Principal de serviciu (CI/CD)
Pentru medii automatizate:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validează configurația completă

Dacă vrei un control rapid de pregătire înainte de a începe Capitolul 1:

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
# Setează abonamentul implicit
azd config set defaults.subscription <subscription-id>

# Setează locația implicită
azd config set defaults.location eastus2

# Vizualizează întreaga configurație
azd config show
```

### Variabile de mediu
Adaugă în profilul shell-ului tău (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configurare Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configurare azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Activează înregistrarea pentru depanare
```

## Integrarea IDE-ului

### Visual Studio Code
Instalează extensia Azure Developer CLI:
1. Deschide VS Code
2. Mergi la Extensions (Ctrl+Shift+X)
3. Caută "Azure Developer CLI"
4. Instalează extensia

Funcționalități:
- IntelliSense pentru azure.yaml
- Comenzi în terminalul integrat
- Răsfoirea șabloanelor
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

## 🐛 Depanarea instalării

### Probleme comune

#### Permisiune refuzată (Windows)
```powershell
# Rulați PowerShell ca administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Probleme PATH
Adaugă manual azd la PATH-ul tău:

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
# Configurează proxy-ul
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Omit verificarea SSL (nu este recomandat pentru producție)
azd config set http.insecure true
```

#### Conflicte de versiuni
```bash
# Eliminați instalările vechi
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: eliminați binarul azd anterior sau legătura simbolică înainte de reinstalare

# Curățați configurația
rm -rf ~/.azd
```

### Obține ajutor suplimentar
```bash
# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Vizualizează configurația curentă
azd config show

# Vizualizează starea curentă a implementării
azd show
```

## Actualizarea azd

### Verificare actualizări
azd avertizează când este disponibilă o versiune mai nouă, iar tu îți poți confirma build-ul curent cu:
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

**Azure CLI (az)**: Unealtă de nivel scăzut pentru gestionarea resurselor individuale Azure
- `az webapp create`, `az storage account create`
- O resursă pe rând
- Orientat spre gestionarea infrastructurii

**Azure Developer CLI (azd)**: Unealtă de nivel înalt pentru implementări complete ale aplicațiilor
- `azd up` implementează întreaga aplicație cu toate resursele
- Fluxuri de lucru bazate pe șabloane
- Orientat spre productivitatea dezvoltatorului

**Ai nevoie de ambele**: azd folosește az CLI pentru autentificare
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Da! Poți:
1. Importa resurse existente în mediile azd
2. Referenția resurse existente în șabloanele tale Bicep
3. Folosi azd pentru implementări noi alături de infrastructura existentă

Vezi [Configuration Guide](configuration.md) pentru detalii.
</details>

<details>
<summary><strong>Funcționează azd cu Azure Government sau Azure China?</strong></summary>

Da, configurează cloud-ul:
```bash
# Azure pentru guvern
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
- Autentificare prin principal de serviciu
- Mod non-interactiv

Vezi [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) pentru modele CI/CD.
</details>

<details>
<summary><strong>Care este costul utilizării azd?</strong></summary>

azd în sine este **complet gratuit** și open-source. Plătești doar pentru:
- Resursele Azure pe care le implementezi
- Costurile de consum Azure (compute, stocare etc.)

Folosește `azd provision --preview` pentru a estima costurile înainte de implementare.
</details>

## Următorii pași

1. **Finalizează autentificarea**: Asigură-te că poți accesa abonamentul tău Azure
2. **Încearcă prima ta implementare**: Urmează [Primul tău proiect](first-project.md)
3. **Explorează șabloanele**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul**: Setează-ți mediul de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obține îndrumare pentru comenzile Azure direct în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitol:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 1 - Fundamente & Pornire rapidă
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Primul tău proiect](first-project.md)
- **🚀 Next Chapter**: [Capitolul 2: Dezvoltare AI-first](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalare completă!** Continuă la [Primul tău proiect](first-project.md) pentru a începe să construiești cu azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
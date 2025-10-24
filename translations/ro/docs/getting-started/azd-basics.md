<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fb0687bd0b166ecb0430dfeeed83487e",
  "translation_date": "2025-10-24T18:03:12+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ro"
}
-->
# AZD Bazele - Înțelegerea Azure Developer CLI

# AZD Bazele - Concepte de bază și fundamente

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 1 - Fundamente & Start Rapid
- **⬅️ Precedent**: [Prezentare generală a cursului](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Următor**: [Instalare & Configurare](installation.md)
- **🚀 Capitol următor**: [Capitolul 2: Dezvoltare AI-First](../ai-foundry/azure-ai-foundry-integration.md)

## Introducere

Această lecție te introduce în Azure Developer CLI (azd), un instrument puternic de linie de comandă care accelerează tranziția de la dezvoltarea locală la implementarea în Azure. Vei învăța conceptele fundamentale, caracteristicile de bază și vei înțelege cum azd simplifică implementarea aplicațiilor cloud-native.

## Obiective de învățare

Până la sfârșitul acestei lecții, vei:
- Înțelege ce este Azure Developer CLI și scopul său principal
- Învăța conceptele de bază despre șabloane, medii și servicii
- Explora caracteristicile cheie, inclusiv dezvoltarea bazată pe șabloane și Infrastructure as Code
- Înțelege structura proiectului azd și fluxul de lucru
- Fi pregătit să instalezi și să configurezi azd pentru mediul tău de dezvoltare

## Rezultate de învățare

După finalizarea acestei lecții, vei putea:
- Explica rolul azd în fluxurile de lucru moderne de dezvoltare cloud
- Identifica componentele structurii unui proiect azd
- Descrie cum funcționează împreună șabloanele, mediile și serviciile
- Înțelege beneficiile Infrastructure as Code cu azd
- Recunoaște diferite comenzi azd și scopurile lor

## Ce este Azure Developer CLI (azd)?

Azure Developer CLI (azd) este un instrument de linie de comandă conceput pentru a accelera tranziția de la dezvoltarea locală la implementarea în Azure. Simplifică procesul de construire, implementare și gestionare a aplicațiilor cloud-native pe Azure.

## Concepte de bază

### Șabloane
Șabloanele sunt fundamentul azd. Ele conțin:
- **Codul aplicației** - Codul sursă și dependențele tale
- **Definiții de infrastructură** - Resurse Azure definite în Bicep sau Terraform
- **Fișiere de configurare** - Setări și variabile de mediu
- **Scripturi de implementare** - Fluxuri de lucru automate pentru implementare

### Medii
Mediile reprezintă diferite ținte de implementare:
- **Dezvoltare** - Pentru testare și dezvoltare
- **Staging** - Mediu pre-producție
- **Producție** - Mediu de producție live

Fiecare mediu își menține propriile:
- Grupuri de resurse Azure
- Setări de configurare
- Stare de implementare

### Servicii
Serviciile sunt blocurile de construcție ale aplicației tale:
- **Frontend** - Aplicații web, SPAs
- **Backend** - API-uri, microservicii
- **Bază de date** - Soluții de stocare a datelor
- **Stocare** - Stocare de fișiere și blob-uri

## Caracteristici cheie

### 1. Dezvoltare bazată pe șabloane
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Limbaj specific domeniului Azure
- **Terraform** - Instrument multi-cloud pentru infrastructură
- **ARM Templates** - Șabloane Azure Resource Manager

### 3. Fluxuri de lucru integrate
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup

# 🧪 NEW: Preview infrastructure changes before deployment (SAFE)
azd provision --preview    # Simulate infrastructure deployment without making changes

azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

#### 🛡️ Planificare sigură a infrastructurii cu Preview
Comanda `azd provision --preview` este revoluționară pentru implementări sigure:
- **Analiză dry-run** - Arată ce va fi creat, modificat sau șters
- **Risc zero** - Nu se fac modificări reale în mediul Azure
- **Colaborare în echipă** - Distribuie rezultatele preview înainte de implementare
- **Estimare costuri** - Înțelege costurile resurselor înainte de angajament

```bash
# Example preview workflow
azd provision --preview           # See what will change
# Review the output, discuss with team
azd provision                     # Apply changes with confidence
```

### 4. Gestionarea mediilor
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Structura proiectului

O structură tipică de proiect azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Fișiere de configurare

### azure.yaml
Fișierul principal de configurare al proiectului:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configurare specifică mediului:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Fluxuri de lucru comune

### Începerea unui proiect nou
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclu de dezvoltare
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Înțelegerea comenzii `azd down --force --purge`
Comanda `azd down --force --purge` este o modalitate puternică de a elimina complet mediul azd și toate resursele asociate. Iată o descriere a ceea ce face fiecare opțiune:
```
--force
```
- Sare peste solicitările de confirmare.
- Utilă pentru automatizare sau scripting unde inputul manual nu este fezabil.
- Asigură că procesul de eliminare continuă fără întreruperi, chiar dacă CLI detectează inconsistențe.

```
--purge
```
Șterge **toate metadatele asociate**, inclusiv:
Starea mediului
Folderul local `.azure`
Informațiile de implementare în cache
Previne ca azd să "își amintească" implementările anterioare, ceea ce poate cauza probleme precum grupuri de resurse nepotrivite sau referințe vechi la registre.


### De ce să folosești ambele?
Când te confrunți cu probleme la `azd up` din cauza stării persistente sau a implementărilor parțiale, această combinație asigură un **nou început**.

Este deosebit de utilă după ștergeri manuale de resurse în portalul Azure sau când schimbi șabloane, medii sau convenții de denumire a grupurilor de resurse.


### Gestionarea mai multor medii
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🔐 Autentificare și acreditive

Înțelegerea autentificării este crucială pentru implementările azd de succes. Azure folosește mai multe metode de autentificare, iar azd utilizează același lanț de acreditive folosit de alte instrumente Azure.

### Autentificare Azure CLI (`az login`)

Înainte de a folosi azd, trebuie să te autentifici cu Azure. Metoda cea mai comună este utilizarea Azure CLI:

```bash
# Interactive login (opens browser)
az login

# Login with specific tenant
az login --tenant <tenant-id>

# Login with service principal
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Check current login status
az account show

# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription <subscription-id>
```

### Fluxul de autentificare
1. **Login interactiv**: Deschide browserul implicit pentru autentificare
2. **Flux de cod de dispozitiv**: Pentru medii fără acces la browser
3. **Service Principal**: Pentru scenarii de automatizare și CI/CD
4. **Managed Identity**: Pentru aplicații găzduite pe Azure

### Lanțul DefaultAzureCredential

`DefaultAzureCredential` este un tip de acreditiv care oferă o experiență simplificată de autentificare prin încercarea automată a mai multor surse de acreditive într-o ordine specifică:

#### Ordinea lanțului de acreditive
```mermaid
graph TD
    A[DefaultAzureCredential] --> B[Environment Variables]
    B --> C[Workload Identity]
    C --> D[Managed Identity]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[Interactive Browser]
```

#### 1. Variabile de mediu
```bash
# Set environment variables for service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Utilizat automat în:
- Azure Kubernetes Service (AKS) cu Workload Identity
- GitHub Actions cu OIDC federation
- Alte scenarii de identitate federată

#### 3. Managed Identity
Pentru resurse Azure precum:
- Mașini virtuale
- App Service
- Funcții Azure
- Instanțe de containere

```bash
# Check if running on Azure resource with managed identity
az account show --query "user.type" --output tsv
# Returns: "servicePrincipal" if using managed identity
```

#### 4. Integrarea cu instrumente de dezvoltare
- **Visual Studio**: Utilizează automat contul conectat
- **VS Code**: Utilizează acreditivele extensiei Azure Account
- **Azure CLI**: Utilizează acreditivele `az login` (cel mai comun pentru dezvoltarea locală)

### Configurarea autentificării AZD

```bash
# Method 1: Use Azure CLI (Recommended for development)
az login
azd auth login  # Uses existing Azure CLI credentials

# Method 2: Direct azd authentication
azd auth login --use-device-code  # For headless environments

# Method 3: Check authentication status
azd auth login --check-status

# Method 4: Logout and re-authenticate
azd auth logout
azd auth login
```

### Cele mai bune practici de autentificare

#### Pentru dezvoltare locală
```bash
# 1. Login with Azure CLI
az login

# 2. Verify correct subscription
az account show
az account set --subscription "Your Subscription Name"

# 3. Use azd with existing credentials
azd auth login
```

#### Pentru pipeline-uri CI/CD
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Pentru medii de producție
- Utilizează **Managed Identity** când rulezi pe resurse Azure
- Utilizează **Service Principal** pentru scenarii de automatizare
- Evită stocarea acreditivelor în cod sau fișiere de configurare
- Utilizează **Azure Key Vault** pentru configurări sensibile

### Probleme comune de autentificare și soluții

#### Problemă: "Nu s-a găsit nicio subscripție"
```bash
# Solution: Set default subscription
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Problemă: "Permisiuni insuficiente"
```bash
# Solution: Check and assign required roles
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Common required roles:
# - Contributor (for resource management)
# - User Access Administrator (for role assignments)
```

#### Problemă: "Token expirat"
```bash
# Solution: Re-authenticate
az logout
az login
azd auth logout
azd auth login
```

### Autentificare în diferite scenarii

#### Dezvoltare locală
```bash
# Personal development account
az login
azd auth login
```

#### Dezvoltare în echipă
```bash
# Use specific tenant for organization
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Scenarii multi-tenant
```bash
# Switch between tenants
az login --tenant tenant1.onmicrosoft.com
# Deploy to tenant 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# Deploy to tenant 2
azd up
```

### Considerații de securitate

1. **Stocarea acreditivelor**: Nu stoca niciodată acreditivele în codul sursă
2. **Limitarea domeniului**: Utilizează principiul privilegiului minim pentru service principals
3. **Rotirea token-urilor**: Rotește regulat secretele service principal
4. **Trail de audit**: Monitorizează activitățile de autentificare și implementare
5. **Securitatea rețelei**: Utilizează puncte finale private, dacă este posibil

### Depanarea autentificării

```bash
# Debug authentication issues
azd auth login --check-status
az account show
az account get-access-token

# Common diagnostic commands
whoami                          # Current user context
az ad signed-in-user show      # Azure AD user details
az group list                  # Test resource access
```

## Înțelegerea comenzii `azd down --force --purge`

### Descoperire
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestionarea proiectului
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorizare
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Cele mai bune practici

### 1. Folosește nume semnificative
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Utilizează șabloane
- Începe cu șabloane existente
- Personalizează-le pentru nevoile tale
- Creează șabloane reutilizabile pentru organizația ta

### 3. Izolarea mediilor
- Utilizează medii separate pentru dev/staging/prod
- Nu implementa direct în producție de pe mașina locală
- Utilizează pipeline-uri CI/CD pentru implementări în producție

### 4. Gestionarea configurării
- Utilizează variabile de mediu pentru date sensibile
- Păstrează configurarea în controlul versiunilor
- Documentează setările specifice mediului

## Progresul învățării

### Începător (Săptămâna 1-2)
1. Instalează azd și autentifică-te
2. Implementează un șablon simplu
3. Înțelege structura proiectului
4. Învață comenzile de bază (up, down, deploy)

### Intermediar (Săptămâna 3-4)
1. Personalizează șabloanele
2. Gestionează mai multe medii
3. Înțelege codul infrastructurii
4. Configurează pipeline-uri CI/CD

### Avansat (Săptămâna 5+)
1. Creează șabloane personalizate
2. Modele avansate de infrastructură
3. Implementări multi-regiune
4. Configurări de nivel enterprise

## Pași următori

**📖 Continuă învățarea din Capitolul 1:**
- [Instalare & Configurare](installation.md) - Instalează și configurează azd
- [Primul tău proiect](first-project.md) - Completează tutorialul practic
- [Ghid de configurare](configuration.md) - Opțiuni avansate de configurare

**🎯 Pregătit pentru capitolul următor?**
- [Capitolul 2: Dezvoltare AI-First](../ai-foundry/azure-ai-foundry-integration.md) - Începe să construiești aplicații AI

## Resurse suplimentare

- [Prezentare generală Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerie de șabloane](https://azure.github.io/awesome-azd/)
- [Exemple comunitare](https://github.com/Azure-Samples)

---

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 1 - Fundamente & Start Rapid  
- **⬅️ Precedent**: [Prezentare generală a cursului](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Următor**: [Instalare & Configurare](installation.md)
- **🚀 Capitol următor**: [Capitolul 2: Dezvoltare AI-First](../ai-foundry/azure-ai-foundry-integration.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
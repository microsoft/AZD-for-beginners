<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4dc26ed8004b58a51875efd07203340f",
  "translation_date": "2025-09-26T18:42:27+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sw"
}
-->
# AZD Msingi - Kuelewa Azure Developer CLI

# AZD Msingi - Dhana za Msingi na Mambo Muhimu

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Iliyopita**: [Muhtasari wa Kozi](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Inayofuata**: [Usakinishaji & Usanidi](installation.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)

## Utangulizi

Somo hili linakutambulisha kwa Azure Developer CLI (azd), chombo chenye nguvu cha mstari wa amri kinachoharakisha safari yako kutoka maendeleo ya ndani hadi usambazaji wa Azure. Utajifunza dhana za msingi, vipengele muhimu, na kuelewa jinsi azd inavyorahisisha usambazaji wa programu za wingu.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kuelewa Azure Developer CLI ni nini na madhumuni yake ya msingi
- Kujifunza dhana za msingi za templates, mazingira, na huduma
- Kuchunguza vipengele muhimu ikiwa ni pamoja na maendeleo yanayoongozwa na templates na Miundombinu kama Kanuni
- Kuelewa muundo wa mradi wa azd na mtiririko wa kazi
- Kuwa tayari kusakinisha na kusanidi azd kwa mazingira yako ya maendeleo

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kuelezea jukumu la azd katika mtiririko wa kazi wa maendeleo ya wingu la kisasa
- Kutambua vipengele vya muundo wa mradi wa azd
- Kufafanua jinsi templates, mazingira, na huduma zinavyofanya kazi pamoja
- Kuelewa faida za Miundombinu kama Kanuni kwa kutumia azd
- Kutambua amri tofauti za azd na madhumuni yake

## Azure Developer CLI (azd) ni nini?

Azure Developer CLI (azd) ni chombo cha mstari wa amri kilichoundwa kuharakisha safari yako kutoka maendeleo ya ndani hadi usambazaji wa Azure. Kinarahisisha mchakato wa kujenga, kusambaza, na kusimamia programu za wingu la Azure.

## Dhana za Msingi

### Templates
Templates ni msingi wa azd. Zinajumuisha:
- **Msimbo wa programu** - Chanzo chako cha msimbo na utegemezi
- **Ufafanuzi wa miundombinu** - Rasilimali za Azure zilizoelezwa kwa Bicep au Terraform
- **Faili za usanidi** - Mipangilio na vigezo vya mazingira
- **Skripti za usambazaji** - Mtiririko wa kazi wa usambazaji wa kiotomatiki

### Mazingira
Mazingira yanawakilisha malengo tofauti ya usambazaji:
- **Maendeleo** - Kwa majaribio na maendeleo
- **Staging** - Mazingira ya kabla ya uzalishaji
- **Uzalishaji** - Mazingira ya uzalishaji wa moja kwa moja

Kila mazingira yanadumisha:
- Kikundi cha rasilimali za Azure
- Mipangilio ya usanidi
- Hali ya usambazaji

### Huduma
Huduma ni sehemu za msingi za programu yako:
- **Frontend** - Programu za wavuti, SPAs
- **Backend** - APIs, huduma ndogo
- **Database** - Suluhisho za hifadhi ya data
- **Storage** - Hifadhi ya faili na blob

## Vipengele Muhimu

### 1. Maendeleo Yanayoongozwa na Templates
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Miundombinu kama Kanuni
- **Bicep** - Lugha maalum ya Azure
- **Terraform** - Chombo cha miundombinu ya wingu nyingi
- **ARM Templates** - Templates za Azure Resource Manager

### 3. Mtiririko wa Kazi Ulioingiliana
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Usimamizi wa Mazingira
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Muundo wa Mradi

Muundo wa kawaida wa mradi wa azd:
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

## 🔧 Faili za Usanidi

### azure.yaml
Faili kuu ya usanidi wa mradi:
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
Usanidi maalum wa mazingira:
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

## 🎪 Mtiririko wa Kazi wa Kawaida

### Kuanza Mradi Mpya
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Mzunguko wa Maendeleo
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

## Kuelewa `azd down --force --purge`
Amri ya `azd down --force --purge` ni njia yenye nguvu ya kuondoa kabisa mazingira yako ya azd na rasilimali zote zinazohusiana. Hapa kuna muhtasari wa kila bendera:
```
--force
```
- Inaruka maonyo ya uthibitisho.
- Inafaa kwa otomatiki au skripti ambapo pembejeo ya mwongozo si rahisi.
- Inahakikisha mchakato wa kuondoa unaendelea bila usumbufu, hata kama CLI inagundua kutokubaliana.

```
--purge
```
Inafuta **metadata yote inayohusiana**, ikiwa ni pamoja na:
Hali ya mazingira
Folda ya ndani `.azure`
Taarifa za usambazaji zilizohifadhiwa
Inazuia azd "kukumbuka" usambazaji wa awali, ambayo inaweza kusababisha masuala kama vikundi vya rasilimali visivyolingana au marejeleo ya rejista yaliyopitwa na wakati.

### Kwa nini utumie zote mbili?
Unapokumbana na tatizo na `azd up` kutokana na hali iliyosalia au usambazaji wa sehemu, mchanganyiko huu unahakikisha **ukurasa safi**.

Ni muhimu hasa baada ya kufuta rasilimali kwa mkono kwenye portal ya Azure au unapobadilisha templates, mazingira, au mikataba ya majina ya vikundi vya rasilimali.

### Kusimamia Mazingira Mengi
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

## 🔐 Uthibitishaji na Hati

Kuelewa uthibitishaji ni muhimu kwa usambazaji wa azd uliofanikiwa. Azure hutumia mbinu nyingi za uthibitishaji, na azd hutumia mnyororo wa hati sawa unaotumiwa na zana nyingine za Azure.

### Uthibitishaji wa Azure CLI (`az login`)

Kabla ya kutumia azd, unahitaji kuthibitisha na Azure. Njia ya kawaida ni kutumia Azure CLI:

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

### Mtiririko wa Uthibitishaji
1. **Kuingia kwa Maingiliano**: Hufungua kivinjari chako cha chaguo-msingi kwa uthibitishaji
2. **Njia ya Msimbo wa Kifaa**: Kwa mazingira yasiyo na ufikiaji wa kivinjari
3. **Service Principal**: Kwa otomatiki na hali za CI/CD
4. **Managed Identity**: Kwa programu zinazohifadhiwa Azure

### DefaultAzureCredential Chain

`DefaultAzureCredential` ni aina ya hati inayotoa uzoefu rahisi wa uthibitishaji kwa kujaribu vyanzo vingi vya hati kwa mpangilio maalum:

#### Mpangilio wa Mnyororo wa Hati
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

#### 1. Vigezo vya Mazingira
```bash
# Set environment variables for service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Inatumika kiotomatiki katika:
- Azure Kubernetes Service (AKS) na Workload Identity
- GitHub Actions na OIDC federation
- Hali nyingine za utambulisho wa pamoja

#### 3. Managed Identity
Kwa rasilimali za Azure kama:
- Virtual Machines
- App Service
- Azure Functions
- Container Instances

```bash
# Check if running on Azure resource with managed identity
az account show --query "user.type" --output tsv
# Returns: "servicePrincipal" if using managed identity
```

#### 4. Ujumuishaji wa Zana za Maendeleo
- **Visual Studio**: Hutumia akaunti iliyosainiwa kiotomatiki
- **VS Code**: Hutumia hati za kiendelezi cha Akaunti ya Azure
- **Azure CLI**: Hutumia hati za `az login` (njia ya kawaida kwa maendeleo ya ndani)

### Usanidi wa Uthibitishaji wa AZD

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

### Mazoea Bora ya Uthibitishaji

#### Kwa Maendeleo ya Ndani
```bash
# 1. Login with Azure CLI
az login

# 2. Verify correct subscription
az account show
az account set --subscription "Your Subscription Name"

# 3. Use azd with existing credentials
azd auth login
```

#### Kwa Mipangilio ya CI/CD
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

#### Kwa Mazingira ya Uzalishaji
- Tumia **Managed Identity** unapokimbia kwenye rasilimali za Azure
- Tumia **Service Principal** kwa hali za otomatiki
- Epuka kuhifadhi hati kwenye msimbo au faili za usanidi
- Tumia **Azure Key Vault** kwa usanidi nyeti

### Masuala ya Kawaida ya Uthibitishaji na Suluhisho

#### Tatizo: "Hakuna usajili uliopatikana"
```bash
# Solution: Set default subscription
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Tatizo: "Haki hazitoshi"
```bash
# Solution: Check and assign required roles
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Common required roles:
# - Contributor (for resource management)
# - User Access Administrator (for role assignments)
```

#### Tatizo: "Token imeisha muda wake"
```bash
# Solution: Re-authenticate
az logout
az login
azd auth logout
azd auth login
```

### Uthibitishaji katika Hali Tofauti

#### Maendeleo ya Ndani
```bash
# Personal development account
az login
azd auth login
```

#### Maendeleo ya Timu
```bash
# Use specific tenant for organization
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Hali za Wateja Wengi
```bash
# Switch between tenants
az login --tenant tenant1.onmicrosoft.com
# Deploy to tenant 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# Deploy to tenant 2
azd up
```

### Masuala ya Usalama

1. **Uhifadhi wa Hati**: Kamwe usihifadhi hati kwenye msimbo wa chanzo
2. **Kizuizi cha Upeo**: Tumia kanuni ya haki ndogo kwa service principals
3. **Mzunguko wa Token**: Badilisha siri za service principal mara kwa mara
4. **Njia ya Ukaguzi**: Fuatilia shughuli za uthibitishaji na usambazaji
5. **Usalama wa Mtandao**: Tumia viunganishi vya kibinafsi inapowezekana

### Kutatua Masuala ya Uthibitishaji

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

## Kuelewa `azd down --force --purge`

### Ugunduzi
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Usimamizi wa Mradi
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Ufuatiliaji
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Mazoea Bora

### 1. Tumia Majina Yenye Maana
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Tumia Templates
- Anza na templates zilizopo
- Badilisha kwa mahitaji yako
- Unda templates zinazoweza kutumika tena kwa shirika lako

### 3. Kutenganisha Mazingira
- Tumia mazingira tofauti kwa maendeleo/staging/uzalishaji
- Kamwe usambaze moja kwa moja kwa uzalishaji kutoka kwa mashine ya ndani
- Tumia mipangilio ya CI/CD kwa usambazaji wa uzalishaji

### 4. Usimamizi wa Usanidi
- Tumia vigezo vya mazingira kwa data nyeti
- Weka usanidi katika udhibiti wa toleo
- Andika mipangilio maalum ya mazingira

## Maendeleo ya Kujifunza

### Msingi (Wiki 1-2)
1. Sakinisha azd na uthibitishe
2. Sambaza template rahisi
3. Elewa muundo wa mradi
4. Jifunze amri za msingi (up, down, deploy)

### Kati (Wiki 3-4)
1. Badilisha templates
2. Simamia mazingira mengi
3. Elewa kanuni za miundombinu
4. Sanidi mipangilio ya CI/CD

### Juu (Wiki 5+)
1. Unda templates maalum
2. Mifumo ya miundombinu ya hali ya juu
3. Usambazaji wa mikoa mingi
4. Usanidi wa kiwango cha biashara

## Hatua Zifuatazo

**📖 Endelea Kujifunza Sura ya 1:**
- [Usakinishaji & Usanidi](installation.md) - Sakinisha na usanidi azd
- [Mradi Wako wa Kwanza](first-project.md) - Kamilisha mafunzo ya vitendo
- [Mwongozo wa Usanidi](configuration.md) - Chaguo za usanidi wa hali ya juu

**🎯 Tayari kwa Sura Inayofuata?**
- [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md) - Anza kujenga programu za AI

## Rasilimali za Ziada

- [Muhtasari wa Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Matunzio ya Templates](https://azure.github.io/awesome-azd/)
- [Mifano ya Jamii](https://github.com/Azure-Samples)

---

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Mwanzo wa Haraka  
- **⬅️ Iliyopita**: [Muhtasari wa Kozi](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Inayofuata**: [Usakinishaji & Usanidi](installation.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)

---


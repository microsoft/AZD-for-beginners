<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T22:12:32+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sw"
}
-->
# AZD Msingi - Kuelewa Azure Developer CLI

**Iliyopita:** [Usakinishaji na Usanidi](installation.md) | **Inayofuata:** [Usanidi](configuration.md)

## Utangulizi

Somo hili linakutambulisha kwa Azure Developer CLI (azd), zana yenye nguvu ya mstari wa amri inayoharakisha safari yako kutoka kwa maendeleo ya ndani hadi usambazaji wa Azure. Utajifunza dhana za msingi, vipengele vya msingi, na kuelewa jinsi azd inavyorahisisha usambazaji wa programu za wingu.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kuelewa Azure Developer CLI ni nini na kusudi lake kuu
- Kujifunza dhana za msingi za templates, environments, na services
- Kuchunguza vipengele muhimu ikiwa ni pamoja na maendeleo yanayoendeshwa na templates na Infrastructure as Code
- Kuelewa muundo wa mradi wa azd na mtiririko wa kazi
- Kuwa tayari kusakinisha na kusanidi azd kwa mazingira yako ya maendeleo

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kuelezea jukumu la azd katika mtiririko wa kazi wa maendeleo ya wingu la kisasa
- Kutambua vipengele vya muundo wa mradi wa azd
- Kufafanua jinsi templates, environments, na services zinavyofanya kazi pamoja
- Kuelewa faida za Infrastructure as Code na azd
- Kutambua amri tofauti za azd na madhumuni yake

## Azure Developer CLI (azd) ni nini?

Azure Developer CLI (azd) ni zana ya mstari wa amri iliyoundwa kuharakisha safari yako kutoka kwa maendeleo ya ndani hadi usambazaji wa Azure. Inarahisisha mchakato wa kujenga, kusambaza, na kusimamia programu za wingu kwenye Azure.

## Dhana za Msingi

### Templates
Templates ni msingi wa azd. Zinajumuisha:
- **Msimbo wa programu** - Chanzo chako cha msimbo na utegemezi
- **Ufafanuzi wa miundombinu** - Rasilimali za Azure zilizoainishwa kwa Bicep au Terraform
- **Faili za usanidi** - Mipangilio na vigezo vya mazingira
- **Skripti za usambazaji** - Mtiririko wa kazi wa usambazaji uliojiendesha

### Environments
Environments zinawakilisha malengo tofauti ya usambazaji:
- **Maendeleo** - Kwa majaribio na maendeleo
- **Staging** - Mazingira ya kabla ya uzalishaji
- **Uzalishaji** - Mazingira ya uzalishaji wa moja kwa moja

Kila mazingira yanadumisha:
- Kikundi cha rasilimali za Azure
- Mipangilio ya usanidi
- Hali ya usambazaji

### Services
Services ni sehemu za kujenga programu yako:
- **Frontend** - Programu za wavuti, SPAs
- **Backend** - APIs, huduma ndogo
- **Database** - Suluhisho za hifadhi ya data
- **Storage** - Hifadhi ya faili na blob

## Vipengele Muhimu

### 1. Maendeleo Yanayoendeshwa na Templates
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Lugha maalum ya Azure
- **Terraform** - Zana ya miundombinu ya wingu nyingi
- **ARM Templates** - Templates za Azure Resource Manager

### 3. Mtiririko wa Kazi Uliojiendesha
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
Amri ya `azd down --force --purge` ni njia yenye nguvu ya kuondoa kabisa mazingira yako ya azd na rasilimali zote zinazohusiana. Hapa kuna maelezo ya kila bendera:
```
--force
```
- Inaruka maonyo ya uthibitisho.
- Inafaa kwa otomatiki au scripting ambapo pembejeo ya mwongozo si rahisi.
- Inahakikisha mchakato wa kuondoa unaendelea bila usumbufu, hata kama CLI inagundua kutofautiana.

```
--purge
```
Inafuta **metadata yote inayohusiana**, ikiwa ni pamoja na:
Hali ya mazingira
Folda ya ndani `.azure`
Taarifa ya usambazaji iliyohifadhiwa
Inazuia azd "kukumbuka" usambazaji wa awali, ambayo inaweza kusababisha masuala kama vikundi vya rasilimali visivyolingana au marejeleo ya rejista yaliyopitwa na wakati.

### Kwa nini utumie zote?
Unapokumbana na matatizo na `azd up` kutokana na hali iliyosalia au usambazaji wa sehemu, mchanganyiko huu unahakikisha **ukurasa safi**.

Ni muhimu hasa baada ya kufuta rasilimali kwa mikono kwenye portal ya Azure au unapobadilisha templates, environments, au mikataba ya majina ya vikundi vya rasilimali.

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

## 🧭 Amri za Uabiri

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
- Usambaze moja kwa moja kwenye uzalishaji kutoka kwa mashine ya ndani
- Tumia njia za CI/CD kwa usambazaji wa uzalishaji

### 4. Usimamizi wa Usanidi
- Tumia vigezo vya mazingira kwa data nyeti
- Weka usanidi katika udhibiti wa toleo
- Andika mipangilio maalum ya mazingira

## Maendeleo ya Kujifunza

### Mwanzoni (Wiki 1-2)
1. Sakinisha azd na uthibitishe
2. Sambaza template rahisi
3. Elewa muundo wa mradi
4. Jifunze amri za msingi (up, down, deploy)

### Kati (Wiki 3-4)
1. Badilisha templates
2. Simamia mazingira mengi
3. Elewa miundombinu ya msimbo
4. Sanidi njia za CI/CD

### Juu (Wiki 5+)
1. Unda templates maalum
2. Mifumo ya miundombinu ya hali ya juu
3. Usambazaji wa maeneo mengi
4. Usanidi wa kiwango cha biashara

## Hatua Zifuatazo

- [Usakinishaji na Usanidi](installation.md) - Sakinisha na sanidi azd
- [Mradi Wako wa Kwanza](first-project.md) - Mafunzo ya vitendo
- [Mwongozo wa Usanidi](configuration.md) - Chaguo za usanidi wa hali ya juu

## Rasilimali za Ziada

- [Muhtasari wa Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Matunzio ya Templates](https://azure.github.io/awesome-azd/)
- [Mifano ya Jamii](https://github.com/Azure-Samples)

---

**Iliyopita:** [Usakinishaji na Usanidi](installation.md) | **Inayofuata:** [Usanidi](configuration.md)
- **Somo Linalofuata**: [Usakinishaji na Usanidi](installation.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
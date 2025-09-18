<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T08:57:23+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sw"
}
-->
# AZD Msingi - Kuelewa Azure Developer CLI

# AZD Msingi - Dhana za Msingi na Mambo Muhimu

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Kuanza Haraka
- **⬅️ Iliyopita**: [Muhtasari wa Kozi](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Inayofuata**: [Usakinishaji & Usanidi](installation.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)

## Utangulizi

Somo hili linakutambulisha kwa Azure Developer CLI (azd), zana yenye nguvu ya mstari wa amri inayoharakisha safari yako kutoka maendeleo ya ndani hadi usambazaji wa Azure. Utajifunza dhana za msingi, vipengele muhimu, na kuelewa jinsi azd inavyorahisisha usambazaji wa programu za wingu.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kuelewa Azure Developer CLI ni nini na madhumuni yake ya msingi
- Kujifunza dhana za msingi za templeti, mazingira, na huduma
- Kuchunguza vipengele muhimu ikiwa ni pamoja na maendeleo yanayoendeshwa na templeti na Miundombinu kama Kanuni
- Kuelewa muundo wa mradi wa azd na mtiririko wa kazi
- Kuwa tayari kusakinisha na kusanidi azd kwa mazingira yako ya maendeleo

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kuelezea jukumu la azd katika mtiririko wa kazi wa maendeleo ya wingu la kisasa
- Kutambua vipengele vya muundo wa mradi wa azd
- Kufafanua jinsi templeti, mazingira, na huduma zinavyofanya kazi pamoja
- Kuelewa faida za Miundombinu kama Kanuni kwa kutumia azd
- Kutambua amri tofauti za azd na madhumuni yake

## Azure Developer CLI (azd) ni nini?

Azure Developer CLI (azd) ni zana ya mstari wa amri iliyoundwa kuharakisha safari yako kutoka maendeleo ya ndani hadi usambazaji wa Azure. Inarahisisha mchakato wa kujenga, kusambaza, na kusimamia programu za wingu kwenye Azure.

## Dhana za Msingi

### Templeti
Templeti ni msingi wa azd. Zinajumuisha:
- **Msimbo wa programu** - Chanzo chako cha msimbo na utegemezi
- **Ufafanuzi wa miundombinu** - Rasilimali za Azure zilizoainishwa kwa Bicep au Terraform
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
- **Backend** - API, huduma ndogo
- **Hifadhidata** - Suluhisho za kuhifadhi data
- **Hifadhi** - Hifadhi ya faili na blob

## Vipengele Muhimu

### 1. Maendeleo Yanayoendeshwa na Templeti
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Miundombinu kama Kanuni
- **Bicep** - Lugha maalum ya Azure
- **Terraform** - Zana ya miundombinu ya wingu nyingi
- **ARM Templates** - Templeti za Azure Resource Manager

### 3. Mtiririko wa Kazi Ulioambatanishwa
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
- Inafaa kwa otomatiki au maandishi ambapo pembejeo ya mwongozo si rahisi.
- Inahakikisha mchakato wa kuondoa unaendelea bila usumbufu, hata kama CLI inagundua kutofautiana.

```
--purge
```
Inafuta **metadata zote zinazohusiana**, ikiwa ni pamoja na:
Hali ya mazingira
Folda ya ndani `.azure`
Taarifa ya usambazaji iliyohifadhiwa
Inazuia azd "kukumbuka" usambazaji wa awali, ambayo inaweza kusababisha masuala kama vikundi vya rasilimali visivyolingana au marejeleo ya rejista yaliyopitwa na wakati.

### Kwa nini utumie zote mbili?
Unapokumbana na tatizo na `azd up` kutokana na hali iliyosalia au usambazaji wa sehemu, mchanganyiko huu unahakikisha **mwanzo safi**.

Ni muhimu hasa baada ya kufuta rasilimali kwa mikono kwenye portal ya Azure au unapobadilisha templeti, mazingira, au mikataba ya majina ya vikundi vya rasilimali.

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

### 2. Tumia Templeti
- Anza na templeti zilizopo
- Badilisha kulingana na mahitaji yako
- Unda templeti zinazoweza kutumika tena kwa shirika lako

### 3. Kutenganisha Mazingira
- Tumia mazingira tofauti kwa maendeleo/staging/uzalishaji
- Usambaze moja kwa moja kwenye uzalishaji kutoka kwa mashine ya ndani
- Tumia mabomba ya CI/CD kwa usambazaji wa uzalishaji

### 4. Usimamizi wa Usanidi
- Tumia vigezo vya mazingira kwa data nyeti
- Weka usanidi katika udhibiti wa toleo
- Andika mipangilio maalum ya mazingira

## Maendeleo ya Kujifunza

### Mwanzoni (Wiki 1-2)
1. Sakinisha azd na uthibitishe
2. Sambaza templeti rahisi
3. Elewa muundo wa mradi
4. Jifunze amri za msingi (up, down, deploy)

### Kati (Wiki 3-4)
1. Badilisha templeti
2. Simamia mazingira mengi
3. Elewa kanuni za miundombinu
4. Sanidi mabomba ya CI/CD

### Juu (Wiki 5+)
1. Unda templeti maalum
2. Mifumo ya miundombinu ya hali ya juu
3. Usambazaji wa maeneo mengi
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
- [Matunzio ya Templeti](https://azure.github.io/awesome-azd/)
- [Mifano ya Jamii](https://github.com/Azure-Samples)

---

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Kuanza Haraka  
- **⬅️ Iliyopita**: [Muhtasari wa Kozi](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Inayofuata**: [Usakinishaji & Usanidi](installation.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
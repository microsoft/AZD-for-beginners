# សំណួរដែលត្រូវសួរគ្រប់ក្ដី (FAQ)

**Get Help by Chapter**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../README.md)
- **🚆 បញ្ហាការដំឡើង**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 ការសួរអំពី AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 ដោះស្រាយបញ្ហា**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## ការណែនាំ

FAQ ពេញលេញនេះផ្តល់ចំលើយចំពោះសំណួរដែលមកជាញឹកញាប់អំពី Azure Developer CLI (azd) និងការដាក់បញ្ជូនទៅ Azure។ សូមស្វែងរកដំណោះស្រាយរហ័សសម្រាប់បញ្ហាទូទៅ, យល់ដឹងអំពីអនុវត្តកាន់តែប្រសើរ, និងទទួលបានការពន្យល់អំពីគំនិត និងលំហួចការងារ azd។

## គោលបំណងការសិក្សា

ដោយពិនិត្យ FAQ នេះអ្នកនឹង:
- ស្វែងរកចំលើយរហ័សចំពោះសំណួរនិងបញ្ហាទូទៅរបស់ Azure Developer CLI
- យល់ដឹងអំពីគំនិតសំខាន់និងពាក្យគន្លឹះតាមទ្រង់ទ្រាយសំណួរនិងចម្លើយ
- ឈានដល់ដំណោះស្រាយដោះស្រាយបញ្ហាសម្រាប់បញ្ហានិងស្ថានការណ៍កំហុសដែលជាញឹកញាប់
- រៀនអំពីអនុវត្តល្អខាងលើតាមសំណួរដែលគេសួរញឹកញាប់អំពីការកែលម្អ
- ស្វែងរកមុខងារល្អឆ្ងាយនិងសមត្ថភាពតាមសំណួររបស់អ្នកជំនាញ
- យោងដល់ការណែនាំអំពីថ្លៃចំណាយ សុវត្ថិភាព និងយុទ្ធសាស្ត្រការដាក់បញ្ចូនយ៉ាងមានប្រសិទ្ធភាព

## លទ្ធផលការសិក្សា

ដោយយោងដើមទៀងទាត់FAQ នឹងអាច:
- ដោះស្រាយបញ្ហាទូទៅរបស់ Azure Developer CLI ដោយឯករាជ្យដោយប្រើដំណោះស្រាយដែលផ្តល់ឲ្យ
- ធ្វើការសម្រេចចិត្តដោយទំនុកចិត្តអំពីយុទ្ធសាស្ត្រការដាក់បញ្ចូន និងកំណត់តម្លៃ
- យល់ទំនាក់ទំនងរវាង azd និងឧបករណ៍ និងសេវាកម្ម Azure ផ្សេងទៀត
- អនុវត្តអនុវត្តល្អដោយផ្អែកលើបទពិសោធន៍សហគមន៍ និងការណែនាំពីអ្នកជំនាញ
- ដោះស្រាយបញ្ហាអះអាងសុវត្ថិភាព ការផ្ទៀងផ្ទាត់និងកំណត់តម្លៃដោយមានប្រសិទ្ធភាព
- បង្កើនប្រសិទ្ធភាពថ្លៃចំណាយ និងកម្រិតការប្រតិបត្តិដោយប្រើគន្លឹះនិងយុទ្ធសាស្ត្រពី FAQ

## តារាងមាតិកា

- [Getting Started](#getting-started)
- [Authentication & Access](#authentication--access)
- [Templates & Projects](#templates--projects)
- [Deployment & Infrastructure](#deployment--infrastructure)
- [Configuration & Environments](#configuration--environments)
- [Troubleshooting](#q-how-do-i-override-template-defaults)
- [Cost & Billing](#cost--billing)
- [Best Practices](#q-are-there-free-tier-options-for-azd-templates)
- [Advanced Topics](#q-how-do-i-handle-secrets-and-sensitive-configuration)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) គឺជាឧបករណ៍បញ្ជា​តាម​បន្ទាត់ផ្នែកអ្នកអភិវឌ្ឍដែលជួយបង្កើនល្បឿនពីពេលដែលកម្មវិធីរបស់អ្នកនៅក្នុងបរិបទអភិវឌ្ឍន៍ក្នុងកុំព្យូទ័រទៅកាន់ Azure។ វាផ្ដល់អនុវត្តល្អតាមរយៈគំរូ និងជួយនៅលើជីវិតការដាក់បញ្ចូនទាំងមូល។

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: ឧបករណ៍ទូទៅសម្រាប់គ្រប់គ្រងធនធាន Azure
- **azd**: ឧបករណ៍ផ្ដោតលើអ្នកអភិវឌ្ឍសម្រាប់ដំណើរការការដាក់បញ្ចូនកម្មវិធី
- azd ប្រើ Azure CLI ផ្នែកខាងក្នុង ប៉ុន្តែផ្តល់ abstraction ជាន់ខ្ពស់សម្រាប់សះស្បើយអភិវឌ្ឍន៍ទូទៅ
- azd 包括 គំរូ, ការគ្រប់គ្រងបរិស្ថាន និងស្វ័យប្រវត្តិក្នុងការដាក់បញ្ចូន

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, azd ត្រូវការកម្មវិធី Azure CLI សម្រាប់ការផ្ទៀងផ្ទាត់ និងសកម្មភាពខ្លះៗ។ សូមដំឡើង Azure CLI ជាមុនបន្ទាប់មកដំឡើង azd។

### Q: What programming languages does azd support?
**A**: azd មិនខ្វះភាសា។ វាដំណើរការជាមួយ:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Can I use azd with existing projects?
**A**: Yes! អ្នកអាច:
1. ប្រើ `azd init` ដើម្បីបន្ថែមការកំណត់ azd ទៅក្នុងគម្រោងដែលមានរួច
2. បត់បែនគម្រោងដែលមានរួចឲ្យសមនឹងរចนាសម្ព័នគំរូ azd
3. បង្កើតគំរូផ្ទាល់ខ្លួនអោយឆ្លើយតបលើស្ថាបត្យកម្មដែលអ្នកមាន

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: ប្រើ `azd auth login` ដែលនឹងបើកផ្ទាំងរុករកសម្រាប់ការផ្ទៀងផ្ទាត់ Azure។ សម្រាប់ស្ថានការណ៍ CI/CD សូមប្រើ service principals ឬ managed identities។

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. ប្រើ `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` ដើម្បីបញ្ជាក់ subscription ដែលចង់ប្រើសម្រាប់បរិស្ថាននីមួយៗ។

### Q: What permissions do I need to deploy with azd?
**A**: ជាទូទៅអ្នកត្រូវការខាងក្រោម:
- **Contributor** role លើ resource group ឬ subscription
- **User Access Administrator** ប្រសិនបើដាក់បញ្ចូនធនធានដែលត្រូវការការចេញជូនភារកិច្ចតួ
- សិទ្ធិជាក់លាក់នឹងខុសគ្នាតាមគំរូ និងធនធានដែលដាក់ទៅ

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutely! azd ត្រូវបានរចនាសម្រាប់ការរួមបញ្ចូលក្នុង CI/CD។ ប្រើ service principals សម្រាប់ការផ្ទៀងផ្ទាត់ និងកំណត់អថេរបរិស្ថានសម្រាប់កំណត់ការកំណត់។

### Q: How do I handle authentication in GitHub Actions?
**A**: ប្រើ Azure Login action ជាមួយសេចក្តីលម្អិត service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- គំរូផ្លូវការទីល្អ: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- គំរូសហគមន៍: ស្វែងរក “azd-template” លើ GitHub
- ប្រើ `azd template list` ដើម្បីរុករកគំរូដែលមាន

### Q: How do I create a custom template?
**A**: 
1. ចាប់ផ្តើមពីរចនាសម្ព័ន្ធគំរូដែលមានរួច
2. កែប្រែរ `azure.yaml`, ឯកសារហេដ្ឋារចនាសម្ព័ន្ធ និងកូដកម្មវិធី
3. សាកល្បងយ៉ាងល្អជាមួយ `azd up`
4. បោះពុម្ពទៅ GitHub ជាមួយ tag ដែលសមស្រប

### Q: Can I use azd without a template?
**A**: Yes, ប្រើ `azd init` នៅក្នុងគម្រោងដែលមានរួចដើម្បីបង្កើតឯកសារកំណត់ដែលចាំបាច់។ អ្នកនឹងត្រូវកំណត់ `azure.yaml` និងឯកសារហេដ្ឋារចនាសម្ព័ន្ធដោយដៃ។

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: ប្រកាន់ដោយ Microsoft, មានការអាប់ដេតជាប្រចាំ, និងឯកសារពិពណ៌នាវិសាល
- **Community templates**: បង្កើតដោយអ្នកអភិវឌ្ឍ, អាចមានករណីប្រើប្រាស់ជាក់លាក់, ធុញត្រូវគុណភាពនិងការថែទាំខុសគ្នា

### Q: How do I update a template in my project?
**A**: គំរូមិនត្រូវបានអាប់ដេតដោយស្វ័យប្រវត្តិ។ អ្នកអាច:
1. ប្រៀបធៀបដោយដៃ និងផ្ទេរមេរៀនពីគំរូប្រភព
2. ចាប់ផ្តើមឡើងវិញជាមួយ `azd init` ដោយប្រើគំរូដែលបានអាប់ដេត
3. Cherry-pick ការកែលម្អជាច្រើនពីគំរូដែលបានអាប់ដេត

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd អាចដាក់បញ្ចូនធនធាន Azure គ្រប់យ៉ាងតាមរយៈ Bicep/ARM templates, រួមមាន:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, សុវត្ថិភាព, និងធនធានត្រួតពិនិត្យ

### Q: Can I deploy to multiple regions?
**A**: Yes, កំណត់តំបន់ច្រើនក្នុង Bicep templates របស់អ្នក និងកំណត់ពាក្យប៉ារ៉ាម៉ែត្រ location ឲ្យសមស្របសម្រាប់បរិស្ថាននីមួយៗ។

### Q: How do I handle database schema migrations?
**A**: ប្រើ deployment hooks នៅក្នុង `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Yes, ប្រើ `azd provision` ដើម្បីដាក់បញ្ចូនតែមួយចំនួនធនធានហេដ្ឋារ ដែលបានកំណត់ក្នុងគំរូរបស់អ្នក។

### Q: How do I deploy to existing Azure resources?
**A**: វារឹងរាក់ទាក់ និងមិនគាំទ្រដោយផ្ទាល់។ អ្នកអាច:
1. នាំចូលធនធានមានរួចទៅក្នុង Bicep templates របស់អ្នក
2. ប្រើ reference ទៅធនធានដែលមានរួចក្នុង templates
3. កែបំលែង templates ដើម្បីបង្កើតឬយោងធនធានដោយមានលក្ខខណ្ឌ

### Q: Can I use Terraform instead of Bicep?
**A**: ថ្ងៃនេះ azd ភាគច្រើនគាំទ្រ Bicep/ARM templates។ ការគាំទ្រលើ Terraform មិនទាន់មានជាផ្លូវការទេ ទោះបីជាមួយដំណោះស្រាយសហគមន៍អាចមាន។

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: បង្កើតបរិស្ថានបំបែកជាមួយ `azd env new <environment-name>` ហើយកំណត់ការកំណត់ផ្សេងៗសម្រាប់មួយៗ:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: នៅក្នុងថត `.azure` ក្នុងថតគម្រោងរបស់អ្នក។ បរិស្ថានមួយៗមានថតផ្ទាល់ខ្លួនដែលមានឯកសារកំណត់រចនាសម្ព័ន្ធ។

### Q: How do I set environment-specific configuration?
**A**: ប្រើ `azd env set` ដើម្បីកំណត់អថេរបរិស្ថាន:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: ថត `.azure` មានព័ត៌មានសំងាត់ និងមិនគួរត្រូវបាន commit ទៅ version control។ ជំនួស:
1. សរសេរ​ឯកសារបញ្ជាក់អថេរបរិស្ថាន​ដែលចាំបាច់
2. ប្រើស្គ្រីបដាក់បញ្ចូនដើម្បីបង្កើតបរិស្ថាន
3. ប្រើ Azure Key Vault សម្រាប់កំណត់តម្លៃដែលមានសារសំងាត់

### Q: How do I override template defaults?
**A**: កំណត់អថេរបរិស្ថានដែលសមនឹងប៉ារ៉ាម៉ែត្រគំរូ:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: មូលហេតុទូទៅ:
1. **Authentication issues**: រត់ `azd auth login`
2. **Insufficient permissions**: ពិនិត្យការផ្តល់តួនាទី Azure របស់អ្នក
3. **Resource naming conflicts**: ប្ដូរឈ្មោះ AZURE_ENV_NAME
4. **Quota/capacity issues**: ពិនិត្យភាពអាចប្រើបានតាមតំបន់
5. **Template errors**: ផ្ទៀងផ្ទាត់ Bicep templates

### Q: How do I debug deployment failures?
**A**: 
1. ប្រើ `azd deploy --debug` ដើម្បីទទួល output លម្អិត
2. ពិនិត្យប្រវត្តិការដាក់បញ្ចូននៅក្នុង Azure portal
3. សូមពិនិត្យ Activity Log នៅក្នុង Azure portal
4. ប្រើ `azd show` ដើម្បីបង្ហាញស្ថានភាពបរិស្ថានបច្ចុប្បន្ន

### Q: Why are my environment variables not working?
**A**: ពិនិត្យ:
1. ឈ្មោះអថេរត្រូវតែត្រូវគ្នានឹងប៉ារ៉ាម៉ែត្រគំរូមែនៗ
2. តម្លៃត្រូវបានដាក់ក្នុងសញ្ញាដៅយ៉ាងត្រឹមត្រូវ ប្រសិនបើមានចន្លោះ
3. បរិស្ថានត្រូវបានជ្រើស៖ `azd env select <environment>`
4. អថេរត្រូវបានកំណត់នៅក្នុងបរិស្ថានត្រឹមត្រូវ

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
នេះលុបទ្រព្យសម្បត្តិទាំងអស់ និង ការកំណត់បរិស្ថាន។

### Q: Why is my application not accessible after deployment?
**A**: ពិនិត្យ:
1. ការដាក់បញ្ចូនបានបញ្ចប់ដោយជោគជ័យឬនៅ
2. កម្មវិធីកំពុងរត់ (ពិនិត្យកំណត់ហេតុនៅក្នុង Azure portal)
3. Network security groups អនុញ្ញាតចរាចរណ៍
4. DNS/ដែនប្ដូរផ្ទាល់បានកំណត់ត្រឹមត្រូវ

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: ថ្លៃដើមអាស្រ័យលើ:
- សេវាកម្ម Azure ដែលបានដាក់
- កម្រិតសេវា/SKUs ដែលបានជ្រើស
- ផ្ទៃតម្លៃតាមតំបន់
- របៀបប្រើប្រាស់

ប្រើ [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) សម្រាប់ការប៉ាន់ស្មាន។

### Q: How do I control costs in azd deployments?
**A**: 
1. ប្រើ SKU កម្រិតទាបសម្រាប់បរិស្ថានអភិវឌ្ឍន៍
2. បានកំណត់ថវិកា Azure និងការជូនដំណឹង
3. ប្រើ `azd down` ដើម្បីយកធនធានចេញនៅពេលមិនចាំបាច់
4. ជ្រើសតំបន់សមរម្យ (ថ្លៃខុសគ្នាតាមទីតាំង)
5. ប្រើឧបករណ៍ Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: សេវាកម្ម Azure ច្រើនផ្តល់ជូនថ្នាក់ឥតគិតថ្លៃ:
- App Service: មានថ្នាក់ឥតគិតថ្លៃ
- Azure Functions: 1M free executions/month
- Cosmos DB: ថ្នាក់ឥតគិតថ្លៃជាមួយ 400 RU/s
- Application Insights: ការប្រើប្រាស់ដំបូង 5GB/ខែឥតគិតថ្លៃ

កំណត់គំរូឲ្យប្រើថ្នាក់ឥតគិតថ្លៃនៅពេលដែលអាចរួច។

### Q: How do I estimate costs before deployment?
**A**: 
1. ពិនិត្យ `main.bicep` របស់គំរូដើម្បីមើលថាតើធនធានណានឹងត្រូវបានបង្កើត
2. ប្រើ Azure Pricing Calculator ជាមួយ SKU ច្បាស់លាស់
3. ដាក់នៅបរិស្ថានអភិវឌ្ឍន៍ជាមុនដើម្បីតាមដានថ្លៃពិត
4. ប្រើ Azure Cost Management សម្រាប់វិភាគថ្លៃលម្អិត

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. រក្សាកូដកម្មវិធីបំបែកពីហេដ្ឋារចនាសម្ព័ន្ធ
2. ប្រើឈ្មោះសេវាដែលមានន័យនៅក្នុង `azure.yaml`
3. អនុវត្តការគ្រប់គ្រងកំហុសសមរម្យក្នុងស្គ្រីប build
4. ប្រើការកំណត់បរិស្ថានជាក់លាក់
5. បន្ថែមឯកសារពិពណ៌នាយ៉ាងពេញលេញ

### Q: How should I organize multiple services in azd?
**A**: ប្រើរចនាសម្ព័ន្ធដែលបានផ្ដល់អនុសាសន៍:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **ទេ!** ថត `.azure` រួមមានព័ត៌មានសំងាត់។ បន្ថែមវាទៅ `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. ប្រើ Azure Key Vault សម្រាប់សម្ងាត់
2. សំគាល់សម្ងាត់ Key Vault នៅក្នុងការកំណត់កម្មវិធី
3. មិនដែល commit សម្ងាត់ទៅ version control
4. ប្រើ managed identities សម្រាប់ការផ្ទៀងផ្ទាត់រវាងសេវាកម្ម

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. ប្រើបរិស្ថានផ្សេងៗសម្រាប់មណ្ឌលនីមួយៗ (dev/staging/prod)
2. អនុវត្តតេស្តស្វ័យប្រវត្តិមុនការដាក់បញ្ចូន
3. ប្រើ service principals សម្រាប់ការផ្ទៀងផ្ទាត់
4. រក្សាកំណត់តម្លៃសំងាត់ក្នុង pipeline secrets/variables
5. អនុវត្តការអនុម័តសម្រាប់ការដាក់បញ្ចូនក្នុងផលិតកម្ម

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Yes, តាមរយៈ deployment hooks ក្នុង `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. ប្រើពាក្យបញ្ជា azd ក្នុងស្គ្រីប pipeline ដែលមានរួច
2. ស្តង់ដារ​លើគំរូ azd នៅក្រុម
3. រួមបញ្ចូលជាមួយការត្រួតពិនិត្យ និងការជូនដំណឹងមានរួច
4. ប្រើ output JSON របស់ azd សម្រាប់ការរួមបញ្ចូលក្នុង pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd ធ្វើការជាមួយប្រព័ន្ធ CI/CD អ្វីៗក៏បាន។ បង្កើត Azure DevOps pipelines ដែលប្រើពាក្យបញ្ជា azd។

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd tool**: ចូលរួម​ទៅកាន់ [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: បង្កើតគំរូដោយអនុវត្ត​តាម [មគ្គុទេសក៍គំរូ](https://github.com/Azure-Samples/awesome-azd)
3. **Documentation**: ចូលរួម​ក្នុង​ឯកសារ​នៅ [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: ផែនការសម្រាប់ azd គឺអ្វី?
**A**: ពិនិត្យ​មើល [ផែនការផ្លូវការ](https://github.com/Azure/azure-dev/projects) សម្រាប់មុខងារដែលបានគ្រោងទុក និងការកែលម្អ។

### Q: តើខ្ញុំផ្លាស់ទីពីឧបករណ៍ដាក់ចេញផ្សេងទៀតទៅ azd ដូចម្តេច?
**A**: 
1. វិភាគស្ថាបត្យកម្មដាក់ចេញ​បច្ចុប្បន្ន
2. បង្កើតគំរូ Bicep ដែលត្រូវតាម
3. កំណត់រចនាសម្ព័ន្ធ `azure.yaml` ដើម្បីឲ្យត្រូវនឹងសេវាកម្ម​បច្ចុប្បន្ន
4. សាកល្បងយ៉ាងពេញលេញនៅក្នុងបរិស្ថានអភិវឌ្ឍន៍
5. ផ្លាស់ប្តូរបរិស្ថានជាដំណាក់កាល

---

## នៅតែ​មាន​សំណួរ​ទៀតទេ?

### **ស្វែងរកជាមុន**
- ត្រួតពិនិត្យ [ឯកសារផ្លូវការ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- ស្វែងរក [GitHub issues](https://github.com/Azure/azure-dev/issues) សម្រាប់បញ្ហា​ដែលស្រដៀង

### **ទទួលបានជំនួយ**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - គាំទ្រពីសហគមន៍
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - សំនួរបច្ចេកទេស
- [Azure Discord](https://discord.gg/azure) - ជជែកសហគមន៍ពេលជាក់ស្តែង

### **រាយការណ៍បញ្ហា**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - របាយការណ៍កំហុស និងការស្នើសុំមុខងារ
- រួមបញ្ចូលកំណត់ហេតុ​ដែលទាក់ទង, សារ​កំហុស និងជំហានដើម្បីធ្វើឲ្យកើតឡើង

### **ស្វែងយល់​បន្ថែម**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*FAQ នេះត្រូវបានធ្វើការអាប់ដេតជាប្រចាំ។ បានអាប់ដេតចុងក្រោយ៖ 9 កញ្ញា 2025*

---

**រុករក**
- **មេរៀន​មុន**: [បញ្ជីពាក្យ](glossary.md)
- **មេរៀន​បន្ទាប់**: [ម​គ្គុទេសក៍សិក្សា](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែដោយ AI [Co-op Translator](https://github.com/Azure/co-op-translator). បើទោះយើងព្យាយាមឲ្យបានត្រឹមត្រូវ សូមអនុគ្រោះថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬមានភាពមិនត្រឹមត្រូវ។ ឯកសារដើមនៅក្នុងភាសាមាតុភូមិនោះគួរត្រូវបានយកចាត់ទុកថាជាប្រភពដែលគួរឱ្យទុកចិត្ត។ សម្រាប់ព័ត៌មានសំខាន់ៗ គួរត្រូវបានបកប្រែដោយអ្នកបកប្រែវិជ្ជាជីវៈមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយ ដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
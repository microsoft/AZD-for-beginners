<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-10-11T15:54:38+00:00",
  "source_file": "resources/faq.md",
  "language_code": "ta"
}
-->
# அடிக்கடி கேட்கப்படும் கேள்விகள் (FAQ)

**அத்தியாயத்தின்படி உதவி பெறுங்கள்**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../README.md)
- **🚆 நிறுவல் சிக்கல்கள்**: [அத்தியாயம் 1: நிறுவல் & அமைப்பு](../docs/getting-started/installation.md)
- **🤖 AI கேள்விகள்**: [அத்தியாயம் 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 பிரச்சினைகளை சரிசெய்தல்**: [அத்தியாயம் 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான FAQ, Azure Developer CLI (azd) மற்றும் Azure deployments பற்றிய பொதுவான கேள்விகளுக்கு பதில்களை வழங்குகிறது. பொதுவான பிரச்சினைகளுக்கு விரைவான தீர்வுகளை கண்டறியவும், சிறந்த நடைமுறைகளைப் புரிந்துகொள்ளவும், azd கருத்துக்கள் மற்றும் வேலைப்பாடுகளை தெளிவுபடுத்தவும் உதவுகிறது.

## கற்றல் நோக்கங்கள்

இந்த FAQ-ஐ ஆய்வு செய்வதன் மூலம், நீங்கள்:
- பொதுவான Azure Developer CLI கேள்விகள் மற்றும் சிக்கல்களுக்கு விரைவான பதில்களை கண்டறியலாம்
- நடைமுறை Q&A வடிவத்தின் மூலம் முக்கிய கருத்துக்கள் மற்றும் சொற்கள்தொகுப்புகளைப் புரிந்துகொள்ளலாம்
- அடிக்கடி ஏற்படும் பிரச்சினைகள் மற்றும் பிழை நிலைகளுக்கான தீர்வுகளை அணுகலாம்
- மேம்படுத்தல் தொடர்பான பொதுவான கேள்விகள் மூலம் சிறந்த நடைமுறைகளை கற்றுக்கொள்ளலாம்
- நிபுணர் நிலை கேள்விகள் மூலம் மேம்பட்ட அம்சங்கள் மற்றும் திறன்களை கண்டறியலாம்
- செலவு, பாதுகாப்பு மற்றும் deployment உத்திகள் பற்றிய வழிகாட்டுதல்களை திறமையாகப் பயன்படுத்தலாம்

## கற்றல் முடிவுகள்

இந்த FAQ-ஐ அடிக்கடி பயன்படுத்துவதன் மூலம், நீங்கள்:
- வழங்கப்பட்ட தீர்வுகளைப் பயன்படுத்தி பொதுவான Azure Developer CLI சிக்கல்களை சுயமாக தீர்க்க முடியும்
- deployment உத்திகள் மற்றும் அமைப்புகள் பற்றிய அறிவார்ந்த முடிவுகளை எடுக்க முடியும்
- azd மற்றும் பிற Azure கருவிகள் மற்றும் சேவைகளுக்கிடையிலான தொடர்பை புரிந்துகொள்ள முடியும்
- சமூக அனுபவம் மற்றும் நிபுணர் பரிந்துரைகளின் அடிப்படையில் சிறந்த நடைமுறைகளைப் பயன்படுத்த முடியும்
- authentication, deployment மற்றும் configuration பிரச்சினைகளை திறமையாக சரிசெய்ய முடியும்
- FAQ-ல் உள்ள தகவல்கள் மற்றும் பரிந்துரைகளைப் பயன்படுத்தி செலவுகளை மற்றும் செயல்திறனை மேம்படுத்த முடியும்

## உள்ளடக்க அட்டவணை

- [தொடக்கத்தில்](../../../resources)
- [அங்கீகாரம் & அணுகல்](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## தொடக்கத்தில்

### Q: Azure Developer CLI (azd) என்றால் என்ன?
**A**: Azure Developer CLI (azd) என்பது developer-களுக்கான command-line கருவியாகும், இது உங்கள் application-ஐ local development சூழலிலிருந்து Azure-க்கு கொண்டு செல்லும் நேரத்தை வேகமாக்குகிறது. இது templates மூலம் சிறந்த நடைமுறைகளை வழங்குகிறது மற்றும் deployment வாழ்க்கைச்சுழற்சியில் உதவுகிறது.

### Q: azd, Azure CLI-யில் இருந்து எப்படி வேறுபடுகிறது?
**A**: 
- **Azure CLI**: Azure resources-ஐ நிர்வகிக்க பொதுவான கருவி
- **azd**: application deployment workflows-க்கு developer-களுக்கான கருவி
- azd, Azure CLI-ஐ உள்நோக்கமாக பயன்படுத்துகிறது, ஆனால் பொதுவான development சூழல்களுக்கு மேம்பட்ட abstraction-களை வழங்குகிறது
- azd, templates, environment management மற்றும் deployment automation-ஐ உள்ளடக்கியது

### Q: azd-ஐ பயன்படுத்த Azure CLI நிறுவல் தேவைப்படுமா?
**A**: ஆம், azd-க்கு authentication மற்றும் சில செயல்பாடுகளுக்கு Azure CLI தேவை. முதலில் Azure CLI-யை நிறுவி, பின்னர் azd-ஐ நிறுவவும்.

### Q: azd எந்த programming மொழிகளை ஆதரிக்கிறது?
**A**: azd மொழி சார்ந்தது அல்ல. இது கீழ்கண்டவற்றுடன் வேலை செய்கிறது:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: azd-ஐ ஏற்கனவே உள்ள project-களுடன் பயன்படுத்த முடியுமா?
**A**: முடியும்! நீங்கள்:
1. `azd init`-ஐ பயன்படுத்தி ஏற்கனவே உள்ள project-களுக்கு azd configuration-ஐ சேர்க்கலாம்
2. azd template அமைப்புக்கு பொருந்தும் வகையில் project-களை மாற்றலாம்
3. உங்கள் ஏற்கனவே உள்ள architecture அடிப்படையில் custom templates உருவாக்கலாம்

---

## அங்கீகாரம் & அணுகல்

### Q: azd-ஐ பயன்படுத்தி Azure-இல் எப்படி அங்கீகரிக்கலாம்?
**A**: `azd auth login`-ஐ பயன்படுத்தவும், இது Azure authentication-க்கு browser window-ஐ திறக்கும். CI/CD சூழல்களுக்கு, service principals அல்லது managed identities-ஐ பயன்படுத்தவும்.

### Q: azd-ஐ பல Azure subscriptions-களுடன் பயன்படுத்த முடியுமா?
**A**: முடியும். `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`-ஐ பயன்படுத்தி ஒவ்வொரு சூழலுக்கும் எந்த subscription-ஐ பயன்படுத்த வேண்டும் என்பதை குறிப்பிடவும்.

### Q: azd-ஐ deploy செய்ய என்ன permissions தேவை?
**A**: பொதுவாக உங்களுக்கு தேவை:
- resource group அல்லது subscription-க்கு **Contributor** பங்கு
- role assignments தேவைப்படும் resources-ஐ deploy செய்ய **User Access Administrator**
- template மற்றும் deploy செய்யப்படும் resources-களின் அடிப்படையில் குறிப்பிட்ட permissions மாறுபடும்

### Q: azd-ஐ CI/CD pipelines-களில் பயன்படுத்த முடியுமா?
**A**: முழுமையாக! azd, CI/CD integration-க்கு வடிவமைக்கப்பட்டுள்ளது. authentication-க்கு service principals-ஐ பயன்படுத்தவும் மற்றும் configuration-க்கு environment variables-ஐ அமைக்கவும்.

### Q: GitHub Actions-ல் authentication-ஐ எப்படி கையாளலாம்?
**A**: Azure Login action-ஐ service principal credentials-களுடன் பயன்படுத்தவும்:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: azd templates-ஐ எங்கு கண்டறியலாம்?
**A**: 
- அதிகாரப்பூர்வ templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- சமூக templates: GitHub-ல் "azd-template" தேடுங்கள்
- `azd template list`-ஐ பயன்படுத்தி கிடைக்கக்கூடிய templates-ஐ உலாவுங்கள்

### Q: custom template-ஐ எப்படி உருவாக்குவது?
**A**: 
1. ஏற்கனவே உள்ள template அமைப்புடன் தொடங்குங்கள்
2. `azure.yaml`, infrastructure files மற்றும் application code-ஐ மாற்றுங்கள்
3. `azd up`-ஐ பயன்படுத்தி முழுமையாக சோதிக்கவும்
4. GitHub-க்கு சரியான tags-களுடன் வெளியிடவும்

### Q: template இல்லாமல் azd-ஐ பயன்படுத்த முடியுமா?
**A**: முடியும், `azd init`-ஐ ஏற்கனவே உள்ள project-ல் பயன்படுத்தி தேவையான configuration files-ஐ உருவாக்கவும். நீங்கள் `azure.yaml` மற்றும் infrastructure files-ஐ கையேடு முறையில் configuration செய்ய வேண்டும்.

### Q: அதிகாரப்பூர்வ templates மற்றும் சமூக templates-இடையிலான வேறுபாடு என்ன?
**A**: 
- **அதிகாரப்பூர்வ templates**: Microsoft-ஆல் பராமரிக்கப்படுகிறது, முறையாக புதுப்பிக்கப்படுகிறது, விரிவான ஆவணங்கள்
- **சமூக templates**: developer-களால் உருவாக்கப்பட்டது, சிறப்பு பயன்பாடுகள் இருக்கலாம், தரம் மற்றும் பராமரிப்பு மாறுபடும்

### Q: project-இல் template-ஐ எப்படி புதுப்பிக்கலாம்?
**A**: templates தானாகவே புதுப்பிக்கப்படாது. நீங்கள்:
1. மூல template-இலிருந்து மாற்றங்களை கையேடு முறையில் ஒப்பிட்டு இணைக்கலாம்
2. `azd init`-ஐ பயன்படுத்தி புதுப்பிக்கப்பட்ட template-ஐ கொண்டு புதிய project-ஐ தொடங்கலாம்
3. புதுப்பிக்கப்பட்ட templates-இலிருந்து குறிப்பிட்ட மேம்பாடுகளை cherry-pick செய்யலாம்

---

## Deployment & Infrastructure

### Q: azd எந்த Azure services-ஐ deploy செய்ய முடியும்?
**A**: azd, Bicep/ARM templates மூலம் எந்த Azure service-ஐயும் deploy செய்ய முடியும், அதில்:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security மற்றும் monitoring resources

### Q: பல பகுதிகளுக்கு deploy செய்ய முடியுமா?
**A**: முடியும், உங்கள் Bicep templates-ல் பல பகுதிகளை configure செய்து ஒவ்வொரு சூழலுக்கும் location parameter-ஐ சரியாக அமைக்கவும்.

### Q: database schema migrations-ஐ எப்படி கையாளலாம்?
**A**: `azure.yaml`-ல் deployment hooks-ஐ பயன்படுத்தவும்:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: applications இல்லாமல் infrastructure-ஐ மட்டும் deploy செய்ய முடியுமா?
**A**: முடியும், `azd provision`-ஐ பயன்படுத்தி templates-ல் வரையறுக்கப்பட்ட infrastructure components-ஐ deploy செய்யலாம்.

### Q: ஏற்கனவே உள்ள Azure resources-க்கு deploy செய்ய முடியுமா?
**A**: இது சிக்கலானது மற்றும் நேரடியாக ஆதரிக்கப்படவில்லை. நீங்கள்:
1. உங்கள் Bicep templates-ல் ஏற்கனவே உள்ள resources-ஐ import செய்யலாம்
2. templates-ல் ஏற்கனவே உள்ள resource references-ஐ பயன்படுத்தலாம்
3. resources-ஐ உருவாக்க அல்லது reference செய்ய templates-ஐ மாற்றலாம்

### Q: Bicep-க்கு பதிலாக Terraform-ஐ பயன்படுத்த முடியுமா?
**A**: தற்போதைக்கு, azd முக்கியமாக Bicep/ARM templates-ஐ ஆதரிக்கிறது. Terraform ஆதரவு அதிகாரப்பூர்வமாக கிடைக்கவில்லை, ஆனால் சமூக தீர்வுகள் இருக்கலாம்.

---

## Configuration & Environments

### Q: dev, staging, prod போன்ற வெவ்வேறு சூழல்களை எப்படி நிர்வகிப்பது?
**A**: `azd env new <environment-name>`-ஐ பயன்படுத்தி தனித்துவமான சூழல்களை உருவாக்கி ஒவ்வொன்றிற்கும் வெவ்வேறு அமைப்புகளை configure செய்யவும்:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: சூழல் configuration-கள் எங்கு சேமிக்கப்படுகின்றன?
**A**: உங்கள் project directory-யில் `.azure` கோப்பகத்தில். ஒவ்வொரு சூழலுக்கும் தனித்துவமான configuration files-களுடன் தனி கோப்பகங்கள் உள்ளன.

### Q: சூழல்-குறிப்பிட்ட configuration-ஐ எப்படி அமைப்பது?
**A**: `azd env set`-ஐ பயன்படுத்தி சூழல் மாறிகளை configure செய்யவும்:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: சூழல் configuration-களை குழு உறுப்பினர்களுடன் பகிர முடியுமா?
**A**: `.azure` கோப்பகத்தில் நுண்ணறிவு தகவல்கள் உள்ளன, இது version control-க்கு commit செய்யக்கூடாது. பதிலாக:
1. தேவையான சூழல் மாறிகளை ஆவணப்படுத்தவும்
2. சூழல்களை அமைக்க deployment scripts-ஐ பயன்படுத்தவும்
3. நுண்ணறிவு configuration-க்கு Azure Key Vault-ஐ பயன்படுத்தவும்

### Q: template defaults-ஐ எப்படி override செய்யலாம்?
**A**: template parameters-க்கு ஒத்த சூழல் மாறிகளை அமைக்கவும்:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: `azd up` ஏன் தோல்வியடைகிறது?
**A**: பொதுவான காரணங்கள்:
1. **அங்கீகாரம் சிக்கல்கள்**: `azd auth login`-ஐ இயக்கவும்
2. **பரிந்துரைகள் போதாமை**: உங்கள் Azure role assignments-ஐ சரிபார்க்கவும்
3. **Resource naming conflicts**: AZURE_ENV_NAME-ஐ மாற்றவும்
4. **Quota/capacity issues**: பகுதி கிடைக்கக்கூடியதை சரிபார்க்கவும்
5. **Template errors**: Bicep templates-ஐ validate செய்யவும்

### Q: deployment தோல்விகளை எப்படி debug செய்வது?
**A**: 
1. `azd deploy --debug`-ஐ verbose output-க்கு பயன்படுத்தவும்
2. Azure portal deployment history-ஐ சரிபார்க்கவும்
3. Azure portal-ல் Activity Log-ஐ மதிப்பீடு செய்யவும்
4. `azd show`-ஐ பயன்படுத்தி தற்போதைய சூழல் நிலையை காட்டவும்

### Q: சூழல் மாறிகள் ஏன் வேலை செய்யவில்லை?
**A**: சரிபார்க்கவும்:
1. Variable names, template parameters-க்கு துல்லியமாக பொருந்த வேண்டும்
2. Values, இடைவெளிகள் உள்ளதானால் சரியாக quote செய்யப்பட வேண்டும்
3. சூழல் தேர்ந்தெடுக்கப்பட்டது: `azd env select <environment>`
4. மாறிகள் சரியான சூழலில் அமைக்கப்பட்டுள்ளன

### Q: தோல்வியடைந்த deployments-ஐ எப்படி சுத்தம் செய்வது?
**A**: 
```bash
azd down --force --purge
```
இது அனைத்து resources மற்றும் சூழல் configuration-ஐ அகற்றும்.

### Q: deployment முடிந்த பிறகு application ஏன் அணுக முடியவில்லை?
**A**: சரிபார்க்கவும்:
1. Deployment வெற்றிகரமாக முடிந்தது
2. Application இயங்குகிறது (Azure portal-ல் logs-ஐ சரிபார்க்கவும்)
3. Network security groups traffic-ஐ அனுமதிக்கின்றன
4. DNS/custom domains சரியாக configure செய்யப்பட்டுள்ளன

---

## Cost & Billing

### Q: azd deployments-க்கு எவ்வளவு செலவாகும்?
**A**: செலவுகள் கீழ்கண்டவற்றின் அடிப்படையில் மாறுபடும்:
- deploy செய்யப்பட்ட Azure services
- Service tiers/SKUs தேர்வு
- பகுதி விலை வேறுபாடுகள்
- பயன்பாட்டு முறை

மதிப்பீடுகளுக்கு [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)-ஐ பயன்படுத்தவும்.

### Q: azd deployments-ல் செலவுகளை எப்படி கட்டுப்படுத்துவது?
**A**: 
1. development சூழல்களுக்கு குறைந்த-tier SKUs-ஐ பயன்படுத்தவும்
2. Azure budgets மற்றும் alerts-ஐ அமைக்கவும்
3. தேவையில்லாத போது resources-ஐ அகற்ற `azd down`-ஐ பயன்படுத்தவும்
4. சரியான பகுதிகளை தேர்வு செய்யவும் (செலவுகள் இடத்தால் மாறுபடும்)
5. Azure Cost Management கருவிகளை பயன்படுத்தவும்

### Q: azd templates-க்கு இலவச tier விருப்பங்கள் உள்ளனவா?
**A**: பல Azure services இலவச tier-களை வழங்குகின்றன:
- App Service: இலவச tier கிடைக்கிறது
- Azure Functions: மாதம் 1M இலவச executions
- Cosmos DB: 400 RU/s உடன் இலவச tier
- Application Insights: முதல் 5GB/மாதம் இலவசம்

கிடைக்கக்கூடிய இடங்களில் templates-ஐ இலவச tier-களை பயன்படுத்த configure செய்யவும்.

### Q: deploy செய்யும் முன் செலவுகளை எப்படி மதிப்பீடு செய்வது?
**A**: 
1. template-இன் `main.bicep`-ஐ மதிப்பீடு செய்து deploy செய்யப்படும் resources-ஐ காண்க
2. குறிப்பிட்ட SKUs-களுடன் Azure Pricing Calculator-ஐ பயன்படுத்தவும்
3. முதலில் development சூழலுக்கு deploy செய்து உண்மையான செலவுகளை கண்காணிக்கவும்
4. Azure Cost Management-ஐ பயன்படுத்தி விரிவான செலவுகளை பகுப்பாய்வு செய்யவும்

---

## Best Practices

### Q: azd project அமைப்புக்கு சிறந்த நடைமுறைகள் என்ன?
**A**: 
1. application code-ஐ infrastructure-இலிருந்து தனியாக வைத்திருங்கள்
2. `azure.yaml`-ல் பொருத்தமான service பெயர்களை பயன்படுத்தவும்
3. build scripts-ல் சரியான error handling-ஐ செயல்படுத்தவும்
4. சூழல்-குறிப்பிட்ட configuration-ஐ பயன்படுத்தவும்
5. விரிவான ஆவணங்களை உள்ளடக்கவும்

### Q: azd-ல் பல services-ஐ எப்படி ஒழுங்கமைப்பது?
**A**: பரிந்துரைக்கப்பட்ட அமைப்பை பயன்படுத்தவும்:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: `.azure` கோப்பகத்தை version control-க்கு commit செய்யலாமா?
**A**: **இல்லை!** `.azure` கோப்பகத்தில் நுண்ணறிவு தகவல்கள் உள்ளன. இதை `.gitignore`-க்கு சேர்க்கவும்:
```gitignore
.azure/
```

### Q: ரகசியங்கள் மற்றும் நுண்ணறிவு configuration-ஐ எப்படி கையாளலாம்?
**A**: 
1. ரகசியங்களுக்கு Azure Key Vault-ஐ பயன்படுத்தவும்
2. application configuration-ல் Key Vault ரகசியங்களை reference செய்யவும்
3. ரகசியங்களை version control-க்கு commit செய்யாதீர்கள்
4. service-to-service authentication-க்கு managed identities-ஐ பயன்படுத்தவும்

### Q: azd-க்கு CI/CD-க்கு பரிந்துரைக்கப்பட்ட அணுகுமுறை என்ன?
**A**: 
1. ஒவ்வொரு நிலைக்கும் தனித்துவமான சூழல்களை (dev/staging/prod) பயன்படுத்தவும்
2. deploy செய்யும் முன் automated testing-ஐ செயல்படுத்தவும்
3. authentication-க்கு service principals-ஐ பயன்படுத்தவும்
4. pipeline secrets/variables-ல் நுண்ணறிவு configuration-ஐ சேமிக்கவும்
5. production deployments-க்கு approval gates-ஐ செயல்படுத்தவும்

---

## Advanced Topics

### Q: az
1. **azd கருவி**: [Azure/azure-dev](https://github.com/Azure/azure-dev) இல் பங்களிக்கவும்  
2. **வார்ப்புருக்கள்**: [வார்ப்புரு வழிகாட்டுதல்கள்](https://github.com/Azure-Samples/awesome-azd) படி வார்ப்புருக்கள் உருவாக்கவும்  
3. **ஆவணங்கள்**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) இல் ஆவணங்களுக்கு பங்களிக்கவும்  

### கேள்வி: azd-க்கு எதிர்கால திட்டம் என்ன?  
**பதில்**: திட்டமிடப்பட்ட அம்சங்கள் மற்றும் மேம்பாடுகளுக்கான [அதிகாரப்பூர்வ திட்டம்](https://github.com/Azure/azure-dev/projects) பார்க்கவும்.  

### கேள்வி: மற்ற பிரயோக கருவிகளிலிருந்து azd-க்கு எப்படி மாற்றுவது?  
**பதில்**:  
1. தற்போதைய பிரயோக கட்டமைப்பை பகுப்பாய்வு செய்யவும்  
2. அதேபோன்ற Bicep வார்ப்புருக்களை உருவாக்கவும்  
3. தற்போதைய சேவைகளுடன் பொருந்த `azure.yaml` ஐ அமைக்கவும்  
4. மேம்பாட்டு சூழலில் முழுமையாக சோதிக்கவும்  
5. சூழல்களை படிப்படியாக மாற்றவும்  

---

## இன்னும் கேள்விகள் உள்ளதா?  

### **முதலில் தேடுங்கள்**  
- [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) பார்க்கவும்  
- இதேபோன்ற பிரச்சினைகளுக்கு [GitHub பிரச்சினைகள்](https://github.com/Azure/azure-dev/issues) தேடவும்  

### **உதவி பெறுங்கள்**  
- [GitHub விவாதங்கள்](https://github.com/Azure/azure-dev/discussions) - சமூக ஆதரவு  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - தொழில்நுட்ப கேள்விகள்  
- [Azure Discord](https://discord.gg/azure) - நேரடி சமூக உரையாடல்  

### **பிரச்சினைகளை அறிவிக்கவும்**  
- [GitHub பிரச்சினைகள்](https://github.com/Azure/azure-dev/issues/new) - பிழை அறிக்கைகள் மற்றும் அம்ச கோரிக்கைகள்  
- தொடர்புடைய பதிவுகள், பிழை செய்திகள் மற்றும் மீண்டும் உருவாக்கும் படிகள் சேர்க்கவும்  

### **மேலும் அறிய**  
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*இந்த FAQ முறையாக புதுப்பிக்கப்படுகிறது. கடைசியாக புதுப்பிக்கப்பட்ட தேதி: செப்டம்பர் 9, 2025*  

---

**வழிசெலுத்தல்**  
- **முந்தைய பாடம்**: [கிளாஸரி](glossary.md)  
- **அடுத்த பாடம்**: [ஆய்வு வழிகாட்டி](study-guide.md)  

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.
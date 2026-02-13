# Maswali Yanayoulizwa Mara kwa Mara (FAQ)

**Pata Msaada kwa Sura**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../README.md)
- **🚆 Matatizo ya Usakinishaji**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 Maswali ya AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Ufumbuzi wa Matatizo**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Utangulizi

FAQ hii kamili inatoa majibu kwa maswali yanayotokea mara kwa mara kuhusu Azure Developer CLI (azd) na utekelezaji wa Azure. Pata suluhisho za haraka kwa matatizo ya kawaida, elewa mbinu bora, na upate ufafanuzi kuhusu dhana na mtiririko wa kazi wa azd.

## Malengo ya Kujifunza

Kwa kupitia FAQ hii, utakuwa umeweza:
- Kupata majibu ya haraka kwa maswali na matatizo ya kawaida ya Azure Developer CLI
- Kuelewa dhana muhimu na istilahi kupitia muundo wa maswali na majibu ya vitendo
- Kupata suluhisho za ufumbuzi wa matatizo kwa matatizo yanayotokea mara kwa mara na hali za makosa
- Kujifunza mbinu bora kupitia maswali yanayoulizwa mara kwa mara kuhusu uboreshaji
- Kugundua vipengele na uwezo wa juu kupitia maswali ya ngazi ya mtaalamu
- Kurejea mwongozo wa gharama, usalama, na kimkakati kwa ufanisi

## Matokeo ya Kujifunza

Kwa kurejea mara kwa mara FAQ hii, utakuwa na uwezo wa:
- Kutatua matatizo ya kawaida ya Azure Developer CLI kwa kujitegemea ukitumia suluhisho zilizotolewa
- Kufanya maamuzi yenye ufahamu kuhusu mikakati ya uenezaji na usanidi
- Kuelewa uhusiano kati ya azd na zana na huduma nyingine za Azure
- Kutumia mbinu bora kulingana na uzoefu wa jumuiya na mapendekezo ya wataalamu
- Kufumbua matatizo ya uthibitishaji, utekelezaji, na usanidi kwa ufanisi
- Kuboreshwa gharama na utendaji kwa kutumia maarifa na mapendekezo ya FAQ

## Yaliyomo

- [Kuanzia](../../../resources)
- [Uthibitishaji & Upatikanaji](../../../resources)
- [Violezo & Miradi](../../../resources)
- [Usambazaji & Miundombinu](../../../resources)
- [Usanidi & Mazingira](../../../resources)
- [Ufumbuzi wa Matatizo](../../../resources)
- [Gharama & Malipo](../../../resources)
- [Mazoea Bora](../../../resources)
- [Mada za Juu](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) ni zana ya mstari wa amri inayomlenga mtengenezaji ambayo inaongeza kasi ya kupeleka programu yako kutoka kwenye mazingira ya maendeleo ya ndani hadi Azure. Inatoa mbinu bora kupitia violezo na husaidia katika mzunguko mzima wa uenezaji.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Chombo cha madhumuni ya jumla kwa kusimamia rasilimali za Azure
- **azd**: Chombo linalolenga watengenezaji kwa mtiririko wa kazi wa uenezaji wa programu
- azd hutumia Azure CLI ndani, lakini hutoa miundo ya ngazi ya juu kwa matukio ya kawaida ya maendeleo
- azd inajumuisha violezo, usimamizi wa mazingira, na uendeshaji wa uenezaji wa programu kwa njia ya kiotomatiki

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, azd inahitaji Azure CLI kwa uthibitishaji na baadhi ya shughuli. Weka Azure CLI kwanza, kisha weka azd.

### Q: What programming languages does azd support?
**A**: azd haitegemei lugha maalum. Inafanya kazi na:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Can I use azd with existing projects?
**A**: Yes! Unaweza ama:
1. Tumia `azd init` kuongeza usanidi wa azd kwenye miradi iliyopo
2. Rekebisha miradi iliyopo ili ifanane na muundo wa kiolezo cha azd
3. Tengeneza violezo vya kibinafsi vinavyoendana na usanifu wako uliopo

---

## Uthibitishaji & Upatikanaji

### Q: How do I authenticate with Azure using azd?
**A**: Tumia `azd auth login` itakayofungua dirisha la kivinjari kwa ajili ya uthibitishaji wa Azure. Kwa hali za CI/CD, tumia service principals au managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. Tumia `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` kubainisha ni usajili gani utakaotumika kwa kila mazingira.

### Q: What permissions do I need to deploy with azd?
**A**: Kawaida unahitaji:
- **Contributor** role kwenye resource group au subscription
- **User Access Administrator** ikiwa unafanyia uenezaji wa rasilimali zinazohitaji uteuzi wa nafasi
- Mvuto wa ruhusa maalum hutofautiana kulingana na kiolezo na rasilimali zinazotumika

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutely! azd imeundwa kwa ajili ya kuunganishwa na CI/CD. Tumia service principals kwa uthibitishaji na weka vigezo vya mazingira kwa usanidi.

### Q: How do I handle authentication in GitHub Actions?
**A**: Tumia Azure Login action pamoja na cheti za service principal:
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
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: GitHub search for "azd-template"
- Tumia `azd template list` kuvinjari violezo vinavyopatikana

### Q: How do I create a custom template?
**A**: 
1. Anza na muundo wa kiolezo kilicho tayari
2. Badilisha `azure.yaml`, faili za miundombinu, na msimbo wa programu
3. Jaribu kwa kina kwa kutumia `azd up`
4. Chapisha GitHub ukiweka lebo zinazofaa

### Q: Can I use azd without a template?
**A**: Yes, tumia `azd init` kwenye mradi uliopo kutengeneza faili muhimu za usanidi. Utahitaji kusanidi `azure.yaml` na faili za miundombinu kwa mkono.

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: Zinahifadhiwa na Microsoft, zinasasishwa mara kwa mara, na zina nyaraka kamili
- **Community templates**: Zinatengenezwa na waendelezaji, zinaweza kuwa na matumizi maalum, ubora na matengenezo yanatofautiana

### Q: How do I update a template in my project?
**A**: Violezo havisasishwi kiotomatiki. Unaweza:
1. Linganisha na kuunganisha mabadiliko kutoka kwa kiolezo cha chanzo kwa mkono
2. Anza upya kwa `azd init` ukitumia kiolezo kilichosasishwa
3. Chagua na kunakili maboresho maalum kutoka kwa violezo vilivyosasishwa

---

## Usambazaji & Miundombinu

### Q: What Azure services can azd deploy?
**A**: azd inaweza kupeleka huduma yoyote ya Azure kupitia Bicep/ARM templates, zikiwemo:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: Can I deploy to multiple regions?
**A**: Yes, sanidi maeneo mbalimbali katika Bicep templates zako na weka parameter ya location ipasavyo kwa kila mazingira.

### Q: How do I handle database schema migrations?
**A**: Tumia deployment hooks katika `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Yes, tumia `azd provision` kupeleka tu vipengele vya miundombinu vilivyofafanuliwa kwenye violezo vyako.

### Q: How do I deploy to existing Azure resources?
**A**: Hii ni ngumu na haiji kwa msaada wa moja kwa moja. Unaweza:
1. Ingiza rasilimali zilizopo katika Bicep templates zako
2. Tumia marejeleo ya rasilimali zilizopo katika templates
3. Badilisha templates ili kuunda au kurejelea rasilimali kwa masharti

### Q: Can I use Terraform instead of Bicep?
**A**: Kwa sasa, azd kwa msingi wake inaunga mkono Bicep/ARM templates. Msaada wa Terraform haujatangazwa rasmi, ingawa suluhisho za jumuiya zinaweza kuwepo.

---

## Usanidi & Mazingira

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Tengeneza mazingira tofauti kwa `azd env new <environment-name>` na sanidi mipangilio tofauti kwa kila moja:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Katika folda `.azure` ndani ya saraka ya mradi wako. Kila mazingira ina folda yake yenye faili za usanidi.

### Q: How do I set environment-specific configuration?
**A**: Tumia `azd env set` kusanidi vigezo vya mazingira:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: Folda `.azure` ina taarifa nyeti na haipendekezwi kuingizwa kwenye udhibiti wa toleo. Badala yake:
1. Andika vigezo vinavyohitajika vya mazingira
2. Tumia skripti za uenezaji kusaidia kuanzisha mazingira
3. Tumia Azure Key Vault kwa usanidi nyeti

### Q: How do I override template defaults?
**A**: Weka vigezo vya mazingira vinavyolingana na parameter za kiolezo:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Sababu za kawaida:
1. **Authentication issues**: Endesha `azd auth login`
2. **Insufficient permissions**: Angalia uteuzi wa nafasi zako za Azure
3. **Resource naming conflicts**: Badilisha AZURE_ENV_NAME
4. **Quota/capacity issues**: Angalia upatikanaji wa kikanda
5. **Template errors**: Thibitisha Bicep templates

### Q: How do I debug deployment failures?
**A**: 
1. Tumia `azd deploy --debug` kwa matokeo ya undani
2. Angalia historia ya uenezaji kwenye Azure portal
3. Kagua Activity Log kwenye Azure portal
4. Tumia `azd show` kuonyesha hali ya mazingira ya sasa

### Q: Why are my environment variables not working?
**A**: Angalia:
1. Majina ya vigezo yanalingana na parameter za kiolezo kwa usahihi
2. Thamani zimewekewa nukuu ipasavyo ikiwa zina nafasi
3. Mazingira yamechaguliwa: `azd env select <environment>`
4. Vigezo vimewekwa kwa mazingira sahihi

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Hii inafuta rasilimali zote na usanidi wa mazingira.

### Q: Why is my application not accessible after deployment?
**A**: Angalia:
1. Uenezaji ulimalizika kwa mafanikio
2. Programu inaendesha (angalia logi kwenye Azure portal)
3. Network security groups zinaruhusu trafiki
4. DNS/vikoa maalum vimewekwa ipasavyo

---

## Gharama & Malipo

### Q: How much will azd deployments cost?
**A**: Gharama zinategemea:
- Huduma za Azure zinazotumika
- Madaraja ya huduma/SKUs zilizochaguliwa
- Tofauti za bei kwa mikoa tofauti
- Mifumo ya matumizi

Tumia [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) kwa makisio.

### Q: How do I control costs in azd deployments?
**A**: 
1. Tumia SKUs za daraja la chini kwa mazingira ya maendeleo
2. Sanidi bajeti na arifa za Azure
3. Tumia `azd down` kuondoa rasilimali wakati hazihitajiki
4. Chagua mikoa inayofaa (gharama zinatofautiana kwa eneo)
5. Tumia zana za Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Huduma nyingi za Azure zinatoa tabaka za bure:
- App Service: Tier ya bure inapatikana
- Azure Functions: Utekelezaji 1M bure/mwezi
- Cosmos DB: Tier ya bure yenye 400 RU/s
- Application Insights: GB 5 za kwanza/mwezi bure

Sanidi violezo kutumia tabaka za bure pale zinazopatikana.

### Q: How do I estimate costs before deployment?
**A**: 
1. Kagua `main.bicep` ya kiolezo ili kuona rasilimali zitakazotengenezwa
2. Tumia Azure Pricing Calculator kwa SKUs maalum
3. Zindua kwenye mazingira ya maendeleo kwanza ili kufuatilia gharama halisi
4. Tumia Azure Cost Management kwa uchambuzi wa kina wa gharama

---

## Mazoea Bora

### Q: What are the best practices for azd project structure?
**A**: 
1. Weka msimbo wa programu tofauti na miundombinu
2. Tumia majina ya huduma yenye maana katika `azure.yaml`
3. Tekeleza utunzaji wa makosa unaofaa katika skripti za kujenga
4. Tumia usanidi maalum kwa mazingira
5. Jumuisha nyaraka kamili

### Q: How should I organize multiple services in azd?
**A**: Tumia muundo uliopendekezwa:
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
**A**: **Hapana!** Folda `.azure` ina taarifa nyeti. Iiweke kwenye `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Tumia Azure Key Vault kwa siri
2. Rejea siri za Key Vault kwenye usanidi wa programu
3. Usiwape siri kwenye udhibiti wa toleo
4. Tumia managed identities kwa uthibitishaji kati ya huduma

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Tumia mazingira tofauti kwa kila hatua (dev/staging/prod)
2. Tekeleza upimaji wa kiotomatiki kabla ya uenezaji
3. Tumia service principals kwa uthibitishaji
4. Hifadhi usanidi nyeti katika siri/vigezo vya pipeline
5. Tekeleza vizingiti vya idhini kwa uenezaji wa uzalishaji

---

## Mada za Juu

### Q: Can I extend azd with custom functionality?
**A**: Yes, kupitia deployment hooks katika `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Tumia amri za azd katika skripti za pipeline uliopo
2. Sanifisha violezo vya azd kwa timu zote
3. Unganisha na ufuatiliaji na arifa ulizopo
4. Tumia pato la JSON la azd kwa kuingiza kwenye pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd inafanya kazi na mfumo wowote wa CI/CD. Tengeneza pipelines za Azure DevOps zinazotumia amri za azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **chombo cha azd**: Changia kwenye [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Violezo**: Tengeneza violezo ukifuata [miongozo ya violezo](https://github.com/Azure-Samples/awesome-azd)
3. **Nyaraka**: Changia kwenye nyaraka katika [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Je, ramani ya maendeleo ya azd ni ipi?
**A**: Angalia the [ramani rasmi](https://github.com/Azure/azure-dev/projects) kwa sifa zilizo pangwa na maboresho.

### Q: Ninawezaje kuhama kutoka kwa zana nyingine za utekelezaji kwenda azd?
**A**: 
1. Chambua usanifu wa utekelezaji uliopo
2. Unda violezo vya Bicep vinavyofanana
3. Sanidi `azure.yaml` ili ifanane na huduma zilizopo
4. Jaribu kwa kina katika mazingira ya maendeleo
5. Hamisha mazingira polepole

---

## Je, bado una maswali?

### **Tafuta Kwanza**
- Angalia [nyaraka rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tafuta [masuala ya GitHub](https://github.com/Azure/azure-dev/issues) kwa matatizo yanayofanana

### **Pata Msaada**
- [Majadiliano ya GitHub](https://github.com/Azure/azure-dev/discussions) - Msaada wa jamii
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Maswali ya kiufundi
- [Azure Discord](https://discord.gg/azure) - Chati ya jamii kwa wakati halisi

### **Ripoti Masuala**
- [Masuala ya GitHub](https://github.com/Azure/azure-dev/issues/new) - Ripoti za mende na maombi ya vipengele
- Jumuisha logi zinazohusiana, ujumbe za makosa, na hatua za kuiga tatizo

### **Jifunze Zaidi**
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*FAQ hii inasasishwa mara kwa mara. Imesasishwa: 9 Septemba 2025*

---

**Urambazaji**
- **Somo lililopita**: [Kamusi](glossary.md)
- **Somo lijalo**: [Mwongozo wa Masomo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka asilia katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tunapendekeza kutumia tafsiri ya kitaalamu ya binadamu. Hatutawajibika kwa kutokuelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
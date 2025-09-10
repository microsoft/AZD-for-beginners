<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:06:55+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Kujifunza - AZD Kwa Anayeanza

## Utangulizi

Mwongozo huu wa kina wa kujifunza unatoa malengo ya kujifunza yaliyojipanga, dhana kuu, mazoezi ya vitendo, na vifaa vya tathmini ili kukusaidia kumudu Azure Developer CLI (azd). Tumia mwongozo huu kufuatilia maendeleo yako na kuhakikisha umeshughulikia mada zote muhimu.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu wa kujifunza, utaweza:
- Kumudu dhana zote za msingi na za juu za Azure Developer CLI
- Kuendeleza ujuzi wa vitendo katika kupeleka na kusimamia programu za Azure
- Kujenga ujasiri katika kutatua matatizo na kuboresha mchakato wa kupeleka
- Kuelewa mbinu za kupeleka zinazofaa kwa uzalishaji na masuala ya usalama

## Matokeo ya Kujifunza

Baada ya kukamilisha sehemu zote za mwongozo huu wa kujifunza, utaweza:
- Kubuni, kupeleka, na kusimamia usanifu kamili wa programu kwa kutumia azd
- Kutekeleza mikakati ya ufuatiliaji, usalama, na uboreshaji wa gharama
- Kutatua matatizo magumu ya mchakato wa kupeleka kwa kujitegemea
- Kuunda templeti maalum na kuchangia kwa jamii ya azd

## Muundo wa Kozi

### Moduli ya 1: Kuanza (Wiki ya 1-2)

#### Malengo ya Kujifunza
- Kuelewa misingi ya Azure Developer CLI na dhana kuu
- Kufanikiwa kusakinisha na kusanidi azd kwenye mazingira yako ya maendeleo
- Kukamilisha mchakato wako wa kwanza wa kupeleka kwa kutumia templeti iliyopo
- Kupitia muundo wa mradi wa azd na kuelewa vipengele muhimu

#### Dhana Kuu za Kumudu
- Templeti, mazingira, na huduma
- Muundo wa usanidi wa azure.yaml
- Amri za msingi za azd (init, up, down, deploy)
- Kanuni za Miundombinu kama Nambari
- Uthibitishaji na idhini ya Azure

#### Mazoezi ya Vitendo

**Zoezi 1.1: Usakinishaji na Usanidi**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Zoezi 1.2: Upelekwaji wa Kwanza**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Zoezi 1.3: Uchambuzi wa Muundo wa Mradi**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Maswali ya Kujitathmini
1. Ni dhana zipi tatu kuu za usanifu wa azd?
2. Nini madhumuni ya faili ya azure.yaml?
3. Mazingira yanasaidiaje kusimamia malengo tofauti ya kupeleka?
4. Ni mbinu zipi za uthibitishaji zinazoweza kutumika na azd?
5. Nini hutokea unapotekeleza `azd up` kwa mara ya kwanza?

### Moduli ya 2: Usanidi na Mazingira (Wiki ya 3)

#### Malengo ya Kujifunza
- Kumudu usimamizi wa mazingira na usanidi
- Kuelewa usanidi wa hali ya juu wa azure.yaml
- Kutekeleza mipangilio na vigezo maalum vya mazingira
- Kusimamia uthibitishaji kwa hali tofauti

#### Dhana Kuu za Kumudu
- Hierarkia ya mazingira na kipaumbele cha vigezo
- Usanidi wa huduma na vigezo
- Vifungo na matukio ya mzunguko wa maisha
- Mbinu za uthibitishaji (mtumiaji, service principal, managed identity)
- Usimamizi wa faili za usanidi

#### Mazoezi ya Vitendo

**Zoezi 2.1: Usanidi wa Mazingira Mengi**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Zoezi 2.2: Usanidi wa Hali ya Juu**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Zoezi 2.3: Usanidi wa Usalama**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Maswali ya Kujitathmini
1. Azd inashughulikaje kipaumbele cha vigezo vya mazingira?
2. Vifungo vya kupeleka ni nini na unapaswa kuvitumia lini?
3. Unasanidi vipi SKUs tofauti kwa mazingira tofauti?
4. Ni athari gani za usalama za mbinu tofauti za uthibitishaji?
5. Unasimamiaje siri na data nyeti ya usanidi?

### Moduli ya 3: Upelekwaji na Utoaji (Wiki ya 4)

#### Malengo ya Kujifunza
- Kumudu mchakato wa kupeleka na mbinu bora
- Kuelewa Miundombinu kama Nambari kwa kutumia templeti za Bicep
- Kutekeleza usanifu wa huduma nyingi wenye ugumu
- Kuboresha utendaji na uaminifu wa mchakato wa kupeleka

#### Dhana Kuu za Kumudu
- Muundo wa templeti za Bicep na moduli
- Utegemezi wa rasilimali na mpangilio
- Mikakati ya kupeleka (blue-green, rolling updates)
- Upelekwaji wa maeneo mengi
- Uhamishaji wa hifadhidata na usimamizi wa data

#### Mazoezi ya Vitendo

**Zoezi 3.1: Miundombinu Maalum**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Zoezi 3.2: Programu ya Huduma Nyingi**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Zoezi 3.3: Ushirikiano wa Hifadhidata**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Maswali ya Kujitathmini
1. Ni faida gani za kutumia Bicep badala ya templeti za ARM?
2. Unashughulikaje uhamishaji wa hifadhidata katika mchakato wa kupeleka wa azd?
3. Ni mikakati gani ipo kwa upelekwaji bila muda wa kupumzika?
4. Unasimamiaje utegemezi kati ya huduma?
5. Ni mambo gani ya kuzingatia kwa upelekwaji wa maeneo mengi?

### Moduli ya 4: Uthibitishaji Kabla ya Upelekwaji (Wiki ya 5)

#### Malengo ya Kujifunza
- Kutekeleza ukaguzi wa kina kabla ya kupeleka
- Kumudu upangaji wa uwezo na uthibitishaji wa rasilimali
- Kuelewa uteuzi wa SKU na uboreshaji wa gharama
- Kujenga mifumo ya uthibitishaji ya kiotomatiki

#### Dhana Kuu za Kumudu
- Vikomo na viwango vya rasilimali za Azure
- Vigezo vya uteuzi wa SKU na athari za gharama
- Scripti na zana za uthibitishaji wa kiotomatiki
- Mbinu za upangaji wa uwezo
- Upimaji wa utendaji na uboreshaji

#### Mazoezi ya Vitendo

**Zoezi 4.1: Upangaji wa Uwezo**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Zoezi 4.2: Uthibitishaji Kabla ya Kupeleka**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Zoezi 4.3: Uboreshaji wa SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Maswali ya Kujitathmini
1. Ni mambo gani yanapaswa kuathiri maamuzi ya uteuzi wa SKU?
2. Unathibitishaje upatikanaji wa rasilimali za Azure kabla ya kupeleka?
3. Ni vipengele gani muhimu vya mfumo wa ukaguzi kabla ya kupeleka?
4. Unakadiriaje na kudhibiti gharama za kupeleka?
5. Ni ufuatiliaji gani muhimu kwa upangaji wa uwezo?

### Moduli ya 5: Utatuzi wa Matatizo na Urekebishaji (Wiki ya 6)

#### Malengo ya Kujifunza
- Kumudu mbinu za utatuzi wa matatizo kwa utaratibu
- Kuendeleza utaalamu wa kurekebisha matatizo magumu ya kupeleka
- Kutekeleza ufuatiliaji na tahadhari za kina
- Kujenga taratibu za kukabiliana na matukio na urejeshaji

#### Dhana Kuu za Kumudu
- Mifumo ya kawaida ya kushindwa kwa mchakato wa kupeleka
- Mbinu za uchambuzi wa kumbukumbu na uhusiano
- Ufuatiliaji wa utendaji na uboreshaji
- Kugundua matukio ya usalama na kukabiliana nayo
- Urejeshaji wa maafa na mwendelezo wa biashara

#### Mazoezi ya Vitendo

**Zoezi 5.1: Matukio ya Utatuzi wa Matatizo**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Zoezi 5.2: Utekelezaji wa Ufuatiliaji**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Zoezi 5.3: Kukabiliana na Matukio**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Maswali ya Kujitathmini
1. Ni mbinu gani ya utaratibu ya kutatua matatizo ya mchakato wa kupeleka wa azd?
2. Unahusishaje kumbukumbu kati ya huduma na rasilimali nyingi?
3. Ni vipimo gani vya ufuatiliaji vinavyohitajika kwa kugundua matatizo mapema?
4. Unatekelezaje taratibu bora za urejeshaji wa maafa?
5. Ni vipengele gani muhimu vya mpango wa kukabiliana na matukio?

### Moduli ya 6: Mada za Juu na Mbinu Bora (Wiki ya 7-8)

#### Malengo ya Kujifunza
- Kutekeleza mifumo ya kupeleka ya kiwango cha biashara
- Kumudu ujumuishaji wa CI/CD na kiotomatiki
- Kuendeleza templeti maalum na kuchangia kwa jamii
- Kuelewa mahitaji ya juu ya usalama na uzingatiaji

#### Dhana Kuu za Kumudu
- Mifumo ya ujumuishaji wa CI/CD
- Uendelezaji na usambazaji wa templeti maalum
- Usimamizi wa biashara na uzingatiaji
- Usanidi wa mitandao na usalama wa hali ya juu
- Uboreshaji wa utendaji na usimamizi wa gharama

#### Mazoezi ya Vitendo

**Zoezi 6.1: Ujumuishaji wa CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Zoezi 6.2: Uendelezaji wa Templeti Maalum**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Zoezi 6.3: Utekelezaji wa Biashara**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Maswali ya Kujitathmini
1. Unajumuishaje azd katika mifumo ya CI/CD iliyopo?
2. Ni mambo gani muhimu ya kuzingatia katika uendelezaji wa templeti maalum?
3. Unatekelezaje usimamizi na uzingatiaji katika mchakato wa kupeleka wa azd?
4. Ni mbinu bora za kupeleka kwa kiwango cha biashara?
5. Unachangiaje kwa ufanisi kwa jamii ya azd?

## Miradi ya Vitendo

### Mradi 1: Tovuti ya Wasifu wa Kibinafsi
**Ugumu**: Anayeanza  
**Muda**: Wiki 1-2

Jenga na peleka tovuti ya wasifu wa kibinafsi kwa kutumia:
- Ukaribishaji wa tovuti tuli kwenye Azure Storage
- Usanidi wa kikoa maalum
- Ujumuishaji wa CDN kwa utendaji wa kimataifa
- Mfumo wa kupeleka kiotomatiki

**Matokeo**:
- Tovuti inayofanya kazi iliyopelekwa kwenye Azure
- Templeti maalum ya azd kwa upelekwaji wa wasifu
- Nyaraka za mchakato wa kupeleka
- Mapendekezo ya uboreshaji wa gharama

### Mradi 2: Programu ya Usimamizi wa Kazi
**Ugumu**: Kati  
**Muda**: Wiki 2-3

Unda programu kamili ya usimamizi wa kazi yenye:
- Upande wa mbele wa React uliowekwa kwenye App Service
- API ya Node.js yenye uthibitishaji
- Hifadhidata ya PostgreSQL yenye uhamishaji
- Ufuatiliaji wa Application Insights

**Matokeo**:
- Programu kamili yenye uthibitishaji wa mtumiaji
- Muundo wa hifadhidata na scripti za uhamishaji
- Dashibodi za ufuatiliaji na sheria za tahadhari
- Usanidi wa kupeleka kwa mazingira mengi

### Mradi 3: Jukwaa la Biashara Mtandaoni la Huduma Nyingi
**Ugumu**: Juu  
**Muda**: Wiki 4-6

Buni na utekeleze jukwaa la biashara mtandaoni lenye huduma nyingi:
- Huduma nyingi za API (katalogi, maagizo, malipo, watumiaji)
- Ujumuishaji wa foleni ya ujumbe na Service Bus
- Cache ya Redis kwa uboreshaji wa utendaji
- Ufuatiliaji na kumbukumbu za kina

**Matokeo**:
- Usanifu kamili wa huduma nyingi
- Mifumo ya mawasiliano kati ya huduma
- Upimaji wa utendaji na uboreshaji
- Utekelezaji wa usalama wa kiwango cha uzalishaji

## Tathmini na Vyeti

### Ukaguzi wa Maarifa

Kamilisha tathmini hizi baada ya kila moduli:

**Tathmini ya Moduli ya 1**: Dhana za msingi na usakinishaji
- Maswali ya chaguo nyingi kuhusu dhana kuu
- Kazi za vitendo za usakinishaji na usanidi
- Zoezi rahisi la kupeleka

**Tathmini ya Moduli ya 2**: Usanidi na mazingira
- Matukio ya usimamizi wa mazingira
- Mazoezi ya kutatua matatizo ya usanidi
- Utekelezaji wa usanidi wa usalama

**Tathmini ya Moduli ya 3**: Upelekwaji na utoaji
- Changamoto za muundo wa miundombinu
- Matukio ya kupeleka huduma nyingi
- Mazoezi ya uboreshaji wa utendaji

**Tathmini ya Moduli ya 4**: Uthibitishaji kabla ya kupeleka
- Uchunguzi wa upangaji wa uwezo
- Matukio ya uboreshaji wa gharama
- Utekelezaji wa mifumo ya ukaguzi

**Tathmini ya Moduli ya 5**: Utatuzi wa matatizo na urekebishaji
- Mazoezi ya utambuzi wa matatizo
- Kazi za utekelezaji wa ufuatiliaji
- Simulizi za kukabiliana na matukio

**Tathmini ya Moduli ya 6**: Mada za juu
- Muundo wa mifumo ya CI/CD
- Uendelezaji wa templeti maalum
- Matukio ya usanifu wa biashara

### Mradi wa Mwisho wa Capstone

Buni na utekeleze suluhisho kamili linaloonyesha umahiri wa dhana zote:

**Mahitaji**:
- Usanifu wa programu ya viwango vingi
- Mazingira mengi ya kupeleka
- Ufuatiliaji na tahadhari za kina
- Utekelezaji wa usalama na uzingatiaji
- Uboreshaji wa gharama na utendaji
- Nyaraka kamili na vitabu vya mwongozo

**Vigezo vya Tathmini**:
- Ubora wa utekelezaji wa kiufundi
- Ukamilifu wa nyaraka
- Uzingatiaji wa usalama na mbinu bora
- Uboreshaji wa utendaji na gharama
- Ufanisi wa utatuzi wa matatizo na ufuatiliaji

## Rasilimali za Kujifunza na Marejeleo

### Nyaraka Rasmi
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Rasilimali za Jamii
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Mazingira ya Mazoezi
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Zana za Ziada
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mapendekezo ya Ratiba ya Kujifunza

### Kujifunza kwa Wakati Wote (Wiki 8)
- **Wiki ya 1-2**: Moduli ya 1-2 (Kuanza, Usanidi)
- **Wiki ya 3-4**: Moduli ya 3-4 (Upelekwaji, Uthibitishaji Kabla ya Kupeleka)
- **Wiki ya 5-6**: Moduli ya 5-6 (Utatuzi wa Matatizo, Mada za Juu)
- **Wiki ya 7-8**: Miradi ya Vitendo na Tathmini ya Mwisho

### Kujifunza kwa Wakati wa Nusu (Wiki 16)
- **Wiki ya 1-4**: Moduli ya 1 (Kuanza)
- **Wiki ya 5-7**: Moduli ya 2 (Usanidi na Mazingira)
- **Wiki ya 8-10**: Moduli ya 3 (Upelekwaji na Utoaji)
- **Wiki ya 11-12**: Moduli ya 4 (Uthibitishaji Kabla ya Kupeleka)
- **Wiki ya 13-14**: Moduli ya 
3. **Changia kwenye Chanzo Huria**: Shiriki templeti zako na suluhisho zako na jamii  
4. **Fundisha Wengine**: Kuelezea dhana kwa wengine kunaimarisha uelewa wako mwenyewe  
5. **Endelea Kuwa na Shauku**: Endelea kuchunguza huduma mpya za Azure na mifumo ya muunganisho  

---

**Urambazaji**  
- **Somo la Awali**: [FAQ](faq.md)  
- **Somo Linalofuata**: [Changelog](../changelog.md)  

**Ufuatiliaji wa Maendeleo ya Kujifunza**: Tumia mwongozo huu kufuatilia safari yako ya kujifunza na kuhakikisha umekamilisha kwa kina dhana na mazoea yote ya Azure Developer CLI.  

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia huduma ya tafsiri ya kitaalamu ya binadamu. Hatutawajibika kwa maelewano mabaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
# Maswali Yanayoulizwa Mara kwa Mara (FAQ)

**Pata Msaada kwa Sura**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **🚆 Masuala ya Usanidi**: [Sura 1: Ufungaji na Usanidi](../docs/chapter-01-foundation/installation.md)
- **🤖 Maswali ya AI**: [Sura 2: Maendeleo ya AI-Kwanza](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Utatuzi wa Matatizo**: [Sura 7: Utatuzi wa Matatizo & Udhibiti wa Hitilafu](../docs/chapter-07-troubleshooting/common-issues.md)

## Utangulizi

FAQ hii ya kina inatoa majibu kwa maswali yanayoulizwa mara kwa mara kuhusu Azure Developer CLI (azd) na usambazaji wa Azure. Pata suluhisho za haraka kwa matatizo ya kawaida, elewa mbinu bora, na pata ufafanuzi juu ya dhana na mchakato wa azd.

## Malengo ya Kujifunza

Kwa kupitia FAQ hii, utakuwa na uwezo wa:
- Kupata majibu ya haraka kwa maswali na matatizo ya kawaida ya Azure Developer CLI
- Kuelewa dhana muhimu na istilahi kupitia muundo wa maswali na majibu ya vitendo
- Kupata suluhisho za utatuzi wa matatizo ya mara kwa mara na hali za makosa
- Kujifunza mbinu bora kupitia maswali yanayoulizwa sana kuhusu uboreshaji
- Kugundua vipengele na uwezo wa hali ya juu kupitia maswali ya kiwango cha mtaalamu
- Kufikia mwongozo wa gharama, usalama, na mbinu za usambazaji kwa ufanisi

## Matokeo ya Kujifunza

Ukiendelea kurejea FAQ hii, utaweza:
- Kutatua matatizo ya kawaida ya Azure Developer CLI kwa kujitegemea kwa kutumia suluhisho zilizotolewa
- Kufanya maamuzi sahihi kuhusu mbinu za usambazaji na usanidi
- Kuelewa uhusiano kati ya azd na zana na huduma nyingine za Azure
- Kutekeleza mbinu bora kwa msingi wa uzoefu wa jamii na mapendekezo ya wataalamu
- Kutatua matatizo ya uthibitishaji, usambazaji, na usanidi kwa ufanisi
- Kuboresha gharama na utendaji kwa kutumia maarifa na mapendekezo ya FAQ

## Jedwali la Yaliyomo

- [Kuanza](#getting-started)
- [Uthibitishaji & Upatikanaji](#authentication--access)
- [Mifano & Miradi](#templates--projects)
- [Usambazaji & Miundombinu](#deployment--infrastructure)
- [Usanidi & Mazingira](#configuration--environments)
- [Utatuzi wa Matatizo](#troubleshooting)
- [Gharama & Malipo](#cost--billing)
- [Mbinu Bora](#best-practices)
- [Mada za Juu](#advanced-topics)

---

## Kuanza

### S: Azure Developer CLI (azd) ni nini?
**J**: Azure Developer CLI (azd) ni chombo cha mstari wa amri kilicholenga waendelezaji ambacho huchochea muda unaochukua kupeleka programu yako kutoka kwenye mazingira ya maendeleo ya ndani hadi Azure. Kinatoa mbinu bora kupitia mifano na husaidia katika mzunguko mzima wa usambazaji.

### S: azd inatofautianaje na Azure CLI?
**J**: 
- **Azure CLI**: Zana ya matumizi ya jumla kwa kusimamia rasilimali za Azure
- **azd**: Zana inayolenga waendelezaji kwa mchakato wa usambazaji wa programu
- azd ina mchakato wake wa uthibitishaji na usambazaji; Azure CLI ni zana tofauti, ya kuongeza
- azd inajumuisha mifano, usimamizi wa mazingira, na ut automatizishaji wa usambazaji

### S: Je, ninahitaji Azure CLI kufunga ili kutumia azd?
**J**: Sio kwa mchakato mkuu wa AZD. Thibitisha kwa `azd auth login`. Sakinisha Azure CLI tofauti wakati kiungo cha mfano au zoezi linapotekeleza amri za `az` kwa uwazi.

### S: azd inaunga mkono lugha gani za programu?
**J**: azd haina mwelekeo wa lugha maalum. Inafanya kazi na:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Tovuti za kudumu
- Programu zilizo ndani ya kontena

### S: Je, naweza kutumia azd na miradi iliyopo?
**J**: Ndiyo! Unaweza:
1. Tumia `azd init` kuongeza usanidi wa azd kwa miradi iliyopo
2. Badilisha miradi iliyopo ili ifuatane na muundo wa mfano wa azd
3. Unda mifano maalum kulingana na usanifu wako uliopo

---

## Uthibitishaji & Upatikanaji

### S: Ninawezaje kuthibitisha na Azure kutumia azd?
**J**: Tumia `azd auth login` ambayo itafungua dirisha la kivinjari kwa uthibitishaji wa Azure. Kwa hali za CI/CD, tumia service principals au managed identities.

### S: Je, naweza kutumia azd na usajili mwingi wa Azure?
**J**: Ndiyo. Tumia `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` kuweka usajili gani utumike kwa kila mazingira.

### S: Nahitaji ruhusa gani kuwasambaza kwa azd?
**J**: Kawaida unahitaji:
- Nafasi ya **Contributor** kwenye kundi la rasilimali au usajili
- Nafasi ya **User Access Administrator** ikiwa unasambaza rasilimali zinazohitaji utekelezaji wa nafasi
- Ruhusa maalum zinatofautiana kulingana na mfano na rasilimali zinazosambazwa

### S: Je, naweza kutumia azd katika mishale ya CI/CD?
**J**: Kabisa! azd imeundwa kwa muunganisho wa CI/CD. Tumia service principals kwa uthibitishaji na weka vigezo vya mazingira kwa usanidi.

### S: Ninawezaje kushughulikia uthibitishaji katika GitHub Actions?
**J**: Pendelea ushirikiano wa utambulisho wa mizigo (OIDC), umewekwa na `azd pipeline config`. Mchakato ulioundwa husakinisha AZD na kuthibitisha AZD moja kwa moja na utambulisho wa ushirikiano. Hatua ya `azure/login` pekee haitiunde kiingilio cha AZD. Hatua ya kuingia ndani ya kazi iliyopo ni:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Toa au sambaza baada ya kuingia, na mazingira ya AZD yaliyokusudiwa, usajili, na eneo vimewekwa. Cheti cha ushirikiano cha utambulisho kinapaswa kuamini hifadhidata/kiashiria cha mchakato wa kazi au mazingira ya GitHub, na nafasi za Azure zinapaswa kuruhusu shughuli zinazohitajika.

---

## Mifano & Miradi

### S: Ninawezaje kupata mifano ya azd?
**J**: 
- Mifano rasmi na ya jamii: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Mifano ya jamii: Tafuta GitHub kwa "azd-template"
- Tumia `azd template list` kuvinjari mifano inayopatikana

### S: Ninawezaje kuunda mfano maalum?
**J**: 
1. Anza na muundo wa mfano uliopo
2. Badilisha `azure.yaml`, faili za miundombinu, na msimbo wa programu
3. Jaribu kwa kina na `azd up`
4. Chapisha GitHub na lebo zinazofaa

### S: Je, naweza kutumia azd bila mfano?
**J**: Ndiyo, tumia `azd init` katika mradi uliopo kuunda faili za usanidi zinazohitajika. Utahitaji kusanidi kwa mkono `azure.yaml` na faili za miundombinu.

### S: Tofauti kati ya mifano rasmi na ya jamii ni nini?
**J**: 
- **Mifano rasmi**: Inasimamiwa na Microsoft, inasasishwa mara kwa mara, na ina nyaraka kamili
- **Mifano ya jamii**: Imetengenezwa na waendelezaji, inaweza kuwa na matumizi maalum, ubora na usimamizi hutofautiana

### S: Ninawezaje kusasisha mfano kwenye mradi wangu?
**J**: Mifano haisasishwi moja kwa moja. Unaweza:
1. Linganisha na kuunganisha mabadiliko kutoka kwa mfano wa chanzo kwa mkono
2. Anza upya na `azd init` ukitumia mfano uliosasishwa
3. Chagua maboresho maalum kutoka kwa mifano iliyosasishwa

---

## Usambazaji & Miundombinu

### S: Huduma gani za Azure azd inaweza kusambaza?
**J**: azd inaweza kusambaza huduma yoyote ya Azure kupitia mifano ya Bicep/ARM, zikiwemo:
- Huduma za Programu, Programu za Kontena, Functions
- Hifadhidata (SQL, PostgreSQL, Cosmos DB)
- Hifadhi, Key Vault, Application Insights
- Mtandao, usalama, na rasilimali za ufuatiliaji

### S: Je, naweza kusambaza kwa mikoa mingi?
**J**: Ndiyo, sanidi mikoa mingi katika mifano yako ya Bicep na kuweka parameter ya eneo ipasavyo kwa kila mazingira.

### S: Ninawezaje kushughulikia uhamaji wa muundo wa hifadhidata?
**J**: Tumia hooks za usambazaji katika `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Je, naweza kusambaza miundombinu tu bila programu?
**J**: Ndiyo, tumia `azd provision` kusambaza sehemu za miundombinu tu zilizobainishwa katika mifano yako.

### S: Ninawezaje kusambaza kwa rasilimali zilizopo za Azure?
**J**: Ndiyo, wakati mfano unakiunga mkono. Rejelea rasilimali zilizopo na tamko za Bicep za `existing` au parameta za mfano za rasilimali zilizopo, na panga huduma za programu kwa malengo yao yaliyokusudiwa. Hii haisafirishi umiliki wala kuunda ruhusa zilizokosekana moja kwa moja. Kagua mfano kabla ya kusambaza.

### S: Je, naweza kutumia Terraform badala ya Bicep?
**J**: Ndiyo. AZD inaunga mkono Terraform pamoja na Bicep. Chagua mfano wa msingi wa Terraform au sanidi `infra.provider: terraform` ndani ya `azure.yaml`, pamoja na faili za Terraform na usanidi wa hali/nyuma. Angalia [mchakato wa Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Usanidi & Mazingira

### S: Ninawezaje kusimamia mazingira tofauti (dev, staging, prod)?
**J**: Unda mazingira tofauti kwa `azd env new <environment-name>` na usanidi mipangilio tofauti kwa kila moja:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Usanidi wa mazingira huhifadhiwa wapi?
**J**: Katika folda ya `.azure` ndani ya saraka ya mradi wako. Kila mazingira yana folda yake yenye faili za usanidi.

### S: Ninawezaje kuweka usanidi maalum wa mazingira?
**J**: Tumia `azd env set` kuweka vigezo vya mazingira:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Je, naweza kushirikiana usanidi wa mazingira kwa wanachama wa timu?
**J**: Folda ya `.azure` ina taarifa nyeti na haipaswi kuwekwa kwenye udhibiti wa toleo. Badala yake:
1. Andika mahitaji ya vigezo vya mazingira
2. Tumia skiripti za usambazaji kufunga mazingira
3. Tumia Azure Key Vault kwa usanidi wa siri

### S: Ninavyoweza kuvunja chaguo za msingi za mfano?
**J**: Weka vigezo vya mazingira vinavyolingana na parameta za mfano:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Vigezo vinavyotumiwa na mfano tu ndivyo huathiri usambazaji. `SKU_NAME` hapo juu ni mfano wa ingizo maalum, si usanidi wa jumla wa AZD.

---

## Utatuzi wa Matatizo

### S: Kwa nini `azd up` inashindwa?
**J**: Sababu za kawaida:
1. **Matatizo ya uthibitishaji**: Endesha `azd auth login`
2. **Ruhusa zisizotosheleza**: Angalia utekelezaji wa nafasi zako za Azure
3. **Migongano ya majina ya rasilimali**: Kagua rasilimali inayoingiliana na ingizo la majina la mfano; unda mazingira tofauti kwa `azd env new` wakati upweke unahitajika
4. **Matatizo ya uwezo/kipaumbele**: Angalia upatikanaji wa kanda
5. **Makosa ya mfano**: Hakiki mifano ya Bicep

### S: Ninawezaje kutatua hitilafu za usambazaji?
**J**: 
1. Tumia `azd deploy --debug` kwa maelezo ya kina
2. Angalia historia ya usambazaji kwenye lango la Azure
3. Pitia Kumbukumbu ya Shughuli kwenye lango la Azure
4. Tumia `azd show` kuonyesha hali ya sasa ya mazingira

### S: Kwa nini vigezo vya mazingira havifanyi kazi?
**J**: Angalia:
1. Majina ya vigezo yanalingana kikamilifu na parameta za mfano
2. Thamani zimewekewa nukuu ipasavyo kama zina nafasi
3. Mazingira yamechaguliwa: `azd env select <environment>`
4. Vigezo vimewekwa kwenye mazingira sahihi

### S: Ninawezaje kusafisha usambazaji uliofeli?
**J**: 
```bash
azd down
```
Kagua kwanza mazingira yaliyoteuliwa na uthibitisho wa ufutaji. Hii hufuta rasilimali za Azure zilizotolewa, sio usanidi wa mazingira ya ndani wa `.azure`. `--purge` pia huomba ufutaji wa kudumu wa rasilimali zilizo wazi kutoka kwa "soft-delete" zinazoungwa mkono na inaweza kuzuiwa na ulinzi wa kuhifadhi/kufuta; hii si hatua ya kawaida ya urejeshaji.

### S: Kwa nini programu yangu haiwezi kufikiwa baada ya usambazaji?
**J**: Angalia:
1. Usambazaji umekamilika kwa mafanikio
2. Programu inaendeshwa (tazama kumbukumbu langoni Azure)
3. Vikundi vya usalama wa mtandao vina ruhusa za trafiki
4. DNS/majina ya desturi yamewekwa ipasavyo

---

## Gharama & Malipo

### S: Usambazaji wa azd utagharimu kiasi gani?
**J**: Gharama zinategemea:
- Huduma za Azure zinazotolewa
- Viwango vya huduma/SKU zilizochaguliwa
- Tofauti za bei kwa mikoa
- Mifumo ya matumizi

Tumia [Kipimo cha Bei cha Azure](https://azure.microsoft.com/pricing/calculator/) kwa makadirio.

### S: Ninawezaje kudhibiti gharama katika usambazaji wa azd?
**J**: 
1. Tumia SKU za ngazi ya chini kwa mazingira ya maendeleo
2. Sanidi bajeti na arifa za Azure
3. Tumia `azd down` kuondoa rasilimali usizohitaji
4. Chagua mikoa inayofaa (gharama zinatofautiana kwa maeneo)
5. Tumia zana za Usimamizi wa Gharama za Azure

### S: Je, kuna chaguzi za ngazi ya bure kwa mifano ya azd?
**J**: Huduma zingine zina SKU za bure au ruzuku za kila mwezi, zikiwekwa chini ya sifa, mpango wa huduma, kanda, na vizingiti vya usajili. Hizi hazifanyi mfano mzima kuwa bure: hifadhidata, utafutaji, mtandao, rejista, telemetry, na uchanganuzi wa mfano vinaweza kusababisha gharama kwa kujitegemea. Angalia [orodha ya huduma za bure za Azure](https://azure.microsoft.com/free/) na bei za sasa kabla ya usambazaji wa kila rasilimali.

### S: Ninawezaje kukadiria gharama kabla ya usambazaji?
**J**: 
1. Kagua `main.bicep` ya mfano kuona rasilimali zinazotengenezwa
2. Tumia Azure Pricing Calculator na SKU maalum
3. Sambaza katika mazingira ya maendeleo kwanza kufuatilia gharama halisi
4. Tumia Azure Cost Management kwa uchambuzi wa kina wa gharama

---

## Mbinu Bora

### S: Ni mbinu gani bora za muundo wa mradi wa azd?
**J**: 
1. Hifadhi msimbo wa programu tofauti na miundombinu
2. Tumia majina yenye maana kwa huduma katika `azure.yaml`
3. Tekeleza utambuzi mzuri wa makosa katika skiripti za kujenga
4. Tumia usanidi maalum wa mazingira
5. Jumuisha nyaraka kamili

### S: Ninavyopaswa kupanga huduma nyingi katika azd?
**J**: Tumia muundo unaopendekezwa:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### S: Je, nifanye nini kuhusu folda ya `.azure` katika udhibiti wa toleo?
**J**: **Hapana!** Folda ya `.azure` ina taarifa nyeti. Idaftari kwenye `.gitignore`:
```gitignore
.azure/
```

### S: Ninawezaje kushughulikia siri na usanidi nyeti?
**J**: 
1. Tumia Azure Key Vault kwa siri
2. Rejelea siri za Key Vault katika usanidi wa programu
3. Usifanye commit kwa siri kwenye udhibiti wa toleo
4. Tumia utambulisho ulioendeshwa kwa uthibitishaji kati ya huduma

### S: Ni njia gani inayopendekezwa kwa CI/CD na azd?
**J**: 
1. Tumia mazingira tofauti kwa kila hatua (dev/staging/prod)
2. Tekeleza upimaji wa moja kwa moja kabla ya usambazaji
3. Tumia wakala wa huduma kwa uthibitishaji
4. Hifadhi usanidi nyeti katika siri/variables za pipeline
5. Tekeleza malango ya idhini kwa usambazaji wa uzalishaji

---

## Mada Zinazoendelea

### S: Ninaweza kuongeza azd na utendakazi wa kawaida?
**J**: Ndiyo, kupitia hooks za usambazaji katika `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Ninawezaje kuingiza azd na michakato ya sasa ya DevOps?
**J**: 
1. Tumia amri za azd katika scripts zilizopo za pipeline
2. Wezesha mfano wa azd kwa timu zote
3. Unganisha na ufuatiliaji na tahadhari zilizopo
4. Tumia toleo la JSON la azd kwa ujumuishaji wa pipeline

### S: Je, naweza kutumia azd na Azure DevOps?
**J**: Ndiyo, azd hufanya kazi na mfumo wowote wa CI/CD. Tengeneza pipelines za Azure DevOps zinazotumia amri za azd.

### S: Ninawezaje kuchangia azd au kutengeneza kiolezo cha jumuiya?
**J**: 
1. **zana ya azd**: Changia katika [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Violezo**: Fuata [maelekezo ya mchango katika maktaba ya Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Nyaraka**: Changia katika nyaraka za [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Ratiba ya azd ni ipi?
**J**: Angalia [ratiba rasmi](https://github.com/Azure/azure-dev/projects) kwa vipengele na maboresho yaliyopangwa.

### S: Ninawezaje kuhamia kutoka zana nyingine za usambazaji kwenda azd?
**J**: 
1. Chunguza usanifu wa sasa wa usambazaji
2. Tengeneza violezo sawa vya Bicep
3. Sanidi `azure.yaml` ili iendane na huduma za sasa
4. Jaribu kwa kina katika mazingira ya maendeleo
5. Hamisha mazingira hatua kwa hatua

---

## Bado Una Maswali?

### **Tafuta Kwanza**
- Angalia [nyaraka rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tafuta [masuala ya GitHub](https://github.com/Azure/azure-dev/issues) kwa matatizo yanayofanana

### **Pata Msaada**
- [Majadiliano ya GitHub](https://github.com/Azure/azure-dev/discussions) - Msaada wa jumuiya
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Maswali ya kiufundi
- [Azure Discord](https://discord.gg/azure) - Mazungumzo ya jumuiya kwa wakati halisi

### **Ripoti Masuala**
- [Masuala ya GitHub](https://github.com/Azure/azure-dev/issues/new) - Ripoti za hitilafu na ombi la vipengele
- Jumuisha kumbukumbu muhimu, ujumbe wa makosa, na hatua za kurudia tatizo

### **Jifunze Zaidi**
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundo ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo Bora wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Mwongozo wa kiufundi ulioangaliwa: Novemba 4, 2026. Upatikanaji wa wingu na bei lazima yachekiwe kwa usajili wako na mkoa.*

---

**Uavigeshaji**
- **Somo lililopita**: [Kamusi](glossary.md)
- **Somo lijalo**: [Mwongozo wa Kusoma](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
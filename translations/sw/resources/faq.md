# Maswali Yanayoulizwa Mara kwa Mara (FAQ)

**Pata Msaada kwa Sura**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **🚆 Masuala ya Usanidi**: [Sura 1: Usanidi na Kusanidi](../docs/chapter-01-foundation/installation.md)
- **🤖 Maswali ya AI**: [Sura 2: Maendeleo ya AI-Kwanza](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Utatuzi wa Matatizo**: [Sura 7: Utatuzi wa Matatizo & Kurekebisha](../docs/chapter-07-troubleshooting/common-issues.md)

## Utangulizi

FAQ hii kamili hutoa majibu kwa maswali yanayoibuka mara kwa mara kuhusu Azure Developer CLI (azd) na ueneaji wa Azure. Pata suluhisho za haraka kwa matatizo ya kawaida, elewa mbinu bora, na upate ufafanuzi juu ya dhana na utiririshaji wa kazi za azd.

## Malengo ya Kujifunza

Kwa kupitia FAQ hii, utakuwa na uwezo wa:
- Kupata majibu ya haraka kwa maswali na matatizo ya kawaida ya Azure Developer CLI
- Kuelewa dhana muhimu na istilahi kupitia muundo wa maswali na majibu wenye vitendo
- Kupata ufumbuzi wa utatuzi wa matatizo kwa masuala na matukio ya makosa yanayotokea mara kwa mara
- Kujifunza mbinu bora kupitia maswali yanayoulizwa zaidi kuhusu uboreshaji
- Kugundua vipengele na uwezo wa hali ya juu kupitia maswali ya ngazi ya mtaalamu
- Kutumia mwongozo wa gharama, usalama, na mkakati wa utekelezaji kwa ufanisi

## Matokeo ya Kujifunza

Kwa kurejelea FAQ hii mara kwa mara, utaweza:
- Kutatua matatizo ya kawaida ya Azure Developer CLI kwa uhuru kwa kutumia suluhisho zilizotolewa
- Kufanya maamuzi makini kuhusu mikakati ya utekelezaji na usanidi
- Kuelewa uhusiano kati ya azd na zana na huduma nyingine za Azure
- Kutumia mbinu bora kulingana na uzoefu wa jumuiya na mapendekezo ya wataalamu
- Kutatua matatizo ya uthibitishaji, utekelezaji, na usanidi kwa ufanisi
- Kuboresha gharama na utendaji kwa kutumia maarifa na mapendekezo ya FAQ

## Jedwali la Yaliyomo

- [Kuanzia](#getting-started)
- [Uthibitishaji & Ufikiaji](#authentication--access)
- [Mifano & Miradi](#templates--projects)
- [Utekelezaji & Miundombinu](#deployment--infrastructure)
- [Usanidi & Mazingira](#configuration--environments)
- [Utatuzi wa Matatizo](#troubleshooting)
- [Gharama & Malipo](#cost--billing)
- [Mbinu Bora](#best-practices)
- [Mada za Juu](#advanced-topics)

---

## Kuanzia

### S: Azure Developer CLI (azd) ni nini?
**J**: Azure Developer CLI (azd) ni chombo cha mstari wa amri kinachoelekezwa kwa wasanidi kilichoandaliwa kuongeza kasi ya muda unaochukua kupata programu yako kutoka mazingira ya maendeleo ya ndani hadi Azure. Kinatoa mbinu bora kupitia mifano na husaidia katika mzunguko mzima wa utekelezaji.

### S: Je azd ni tofauti vipi na Azure CLI?
**J**: 
- **Azure CLI**: Chombo cha matumizi ya jumla kwa usimamizi wa rasilimali za Azure
- **azd**: Chombo kinacholenga wasanidi kwa utiririshaji wa kazi za utekelezaji wa programu
- azd ina utaratibu wake wa uthibitishaji na utekelezaji; Azure CLI ni chombo tofauti kinachosaidia
- azd ina mifano, usimamizi wa mazingira, na otomatiki ya utekelezaji

### S: Je nahitaji usakinishaji wa Azure CLI ili kutumia azd?
**J**: Siyo kwa mzunguko mkuu wa AZD. Thibitisha kwa `azd auth login`. Sakinisha Azure CLI kwa kujitegemea wakati kiungo cha mfano au zoezi linapoendesha amri za `az` waziwazi.

### S: azd inasaidia lugha za programu gani?
**J**: azd haitegemei lugha yoyote. Inafanya kazi na:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Tovuti zisizobadiliwa (static)
- Programu zilizo ndani ya kontena

### S: Je naweza kutumia azd na miradi iliyopo?
**J**: Ndiyo! Unaweza:
1. Tumia `azd init` kuongeza usanidi wa azd kwa miradi iliyopo
2. Rekebisha miradi iliyopo ili iendane na muundo wa mfano wa azd
3. Tengeneza mifano maalum kwa msingi wa usanifu wako uliopo

### S: Nini kilibadilika kwa upatikana kwa ujumla wa kiendelezi cha Foundry?
**J**: Kifurushi cha `microsoft.foundry` kilifikia toleo 1.0 na GA tarehe 5 Novemba, 2026. Kwa AZD 1.37.0+, tumia `azd ext install microsoft.foundry` kusakinisha viendelezi vikuu saba kwa mawakala, miunganisho, mkaguzi, miradi, taratibu, ujuzi, na sanduku la zana. Hii si nafasi mpya ya amri, na vipengele vyake vina toleo la kujitegemea. Tathmini, seti za data, kurekebisha, na vituo vya kawaida husakinishwa kwa kujitegemea; vipengele vya awali vya hiari havijiwa GA kwa sababu kifurushi ni GA.

Mwongozo wa [wakala aliyeshikiliwa](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) unatumia Python 3.13+ na uv ya sasa. `azd ai agent run` hufungua Agent Inspector kwa karibu, lakini miito ya mfano bado hutumia Azure na husababisha malipo. Mode ya msimbo `azd deploy` hupoandikisha chanzo kwa ajili ya ujenzi wa mbali bila hitaji la ujenzi wa kontena wa karibu.

### S: Je, `azd down` huondoa wakala mwenyeji kutoka kwa mradi wa Foundry uliopo?
**J**: Hapana kwa njia ya mradi uliotumika tena kama ilivyoelezwa katika mwanzo wa haraka wa wakala mwenyeji: inawaacha mradi, wakala mwenyeji, na rasilimali nyingine mahali pake. Ondoa rasilimali zisizohitajika kando bila kufuta rasilimali zinazoshirikiwa. Ikiwa mazingira yalitengeneza mradi mpya wa Foundry, `azd down` hufuta kikundi chake cha rasilimali na kila kitu kilicho ndani yake. Pitia [miongozo ya usafi](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) na tahadhari za kufuta kabla ya kuthibitisha.

---

## Uthibitishaji & Upatikanaji

### S: Ninawezaje kuthibitisha kwa Azure kutumia azd?
**J**: Tumia `azd auth login` ambayo itafungua dirisha la kivinjari kwa ajili ya uthibitishaji wa Azure. Kwa hali za CI/CD, tumia principals za huduma au utambulisho ulioendeshwa.

### S: Je, naweza kutumia azd na usajili mwingi wa Azure?
**J**: Ndiyo. Tumia `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` kuweka ni usajili gani utumike kwa kila mazingira.

### S: Nahitaji ruhusa gani ili kuweka maeneo kwa kutumia azd?
**J**: Kawaida unahitaji:
- Nafasi ya **Contributor** kwenye kundi la rasilimali au usajili
- **User Access Administrator** ikiwa unaweka maeneo yanayohitaji uteuzi wa nafasi
- Ruhusa maalum zinatofautiana kulingana na kiolezo na maeneo yanayowekwa

### S: Naweza kutumia azd kwenye mizunguko ya CI/CD?
**A**: Kabisa! azd imeundwa kwa ajili ya ujumuishaji wa CI/CD. Tumia wakala wa huduma kwa uthibitishaji na weka vigezo vya mazingira kwa usanidi.

### Q: Ninawezaje kushughulikia uthibitishaji kwenye Matendo ya GitHub?
**A**: Pendelea ushirikiano wa utambulisho wa mzigo (OIDC), uliowekwa na `azd pipeline config`. Mchakato uliotengenezwa unasakinisha AZD na kuthibitisha AZD moja kwa moja na utambulisho wa ushirikiano. Hatua ya `azure/login` peke yake haiti saini ya AZD. Hatua ya kuingia ndani ya kazi iliyopo ni:
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

Tandaza au zindua baada ya kuingia, ukiwa na mazingira ya AZD yanayokusudiwa, usajili, na eneo lililosanidiwa. Cheti cha ushirikiano cha utambulisho lazima kitumie imani kwa hazina/marejeleo ya mchakato au mazingira ya GitHub, na majukumu yake ya Azure lazima yaache kuruhusu shughuli zilizoombwa.

---

## Violezo & Miradi

### Q: Naweza kupata wapi violezo vya azd?
**A**: 
- Violezo rasmi na vya jumuiya: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Violezo vya jumuiya: Tafuta GitHub kwa "azd-template"
- Tumia `azd template list` kuvinjari violezo vilivyopo

### Q: Ninawezaje kuunda kiolezo maalum?
**A**: 
1. Anza na muundo wa kiolezo kilichopo
2. Badilisha `azure.yaml`, faili za miundombinu, na msimbo wa programu
3. Jaribu kwa kina kwa kutumia `azd up`
4. Chapisha kwenye GitHub na lebo zinazofaa

### Q: Naweza kutumia azd bila kiolezo?
**A**: Ndiyo, tumia `azd init` katika mradi uliopo kuunda faili za usanidi zinazohitajika. Utahitaji kusanidi kwa mkono `azure.yaml` na faili za miundombinu.

### S: Ni tofauti gani kati ya templates rasmi na za jamii?
**J**: 
- **Mitindo Rasmi**: Inasimamiwa na Microsoft, husasishwa mara kwa mara, nyaraka kamili
- **Mitindo ya Jamii**: Imetengenezwa na waendelezaji, inaweza kuwa na matumizi maalum, ubora na usimamizi tofauti

### S: Ninawezaje kusasisha mtindo katika mradi wangu?
**J**: Mitindo haisasishiwa moja kwa moja. Unaweza:
1. Kulinganisha na kuunganisha mabadiliko kutoka kwa mtindo wa chanzo kwa mkono
2. Anza upya na `azd init` ukitumia mtindo uliosasishwa
3. Chagua maboresho maalum kutoka kwa mitindo iliyosasishwa

---

## Utekelezaji & Miundombinu

### S: Huduma gani za Azure azd inaweza kutekeleza?
**J**: azd inaweza kutekeleza huduma yoyote ya Azure kupitia mitindo ya Bicep/ARM, ikijumuisha:
- Huduma za Programu, Programu za Kontena, Kazi
- Mamlaka za Data (SQL, PostgreSQL, Cosmos DB)
- Uhifadhi, Hazina ya Funguo, Uangalizi wa Programu
- Mtandao, usalama, na rasilimali za ufuatiliaji

### S: Nawezaje kutekeleza katika mikoa mingi?
**J**: Ndiyo, panga mikoa mingi katika mitindo yako ya Bicep na weka kipengele cha eneo ipasavyo kwa kila mazingira.

### S: Ninawezaje kushughulikia uhamishaji wa skimu za hifadhidata?
**J**: Tumia vibonye vya utekelezaji katika `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Nawezaje kutekeleza miundombinu pekee bila programu?
**J**: Ndiyo, tumia `azd provision` kutekeleza vipengele vya miundombinu tu vilivyoainishwa katika mitindo yako.

### S: Nawezaje kutekeleza kwa rasilimali za Azure zilizopo?
**J**: Ndiyo, pale mtindo unapo支持. Rejelea rasilimali zilizopo kwa taarifa za Bicep's `existing` au vigezo vilivyoainishwa katika mtindo kwa rasilimali zilizopo, na ramani huduma za programu kwa malengo yao yaliyokusudiwa. Hii haina kuleta umiliki au kuunda ruhusa zilizokosekana moja kwa moja. Kagua mtindo kabla ya kutekeleza.

### S: Naweza kutumia Terraform badala ya Bicep?
**J**: Ndiyo. AZD inaunga mkono Terraform pamoja na Bicep. Chagua mtindo unaotumia Terraform au sanifu `infra.provider: terraform` katika `azure.yaml`, kwa pamoja na faili za Terraform na usanidi wa hali/nyuma. Angalia [mzunguko wa kazi wa Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Usanidi & Mazingira

### S: Ninawezaje kusimamia mazingira tofauti (dev, staging, prod)?
**J**: Tunga mazingira tofauti kwa kutumia `azd env new <environment-name>` na sanifu mipangilio tofauti kwa kila moja:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Usanidi wa mazingira huhifadhiwa wapi?
**J**: Katika folda ya `.azure` ndani ya saraka ya mradi wako. Kila mazingira ina folda yake yenye faili za usanidi.

### S: Ninawezaje kuweka usanidi maalum kwa mazingira?
**J**: Tumia `azd env set` kuweka vigezo vya mazingira:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Naweza kushiriki usanidi wa mazingira kati ya wanatim?
**J**: Folda ya `.azure` ina taarifa nyeti na haitakiwa kuingizwa katika udhibiti wa matoleo. Badala yake:
1. Andika vigezo vya mazingira vinavyotakiwa
2. Tumia skripti za utekelezaji kupanga mazingira
3. Tumia Azure Key Vault kwa usanidi nyeti

### S: Ninawezaje kuingilia vigezo vya mtindo vilivyoanzishwa awali?
**J**: Weka vigezo vya mazingira vinavyolingana na vigezo vya mtindo:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Vigezo vinavyotumiwa tu na mtindo ndivyo huathiri utekelezaji. `SKU_NAME` hapo juu ni mfano wa ingizo maalum, si usanidi wa jumla wa AZD.

---

## Utatuzi wa matatizo

### S: Kwa nini `azd up` inashindwa?
**J**: Sababu za kawaida:
1. **Masuala ya uthibitishaji**: Endesha `azd auth login`
2. **Ruhusa zisizotosha**: Angalia beno lako la majukumu ya Azure
3. **Migogoro ya majina ya rasilimali**: Kagua rasilimali inayogongana na pembejeo za majina ya templeti; tengeneza mazingira tofauti kwa `azd env new` wakati upunguzaji unahitajika
4. **Masuala ya quota/uwezo**: Angalia upatikanaji wa kikanda
5. **Makosa ya templeti**: Thibitisha templeti za Bicep

### Q: Ninawezaje kutatua shida za kushindwa kwa usambazaji?
**J**: 
1. Tumia `azd deploy --debug` kwa maelezo ya kina
2. Angalia historia ya usambazaji kwenye lango la Azure
3. Kagua Kumbukumbu ya Shughuli kwenye lango la Azure
4. Tumia `azd show` kuonyesha hali ya mazingira ya sasa

### Q: Kwa nini mabadiliko yangu ya mazingira hayafanyi kazi?
**J**: Angalia:
1. Majina ya variable yanafanana hasa na vigezo vya templeti
2. Thamani zimewekewa nukuu ipasavyo ikiwa zina nafasi
3. Mazingira yamechaguliwa: `azd env select <environment>`
4. Variable zimewekwa katika mazingira sahihi

### Q: Ninawezaje kusafisha usambazaji uliofeli?
**J**: 
```bash
azd down
```
Kagua mazingira yaliyoteuliwa na uthibitisho wa ufutaji kwanza. Hii huondoa rasilimali za Azure zilizotolewa, sio usanidi wa mazingira ya ndani wa `.azure`. `--purge` pia huomba ufutaji wa kudumu wa rasilimali zilizo soft-deleted zinazoungwa mkono na inaweza kuzuiwa na ulinzi wa uhifadhi/ufutaji; hii si hatua ya kawaida ya kupona.

### Q: Kwa nini programu yangu haipatikani baada ya usambazaji?
**J**: Angalia:
1. Usambazaji umekamilika kwa mafanikio
2. Programu inaendesha (angaliza kumbukumbu kwenye lango la Azure)
3. Vikundi vya usalama wa mitandao vinaruhusu trafiki
4. DNS/vikoa maalum vimewekwa vizuri

---

## Gharama & Malipo

### Q: Usambazaji wa azd utagharimu kiasi gani?
**J**: Gharama zinategemea:
- Huduma za Azure zilizotolewa
- Madaraja ya huduma/SKUs zilizochaguliwa
- Tofauti za bei za kikanda
- Mifumo ya matumizi

Tumia [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) kwa makadirio.

### Q: Ninawezaje kudhibiti gharama katika usambazaji wa azd?
**J**: 
1. Tumia SKUs za daraja la chini kwa mazingira ya maendeleo
2. Tayarisha bajeti na arifa za Azure
3. Tumia `azd down` kuondoa rasilimali wakati hazihitajiki
4. Chagua maeneo yanayofaa (gharama zinabadilika kwa eneo)
5. Tumia zana za Usimamizi wa Gharama za Azure

### S: Je, kuna chaguzi za tier ya bure kwa templeti za azd?
**J**: Huduma zingine zina SKUs za bure au ruzuku za kila mwezi, kulingana na uwezo wa kupata, mpango wa mwenyeji, eneo, na mipaka ya usajili. Hizi hazifanyi templeti nzima kuwa bure: hifadhidata, utafutaji, mtandao, rejista, telemetry, na tathmini ya mfano vinaweza kutoa gharama kwa kujitegemea. Angalia [orodha ya huduma za bure za Azure](https://azure.microsoft.com/free/) na bei za sasa kwa kila rasilimali kabla ya utekelezaji.

### S: Ninawezaje kubaini gharama kabla ya utekelezaji?
**J**: 
1. Kagua `main.bicep` ya templeti kuona rasilimali gani zinaundwa
2. Tumia Kadiriaji la Bei la Azure kwa SKUs maalum
3. Tekeleza kwenye mazingira ya maendeleo kwanza ili kufuatilia gharama halisi
4. Tumia Usimamizi wa Gharama za Azure kwa uchambuzi wa kina wa gharama

---

## Mazoezi Bora

### S: Mazoezi bora ya muundo wa mradi wa azd ni yapi?
**J**: 
1. Hifadhi msimbo wa programu tofauti na miundombinu
2. Tumia majina ya huduma yenye maana katika `azure.yaml`
3. Tekeleza utambuzi wa makosa vizuri katika maandishi ya kujenga
4. Tumia usanidi maalum kwa mazingira
5. Jumuisha nyaraka kamili

### S: Ninawezaje kupanga huduma nyingi katika azd?
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

### S: Je, ni sahihi kuingiza folda ya `.azure` katika udhibiti wa toleo?
**J**: **Hapana!** Folda ya `.azure` ina taarifa nyeti. Iongeze kwenye `.gitignore`:
```gitignore
.azure/
```

### S: Ninawezaje kushughulikia siri na usanidi nyeti?
**J**: 
1. Tumia Azure Key Vault kwa siri
2. Rejelea siri za Key Vault katika usanidi wa programu
3. Kamwe usiingize siri katika udhibiti wa toleo
4. Tumia utambulisho uliodhibitiwa kwa uthibitishaji kati ya huduma

### S: Je, ni njia gani inayopendekezwa kwa CI/CD na azd?
**J**: 
1. Tumia mazingira tofauti kwa kila hatua (dev/staging/prod)
2. Tekeleza upimaji wa moja kwa moja kabla ya utekelezaji
3. Tumia wakala wa huduma kwa uthibitishaji
4. Weka usanidi nyeti katika siri/kigezo cha mzunguko
5. Tekeleza milango ya idhini kwa utekelezaji uzalishaji

---

## Mada za Juu

### S: Je, naweza kuongeza azd na utendaji maalum?
**J**: Ndiyo, kupitia mitego ya utekelezaji katika `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Ninawezaje kuunganisha azd na michakato ya sasa ya DevOps?
**J**: 
1. Tumia amri za azd katika maandishi ya mzunguko uliopo
2. Tambulisha templeti za azd kwa timu zote
3. Unganisha na ufuatiliaji na tahadhari zilizopo
4. Tumia toleo la JSON la azd kwa ujumuishaji wa mzunguko

### S: Je, naweza kutumia azd na Azure DevOps?
**J**: Ndiyo, azd hufanya kazi na mfumo wowote wa CI/CD. Tengeneza mitiririko ya Azure DevOps inayotumia amri za azd.

### S: Ninawezaje kuchangia kwenye azd au kutengeneza templeti za jumuiya?
**J**: 
1. **zana ya azd**: Changia kwenye [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templeti**: Fuata [maelekezo ya mchango wa maktaba ya Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Nyaraka**: Changia kwenye nyaraka za [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Ramani ya njia ya azd ni nini?
**J**: Angalia [ramani rasmi](https://github.com/Azure/azure-dev/projects) kwa vipengele na maboresho yaliyopangwa.

### S: Ninawezaje kuhama kutoka kwa zana zingine za utekelezaji kwenda azd?
**J**: 
1. Chunguza usanifu wa utekelezaji wa sasa
2. Tengeneza templeti sawa za Bicep
3. Sanidi `azure.yaml` ili iendane na huduma za sasa
4. Jaribu kwa kina katika mazingira ya maendeleo
5. Hamisha mazingira kidogo kidogo

---

## Bado una maswali?

### **Tafuta Kwanza**
- Angalia [nyaraka rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tafuta [masuala ya GitHub](https://github.com/Azure/azure-dev/issues) kwa matatizo yanayofanana

### **Pata Msaada**
- [Majadiliano ya GitHub](https://github.com/Azure/azure-dev/discussions) - Msaada wa jumuiya
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Maswali ya kiufundi
- [Azure Discord](https://discord.gg/azure) - Gumzo la jumuiya kwa wakati halisi

### **Ripoti Masuala**
- [Masuala ya GitHub](https://github.com/Azure/azure-dev/issues/new) - Ripoti za mdudu na ombi la vipengele
- Jumuisha kumbukumbu muhimu, ujumbe wa makosa, na hatua za kuzalisha upya

### **Jifunze Zaidi**
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundo ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfano Bora wa Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Mwongozo wa kiufundi uliohakikiwa: Novemba 4, 2026. Upatikanaji wa wingu na bei vinapaswa kuangaliwa kwa usajili na eneo lako.*

---

**Urambazaji**
- **Somo lililopita**: [Kamusi](glossary.md)
- **Somoe lijalo**: [Mwongozo wa Masomo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
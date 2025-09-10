<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:23:05+00:00",
  "source_file": "resources/faq.md",
  "language_code": "sw"
}
-->
# Maswali Yanayoulizwa Mara kwa Mara (FAQ)

## Utangulizi

FAQ hii ya kina inatoa majibu kwa maswali ya kawaida kuhusu Azure Developer CLI (azd) na usambazaji wa Azure. Pata suluhisho za haraka kwa matatizo ya kawaida, elewa mbinu bora, na pata ufafanuzi kuhusu dhana na mtiririko wa kazi wa azd.

## Malengo ya Kujifunza

Kwa kupitia FAQ hii, utaweza:
- Kupata majibu ya haraka kwa maswali na changamoto za Azure Developer CLI
- Kuelewa dhana muhimu na istilahi kupitia muundo wa maswali na majibu ya vitendo
- Kupata suluhisho za kutatua matatizo ya mara kwa mara na hali za makosa
- Kujifunza mbinu bora kupitia maswali yanayoulizwa mara kwa mara kuhusu uboreshaji
- Kugundua vipengele vya hali ya juu na uwezo kupitia maswali ya kiwango cha kitaalamu
- Kurejelea mwongozo wa gharama, usalama, na mikakati ya usambazaji kwa ufanisi

## Matokeo ya Kujifunza

Kwa kurejelea FAQ hii mara kwa mara, utaweza:
- Kutatua changamoto za kawaida za Azure Developer CLI kwa kujitegemea ukitumia suluhisho zilizotolewa
- Kufanya maamuzi sahihi kuhusu mikakati ya usambazaji na usanidi
- Kuelewa uhusiano kati ya azd na zana na huduma nyingine za Azure
- Kutumia mbinu bora kulingana na uzoefu wa jamii na mapendekezo ya wataalamu
- Kutatua matatizo ya uthibitishaji, usambazaji, na usanidi kwa ufanisi
- Kuboresha gharama na utendaji ukitumia maarifa na mapendekezo ya FAQ

## Jedwali la Maudhui

- [Kuanza](../../../resources)
- [Uthibitishaji na Ufikiaji](../../../resources)
- [Violezo na Miradi](../../../resources)
- [Usambazaji na Miundombinu](../../../resources)
- [Usanidi na Mazingira](../../../resources)
- [Kutatua Matatizo](../../../resources)
- [Gharama na Malipo](../../../resources)
- [Mbinu Bora](../../../resources)
- [Mada za Juu](../../../resources)

---

## Kuanza

### Swali: Azure Developer CLI (azd) ni nini?
**Jibu**: Azure Developer CLI (azd) ni zana ya mstari wa amri inayolenga watengenezaji ambayo inaharakisha muda unaohitajika kupeleka programu yako kutoka mazingira ya maendeleo ya ndani hadi Azure. Inatoa mbinu bora kupitia violezo na husaidia katika mzunguko mzima wa usambazaji.

### Swali: azd inatofautianaje na Azure CLI?
**Jibu**: 
- **Azure CLI**: Zana ya matumizi ya jumla ya kusimamia rasilimali za Azure
- **azd**: Zana inayolenga watengenezaji kwa mtiririko wa kazi wa usambazaji wa programu
- azd hutumia Azure CLI ndani lakini hutoa dhana za kiwango cha juu kwa hali za kawaida za maendeleo
- azd inajumuisha violezo, usimamizi wa mazingira, na otomatiki ya usambazaji

### Swali: Je, ninahitaji Azure CLI ili kutumia azd?
**Jibu**: Ndiyo, azd inahitaji Azure CLI kwa uthibitishaji na baadhi ya operesheni. Sakinisha Azure CLI kwanza, kisha sakinisha azd.

### Swali: azd inaunga mkono lugha gani za programu?
**Jibu**: azd haina upendeleo wa lugha. Inafanya kazi na:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Tovuti za tuli
- Programu zilizo kwenye kontena

### Swali: Je, ninaweza kutumia azd na miradi iliyopo?
**Jibu**: Ndiyo! Unaweza:
1. Kutumia `azd init` kuongeza usanidi wa azd kwenye miradi iliyopo
2. Kubadilisha miradi iliyopo ili kufanana na muundo wa violezo vya azd
3. Kuunda violezo maalum kulingana na usanifu wako uliopo

---

## Uthibitishaji na Ufikiaji

### Swali: Ninawezaje kuthibitisha na Azure kwa kutumia azd?
**Jibu**: Tumia `azd auth login` ambayo itafungua dirisha la kivinjari kwa uthibitishaji wa Azure. Kwa hali za CI/CD, tumia service principals au managed identities.

### Swali: Je, ninaweza kutumia azd na usajili nyingi za Azure?
**Jibu**: Ndiyo. Tumia `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` kubainisha usajili wa kutumia kwa kila mazingira.

### Swali: Ni ruhusa gani ninazohitaji kupeleka kwa kutumia azd?
**Jibu**: Kwa kawaida unahitaji:
- Jukumu la **Contributor** kwenye kikundi cha rasilimali au usajili
- **User Access Administrator** ikiwa unapeleka rasilimali zinazohitaji ugawaji wa majukumu
- Ruhusa maalum zinatofautiana kulingana na kiolezo na rasilimali zinazopelekwa

### Swali: Je, ninaweza kutumia azd katika mabomba ya CI/CD?
**Jibu**: Bila shaka! azd imeundwa kwa ujumuishaji wa CI/CD. Tumia service principals kwa uthibitishaji na weka vigezo vya mazingira kwa usanidi.

### Swali: Ninawezaje kushughulikia uthibitishaji katika GitHub Actions?
**Jibu**: Tumia Azure Login action na maelezo ya service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Violezo na Miradi

### Swali: Ninaweza kupata wapi violezo vya azd?
**Jibu**: 
- Violezo rasmi: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Violezo vya jamii: Tafuta GitHub kwa "azd-template"
- Tumia `azd template list` kuvinjari violezo vinavyopatikana

### Swali: Ninawezaje kuunda kiolezo maalum?
**Jibu**: 
1. Anza na muundo wa kiolezo kilichopo
2. Badilisha `azure.yaml`, faili za miundombinu, na msimbo wa programu
3. Jaribu kwa kina ukitumia `azd up`
4. Chapisha kwenye GitHub na lebo zinazofaa

### Swali: Je, ninaweza kutumia azd bila kiolezo?
**Jibu**: Ndiyo, tumia `azd init` katika mradi uliopo kuunda faili za usanidi zinazohitajika. Utahitaji kusanidi `azure.yaml` na faili za miundombinu kwa mikono.

### Swali: Tofauti ni ipi kati ya violezo rasmi na vya jamii?
**Jibu**: 
- **Violezo rasmi**: Vinadumishwa na Microsoft, vinaboreshwa mara kwa mara, vina nyaraka za kina
- **Violezo vya jamii**: Vimeundwa na watengenezaji, vinaweza kuwa na matumizi maalum, ubora na matengenezo hutofautiana

### Swali: Ninawezaje kusasisha kiolezo katika mradi wangu?
**Jibu**: Violezo havisasishwi kiotomatiki. Unaweza:
1. Kulinganisha na kuunganisha mabadiliko kutoka kwa kiolezo cha chanzo kwa mikono
2. Kuanza upya na `azd init` ukitumia kiolezo kilichosasishwa
3. Kuchagua maboresho maalum kutoka kwa violezo vilivyosasishwa

---

## Usambazaji na Miundombinu

### Swali: azd inaweza kupeleka huduma gani za Azure?
**Jibu**: azd inaweza kupeleka huduma yoyote ya Azure kupitia violezo vya Bicep/ARM, ikijumuisha:
- App Services, Container Apps, Functions
- Hifadhidata (SQL, PostgreSQL, Cosmos DB)
- Uhifadhi, Key Vault, Application Insights
- Rasilimali za mtandao, usalama, na ufuatiliaji

### Swali: Je, ninaweza kupeleka kwenye maeneo mengi?
**Jibu**: Ndiyo, sanidi maeneo mengi katika violezo vyako vya Bicep na weka parameter ya eneo ipasavyo kwa kila mazingira.

### Swali: Ninawezaje kushughulikia uhamishaji wa muundo wa hifadhidata?
**Jibu**: Tumia deployment hooks katika `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Swali: Je, ninaweza kupeleka miundombinu pekee bila programu?
**Jibu**: Ndiyo, tumia `azd provision` kupeleka tu vipengele vya miundombinu vilivyobainishwa katika violezo vyako.

### Swali: Ninawezaje kupeleka kwenye rasilimali zilizopo za Azure?
**Jibu**: Hili ni gumu na halijaungwa mkono moja kwa moja. Unaweza:
1. Kuingiza rasilimali zilizopo kwenye violezo vyako vya Bicep
2. Kutumia marejeleo ya rasilimali zilizopo katika violezo
3. Kubadilisha violezo kuunda au kurejelea rasilimali kwa masharti

### Swali: Je, ninaweza kutumia Terraform badala ya Bicep?
**Jibu**: Kwa sasa, azd inaunga mkono hasa violezo vya Bicep/ARM. Msaada wa Terraform haupatikani rasmi, ingawa suluhisho za jamii zinaweza kuwepo.

---

## Usanidi na Mazingira

### Swali: Ninawezaje kusimamia mazingira tofauti (dev, staging, prod)?
**Jibu**: Unda mazingira tofauti ukitumia `azd env new <environment-name>` na usanidi mipangilio tofauti kwa kila moja:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Swali: Usanidi wa mazingira unahifadhiwa wapi?
**Jibu**: Katika folda ya `.azure` ndani ya saraka ya mradi wako. Kila mazingira yana folda yake yenye faili za usanidi.

### Swali: Ninawezaje kuweka usanidi maalum wa mazingira?
**Jibu**: Tumia `azd env set` kusanidi vigezo vya mazingira:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Swali: Je, ninaweza kushiriki usanidi wa mazingira na wanachama wa timu?
**Jibu**: Folda ya `.azure` ina taarifa nyeti na haipaswi kuwekwa kwenye udhibiti wa toleo. Badala yake:
1. Andika nyaraka za vigezo vya mazingira vinavyohitajika
2. Tumia hati za usambazaji kuanzisha mazingira
3. Tumia Azure Key Vault kwa usanidi nyeti

### Swali: Ninawezaje kubadilisha chaguo-msingi za kiolezo?
**Jibu**: Weka vigezo vya mazingira vinavyolingana na vigezo vya kiolezo:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Kutatua Matatizo

### Swali: Kwa nini `azd up` inashindwa?
**Jibu**: Sababu za kawaida:
1. **Masuala ya uthibitishaji**: Endesha `azd auth login`
2. **Ruhusa zisizotosha**: Angalia ugawaji wa majukumu yako ya Azure
3. **Migogoro ya majina ya rasilimali**: Badilisha AZURE_ENV_NAME
4. **Masuala ya upatikanaji wa uwezo**: Angalia upatikanaji wa kikanda
5. **Makosa ya kiolezo**: Thibitisha violezo vya Bicep

### Swali: Ninawezaje kufuatilia makosa ya usambazaji?
**Jibu**: 
1. Tumia `azd deploy --debug` kwa maelezo ya kina
2. Angalia historia ya usambazaji kwenye portal ya Azure
3. Kagua Activity Log kwenye portal ya Azure
4. Tumia `azd show` kuonyesha hali ya sasa ya mazingira

### Swali: Kwa nini vigezo vyangu vya mazingira havifanyi kazi?
**Jibu**: Angalia:
1. Majina ya vigezo yanalingana na vigezo vya kiolezo kwa usahihi
2. Thamani zimewekwa vizuri ikiwa zina nafasi
3. Mazingira yamechaguliwa: `azd env select <environment>`
4. Vigezo vimewekwa katika mazingira sahihi

### Swali: Ninawezaje kusafisha usambazaji ulioshindwa?
**Jibu**: 
```bash
azd down --force --purge
```
Hii huondoa rasilimali zote na usanidi wa mazingira.

### Swali: Kwa nini programu yangu haipatikani baada ya usambazaji?
**Jibu**: Angalia:
1. Usambazaji umekamilika kwa mafanikio
2. Programu inaendesha (angalia kumbukumbu kwenye portal ya Azure)
3. Vikundi vya usalama wa mtandao vinakubali trafiki
4. DNS/majina maalum yamewekwa vizuri

---

## Gharama na Malipo

### Swali: Usambazaji wa azd utagharimu kiasi gani?
**Jibu**: Gharama zinategemea:
- Huduma za Azure zilizopelekwa
- Viwango vya huduma/SKUs vilivyochaguliwa
- Tofauti za bei za kikanda
- Mwelekeo wa matumizi

Tumia [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) kwa makadirio.

### Swali: Ninawezaje kudhibiti gharama katika usambazaji wa azd?
**Jibu**: 
1. Tumia SKUs za viwango vya chini kwa mazingira ya maendeleo
2. Weka bajeti na arifa za Azure
3. Tumia `azd down` kuondoa rasilimali zisizohitajika
4. Chagua maeneo yanayofaa (gharama hutofautiana kulingana na eneo)
5. Tumia zana za Usimamizi wa Gharama za Azure

### Swali: Je, kuna chaguo za bure kwa violezo vya azd?
**Jibu**: Huduma nyingi za Azure zinatoa viwango vya bure:
- App Service: Kiwango cha bure kinapatikana
- Azure Functions: Utekelezaji milioni 1 bure kwa mwezi
- Cosmos DB: Kiwango cha bure na 400 RU/s
- Application Insights: GB 5 za kwanza kwa mwezi bure

Sanidi violezo kutumia viwango vya bure pale inapowezekana.

### Swali: Ninawezaje kukadiria gharama kabla ya usambazaji?
**Jibu**: 
1. Kagua `main.bicep` ya kiolezo ili kuona rasilimali zinazoundwa
2. Tumia Azure Pricing Calculator na SKUs maalum
3. Peleka kwenye mazingira ya maendeleo kwanza kufuatilia gharama halisi
4. Tumia Usimamizi wa Gharama za Azure kwa uchambuzi wa kina wa gharama

---

## Mbinu Bora

### Swali: Mbinu bora za muundo wa mradi wa azd ni zipi?
**Jibu**: 
1. Weka msimbo wa programu tofauti na miundombinu
2. Tumia majina ya huduma yenye maana katika `azure.yaml`
3. Tekeleza utunzaji sahihi wa makosa katika hati za ujenzi
4. Tumia usanidi maalum wa mazingira
5. Jumuisha nyaraka za kina

### Swali: Ninawezaje kupanga huduma nyingi katika azd?
**Jibu**: Tumia muundo unaopendekezwa:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Swali: Je, ninapaswa kuweka folda ya `.azure` kwenye udhibiti wa toleo?
**Jibu**: **Hapana!** Folda ya `.azure` ina taarifa nyeti. Ongeza kwenye `.gitignore`:
```gitignore
.azure/
```

### Swali: Ninawezaje kushughulikia siri na usanidi nyeti?
**Jibu**: 
1. Tumia Azure Key Vault kwa siri
2. Rejelea siri za Key Vault katika usanidi wa programu
3. Kamwe usiweke siri kwenye udhibiti wa toleo
4. Tumia managed identities kwa uthibitishaji wa huduma kwa huduma

### Swali: Mbinu inayopendekezwa ya CI/CD na azd ni ipi?
**Jibu**: 
1. Tumia mazingira tofauti kwa kila hatua (dev/staging/prod)
2. Tekeleza majaribio ya kiotomatiki kabla ya usambazaji
3. Tumia service principals kwa uthibitishaji
4. Hifadhi usanidi nyeti katika siri/vigezo vya bomba
5. Tekeleza milango ya idhini kwa usambazaji wa uzalishaji

---

## Mada za Juu

### Swali: Je, ninaweza kupanua azd kwa utendaji maalum?
**Jibu**: Ndiyo, kupitia deployment hooks katika `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Swali: Ninawezaje kujumuisha azd na michakato iliyopo ya DevOps?
**Jibu**: 
1. Tumia amri za azd katika hati za bomba zilizopo
2. Sanifisha violezo vya azd katika timu
3. Jumuisha na ufuatiliaji na arifa zilizopo
4. Tumia matokeo ya JSON ya azd kwa ujumuishaji wa bomba

### Swali: Je, ninaweza kutumia azd na Azure DevOps?
**Jibu**: Ndiyo, azd inafanya kazi na mfumo wowote wa CI/CD. Unda mabomba ya Azure DevOps yanayotumia amri za azd.

### Swali: Ninawezaje kuchangia azd au kuunda violezo vya jamii?
**Jibu**: 
1. **Zana ya azd**: Changia kwa [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Violezo**: Unda violezo ukifuata [miongozo ya violezo](https://github.com/Azure-Samples/awesome-azd)
3. **Nyaraka**: Changia nyaraka kwa [MicrosoftDocs/azure-dev-docs](https
1. Changanua usanifu wa sasa wa usanidi
2. Unda templeti za Bicep zinazolingana
3. Sanidi `azure.yaml` ili kuendana na huduma za sasa
4. Jaribu kwa kina katika mazingira ya maendeleo
5. Hamisha mazingira hatua kwa hatua

---

## Bado Una Maswali?

### **Tafuta Kwanza**
- Angalia [nyaraka rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tafuta [masuala ya GitHub](https://github.com/Azure/azure-dev/issues) kwa matatizo yanayofanana

### **Pata Msaada**
- [Majadiliano ya GitHub](https://github.com/Azure/azure-dev/discussions) - Msaada wa jamii
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Maswali ya kiufundi
- [Azure Discord](https://discord.gg/azure) - Gumzo la moja kwa moja la jamii

### **Ripoti Masuala**
- [Masuala ya GitHub](https://github.com/Azure/azure-dev/issues/new) - Ripoti za hitilafu na maombi ya vipengele
- Jumuisha magogo yanayohusika, ujumbe wa hitilafu, na hatua za kuzalisha tatizo

### **Jifunze Zaidi**
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Maswali haya yanayoulizwa mara kwa mara husasishwa mara kwa mara. Iliyosasishwa mwisho: Septemba 9, 2025*

---

**Urambazaji**
- **Somo la Awali**: [Kamusi](glossary.md)
- **Somo Linalofuata**: [Mwongozo wa Kujifunza](study-guide.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia huduma ya tafsiri ya kitaalamu ya binadamu. Hatutawajibika kwa maelewano mabaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
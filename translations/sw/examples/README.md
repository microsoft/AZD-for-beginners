<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:22:41+00:00",
  "source_file": "examples/README.md",
  "language_code": "sw"
}
-->
# Mifano - Violezo vya AZD vya Kivitendo na Usanidi

## Utangulizi

Hili jalada lina mifano ya kivitendo, violezo, na hali halisi za matumizi ili kukusaidia kujifunza Azure Developer CLI kupitia mazoezi ya vitendo. Kila mfano unatoa msimbo kamili unaofanya kazi, violezo vya miundombinu, na maelekezo ya kina kwa usanifu tofauti wa programu na mifumo ya usambazaji.

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utaweza:
- Kufanya mazoezi ya mtiririko wa kazi wa Azure Developer CLI kwa hali halisi za programu
- Kuelewa usanifu tofauti wa programu na utekelezaji wake kwa azd
- Kumiliki mifumo ya Miundombinu kama Msimbo kwa huduma mbalimbali za Azure
- Kutumia usimamizi wa usanidi na mikakati ya usambazaji maalum kwa mazingira
- Kutekeleza mifumo ya ufuatiliaji, usalama, na upanuzi katika hali halisi
- Kujenga uzoefu wa kutatua matatizo na kurekebisha hali halisi za usambazaji

## Matokeo ya Kujifunza

Baada ya kukamilisha mifano hii, utaweza:
- Kusambaza aina mbalimbali za programu kwa kutumia Azure Developer CLI kwa ujasiri
- Kubadilisha violezo vilivyotolewa ili kukidhi mahitaji ya programu yako
- Kubuni na kutekeleza mifumo maalum ya miundombinu kwa kutumia Bicep
- Kusimamia programu za huduma nyingi kwa utegemezi sahihi
- Kutumia mbinu bora za usalama, ufuatiliaji, na utendaji katika hali halisi
- Kutatua matatizo na kuboresha usambazaji kwa msingi wa uzoefu wa vitendo

## Muundo wa Jalada

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Mifano ya Kuanza Haraka

### Kwa Anayeanza
1. **[Programu Rahisi ya Wavuti](../../../examples/simple-web-app)** - Sambaza programu ya msingi ya Node.js
2. **[Tovuti ya Kawaida](../../../examples/static-website)** - Weka tovuti ya kawaida kwenye Azure Storage
3. **[Programu ya Kontena](../../../examples/container-app)** - Sambaza programu iliyowekwa kwenye kontena

### Kwa Watumiaji wa Kati
4. **[Programu ya Hifadhidata](../../../examples/database-app)** - Programu ya wavuti na hifadhidata ya PostgreSQL
5. **[Kazi Isiyo na Seva](../../../examples/serverless-function)** - Azure Functions na vichocheo vya HTTP
6. **[Huduma Ndogo](../../../examples/microservices)** - Programu ya huduma nyingi na API gateway

## 📋 Maelekezo ya Matumizi

### Kuendesha Mifano Laini

1. **Nakili au Kloni Mfano**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Anzisha Mazingira ya AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Sanidi Mazingira**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Sambaza**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Kubadilisha Mifano

Kila mfano unajumuisha:
- **README.md** - Maelekezo ya kina ya usanidi na ubinafsishaji
- **azure.yaml** - Usanidi wa AZD na maelezo
- **infra/** - Violezo vya Bicep na maelezo ya vigezo
- **src/** - Msimbo wa programu ya mfano
- **scripts/** - Hati za kusaidia kwa kazi za kawaida

## 🎯 Malengo ya Kujifunza

### Makundi ya Mifano

#### **Usambazaji Rahisi**
- Programu za huduma moja
- Mifumo rahisi ya miundombinu
- Usimamizi wa usanidi wa msingi
- Mazingira ya maendeleo ya gharama nafuu

#### **Hali za Juu**
- Usanifu wa huduma nyingi
- Usanidi wa mitandao tata
- Mifumo ya ujumuishaji wa hifadhidata
- Utekelezaji wa usalama na uzingatiaji

#### **Mifumo Tayari kwa Uzalishaji**
- Usanidi wa upatikanaji wa juu
- Ufuatiliaji na uangalizi
- Ujumuishaji wa CI/CD
- Mipango ya urejeshaji wa maafa

## 📖 Maelezo ya Mifano

### Programu Rahisi ya Wavuti
**Teknolojia**: Node.js, App Service, Application Insights  
**Ugumu**: Anayeanza  
**Mafunzo**: Usambazaji wa msingi, vigezo vya mazingira, ukaguzi wa afya

### Tovuti ya Kawaida
**Teknolojia**: HTML/CSS/JS, Storage Account, CDN  
**Ugumu**: Anayeanza  
**Mafunzo**: Ukaribishaji wa kawaida, ujumuishaji wa CDN, majina maalum ya kikoa

### Programu ya Kontena
**Teknolojia**: Docker, Container Apps, Container Registry  
**Ugumu**: Kati  
**Mafunzo**: Uwekaji kwenye kontena, upanuzi, usanidi wa ingress

### Programu ya Hifadhidata
**Teknolojia**: Python Flask, PostgreSQL, App Service  
**Ugumu**: Kati  
**Mafunzo**: Muunganisho wa hifadhidata, usimamizi wa siri, uhamishaji

### Kazi Isiyo na Seva
**Teknolojia**: Azure Functions, Cosmos DB, API Management  
**Ugumu**: Kati  
**Mafunzo**: Usanifu unaotegemea matukio, viunganishi, usimamizi wa API

### Huduma Ndogo
**Teknolojia**: Huduma nyingi, Service Bus, API Gateway  
**Ugumu**: Juu  
**Mafunzo**: Mawasiliano ya huduma, foleni za ujumbe, usawazishaji wa mzigo

## 🛠 Mifano ya Usanidi

Jalada la `configurations/` lina vipengele vinavyoweza kutumika tena:

### Usanidi wa Mazingira
- Mipangilio ya mazingira ya maendeleo
- Usanidi wa mazingira ya majaribio
- Usanidi tayari kwa uzalishaji
- Usambazaji wa maeneo mengi

### Moduli za Bicep
- Vipengele vya miundombinu vinavyoweza kutumika tena
- Mifumo ya rasilimali ya kawaida
- Violezo vilivyoboreshwa kwa usalama
- Usanidi wa gharama nafuu

### Hati za Kusaidia
- Uendeshaji wa usanidi wa mazingira
- Hati za uhamishaji wa hifadhidata
- Zana za uthibitishaji wa usambazaji
- Zana za ufuatiliaji wa gharama

## 🔧 Mwongozo wa Kubinafsisha

### Kubadilisha Mifano kwa Matumizi Yako

1. **Kagua Mahitaji**
   - Angalia mahitaji ya huduma za Azure
   - Hakiki mipaka ya usajili
   - Elewa athari za gharama

2. **Badilisha Usanidi**
   - Sasisha ufafanuzi wa huduma kwenye `azure.yaml`
   - Badilisha violezo vya Bicep
   - Rekebisha vigezo vya mazingira

3. **Jaribu Kwa Kina**
   - Sambaza kwenye mazingira ya maendeleo kwanza
   - Thibitisha utendaji
   - Jaribu upanuzi na utendaji

4. **Kagua Usalama**
   - Hakiki udhibiti wa ufikiaji
   - Tekeleza usimamizi wa siri
   - Washa ufuatiliaji na arifa

## 📊 Jedwali la Ulinganisho

| Mfano | Huduma | Hifadhidata | Uthibitishaji | Ufuatiliaji | Ugumu |
|-------|--------|-------------|---------------|-------------|-------|
| Programu Rahisi ya Wavuti | 1 | ❌ | Msingi | Msingi | ⭐ |
| Tovuti ya Kawaida | 1 | ❌ | ❌ | Msingi | ⭐ |
| Programu ya Kontena | 1 | ❌ | Msingi | Kamili | ⭐⭐ |
| Programu ya Hifadhidata | 2 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| Kazi Isiyo na Seva | 3 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| Huduma Ndogo | 5+ | ✅ | Kamili | Kamili | ⭐⭐⭐⭐ |

## 🎓 Njia ya Kujifunza

### Mpangilio Unaopendekezwa

1. **Anza na Programu Rahisi ya Wavuti**
   - Jifunze dhana za msingi za AZD
   - Elewa mtiririko wa kazi wa usambazaji
   - Fanya mazoezi ya usimamizi wa mazingira

2. **Jaribu Tovuti ya Kawaida**
   - Chunguza chaguo tofauti za ukaribishaji
   - Jifunze kuhusu ujumuishaji wa CDN
   - Elewa usanidi wa DNS

3. **Endelea na Programu ya Kontena**
   - Jifunze misingi ya uwekaji kwenye kontena
   - Elewa dhana za upanuzi
   - Fanya mazoezi na Docker

4. **Ongeza Ujumuishaji wa Hifadhidata**
   - Jifunze utoaji wa hifadhidata
   - Elewa mistari ya muunganisho
   - Fanya mazoezi ya usimamizi wa siri

5. **Chunguza Kazi Isiyo na Seva**
   - Elewa usanifu unaotegemea matukio
   - Jifunze kuhusu vichocheo na viunganishi
   - Fanya mazoezi na API

6. **Jenga Huduma Ndogo**
   - Jifunze mawasiliano ya huduma
   - Elewa mifumo ya kusambazwa
   - Fanya mazoezi ya usambazaji tata

## 🔍 Kupata Mfano Sahihi

### Kwa Teknolojia
- **Node.js**: Programu Rahisi ya Wavuti, Huduma Ndogo
- **Python**: Programu ya Hifadhidata, Kazi Isiyo na Seva
- **Tovuti za Kawaida**: Tovuti ya Kawaida
- **Kontena**: Programu ya Kontena, Huduma Ndogo
- **Hifadhidata**: Programu ya Hifadhidata, Kazi Isiyo na Seva

### Kwa Mfano wa Usanifu
- **Monolithic**: Programu Rahisi ya Wavuti, Programu ya Hifadhidata
- **Kawaida**: Tovuti ya Kawaida
- **Huduma Ndogo**: Mfano wa Huduma Ndogo
- **Isiyo na Seva**: Kazi Isiyo na Seva
- **Mseto**: Programu ya Kontena

### Kwa Kiwango cha Ugumu
- **Anayeanza**: Programu Rahisi ya Wavuti, Tovuti ya Kawaida
- **Kati**: Programu ya Kontena, Programu ya Hifadhidata, Kazi Isiyo na Seva  
- **Juu**: Huduma Ndogo

## 📚 Rasilimali za Ziada

### Viungo vya Nyaraka
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mifano ya Jamii
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Mbinu Bora
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Kuchangia Mifano

Una mfano muhimu wa kushiriki? Tunakaribisha michango!

### Miongozo ya Uwasilishaji
1. Fuata muundo wa jalada uliowekwa
2. Jumuisha README.md yenye maelezo kamili
3. Ongeza maoni kwenye faili za usanidi
4. Jaribu kwa kina kabla ya kuwasilisha
5. Jumuisha makadirio ya gharama na mahitaji

### Muundo wa Mfano wa Kiolezo
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Ushauri wa Wataalamu**: Anza na mfano rahisi unaolingana na teknolojia yako, kisha endelea hatua kwa hatua hadi hali ngumu zaidi. Kila mfano unajenga juu ya dhana za mfano uliopita!

**Hatua Zifuatazo**: 
- Chagua mfano unaolingana na kiwango chako cha ujuzi
- Fuata maelekezo ya usanidi kwenye README ya mfano
- Jaribu ubinafsishaji
- Shiriki mafunzo yako na jamii

---

**Urambazaji**
- **Somo la Awali**: [Mwongozo wa Kujifunza](../resources/study-guide.md)
- **Rudi kwa**: [README Kuu](../README.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia huduma ya tafsiri ya kitaalamu ya binadamu. Hatutawajibika kwa maelewano mabaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
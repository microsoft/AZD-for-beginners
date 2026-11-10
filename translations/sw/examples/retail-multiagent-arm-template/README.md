# Msingi wa Miundombinu ya Wakala Wengi wa Malzi

**Mfano wa usanifu wa hali ya juu — si programu ya wakala wengi inayofanya kazi.**

[Nyumbani kwa Kozi](../../README.md) ·
[Sura ya 5](../../docs/chapter-05-multi-agent/README.md) ·
[Mchoro wa usanifu](../retail-scenario.md)

## Hiki huchangia nini

Hii saraka ina templeti ya ARM, vigezo, na skiripti ya usambazaji ya Bash.
Hakuna **chanzo cha `azure.yaml` au programu ya malzi**.

| Rasilimali | Hali halisi baada ya kuweka |
|---|---|
| Akaunti kuu ya Azure OpenAI | usambazaji wa `gpt-4.1-chat` ukitumia toleo la `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| Akaunti ya pili ya OpenAI (hiari) | `gpt-4.1-mini-inventory`, mfano `gpt-4.1-mini` toleo `2025-04-14`, `GlobalStandard` |
| Akaunti ya embeddings (hiari) | `text-embedding-ada-002` toleo `2`, `Standard`; hakuna bomba la uorodheshaji |
| Akaunti ya Grader OpenAI | `gpt-4.1-grader`, mfano `gpt-4.1` toleo `2025-04-14`, `GlobalStandard`; hakuna mtathmini |
| AI Search | Huduma tupu; hakuna orodha wala nyaraka |
| Hifadhi | Vyombo vya blob vya tupu vya `documents` na `uploads` |
| Cosmos DB | Akaunti isiyohitaji seva, hifadhidata ya `chathistory`, kontena ya `conversations` inayogawanyika kwa `/userId`, muda wa kuhifadhi vitu wa siku 30 |
| Programu za Kontena | Kituo cha mawasiliano na sehemu ya mbele zote zinaendesha `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` kwenye mlango wa 80 |
| Key Vault (hiari) | Kifungu cha usalama chenye RBAC; **hakuna siri wala uteuzi wa majukumu** |
| Application Insights / Log Analytics (hiari) | Rasilimali na ukusanyaji wa kumbukumbu za mazingira; hakuna uingizaji maalum wa programu, tahadhari, au dashibodi |
| Document Intelligence | Akaunti ya S0; hakuna mtiririko wa usindikaji wa nyaraka |

Utafutaji wa Legacy Bing v7 ulisitishwa Agosti 11, 2025 na **haujaundwa**.
Hakuna utekelezaji wa mchakato wa uunganisho wa mtandao wa kubadilisha.

**Sihusiani:** mawakala wa wateja/hesabu, API ya router `/chat`, UI ya mazungumzo ya mbele,
muundo wa utafutaji au skiripti za usindishaji, Azure Container Registry, vituo vya kibinafsi,
utambulisho ulioendeshwa, uteuzi wa majukumu ya RBAC, mabadiliko ya kiotomatiki, Front Door, skana ya timu nyekundu,
CLI ya tathmini, uthibitishaji, au CI/CD.

Ujumbe wa mafanikio wa ARM unahakikisha tu kuweka rasilimali. Hauhifadhi
utendaji kazi wa programu, usalama, upatikanaji, au utayari wa uzalishaji.

## Mahitaji na gharama

- Bash (Git Bash/WSL kwenye Windows) na
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Usajili wenye ruhusa za kuunda rasilimali zote zilizoonyeshwa.
- Angalia upatikanaji wa **kila mfano/toleo/SKU katika kila kanda iliyochaguliwa** na
  kikwazo cha usajili wako. Mifano ni kwa maonyesho, si dhamana.
  Angalia [upatikanaji wa mfano](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Chagua kikundi cha rasilimali ulilengwa ambacho unaweza kufuta baada ya majaribio.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Maeneo ya msingi: kuu `eastus2`, ya pili `westus2`, embeddings `francecentral`;
grader hutumia kanda kuu isipokuwa `graderLocation` itolewe.
`--no-multi-region` hupita akaunti za sekondari na embeddings; haipitii akaunti ya
grader.

Huduma ya Utafutaji hulipishwa wakati imewekwa hata ikiwa tupu. Nakala ndogo za kontena,
wingi wa hifadhi, ombi la Cosmos DB/hifadhi, tokeni za mfano, simu za Document Intelligence,
na ingizo/hifadhi ya kumbukumbu vinaweza kuongeza malipo. Hakuna ada
jumla ya kila mwezi**. Kadiria SKUs halisi katika
[Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) na
weka bajeti kabla ya kuweka.

### Njia za Uenezaji

Mipangilio hii ni ukubwa wa rasilimali, **si cheti za uzalishaji au SLA**:

| Njia | Chat / mini / embedding / grader units za uwezo | Nakala za router | Nakala za frontend | Kipengele cha utafutaji | Uhifadhi |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | msingi, nakala 1 | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | kawaida, nakala 1 | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, nakala 2 | Standard_GRS |

Kitengo cha uwezo wa modeli ni maalum kwa modeli/SKU; usiongeze kama dhamana ya TPM ya ulimwengu
. Premium haiwasha Programu za Kontena zenye mzunguko wa eneo: hiyo inahitaji
muundo zaidi wa mtandao. Utafutaji wa Msingi unasaidia utafutaji wa vekta, ukitegemea
vikwazo vya huduma; si kinyume kabisa na vekta.

## 🚀 Uenezaji wa Haraka

Hakiki `azuredeploy.json` na `azuredeploy.parameters.json` kwanza. Amri
hapa chini **huzalisha rasilimali za Azure zinazolipishwa**; sio ukaguzi wa offline.

Kutoka kwenye mizizi ya hazina:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skripti hutumia njia kulingana na saraka yake, hukagua kuingia/vifaa/hoja,
huunda kundi la rasilimali kama halipo, hudhibitisha uenezaji, hutayarisha, na
huonyesha matokeo yasiyo ya siri. Hakuna `jq`, uingizaji wa data, uvujaji wa siri, au
usanidi wa programu baada ya uenezaji unahitajika au kufanywa.

Thamani za amri za mstari wa amri za skripti husababisha kuzidi thamani zinazolingana katika
faili ya vigezo. Hariri faili ya vigezo kwa mipangilio kama maeneo ya pili/tatizo;
tumia uenezaji wa moja kwa moja kwa CLI ikiwa unahitaji kubadilisha vigezo yoyote:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Uandikishaji unaweza kuchukua dakika 15–45 au zaidi, na unaweza kushindwa kwenye vikwazo vya kikanda au
vizuizi vya mzunguko wa maisha wa modeli. Usijaribu tena kwa upumbavu: soma operesheni iliyoshindwa kwanza.

## Chaguzi za usanidi

| Kigezo | Chaguo-msingi katika template | Maana |
|---|---|---|
| `projectName` | Lazima (`retail` katika faili la vigezo) | Herufi/dhigit 3–10 za herufi ndogo |
| `location` | Mahali pa kundi la rasilimali | Eneo kuu (`eastus2` katika faili la vigezo) |
| `secondaryLocation` | `westus2` | Eneo la akaunti ya mini modeli |
| `tertiaryLocation` | `francecentral` | Eneo la akaunti za embeddings |
| `graderLocation` | Eneo kuu | Eneo la akaunti huru ya grader |
| `environmentName` | `dev` | `dev`, `staging`, au `prod`; jina tu, si swichi ya kuimarisha |
| `deploymentMode` | `standard` | Uchaguzi wa SKU/uwezo |
| `enableMultiRegion` | `true` | Ongeza akaunti za sekondari na embeddings |
| `enableMonitoring` | `true` | Ongeza Insights/ukusanyaji wa log wa eneo la kazi na mazingira |
| `enableSecurity` | `true` | Tengeneza hazina iliyo wazi tu yenye uwezo wa RBAC |

Kigezo cha `openAiApiVersion` kilichozua mkanganyiko kimeondolewa: toleo la API la data-plane
halidhibiti toleo za rasilimali za ARM au toleo za modeli. Majina/toleo za modeli
yako katika `variables.modelDeployments`; angalia pamoja na SKU ya uenezaji.

## Thibitisha uandikishaji

Tumia jina la uenezaji kutoka katika matokeo ya skripti au `az deployment group list`.
Kwa uenezaji wa moja kwa moja hapo juu:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Kinachotarajiwa: hali ya uenezaji `Succeeded`. Kwa kushindwa, angalia maelezo ya makosa ya operesheni.
Matokeo ya orodha ya rasilimali pekee si ukaguzi wa hali ya uandikishaji wa kuaminika.

Jaribu kielekezi **root**, si huduma inayokuwepo ya wakala:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Kinachotarajiwa: ukurasa wa HTTP 200 wa hello-world, **si jibu la chat**. Hitilafu ya HTTP
haihesabiwi kama kuthibitisha kwa mafanikio.

Ili kujaribu uelewa halisi wa modeli kuu (unaolipishwa):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Inatarajiwa: JSON yenye `choices` na `usage`. Jina la usambazaji ni
`gpt-4.1-chat`, si jina la mfano ulio chini `gpt-4.1`.

## 🔧 Baada ya Usambazaji: Hatua Zifuatazo

Hii ni **orodha ya maendeleo**, si zoezi lililokamilika:

1. Tekeleza mawakala waliothibitishwa wa mteja/hisa na mkataba wa wasambazaji.
2. Tekeleza sehemu ya mbele na thibitisha usanidi wake.
3. Unda na jaza faharasa ya utafutaji yenye kipimo/profaili kinacholingana na
   mfano wa uwekeaji wako, na shughulikia kushindwa kwa hati na masasisho.
4. Unda rejista na usanidi vitambulisho/miruhusa ya kuvuta picha.
5. Jenga na sukuma picha halisi. Badilisha milango ya kuingiza na vipimo vya Container App ili
   ziendane na zile picha kabla ya kujaribu; mlango 80 hapa ni wa alama za nafasi.
6. Sanidi siri au vitambulisho vinavyodhibitiwa na nafasi za data-plane zilizoainishwa. Usitaje
   majina ya siri yasiyo halisi: templati hii haitaunda siri za programu yoyote.
7. Pima programu, sanidi arifa, jaribu kushindwa/pirejesho, na tathmini
   matokeo kwa ukweli wa ardhi unaowakilisha na ukaguzi wa binadamu.

Tazama [bango la usanifu](../retail-scenario.md) kwa mipaka ya muundo.

## Utatuzi wa matatizo na mipaka ya usalama

- **Mfano haupatikani:** hakiki mfano/toleo/SKU, eneo, na kiwango cha usajili;
  hati ya maelekezo haisambazi daftari za mfano mapema.
- **Ufuatiliaji umezimwa:** eneo la kumbukumbu za mazingira ni `none`, si
  usanidi batili wa Log Analytics ambao ni tupu.
- **Nafasi za kuingiza tu:** `/chat`, tathmini ya wakala, na usindikaji wa faili havipo.
- **Mtandao/utambulisho:** milango ya umma na uthibitishaji wa ndani vimewezeshwa.
  Kuanzisha Key Vault RBAC pekee hakutengenezi maamuzi ya majukumu au vitambulisho.
- **Uzalishaji:** ongeza uthibitishaji, vitambulisho vilivyo na upeo maalum, usimamizi wa siri,
  mtandao wa kibinafsi inapofaa, usanifu wa upatikanaji, na majaribio ya uendeshaji.
  Akaunti za mfano zilizo katika maeneo mengi pekee hazitoi kushindwa-kufanyika.

## Usafishaji

Hakuna mradi wa AZD hapa; `azd down` si amri ya usafishaji.
Baada ya kuthibitisha kuwa kikundi kina rasilimali zako za kujifunza tu:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Kinachotarajiwa baada ya kufuta kumalizika: `false`. Rasilimali zilizo katika Key Vault na Huduma za Akili
zilizofutwa kwa upole zinaweza kuhifadhi majina; kusafisha kabisa kunahitaji ruhusa zinazofaa.
Angalia Usimamizi wa Gharama kwa malipo ya matumizi yaliyocheleweshwa.

[Ripoti tatizo](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
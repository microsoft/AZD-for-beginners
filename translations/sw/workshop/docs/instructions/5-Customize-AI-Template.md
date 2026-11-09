# 5. Bina Kiolezo Kibinafsi

!!! tip "MWISHONI MWA MODULI HII UTAWEZA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Weka msingi wa awali

Tumia hazina ya [Anza na Maajenti wa AI](https://github.com/Azure-Samples/get-started-with-ai-agents) iliyowekwa kutoka modulini zilizopita. Rekodi mabadiliko ya kiolezo, toleo la AZD, mazingira yaliyoteuliwa, usanidi wa modeli, na maswali ya mfano yanayofanya kazi kabla ya kubadilisha kitu chochote.

Mfano unatekeleza programu ya mazungumzo inayotegemea maajenti. HAUKUBALISHI mfumo wa maajenti wawili wa rejareja kwa kuanzisha tu mabadiliko ya mazingira au kuokoa faili za mafundisho ya ziada. Maajenti za ziada, watunzaji wa zana, usafirishaji, idhini, na upatikanaji wa data hupaswa kufanywa na msimbo wa programu.

Angalia mafundisho na zana za maajenti waliowekwa sasa katika Foundry. Jaribu swali moja la ukweli, swali moja la urejeshaji, na swali moja ambalo data ya mfano haiwezi kujibu. Thibitisha marejeleo dhidi ya hati halisi badala ya kudhani jibu laini ni sahihi.

## 5.2 Bina upatikanaji wa maarifa

Kiolezo kinaunga mkono upatikanaji wa faili na ujumuishaji wa hiari wa Azure AI Search. Fuata [mwongozo wa sasa wa AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) kwa ajili ya kuorodhesha na usanifu wa zana.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Kuwasha huduma ni sehemu moja ya upatikanaji. Kabla ya kupakia data yako:

1. Thibitisha una ruhusa ya kutumia nyaraka na toa taarifa nyeti.
2. Chagua mfano wa uingizaji unaoungwa mkono katika eneo lako na weka toleo linalolingana, aina ya usanidi, na vipimo vya vekta.
3. Unda/jaza orodha kwa kutumia mchakato ulioandikwa wa mfano.
4. Sanidi zana ya upatikanaji ya maajenti kutumia orodha hiyo.
5. Jaribu upatikanaji, marejeleo, idhini, na tabia wakati hakuna hati inayofaa.

Usibadilishe kutoka `text-embedding-3-small` kwenda mfano mwingine wa uingizaji bila kuangalia vipimo na kujenga upya/kurejesha vekta kama inavyohitajika. Jina kama `retail-products` si katalogi iliyotekelezwa au sera ya udhibiti wa upatikanaji.

## 5.3 Kufuatilia na uangalizi

Fuata [mwongozo wa uangalizi wa mfano](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Hakikisha rasilimali ya Application Insights na muunganisho muhimu tayari zipo; ukibadilisha mipangilio ya miundombinu, tumia `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Tuma ombi la mtihani, kisha angalia kumbukumbu za programu za Container App na mtazamo wa ufuatiliaji wa maajenti katika Foundry. Angalia ucheleweshaji, simu za zana, makosa, na uhusiano kati ya ombi na ufuatiliaji. Usidhanie telemetry imeunganishwa kwa sababu tu usanidi umeridhika.

Aiache `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` isizime isipokuwa umehakiki wazi mapenzi, kuficha, kuhifadhi, na udhibiti wa upatikanaji. Ufuatiliaji unaweza kuwa na hoja za zana nyeti au maudhui ya hati hata kama kumbukumbu za kawaida za programu zinaonekana salama.

## 5.4 Tathmini ya maajenti

Sehemu ya kuingia ya tathmini ya mfano sasa ni [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), sio saraka ya `evals/`. Kutoka kwa mzizi wa mfano, tumia mazingira ya Python yanayokidhi mahitaji yaliyodhibitishwa:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Kabla ya kuendesha, kamilisha [mahitaji ya tathmini](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Mitihani inaleta usanidi kutoka kwa `.azure/<environment>/.env` iliyochaguliwa; thibitisha mazingira yanayotarajiwa yamechaguliwa. Ingizo muhimu ni pamoja na:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, ukitumia muundo unaotakiwa na mfano wa sasa (toleo lililopitiwa linatumia `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, hutumiwa kama usanidi wa modeli ya mshindi

Angalia mitihani kuelewa uchaguzi wa mtathmini, vizingiti, majukumu yanayohitajika, na gharama za modeli. Kuendesha kufanyika sio moja kwa moja kufanikisha lango la ubora; angalia alama, kesi zilizoshindwa/zilizo na makosa, na matokeo yaliyohusishwa ya Foundry.

### Ongezeko la tathmini la AZD tofauti

Mtihani wa Python hapo juu ni **mchakato maalum kwa mfano**. Ongezeko la hiari la `azure.ai.evaluations` ni mchakato tofauti, wenye usanidi wake wa `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Kwa usanidi kamili wa ongezeko, ona [michakato ya tathmini na uhamishaji](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Tangu maajenti ongezeko beta.22, usitumie amri zilizotolewa za `azd ai agent eval`. Kusakinisha ongezeko la tathmini hakubadilishi mitihani ya Python ya mfano wala kuanzisha usanidi wa tathmini moja kwa moja.

## 5.5 Timu nyekundu ya AI na tathmini ya kuendelea

Mfano wa sasa unatoa [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Kamilisha mahitaji yake na hakiki lengo na gharama kabla ya kuendesha:

```bash
pytest tests/test_red_teaming.py -s
```

Tumia usanidi wa mtihani uliothibitishwa na data bandia. Kagua mashambulizi na matokeo yaliyotengenezwa; skana hii haisemi kwamba programu ni salama au inatii.

Mwongozo wa [kuangalia](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) pia unaelezea tathmini endelevu iliyowekwa wakati wa kuanzishwa kwa kontena. Unachunguza mwingiliano halisi wa watumiaji, si trafiki ya mtihani iliyotengenezwa, na msaada wa mtathmini hubadilika kwa kila eneo. Hakuna mwingiliano maana yake hakuna kumbukumbu za tathmini. Thibitisha toleo la sampuli lililowekwa na usanidi wa mtathmini badala ya kudhani kila usambazaji una chaguo-msingi sawa.

Uthibitishaji ni tofauti na tathmini. Fuata usanidi wa utambulisho/ufikiaji ulioandikwa wa sampuli. Hakuna “mwangilio wa uthibitishaji wa msingi” uliodokumentwa wa kutegemea kulinda eneo la umma.

## 5.6 Mazoezi ya Ubunifu: Usanifu wa rejareja

!!! warning "Mazoezi ya Ubunifu, sio usambazaji uliokamilika"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Andika mpango mfupi ukizungumzia:

| Eneo | Uamuzi na ushahidi wa kukusanya |
|------|----------------------------------|
| Majukumu ya wakala | Anza na wakala mmoja, au fafanua wakala wa Mwanunuzi na Uaminifu tofauti pamoja na mantiki ya kuweka njia |
| Data | Tafsiri seti ya data ya orodha/suluhisho la zawadi na umiliki wa masasisho |
| Zana | Tekeleza wasimamizi wa kusoma tu kwanza; fafanua idhini na uthibitishaji kwa maandishi yoyote |
| Mifano | Chagua mchanganyiko wa modeli/toleo/SKU zilizopo na thibitisha kipaumbele; epuka kutenga mifano isiyotumika |
| Upataji | Fafanua uorodheshaji, vipimo vya kuchanganya, marejeo, na udhibiti wa ufikiaji wa viwango vya hati |
| Tathmini | Ongeza majibu yanayotarajiwa, maswali yasiyo na msaada, matumizi ya zana, na kesi za usalama zenye mipaka wazi |
| Uendeshaji | Fafanua telemetri, muda wa kuchelewa/bajeti za makosa, mipaka ya gharama, na umiliki wa usafishaji |

Kuhifadhi `custom-agents/shopper-agent-instructions.md` hakusababisha sampuli kuipakia. Tafuta msimbo wa programu unaounda/kuboresha wakala, ungana na maelekezo uliyoyakagua hapo, na thibitisha toleo la wakala lililotokana kabla ya kujaribu. Maelekezo hayawezi kutoa ufikiaji kwa data au zana ambazo hujazitumia.

Fanya mabadiliko moja kwa moja, sukuma tena sehemu zilizoathirika, na rerudia maswali na tathmini zako za msingi. Hifadhi toleo linalofanya kazi kwa ajili ya kulinganisha. Kwa msukumo wa usanifu, angalia [mpango wa rejareja](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ambao pia si programu kamili ya rejareja.

!!! quote "MWISHONI MWENDELEO HUU UNATAKANA KUWA NA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Endelea kwenye [Kubomoa Miundombinu](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
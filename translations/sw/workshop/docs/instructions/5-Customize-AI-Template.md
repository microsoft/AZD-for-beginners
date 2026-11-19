# 5. Badilisha Kifananisho

!!! tip "MWISHONI WA MODULI HII UTAWEZA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Weka mstari wa msingi

Tumia hifadhidata ya [Anza na Wakala wa AI](https://github.com/Azure-Samples/get-started-with-ai-agents) iliyozinduliwa kutoka moduli zilizopita. Rekodi marekebisho ya kifananisho, toleo la AZD, mazingira yaliyoteuliwa, upangaji wa mfano, na maswali ya sampuli yanayofanya kazi kabla ya kubadilisha kitu chochote.

Sampuli hiyo inatekeleza programu ya mazungumzo inayotegemea wakala. HAIWEKIWI kuwa mfumo wa wauzaji wawili kwa kuweka tu vigezo vya mazingira au kuhifadhi faili za maagizo za ziada. Wakala wa ziada, washughulikia zana, uelekezaji, idhini, na upatikanaji wa data vinahitaji msimbo wa programu.

Chunguza maagizo na zana za wakala aliyewekwa sasa katika Foundry. Jaribu swali moja la ukweli, swali moja la kupata taarifa, na swali moja ambalo data ya sampuli haiwezi kujibu. Thibitisha marejeleo dhidi ya nyaraka halisi za chanzo badala ya kudhani jibu la mvumilivu ni sahihi.

## 5.2 Badilisha upatikanaji wa maarifa

Kifananisho kinaunga mkono upatikanaji unaotegemea faili na utekelezaji wa hiari wa Azure AI Search. Fuata [mwongozo wa sasa wa AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) kwa ajili ya upangaji na usanidi wa zana.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Kuwezesha huduma ni sehemu moja tu ya upatikanaji. Kabla ya kupakia data zako:

1. Thibitisha una ruhusa ya kutumia nyaraka na ondoa taarifa nyeti.
2. Chagua mfano wa embedding unaoungwa mkono katika eneo lako na weka toleo lake linalofaa, aina ya upangaji, na vipimo vya vector.
3. Tengeneza/jaza index kwa kutumia mchakato wa sampuli uliobandikwa.
4. Sanidi zana ya upatikanaji ya wakala kutumia index hiyo.
5. Jaribu upatikanaji, marejeleo, idhini, na tabia wakati hakuna hati inayohusiana.

Usibadilishe kutoka `text-embedding-3-small` kwenda mfano mwingine wa embedding bila kukagua vipimo na kujenga/reindex vectors kama inavyohitajika. Jina kama `retail-products` si katalogi iliyotekelezwa wala sera ya udhibiti wa upatikanaji.

## 5.3 Ufuatiliaji na uangalizi

Fuata [mwongozo wa uangalizi wa sampuli](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Hakikisha rasilimali ya Application Insights na muunganisho vinavyohitajika tayari vinapatikana; ikiwa unabadilisha mipangilio ya miundombinu, tumia `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Tuma ombi la majaribio, kisha angalia kumbukumbu za programu za Container App na maonyesho ya ufuatiliaji wa wakala katika Foundry. Angalia ucheleweshaji, simu za zana, makosa, na uhusiano kati ya ombi na ufuatiliaji. Usidhani telemetry imeunganishwa kwa sababu ya kufanikisha upangaji tu.

Waache `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` wajielezwe isipokuwa umebaini wazi ruhusa, kufuta, kuhifadhi na udhibiti wa upatikanaji. Ufuatiliaji unaweza kuwa na hoja za zana nyeti au maudhui ya hati hata wakati kumbukumbu za kawaida za programu zinaonekana hakuathiri.

## 5.4 Tathmini ya wakala

Sehemu ya kuingilia ya tathmini ya sampuli sasa ni [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), si saraka ya `evals/`. Kutoka mzizi wa sampuli, tumia mazingira ya Python yanayokidhi mahitaji yaliyofuatwa:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Kabla ya kuendesha, kamilisha [mahitaji ya tathmini](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Mitihani huingiza usanidi kutoka kwa `.azure/<environment>/.env` iliyochaguliwa; thibitisha mazingira yaliyokusudiwa yamechaguliwa. Mawasilisho muhimu ni pamoja na:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, ukitumia muundo unaohitajika na sampuli ya sasa (toleo lililopitiwa linatumia `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, inatumiwa kama mfano wa mchezaji wa hakimu

Chunguza mitihani kuelewa uchaguzi wa mshtakiwa, vizingiti, nyadhifa zinazohitajika, na gharama za modeli. Mgomo uliokamilika si moja kwa moja lango la ubora la kupitisha; chunguza alama, kesi zilizoizimia/kukosea, na matokeo yaliyoambatanishwa ya Foundry.

### Kiongezi kinachotenganisha tathmini za AZD

Jaribio la Python lililotajwa hapo juu ni **mtiririko wa kazi wa sampuli**. Kiongezi cha hiari cha `azure.ai.evaluations` ni mtiririko tofauti, na usanidi wake wa `evals/azure.eval.yaml`. Kinawekwa tofauti, si sehemu ya kundi la kawaida la `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Kwa usanidi kamili wa kiongezi, ona [mitiririko ya tathmini na uhamisho](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Tangu wakala wa kuongeza beta.22, usitumie amri zilizotolewa za `azd ai agent eval`. Kuweka kiongezi cha tathmini hakubadilishi mitihani ya Python ya sampuli au kuzalisha usanidi wa tathmini moja kwa moja.

Kwa **mazoezi ya wakala wa GA yaliyo hifadhiwa kando**, tumia folda tupu nje ya sampuli hii ya warsha na fuata [maelekezo ya Foundry kutoka mtaa hadi wingu](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Inatumia AZD 1.37.0+, kundi la `microsoft.foundry`, Python 3.13+, na uv wa sasa. Utaangalia `azure.yaml`, jaribu mahali hapa na Agent Inspector, panda chanzo kwa ajili ya kujenga kwa mbali Foundry, na tengeneza/pitia dataset na rubrik kabla ya kusanidi `azd ai eval init --name quality`. Usibadilishe mitihani ya sampuli hii au kudhani kuweka kundi kunaibadilisha modeli yake ya kuhifadhi.

## 5.5 Timu nyekundu za AI na tathmini endelevu

Sampuli ya sasa inatoa [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Kamilisha mahitaji yake ya awali na pitia lengo lililokusudiwa na gharama kabla ya kuendesha:

```bash
pytest tests/test_red_teaming.py -s
```

Tumia upangaji wa majaribio ulioruhusiwa na data bandia. Pitia mashambulizi na matokeo yaliyotengenezwa; skanning hii haihakikishi kwamba programu ni salama au inakidhi kanuni.

Mwongozo wa [kuona kwa macho](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) pia unaelezea tathmini endelevu iliyowekwa wakati wa kuanzisha kontena. Unatathmini mwingiliano halisi wa mtumiaji, sio trafiki ya majaribio yaliyotengenezwa, na msaada wa mtathmini hutofautiana kwa mkoa. Hakuna mwingiliano maana yake hakuna mipangilio ya tathmini. Thibitisha toleo la sampuli lililosakinishwa na usanidi wa mtathmini badala ya kudhani kuwa kila usambazaji una mipangilio sawa.

Uthibitishaji ni tofauti na tathmini. Fuata usanidi wa utambulisho/ufikiaji uliodokumentiwa wa sampuli. Hakuna "mwalikaji wa uthibitishaji wa msingi" uliodokumentiwa wa kutegemea kulinda sehemu ya umma.

## 5.6 Zoef Zoefu: Urekebishaji wa rejareja

!!! warning "Zoefu ya Ubunifu, si usambazaji kamili"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Andika mpango mfupi unaoshughulikia:

| Eneo | Uamuzi na ushahidi wa kukusanya |
|------|----------------------------------|
| Majukumu ya wakala | Anza na wakala mmoja, au fafanua wakala wa Mnunuzi na Uaminifu tofauti pamoja na mantiki ya kupitisha |
| Data | Tafsiri seti ya orodha/tuzo ya mfano na umiliki wa masasisho |
| Zana | Tekeleza wataalamu wa kusoma tu kwanza; fafanua idhini na uthibitisho kwa chochote cha kuandika |
| Mifano | Chagua mchanganyiko wa mfano/toleo/SKU uliopatikana na thibitisha kiasi; epuka kuandaa mifano isiyotumiwa |
| Uvujaji | Tafsiri uainishaji, vipimo vya embedding, marejeo, na udhibiti wa upatikanaji wa kiwango cha hati |
| Tathmini | Ongeza majibu yanayotegemewa, maswali yasiyounga mkono, matumizi ya zana, na kesi za usalama zenye vizingiti wazi |
| Uendeshaji | Tafsiri telemetry, bajeti za ucheleweshaji/makosa, vizingiti vya gharama, na umiliki wa usafishaji |

Kuokoa `custom-agents/shopper-agent-instructions.md` hakusababisha sampuli kuizipeleka. Tafuta msimbo wa maombi unaounda/kuboresha wakala, ungana na maagizo yako yaliyopitiwa hapo, na thibitisha toleo la wakala linalotokana kabla ya kujaribu. Maagizo hayawezi kutoa ufikiaji wa data au zana ambazo hujafanikisha.

Tumia mabadiliko moja kwa wakati, wasambaze tena vipengele vilivyohusika, na rejesha maswali na tathmini zako za msingi. Hifadhi toleo linalofanya kazi kwa ajili ya kulinganisha. Kwa msukumo wa usanifu, ona [rasimu ya rejareja](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ambayo pia si programu kamili ya rejareja.

!!! quote "MWISHONI WA MAWAZO HAYA UNATASWA KUWA NA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Endelea kwa [Kutomora Miundombinu](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
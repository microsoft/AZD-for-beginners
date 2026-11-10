# 5. I-customize ang Template

!!! tip "PAGKATAPOS NG MODULONG ITO, MAGAGAWA MO NA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Magtatag ng baseline

Gamitin ang initialized na [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repository mula sa mga nakaraang module. Itala ang template revision, bersyon ng AZD, napiling environment, deployment ng modelo, at mga sample na tanong bago magbago ng anumang bagay.

Ang sample ay nagpapatupad ng agent-backed chat application. Hindi ito nagiging two-agent retail system sa pamamagitan lang ng pagtatakda ng mga environment variable o pag-save ng karagdagang instruction files. Ang mga dagdag na agent, tool handlers, routing, authorization, at access sa data ay nangangailangan ng application code.

Suriin ang mga instruksiyon at tool ng kasalukuyang deployed na agent sa Foundry. Subukan ang isang factual na tanong, isang retrieval na tanong, at isang tanong na hindi masagot ng sample data. I-verify ang mga citation laban sa mga aktwal na source documents sa halip na isipin na tama ang fluent na sagot.

## 5.2 I-customize ang knowledge retrieval

Sinusuportahan ng template ang file-based retrieval at optional na Azure AI Search integration. Sundin ang [current AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para sa pag-index at configuration ng tool.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Ang pag-enable ng serbisyo ay bahagi lamang ng retrieval. Bago mag-upload ng sariling data:

1. Kumpirmahin na may permiso ka na gamitin ang mga dokumento at alisin ang sensitibong impormasyon.
2. Pumili ng embedding model na suportado sa iyong rehiyon at itakda ang compatible na bersyon, deployment type, at vector dimensions.
3. Gumawa/punuan ang index gamit ang dokumentadong proseso ng sample.
4. I-configure ang retrieval tool ng agent para gamitin ang index na iyon.
5. Subukan ang retrieval, citations, authorization, at ugali kapag walang kaugnay na dokumento.

Huwag lumipat mula sa `text-embedding-3-small` papunta sa ibang embedding model nang hindi sinusuri ang dimensions at hindi nirerebuild/reindex ang vectors kung kinakailangan. Ang isang pangalan tulad ng `retail-products` ay hindi isang ipinatupad na katalogo o access-control policy.

## 5.3 Pagsubaybay at monitoring

Sundin ang [sample's observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Siguraduhing ang kinakailangang Application Insights resource at connection ay umiiral na; kung binabago ang settings ng imprastruktura, gamitin ang `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Magpadala ng test request, pagkatapos suriin ang mga application logs ng Container App at ang tracing view ng agent sa Foundry. Tingnan ang latency, tool calls, errors, at korelasyon sa pagitan ng request at trace. Huwag ipalagay na konektado ang telemetry dahil lang matagumpay ang deployment.

Panatilihing naka-disable ang `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` maliban kung malinaw mong nirebyu ang consent, redaction, retention, at mga control sa access. Maaaring maglaman ang mga trace ng sensitibong argument ng tool o nilalaman ng dokumento kahit ang ordinaryong application logs ay ligtas tingnan.

## 5.4 Pagsusuri sa Agent

Ang entry point para sa pagsusuri ng sample ay ngayon ang [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), hindi isang `evals/` na directory. Mula sa root ng sample, gumamit ng Python environment na tumutugon sa mga dokumentadong kinakailangan nito:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Bago tumakbo, kumpletuhin ang [evaluation prerequisites](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Ang mga pagsubok ay naglo-load ng configuration mula sa napiling `.azure/<environment>/.env`; tiyakin na tama ang napiling environment. Mahahalagang input ang:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, gamit ang format na kinakailangan ng kasalukuyang sample (ang nirebyung bersyon ay gumagamit ng `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, ginagamit bilang judge-model deployment

Suriin ang mga pagsubok upang maunawaan ang pagpili ng evaluator, thresholds, kinakailangang roles, at gastos ng modelo. Ang isang natapos na run ay hindi awtomatikong pumasa sa quality gate; suriin ang mga score, mga nabigong kaso, mga error, at mga naka-link na resulta sa Foundry.

### Hiwalay na extension para sa AZD evaluations

Ang Python test sa itaas ay isang **sample-specific workflow**. Ang opsyonal na `azure.ai.evaluations` extension ay isang ibang workflow, na may sariling `evals/azure.eval.yaml` configuration:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para sa kompletong pag-setup ng extension, tingnan ang [evaluation workflows at migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Mula sa agents extension beta.22, huwag gamitin ang tinanggal na `azd ai agent eval` na mga command. Ang pag-install ng evaluations extension ay hindi nagkokonvert ng mga Python tests ng sample o awtomatikong lumilikha ng evaluation configuration.

## 5.5 AI red teaming at tuloy-tuloy na pagsusuri

Nagbibigay ang kasalukuyang sample ng [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Kumpletuhin ang mga prerequisites nito at suriin ang tinukoy na target at gastos bago tumakbo:

```bash
pytest tests/test_red_teaming.py -s
```

Gumamit ng awtorisadong test deployment at synthetic data. Suriin ang mga nagawang pag-atake at resulta; ang scan na ito ay hindi nagpapatunay na ang isang application ay ligtas o sumusunod sa mga regulasyon.

Ang [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) ay naglalarawan din ng tuloy-tuloy na pagsusuri na naka-configure sa pagsisimula ng container. Sinusuri nito ang totoong interaksyon ng user, hindi ang generated test traffic, at nagkakaiba ang suporta ng evaluator ayon sa rehiyon. Kung walang interaksyon, walang pagsusuri. Kumpirmahin ang naka-install na bersyon ng sample at configuration ng evaluator sa halip na isipin na pareho ang default sa bawat deployment.

Ang authentication ay hiwalay sa pagsusuri. Sundin ang dokumentadong identity/access setup ng sample. Walang dokumentadong “basic auth fallback” na maaasal bilang proteksyon sa isang pampublikong endpoint.

## 5.6 Exercise sa disenyo: retail customization

!!! warning "Exercise sa disenyo, hindi kumpletong deployment"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Sumulat ng maikling plano na tumutugon sa:

| Area | Desisyon at ebidensyang dapat kolektahin |
|------|----------------------------------|
| Mga responsibilidad ng agent | Magsimula sa isang agent, o bigyang-katwiran ang paghihiwalay ng Shopper at Loyalty agents at routing logic |
| Data | Tukuyin ang synthetic catalog/rewards dataset at pagmamay-ari ng mga update |
| Mga Tool | Ipapatupad muna ang read-only handlers; tukuyin ang authorization at validation para sa anumang write |
| Mga Modelo | Pumili ng available na kombinasyon ng modelo/bersyon/SKU at tiyakin ang quota; iwasang mag-provision ng hindi ginagamit na mga modelo |
| Retrieval | Tukuyin ang pag-index, embedding dimensions, citations, at mga control sa access sa antas ng dokumento |
| Pagsusuri | Magdagdag ng mga kaso para sa expected-answer, unsupported-question, tool-use, at safety na may malinaw na thresholds |
| Operasyon | Tukuyin ang telemetry, latency/error budgets, cost limits, at pagmamay-ari ng paglilinis |

Ang pag-save ng `custom-agents/shopper-agent-instructions.md` ay hindi nagiging dahilan upang i-load ito ng sample. Hanapin ang application code na gumawa/o nag-update ng agent, ikonekta ang nirebyung mga instruksiyon doon, at i-verify ang nagresultang agent version bago magsagawa ng pagsubok. Hindi maaaring magbigay ng access ang mga instruksiyon sa data o tool na hindi mo ipinapatupad.

Mag-apply ng isang pagbabago sa bawat pagkakataon, i-redeploy ang mga apektadong bahagi, at muling patakbuhin ang baseline na mga tanong at pagsusuri. Panatilihin ang gumaganang revision para sa paghahambing. Para sa inspirasyon sa arkitektura, tingnan ang [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), na hindi rin kumpletong retail application.

!!! quote "PAGKATAPOS NG LAB NA ITO, DAPAT SUPORTAHAN MO NA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Magpatuloy sa [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
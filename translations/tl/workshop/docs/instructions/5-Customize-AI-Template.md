# 5. I-customize ang isang Template

!!! tip "SA WAKAS NG MODULONG ITO AY MAAARING MANGYARI SA IYO NA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Magtakda ng baseline

Gamitin ang inisyal na [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repository mula sa mga nakaraang module. Itala ang rebisyon ng template, bersyon ng AZD, napiling environment, deployment ng modelo, at mga sample na tanong bago magbago ng kahit ano.

Ang sample ay nag-iimplementa ng isang agent-backed chat application. Hindi ito nagiging dalawang-agent retail system lamang sa pamamagitan ng pagtatakda ng environment variables o pagsave ng karagdagang instruction files. Kailangan ng karagdagang agents, tool handlers, routing, authorization, at access sa data ng application code.

Suriin ang mga kasalukuyang inilunsad na agent instructions at tools sa Foundry. Subukan ang isang factual na tanong, isang retrieval na tanong, at isang tanong na hindi masagot ng sample data. Patunayan ang mga citation laban sa aktwal na source na dokumento sa halip na ipalagay na tama ang isang fluent na sagot.

## 5.2 I-customize ang knowledge retrieval

Sinusuportahan ng template ang file-based retrieval at opsyonal na Azure AI Search integration. Sundin ang [current AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para sa pag-index at pagsasaayos ng tool.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Ang pag-enable ng serbisyo ay isang bahagi lamang ng retrieval. Bago mag-upload ng sarili mong data:

1. Kumpirmahin na may permiso kang gamitin ang mga dokumento at alisin ang sensitibong impormasyon.
2. Pumili ng embedding model na sinusuportahan sa iyong rehiyon at itakda ang compatible na bersyon, uri ng deployment, at sukat ng vectors.
3. Gumawa/punuin ang index gamit ang proseso na dokumentado sa sample.
4. Isaayos ang retrieval tool ng agent upang gamitin ang index na iyon.
5. Subukan ang retrieval, citations, authorization, at ugali kapag walang kaugnay na dokumento.

Huwag lumipat mula sa `text-embedding-3-small` papunta sa ibang embedding model nang hindi sinisigurado ang dimensyon at muling pagtatayo o pag-reindex ng mga vectors kung kinakailangan. Ang pangalan na tulad ng `retail-products` ay hindi isang implementadong katalogo o access-control policy.

## 5.3 Tracing at monitoring

Sundin ang [sample's observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Siguraduhin na ang kinakailangang Application Insights resource at connection ay umiiral na; kung babaguhin ang mga setting ng infrastructure, gamitin ang `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Magpadala ng test request, pagkatapos suriin ang application logs ng Container App at ang tracing view ng agent sa Foundry. Tingnan ang latency, tool calls, errors, at correlation sa pagitan ng request at trace. Huwag ipalagay na connected ang telemetry dahil lamang matagumpay ang deployment.

Panatilihing naka-disable ang `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` maliban kung malinaw na nireview mo ang consent, redaction, retention, at access controls. Maaaring maglaman ang mga trace ng sensitibong argument ng tool o nilalaman ng dokumento kahit na mukhang ligtas ang ordinaryong application logs.

## 5.4 Pagsusuri sa agent

Ang entry point ng pagsusuri ng sample ay ngayon [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), hindi isang `evals/` direktoryo. Mula sa root ng sample, gumamit ng Python environment na naaayon sa mga documented requirements nito:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Bago patakbuhin, kumpletuhin ang [evaluation prerequisites](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Ina-load ng mga tests ang configuration mula sa napiling `.azure/<environment>/.env`; siguraduhing tama ang napiling environment. Mahahalagang inputs ay:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, gamit ang format na hinihingi ng kasalukuyang sample (ang nirebyung bersyon ay gumagamit ng `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, ginagamit bilang judge-model deployment

Suriin ang mga tests upang maunawaan ang pagpili ng evaluator, mga threshold, kinakailangang role, at mga gastos sa modelo. Ang matagumpay na run ay hindi agad nangangahulugang pumasa sa quality gate; suriin ang mga scores, mga failed o errored case, at ang naka-link na resulta sa Foundry.

### Hiwa-hiwalay na AZD evaluations extension

Ang Python test na nasa itaas ay isang **sample-specific workflow**. Ang opsyonal na `azure.ai.evaluations` extension ay ibang workflow, na may sarili nitong `evals/azure.eval.yaml` configuration. Ini-install ito nang hiwalay, hindi kasama sa generally available `microsoft.foundry` 1.0 bundle:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para sa kompletong setup ng extension, tingnan ang [evaluation workflows and migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Simula sa agents extension beta.22, huwag gamitin ang tinanggal na `azd ai agent eval` commands. Ang pag-install ng evaluations extension ay hindi nagko-convert ng Python tests ng sample o awtomatikong lumilikha ng evaluation configuration.

Para sa hiwalay na **GA hosted-agent exercise**, gumamit ng walang laman na folder sa labas ng sample na ito sa workshop at sundin ang [Foundry local-to-cloud walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Gumagamit ito ng AZD 1.37.0+, `microsoft.foundry` bundle, Python 3.13+, at kasalukuyang uv. Susuriin mo ang `azure.yaml`, susubukan locally gamit ang Agent Inspector, ide-deploy ang source para sa remote Foundry build, at gagawa/magre-review ng dataset at rubric bago isaayos ang `azd ai eval init --name quality`. Huwag palitan ang mga tests ng sample na ito o ipalagay na binabago ng pag-install ng bundle ang hosting model nito.

## 5.5 AI red teaming at tuloy-tuloy na pagsusuri

Ang kasalukuyang sample ay nagbibigay ng [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Kumpletuhin ang mga prerequisites nito at suriin ang target at gastos bago patakbuhin:

```bash
pytest tests/test_red_teaming.py -s
```

Gumamit ng authorized test deployment at synthetic na data. Suriin ang mga générang atake at resulta; hindi nito pinapatunayan na ligtas o compliant ang isang aplikasyon.

Ang [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) ay naglalarawan din ng tuloy-tuloy na pagsusuri na naka-configure sa pagsisimula ng container. Sinusuri nito ang totoong pakikipag-ugnayan ng user, hindi ang generadong test traffic, at ang suporta ng evaluator ay nag-iiba ayon sa rehiyon. Walang pakikipag-ugnayan ay walang entry sa pagsusuri. Tingnan ang naka-install na bersyon ng sample at configuration ng evaluator imbes na ipalagay na pareho lahat ng deployment ang default.

Ang authentication ay hiwalay sa pagsusuri. Sundin ang documented setup sa sample para sa identity/access. Walang dokumentadong “basic auth fallback” na maaaring gamitin bilang proteksyon sa isang public endpoint.

## 5.6 Disenyo ng pagsasanay: retail customization

!!! warning "Disenyo ng pagsasanay, hindi isang kompletong deployment"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Sumulat ng maikling plano na tumutukoy sa:

| Area | Desisyon at ebidensyang dapat kolektahin |
|------|----------------------------------|
| Pananagutan ng Agent | Simulan sa isang agent, o magbigay ng katwiran para sa magkahiwalay na Shopper at Loyalty agents at routing logic |
| Datos | Tukuyin ang synthetic catalog/rewards dataset at pagmamay-ari ng mga update |
| Mga Tools | Ipatupad muna ang read-only handlers; tukuyin ang authorization at validation para sa anumang pagsusulat |
| Mga Modelo | Pumili ng mga available na kombinasyon ng modelo/bersyon/SKU at suriin ang quota; iwasan ang provisioning ng hindi nagagamit na mga modelo |
| Retrieval | Tukuyin ang pag-index, mga dimensyon ng embedding, mga citation, at mga control sa access ng dokumento |
| Pagsusuri | Magdagdag ng inaasahang sagot, unsupported question, paggamit ng tool, at mga kaso ng kaligtasan na may malinaw na threshold |
| Operasyon | Tukuyin ang telemetry, latency/error budgets, limitasyon sa gastos, at pagmamay-ari ng paglilinis |

Ang pagsave ng `custom-agents/shopper-agent-instructions.md` ay hindi nagpapapag-load ng sample ng code nito. Hanapin ang application code na lumilikha/nag-a-update ng agent, ikonekta ang iyong nirebyung instruksyon doon, at siguraduhing tumpak ang bersyon ng agent bago subukan. Hindi maaaring magbigay ang mga instruksyon ng access sa data o tools na hindi mo pa na-implementa.

Mag-apply ng isang pagbabago sa bawat pagkakataon, i-redeploy ang apektadong mga bahagi, at patakbuhin muli ang iyong baseline na mga tanong at pagsusuri. Panatilihin ang isang gumaganang rebisyon para sa paghahambing. Para sa inspirasyon sa arkitektura, tingnan ang [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), na hindi rin isang kompletong retail application.

!!! quote "SA WAKAS NG LAB NA ITO DAPAT AY MAYROON KA NG"

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
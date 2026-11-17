# 5. Customize Template

!!! tip "BY DE END OF DIS MODULE YOU GO FIT DO"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Set baseline

Use di initialized [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repo wey you start for di previous modules. Record di template revision, AZD version, environment wey you choose, model deployment, and working sample questions before you change anything.

Di sample na agent-backed chat app. E no go turn to two-agent retail system just wen you set environment variables or save more instruction files. Extra agents, tool handlers, routing, authorization, and data access need application code.

Check di deployed agent instructions and tools inside Foundry. Test one factual question, one retrieval question, and one question wey di sample data no fit answer. Verify citation against di real source documents, no just assume say fluent response dey correct.

## 5.2 Customize knowledge retrieval

Di template support file-based retrieval plus optional Azure AI Search integration. Follow di [current AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) for indexing and tool configuration.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

To enable di service na only one part of retrieval. Before you upload your own data:

1. Confirm say you get permission to use di documents and remove sensitive info dem.
2. Choose embedding model wey your region support and set its correct version, deployment type, and vector dimensions.
3. Create or fill di index using di sample documented process.
4. Configure di agent retrieval tool to use dat index.
5. Test retrieval, citations, authorization, and how e go behave when no relevant document dey.

No just waka comot `text-embedding-3-small` go use different embedding model without check dimensions and rebuild or reindex vectors as needed. Some name like `retail-products` no be implemented catalog or access-control policy.

## 5.3 Tracing and monitoring

Follow di [sample's observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Make sure di required Application Insights resource and connection dey; if you wan change infrastructure settings, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Send test request, then check di Container App application logs and di agent tracing view for Foundry. Check latency, tool calls, errors, and how request and trace relate. No just think say telemetry connect because deployment succeed.

Leave `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` disable unless you don properly review consent, redaction, retention, and access controls. Traces fit get sensitive tool arguments or document content even if normal application logs look harmless.

## 5.4 Agent evaluation

Di sample evaluation entry point na [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), no be `evals/` directory. From di sample root, use Python environment wey fit meet its documented requirements:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Before you run am, complete di [evaluation prerequisites](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Di tests dey load configuration from di selected `.azure/<environment>/.env`; confirm say di environment wey you want dey set. Important inputs include:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, using di format wey di current sample require (di reviewed version dey use `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, wey e be di judge-model deployment

Check di tests to understand evaluator choice, thresholds, required roles, and model costs. Run wey finish no mean e pass quality gate; check scores, failed or errored cases, and linked Foundry results.

### Separate AZD evaluations extension

Di Python test wey I talk about na **sample-specific workflow**. Di optional `azure.ai.evaluations` extension na different workflow, with its own `evals/azure.eval.yaml` configuration. E dey installed separately, no dey inside di generally available `microsoft.foundry` 1.0 bundle:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

For complete extension setup, see [evaluation workflows and migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Since agents extension beta.22, no use di removed `azd ai agent eval` commands. Installing di evaluations extension no mean say e go convert di sample's Python tests or automatically create evaluation configuration.

For separate **GA hosted-agent exercise**, use empty folder outside dis workshop sample and follow di [Foundry local-to-cloud walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). E dey use AZD 1.37.0+, di `microsoft.foundry` bundle, Python 3.13+, and current uv. You go inspect `azure.yaml`, test locally with Agent Inspector, deploy source for remote Foundry build, and generate or review dataset and rubric before you configure `azd ai eval init --name quality`. No replace dis sample tests or think say installing di bundle go change hosting model.

## 5.5 AI red teaming and continuous evaluation

Di current sample get [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete di prerequisites and review di intended target and costs before you run am:

```bash
pytest tests/test_red_teaming.py -s
```

Use authorized test deployment and synthetic data. Check di generated attacks and results; dis scan no dey mean say application secure or compliant.

Di [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) also talk about continuous evaluation wey dey configured at container startup. E dey evaluate real user interactions, no be just generated test traffic, and evaluator support dey differ by region. If no interactions, no evaluation entries. Confirm installed sample version and evaluator configuration no just assume say every deployment get di same default.

Authentication dey separate from evaluation. Follow di sample documented identity/access setup. No get documented “basic auth fallback” to rely on for protecting public endpoint.

## 5.6 Design exercise: retail customization

!!! warning "Design exercise, no be completed deployment"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Write short plan to answer:

| Area | Decision and evidence to collect |
|------|----------------------------------|
| Agent responsibilities | Start with one agent, or justify separate Shopper and Loyalty agents and routing logic |
| Data | Define synthetic catalog/rewards dataset and ownership of updates |
| Tools | Implement read-only handlers first; specify authorization and validation for any writes |
| Models | Choose available model/version/SKU combinations and verify quota; avoid provisioning unused models |
| Retrieval | Define indexing, embedding dimensions, citations, and document-level access controls |
| Evaluation | Add expected-answer, unsupported-question, tool-use, and safety cases with explicit thresholds |
| Operations | Define telemetry, latency/error budgets, cost limits, and cleanup ownership |

Saving `custom-agents/shopper-agent-instructions.md` no go make di sample load am. Find application code wey dey create or update di agent, connect your reviewed instructions there, and verify resultant agent version before you test. Instructions no fit authorize access to data or tools wey you no implement.

Apply one change at a time, redeploy affected components, and rerun baseline questions and evaluations. Keep working revision for comparison. For architecture ideas, see di [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), wey no still complete retail application.

!!! quote "BY DE END OF DIS LAB YOU SUPPOSE GET"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continue to [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
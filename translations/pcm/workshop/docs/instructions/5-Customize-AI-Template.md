# 5. Customize Template

!!! tip "BY DI TIME YOU FINISH DIS MODULE, YOU GO FIT"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Set up baseline

Use di initialized [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repo from di previous modules. Make note of di template revision, AZD version, selected environment, model deployment, and working sample questions before you change anything.

Di sample dey run agent-backed chat application. E no come be two-agent retail system just by setting environment variables or saving more instruction files. Extra agents, tool handlers, routing, authorization, and data access need application code.

Check di current deployed agent instructions and tools for Foundry. Test one factual question, one retrieval question, and one question wey di sample data no fit answer. Confirm citations with real source documents instead of just believing say di response dey correct.

## 5.2 Customize knowledge retrieval

Di template dey support file-based retrieval plus optional Azure AI Search integration. Follow di [current AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) for indexing and tool setup.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Turning the service on na just one part of retrieval. Before you upload your own data:

1. Confirm say you get permission to use di documents and remove any sensitive info.
2. Choose embedding model wey your region support and set di correct version, deployment type, and vector dimensions.
3. Make or populate di index using di sample's documented process.
4. Configure di agent retrieval tool to use dat index.
5. Test retrieval, citations, authorization, and how e behave if no relevant document dey.

No switch from `text-embedding-3-small` to another embedding model without checking dimensions and rebuilding/reindexing vectors if needed. Name like `retail-products` no be implemented catalog or access-control policy.

## 5.3 Tracing and monitoring

Follow di [sample's observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Make sure say di required Application Insights resource and connection dey ready; if you wan change infrastructure settings, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Send test request, den check di Container App application logs and di agent tracing view for Foundry. Look latency, tool calls, errors, and how request and trace dey connect. No just assume telemetry dey connected just because deployment succeed.

Leave `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` off unless you don clearly review consent, redaction, retention, and access controls. Traces fit get sensitive tool arguments or document info even if normal application logs look harmless.

## 5.4 Agent evaluation

Di sample evaluation entry point now be [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), no be `evals/` directory. From di sample root, use Python environment wey meet di documented requirements:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Before you run am, complete di [evaluation prerequisites](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Di tests load config from di chosen `.azure/<environment>/.env`; confirm say di right environment dey selected. Important inputs na:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, using di format wey di current sample require (di reviewed version dey use `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, used as judge-model deployment

Check di tests well to understand evaluator choice, thresholds, required roles, and model costs. Just because run finish no mean e pass quality gate; look scores, failed/errored cases, and di linked Foundry results.

### Separate AZD evaluations extension

Di Python test wey I talk na **sample-specific workflow**. Di optional `azure.ai.evaluations` extension na different workflow with its own `evals/azure.eval.yaml` config:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

For full extension setup, see [evaluation workflows and migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Since agents extension beta.22, no use di removed `azd ai agent eval` commands. Installing di evaluations extension no go change di sample Python tests or automatically create evaluation config.

## 5.5 AI red teaming and continuous evaluation

Di current sample get [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete e prerequisites and study di target and costs before you run am:

```bash
pytest tests/test_red_teaming.py -s
```

Use authorized test deployment and synthetic data. Check di generated attacks and results; dis scan no mean say di application secure or compliant.

Di [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) also talk about continuous evaluation wey e happen when container start. E dey check real user interactions, no be generated test traffic, and evaluator support fit different by region. If no interaction, no evaluation entries. Confirm di installed sample version and evaluator config instead of assuming all deployment get di same settings.

Authentication dey separate from evaluation. Follow di sample documented identity/access setup. No dey documented “basic auth fallback” wey person fit rely on to protect public endpoint.

## 5.6 Design exercise: retail customization

!!! warning "Design exercise, no be completed deployment"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Write short plan wey go talk about:

| Area | Decision and evidence to collect |
|------|----------------------------------|
| Agent responsibilities | Start with one agent, or explain why to get separate Shopper and Loyalty agents plus routing logic |
| Data | Define synthetic catalog/rewards dataset and who go handle updates |
| Tools | Implement read-only handlers first; specify authorization and validation for any writes |
| Models | Choose available model/version/SKU combos and confirm quota; avoid provisioning models wey no go use |
| Retrieval | Define indexing, embedding dimensions, citations, and document-level access controls |
| Evaluation | Add expected-answer, unsupported-question, tool-use, and safety cases with clear thresholds |
| Operations | Define telemetry, latency/error budgets, cost limits, and cleanup ownership |

Saving `custom-agents/shopper-agent-instructions.md` no mean say di sample go load am. Find di app code wey create/update di agent, connect your reviewed instructions there, and confirm di agent version wey e produce before you test. Instruction no fit give access to data or tools wey you never implement.

Apply one change at a time, redeploy di parts wey di change affect, then run your baseline questions and evaluations again. Keep working revision to compare. For architecture idea, see [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), but e no be complete retail app too.

!!! quote "BY DI TIME YOU FINISH DIS LAB, YOU SUPPOSE GET"

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
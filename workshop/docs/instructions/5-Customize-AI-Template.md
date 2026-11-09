# 5. Customize a Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Establish a baseline

Use the initialized [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repository from the previous modules. Record the template revision, AZD version, selected environment, model deployment, and working sample questions before changing anything.

The sample implements an agent-backed chat application. It does **not** become a two-agent retail system simply by setting environment variables or saving additional instruction files. Extra agents, tool handlers, routing, authorization, and data access require application code.

Inspect the currently deployed agent's instructions and tools in Foundry. Test one factual question, one retrieval question, and one question the sample data cannot answer. Verify citations against the actual source documents rather than assuming a fluent response is correct.

## 5.2 Customize knowledge retrieval

The template supports file-based retrieval and optional Azure AI Search integration. Follow the [current AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) for indexing and tool configuration.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Enabling the service is only one part of retrieval. Before uploading your own data:

1. Confirm you have permission to use the documents and remove sensitive information.
2. Select an embedding model supported in your region and set its compatible version, deployment type, and vector dimensions.
3. Create/populate the index using the sample's documented process.
4. Configure the agent's retrieval tool to use that index.
5. Test retrieval, citations, authorization, and behavior when no relevant document exists.

Do not switch from `text-embedding-3-small` to a different embedding model without checking dimensions and rebuilding/reindexing vectors as needed. A name such as `retail-products` is not an implemented catalog or an access-control policy.

## 5.3 Tracing and monitoring

Follow the [sample's observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Ensure the required Application Insights resource and connection already exist; if changing infrastructure settings, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Send a test request, then inspect the Container App's application logs and the agent's tracing view in Foundry. Check latency, tool calls, errors, and correlation between the request and trace. Do not assume telemetry is connected solely because deployment succeeded.

Leave `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` disabled unless you have explicitly reviewed consent, redaction, retention, and access controls. Traces can contain sensitive tool arguments or document content even when ordinary application logs look harmless.

## 5.4 Agent evaluation

The sample's evaluation entry point is now [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), not an `evals/` directory. From the sample root, use a Python environment that meets its documented requirements:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Before running, complete the [evaluation prerequisites](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). The tests load configuration from the selected `.azure/<environment>/.env`; confirm the intended environment is selected. Important inputs include:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, using the format required by the current sample (the reviewed version uses `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, used as the judge-model deployment

Inspect the tests to understand evaluator choice, thresholds, required roles, and model costs. A completed run is not automatically a passing quality gate; inspect scores, failed/errored cases, and the linked Foundry results.

### Separate AZD evaluations extension

The Python test above is a **sample-specific workflow**. The optional `azure.ai.evaluations` extension is a different workflow, with its own `evals/azure.eval.yaml` configuration. It is installed separately, not included in the generally available `microsoft.foundry` 1.0 bundle:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

For a complete extension setup, see [evaluation workflows and migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Since agents extension beta.22, do not use the removed `azd ai agent eval` commands. Installing the evaluations extension does not convert the sample's Python tests or automatically create an evaluation configuration.

For a separate **GA hosted-agent exercise**, use an empty folder outside this workshop's sample and follow the [Foundry local-to-cloud walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). It uses AZD 1.37.0+, the `microsoft.foundry` bundle, Python 3.13+, and current uv. You will inspect `azure.yaml`, test locally with Agent Inspector, deploy source for a remote Foundry build, and generate/review a dataset and rubric before configuring `azd ai eval init --name quality`. Do not replace this sample's tests or assume installing the bundle changes its hosting model.

## 5.5 AI red teaming and continuous evaluation

The current sample provides [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete its prerequisites and review the intended target and costs before running:

```bash
pytest tests/test_red_teaming.py -s
```

Use an authorized test deployment and synthetic data. Review the generated attacks and results; this scan does not establish that an application is secure or compliant.

The [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) also describes continuous evaluation configured at container startup. It evaluates real user interactions, not generated test traffic, and evaluator support varies by region. No interactions means no evaluation entries. Verify the installed sample version and evaluator configuration instead of assuming every deployment has the same defaults.

Authentication is separate from evaluation. Follow the sample's documented identity/access setup. There is no documented “basic auth fallback” to rely on for protecting a public endpoint.

## 5.6 Design exercise: retail customization

!!! warning "Design exercise, not a completed deployment"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Write a short plan addressing:

| Area | Decision and evidence to collect |
|------|----------------------------------|
| Agent responsibilities | Start with one agent, or justify separate Shopper and Loyalty agents and routing logic |
| Data | Define a synthetic catalog/rewards dataset and ownership of updates |
| Tools | Implement read-only handlers first; specify authorization and validation for any writes |
| Models | Choose available model/version/SKU combinations and verify quota; avoid provisioning unused models |
| Retrieval | Define indexing, embedding dimensions, citations, and document-level access controls |
| Evaluation | Add expected-answer, unsupported-question, tool-use, and safety cases with explicit thresholds |
| Operations | Define telemetry, latency/error budgets, cost limits, and cleanup ownership |

Saving `custom-agents/shopper-agent-instructions.md` does not cause the sample to load it. Find the application code that creates/updates the agent, connect your reviewed instructions there, and verify the resulting agent version before testing. Instructions cannot grant access to data or tools that you have not implemented.

Apply one change at a time, redeploy the affected components, and rerun your baseline questions and evaluations. Keep a working revision for comparison. For architecture inspiration, see the [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), which is also not a complete retail application.

!!! quote "BY THE END OF THIS LAB YOU SHOULD HAVE"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continue to [Teardown Infrastructure](6-Teardown-Infrastructure.md).

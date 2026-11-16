# Examples — English Source and Azure Samples

Dis na learning samples, no be production-certified applications. Read every
example prerequisites, limitations, costs, and cleanup instructions before
you run commands. You gats check Azure availability and quotas for your subscription.

- [Course home](../README.md)
- [Installation](../docs/chapter-01-foundation/installation.md)
- [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

## Wetin actually dey for local

E get **four application samples** and **one infrastructure scaffold**:

| Example | Local implementation | Learning focus | Level |
|---|---|---|---|
| [Simple Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Container deployment, probes, logs | Beginner |
| [Two-service microservices](../../../examples/container-app/microservices) | Node.js gateway and read-only Python product service, Dockerfiles, Bicep, `azure.yaml` | Internal HTTPS communication, independent scaling | Intermediate |
| [Database app](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL connectivity, initialization, logs | Intermediate |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Local Python CLI, Azure OpenAI and Key Vault Bicep, infrastructure-only `azure.yaml` | Model provisioning, chat history, token estimates | Intermediate |
| [Retail infrastructure](../../../examples/retail-multiagent-arm-template) | ARM template, parameters, Bash deployment script; **hello-world containers only** | Infrastructure for a future multi-agent application | Advanced |

The [retail scenario](retail-scenario.md) na **architecture blueprint**, no be
complete multi-agent implementation. No retail agent code, chat frontend, router
API, search data pipeline, evaluation CLI, automatic failover, or production
hardening dey inside. Dem must design, build, and test separate separate.

The [microservices overview](microservices/README.md) dey point to the runnable
two-service sample; e no be another deployment folder.

## Recommended learning path

1. Deploy the Flask API and check `/health` and CRUD operations.
2. Deploy the database app and check the five seeded products inside.
3. Deploy the two-service example and check gateway-to-product requests.
4. Provision the chat resources and run the interactive CLI **locally**.
5. Study the retail blueprint after you don finish the working examples.

Allow about 30–60 minutes per application sample including prerequisites and
verification. Retail implementation na separate development project, no be
30-minute workshop. To read the architecture, e go take about 2–3 hours; implementation
and production readiness fit take well pass the example
80–120 development hours wey dey for the guide.

## Quick start

From the repository root, for the first container sample:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Wetin you expect: HTTP 200 and JSON wey get `"status": "healthy"`.
You gats make Docker dey run for the local container build.

For chat, follow the [chat README](azure-openai-chat/README.md): use
`azd provision`, load the API key from Key Vault inside the current shell, install
`src/requirements.txt`, and run `python src/chat.py`. No hosting chat service dey.

For retail, use the [ARM guide](retail-multiagent-arm-template/README.md).
E no get `azure.yaml` and e **no** dey deployed or removed by `azd up`/`azd down`.

## Costs and limitations

- All deployments go create billable Azure resources. Scale-to-zero e dey only apply to
  app compute; e no go clear registry, database, storage, search, or log costs.
- Exact prices depend on region, currency, traffic, model/SKU, and retention.
  Use the [Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/)
  before deployment and arrange budget for Azure Cost Management.
- Flask CRUD data dey inside memory, e limit to one worker and maximum one replica by
  default. E go disappear if you restart or scale-to-zero. Dis no be durable storage.
- The product microservice dey expose only GET endpoints. No order service, user
  service, database, Service Bus, C#, or Go implementation dey inside.
- Application Insights resources no automatically dey instrument every application.
  Check each example for the telemetry wey dem really dey emit.
- Samples no implement application authentication. Add identity, authorization,
  persistent storage, network controls, tests, and operational procedures before production.

## External Azure Samples — clone separately

Dis links na references to separate repositories, **no be local examples**.
Their maintainers get full control of setup instructions, implementation, dependencies, and costs.

| Sample | Focus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js application with database |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# and Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Static frontend with C# Functions and SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python serverless application |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Containerized store backend |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chat application |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent application |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG with search and citations |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Conversational AI sample |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java microservices |

Find more projects for the [AZD template gallery](https://azure.github.io/awesome-azd/).
No assume say external project de support `azd` without you check the current README.

## Repository structure

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

No shared `configurations/`, `scripts/`, or test directory dey promised by
dis index. Actual files and optional extension ideas dey inside each guide.

## Cleanup

For the four AZD samples, run dis **from the selected sample directory**:

```bash
azd down
```

Look the deletion prompt well well. For retail, delete only the dedicated resource group
wey you create, using the instructions wey dey inside the ARM guide. Check Azure Cost Management
after cleanup; billing data fit still reach later.

## Contributing

Include source, infrastructure, deployment configuration, clear setup and
verification steps, limitations, and cleanup instructions for every application
sample. Tag architecture-only materials and incomplete snippets clear clear.
No talk say e ready for production without deployment, functional, and operational tests.

[FAQ](../resources/faq.md) · [Study guide](../resources/study-guide.md) ·
[Report an issue](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
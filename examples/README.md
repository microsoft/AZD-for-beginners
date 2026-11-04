# Examples — English Source and Azure Samples

These are learning samples, not production-certified applications. Read each
example's prerequisites, limitations, costs, and cleanup instructions before
running commands. Azure availability and quotas must be checked in your subscription.

- [Course home](../README.md)
- [Installation](../docs/chapter-01-foundation/installation.md)
- [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

## What actually exists locally

There are **four application samples** and **one infrastructure scaffold**:

| Example | Local implementation | Learning focus | Level |
|---|---|---|---|
| [Simple Flask API](container-app/simple-flask-api/) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Container deployment, probes, logs | Beginner |
| [Two-service microservices](container-app/microservices/) | Node.js gateway and read-only Python product service, Dockerfiles, Bicep, `azure.yaml` | Internal HTTPS communication, independent scaling | Intermediate |
| [Database app](database-app/) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL connectivity, initialization, logs | Intermediate |
| [Azure OpenAI chat](azure-openai-chat/) | Local Python CLI, Azure OpenAI and Key Vault Bicep, infrastructure-only `azure.yaml` | Model provisioning, chat history, token estimates | Intermediate |
| [Retail infrastructure](retail-multiagent-arm-template/) | ARM template, parameters, Bash deployment script; **hello-world containers only** | Infrastructure for a future multi-agent application | Advanced |

The [retail scenario](retail-scenario.md) is an **architecture blueprint**, not a
complete multi-agent implementation. No retail agent code, chat frontend, router
API, search data pipeline, evaluation CLI, automatic failover, or production
hardening is included. These must be designed, built, and tested separately.

The [microservices overview](microservices/README.md) points to the runnable
two-service sample; it is not another deployment directory.

## Recommended learning path

1. Deploy the Flask API and verify `/health` and CRUD operations.
2. Deploy the database app and verify its five seeded products.
3. Deploy the two-service example and verify gateway-to-product requests.
4. Provision the chat resources and run the interactive CLI **locally**.
5. Study the retail blueprint after completing working examples.

Allow roughly 30–60 minutes per application sample including prerequisites and
verification. Retail implementation is a separate development project, not a
30-minute workshop. Reading its architecture takes about 2–3 hours; implementation
and production readiness can take substantially longer than the illustrative
80–120 development hours in the guide.

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

Expected: HTTP 200 and JSON containing `"status": "healthy"`.
You need Docker running for the local container build.

For chat, follow the [chat README](azure-openai-chat/README.md): use
`azd provision`, load the API key from Key Vault into the current shell, install
`src/requirements.txt`, and run `python src/chat.py`. There is no hosted chat service.

For retail, use the [ARM guide](retail-multiagent-arm-template/README.md).
It has no `azure.yaml` and is **not** deployed or removed by `azd up`/`azd down`.

## Costs and limitations

- All deployments create billable Azure resources. Scale-to-zero only applies to
  app compute; it does not eliminate registry, database, storage, search, or log costs.
- Exact prices depend on region, currency, traffic, model/SKU, and retention.
  Use the [Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/)
  before deployment and configure a budget in Azure Cost Management.
- Flask CRUD data is in memory, limited to one worker and at most one replica by
  default. It disappears on restart or scale-to-zero. This is not durable storage.
- The product microservice exposes GET endpoints only. No order service, user
  service, database, Service Bus, C#, or Go implementation is included.
- Application Insights resources do not automatically instrument every application.
  Consult each example for the telemetry actually emitted.
- Samples do not implement application authentication. Add identity, authorization,
  persistent storage, network controls, tests, and operational procedures before production.

## External Azure Samples — clone separately

These links are references to separate repositories, **not local examples**.
Their maintainers own setup instructions, implementation, dependencies, and costs.

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

Discover more projects in the [AZD template gallery](https://azure.github.io/awesome-azd/).
Do not assume an external project supports `azd` without checking its current README.

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

There is no shared `configurations/`, `scripts/`, or test directory promised by
this index. Actual files and optional extension ideas are identified in each guide.

## Cleanup

For the four AZD samples, run this **from the selected sample directory**:

```bash
azd down
```

Review the deletion prompt. For retail, delete only the dedicated resource group
you created, using the instructions in its ARM guide. Check Azure Cost Management
after cleanup; billing data can arrive later.

## Contributing

Include source, infrastructure, deployment configuration, actionable setup and
verification steps, limitations, and cleanup instructions with each application
sample. Label architecture-only material and incomplete snippets explicitly.
Do not claim production readiness without deployment, functional, and operational tests.

[FAQ](../resources/faq.md) · [Study guide](../resources/study-guide.md) ·
[Report an issue](https://github.com/microsoft/AZD-for-beginners/issues)

# Mga Halimbawa — Pinagmulan ng Ingles at Mga Sample ng Azure

Ito ay mga sample para sa pag-aaral, hindi mga sertipikadong aplikasyon para sa produksyon. Basahin ang
mga kinakailangan, limitasyon, gastos, at mga tagubilin sa paglilinis ng bawat halimbawa bago
patakbuhin ang mga utos. Kailangang suriin ang availability at quota ng Azure sa iyong subscription.

- [Pahina ng kurso](../README.md)
- [Pag-install](../docs/chapter-01-foundation/installation.md)
- [Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md)

## Ano talaga ang nasa lokal

Mayroong **apat na sample ng aplikasyon** at **isang infrastructure scaffold**:

| Halimbawa | Lokal na implementasyon | Pokus sa pag-aaral | Antas |
|---|---|---|---|
| [Simpleng Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Pag-deploy ng container, probes, log | Baguhan |
| [Dalawang-serbisyong microservices](../../../examples/container-app/microservices) | Node.js gateway at read-only na Python na serbisyo ng produkto, Dockerfiles, Bicep, `azure.yaml` | Internal HTTPS na komunikasyon, independiyenteng scaling | Intermediate |
| [Database app](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL connectivity, initialization, log | Intermediate |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Lokal na Python CLI, Azure OpenAI at Key Vault Bicep, infrastructure lamang `azure.yaml` | Provisioning ng modelo, kasaysayan ng chat, pagtatantiya ng token | Intermediate |
| [Retail infrastructure](../../../examples/retail-multiagent-arm-template) | ARM template, parameters, Bash deployment script; **mga hello-world container lamang** | Imprastruktura para sa isang hinaharap na multi-agent na aplikasyon | Advanced |

Ang [retail scenario](retail-scenario.md) ay isang **blueprint ng arkitektura**, hindi isang
kumpletong multi-agent na implementasyon. Walang code ng retail agent, chat frontend, router
API, search data pipeline, evaluation CLI, automatic failover, o production
hardening na kasama. Kailangang idisenyo, buuin, at subukan ito nang hiwalay.

Ang [microservices overview](microservices/README.md) ay nagtuturo sa runnable
dalawang-serbisyo sample; hindi ito isa pang direktoryo ng deployment.

## Inirerekomendang landas ng pag-aaral

1. I-deploy ang Flask API at i-verify ang `/health` at mga CRUD na operasyon.
2. I-deploy ang database app at i-verify ang limang naka-seed na produkto nito.
3. I-deploy ang dalawang-serbisyo na halimbawa at i-verify ang mga request mula gateway papuntang produkto.
4. I-provision ang mga chat resources at patakbuhin ang interactive CLI **lokal**.
5. Pag-aralan ang retail blueprint pagkatapos makumpleto ang mga gumaganang halimbawa.

Maglaan ng humigit-kumulang 30–60 minuto bawat sample ng aplikasyon kasama ang mga kinakailangan at
beripikasyon. Ang retail implementation ay isang hiwalay na proyekto ng pag-develop, hindi isang
30-minutong workshop. Ang pagbabasa ng arkitektura nito ay tumatagal ng mga 2–3 oras; ang implementasyon
at kahandaan sa produksyon ay maaaring tumagal nang mas matagal kaysa sa ilustratibong
80–120 oras ng pag-develop sa gabay.

## Mabilis na panimula

Mula sa root ng repository, para sa unang sample ng container:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Inaasahan: HTTP 200 at JSON na naglalaman ng `"status": "healthy"`.
Kailangan ng Docker na tumakbo para sa lokal na pagbuo ng container.

Para sa chat, sundin ang [chat README](azure-openai-chat/README.md): gamitin ang
`azd provision`, i-load ang API key mula sa Key Vault papunta sa kasalukuyang shell, i-install ang
`src/requirements.txt`, at patakbuhin ang `python src/chat.py`. Walang hosted chat service.

Para sa retail, gamitin ang [ARM guide](retail-multiagent-arm-template/README.md).
Wala itong `azure.yaml` at **hindi** ito na-de-deploy o tinatanggal gamit ang `azd up`/`azd down`.

## Mga gastos at limitasyon

- Lahat ng deployment ay lumilikha ng mga billable na Azure resources. Ang scale-to-zero ay naaangkop lamang sa
  app compute; hindi nito inaalis ang mga gastos sa registry, database, storage, search, o log.
- Ang mga eksaktong presyo ay depende sa rehiyon, pera, trapiko, modelo/SKU, at retention.
  Gamitin ang [Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/)
  bago mag-deploy at mag-configure ng budget sa Azure Cost Management.
- Ang Flask CRUD data ay nasa memorya, limitado sa isang worker at hindi hihigit sa isang replica bilang
  default. Nawawala ito kapag ni-restart o nag-scale-to-zero. Hindi ito durable storage.
- Ang product microservice ay naglalabas lang ng GET endpoints. Walang order service, user
  service, database, Service Bus, C#, o Go implementasyon na kasama.
- Hindi awtomatikong ine-instrument ng Application Insights resources ang bawat aplikasyon.
  Suriin ang bawat halimbawa para sa telemetry na aktwal na inilalabas.
- Hindi nag-iimplementa ng application authentication ang mga sample. Magdagdag ng identity, authorization,
  persistent storage, network controls, tests, at operational procedures bago ang produksyon.

## Mga Panlabas na Sample ng Azure — i-clone nang hiwalay

Ang mga link na ito ay mga reperensiya sa hiwalay na mga repository, **hindi mga lokal na halimbawa**.
Ang mga tagapangasiwa nila ang may hawak ng mga tagubilin sa setup, implementasyon, dependencies, at gastos.

| Sample | Pokus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js na aplikasyon na may database |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# at Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Static frontend na may C# Functions at SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python na serverless na aplikasyon |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Containerized na store backend |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chat na aplikasyon |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplikasyon ng agent |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG na may search at citations |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Halimbawa ng conversational AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java microservices |

Tuklasin ang mas maraming proyekto sa [AZD template gallery](https://azure.github.io/awesome-azd/).
Huwag ipagpalagay na sinusuportahan ng panlabas na proyekto ang `azd` nang hindi tse-tsek ang kasalukuyang README nito.

## Istruktura ng Repositoryo

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

Walang pinagsasaluhang `configurations/`, `scripts/`, o test directory na ipinangako ng
index na ito. Ang aktwal na mga file at opsyonal na mga ideya para sa extension ay tinutukoy sa bawat gabay.

## Paglilinis

Para sa apat na AZD samples, patakbuhin ito **mula sa napiling direktoryo ng sample**:

```bash
azd down
```

Suriin ang prompt para sa pagtanggal. Para sa retail, tanggalin lamang ang dedikadong resource group
na nilikha mo, gamit ang mga tagubilin sa ARM guide nito. Suriin ang Azure Cost Management
pagkatapos ng paglilinis; maaaring dumating ang billing data nang mas huli.

## Pag-aambag

Isama ang source, infrastructure, deployment configuration, mga gagawing hakbang sa setup at
beripikasyon, mga limitasyon, at mga tagubilin sa paglilinis sa bawat sample ng aplikasyon.
Lagyan ng label nang malinaw ang mga materyal na arkitektura lamang at hindi kumpletong mga snippet.
Huwag ipagmalaki ang kahandaan sa produksyon nang walang deployment, functional, at operational na mga pagsusuri.

[FAQ](../resources/faq.md) · [Gabay sa pag-aaral](../resources/study-guide.md) ·
[I-report ang isang isyu](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
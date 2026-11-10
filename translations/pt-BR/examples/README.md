# Exemplos — Fonte em Inglês e Amostras do Azure

Estes são exemplos para aprendizado, não aplicações certificadas para produção. Leia os pré-requisitos,
limitações, custos e instruções de limpeza de cada exemplo antes de executar os comandos.
A disponibilidade e cotas do Azure devem ser verificadas na sua assinatura.

- [Página inicial do curso](../README.md)
- [Instalação](../docs/chapter-01-foundation/installation.md)
- [Solução de problemas](../docs/chapter-07-troubleshooting/common-issues.md)

## O que existe localmente

Existem **quatro exemplos de aplicação** e **uma estrutura de infraestrutura**:

| Exemplo | Implementação local | Foco de aprendizado | Nível |
|---|---|---|---|
| [API Flask simples](../../../examples/container-app/simple-flask-api) | API CRUD Flask, Dockerfile, Bicep, `azure.yaml` | Implantação de contêiner, sondas, logs | Iniciante |
| [Microsserviços com dois serviços](../../../examples/container-app/microservices) | Gateway Node.js e serviço Python somente leitura, Dockerfiles, Bicep, `azure.yaml` | Comunicação HTTPS interna, escala independente | Intermediário |
| [Aplicação com banco de dados](../../../examples/database-app) | API Flask de leitura, Azure SQL, App Service, Bicep, `azure.yaml` | Conectividade SQL, inicialização, logs | Intermediário |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python local, Azure OpenAI e Key Vault Bicep, somente infraestrutura `azure.yaml` | Provisionamento de modelo, histórico de chat, estimativas de tokens | Intermediário |
| [Infraestrutura de varejo](../../../examples/retail-multiagent-arm-template) | Template ARM, parâmetros, script Bash de implantação; **somente contêineres hello-world** | Infraestrutura para aplicação multi-agente futura | Avançado |

O [cenário de varejo](retail-scenario.md) é um **modelo de arquitetura**, não uma
implementação completa multi-agente. Não inclui código de agentes de varejo, frontend de chat,
API de roteador, pipeline de dados de pesquisa, CLI de avaliação, failover automático ou
endurecimento para produção. Estes devem ser projetados, construídos e testados separadamente.

A [visão geral dos microsserviços](microservices/README.md) aponta para o exemplo executável
de dois serviços; não é outro diretório de implantação.

## Caminho de aprendizado recomendado

1. Implemente a API Flask e verifique `/health` e operações CRUD.
2. Implemente o aplicativo de banco de dados e verifique os cinco produtos semeados.
3. Implemente o exemplo com dois serviços e verifique as requisições gateway-para-produto.
4. Provisione os recursos de chat e execute a CLI interativa **localmente**.
5. Estude o modelo de varejo após concluir os exemplos funcionais.

Reserve cerca de 30–60 minutos por exemplo de aplicação incluindo pré-requisitos e
verificação. A implementação de varejo é um projeto de desenvolvimento separado, não
um workshop de 30 minutos. A leitura da arquitetura leva cerca de 2–3 horas;
implementação e prontidão para produção podem levar substancialmente mais que as
ilustrativas 80–120 horas de desenvolvimento no guia.

## Início rápido

A partir da raiz do repositório, para o primeiro exemplo de contêiner:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Esperado: HTTP 200 e JSON contendo `"status": "healthy"`.
Você precisa do Docker em execução para a construção local do contêiner.

Para chat, siga o [README do chat](azure-openai-chat/README.md): use
`azd provision`, carregue a chave da API do Key Vault no shell atual, instale
`src/requirements.txt`, e execute `python src/chat.py`. Não há serviço de chat hospedado.

Para varejo, use o [guia ARM](retail-multiagent-arm-template/README.md).
Não possui `azure.yaml` e **não** é implantado ou removido por `azd up`/`azd down`.

## Custos e limitações

- Todas as implantações criam recursos Azure faturáveis. Escala-zero se aplica apenas ao
  cálculo de aplicativos; isso não elimina custos de registro, banco de dados, armazenamento, pesquisa ou logs.
- Preços exatos dependem de região, moeda, tráfego, modelo/SKU e retenção.
  Use a [calculadora de preços do Azure](https://azure.microsoft.com/pricing/calculator/)
  antes da implantação e configure um orçamento no Azure Cost Management.
- Os dados CRUD do Flask estão na memória, limitados a um trabalhador e no máximo uma réplica por
  padrão. Eles desaparecem na reinicialização ou escala-zero. Isto não é armazenamento durável.
- O microsserviço do produto expõe somente endpoints GET. Não inclui serviço de pedidos, serviço de usuários,
  banco de dados, Service Bus, implementação em C# ou Go.
- Os recursos do Application Insights não instrumentam automaticamente todas as aplicações.
  Consulte cada exemplo para a telemetria realmente emitida.
- Os exemplos não implementam autenticação de aplicação. Adicione identidade, autorização,
  armazenamento persistente, controles de rede, testes e procedimentos operacionais antes da produção.

## Amostras externas do Azure — clonar separadamente

Estes links são referências a repositórios separados, **não exemplos locais**.
Seus mantenedores são responsáveis por instruções de configuração, implementação, dependências e custos.

| Amostra | Foco |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplicação Node.js com banco de dados |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# e Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend estático com C# Functions e SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Aplicação serverless Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend de loja conteinerizado |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplicação de chat de IA |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplicação de agentes |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG com pesquisa e citações |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Exemplo de IA conversacional |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microsserviços Java |

Descubra mais projetos na [galeria de templates AZD](https://azure.github.io/awesome-azd/).
Não assuma que um projeto externo suporta `azd` sem verificar seu README atual.

## Estrutura do repositório

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

Não há nenhum diretório compartilhado `configurations/`, `scripts/` ou de testes prometido por
este índice. Arquivos reais e ideias opcionais de extensão são identificados em cada guia.

## Limpeza

Para as quatro amostras AZD, execute isto **do diretório da amostra selecionada**:

```bash
azd down
```

Revise o prompt de exclusão. Para varejo, exclua somente o grupo de recursos dedicado
que você criou, usando as instruções em seu guia ARM. Verifique o Azure Cost Management
após a limpeza; dados de cobrança podem chegar depois.

## Contribuindo

Inclua fonte, infraestrutura, configuração de implantação, passos acionáveis de configuração e
verificação, limitações e instruções de limpeza com cada exemplo de aplicação.
Rotule explicitamente material somente de arquitetura e trechos incompletos.
Não declare prontidão para produção sem testes de implantação, funcionais e operacionais.

[FAQ](../resources/faq.md) · [Guia de estudo](../resources/study-guide.md) ·
[Reportar um problema](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
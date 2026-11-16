# Exemplos — Origem em Inglês e Amostras Azure

Estes são exemplos para aprendizagem, não aplicações certificadas para produção. Leia os
pré-requisitos, limitações, custos e instruções de limpeza de cada exemplo antes de
executar comandos. Deve verificar a disponibilidade e quotas do Azure na sua subscrição.

- [Página do curso](../README.md)
- [Instalação](../docs/chapter-01-foundation/installation.md)
- [Resolução de problemas](../docs/chapter-07-troubleshooting/common-issues.md)

## O que existe realmente localmente

Existem **quatro exemplos de aplicações** e **uma estrutura de infraestrutura**:

| Exemplo | Implementação local | Foco de aprendizagem | Nível |
|---|---|---|---|
| [API Flask simples](../../../examples/container-app/simple-flask-api) | API CRUD Flask, Dockerfile, Bicep, `azure.yaml` | Implantação de containers, sondas, logs | Iniciante |
| [Microserviços com dois serviços](../../../examples/container-app/microservices) | Gateway Node.js e serviço de produto só de leitura Python, Dockerfiles, Bicep, `azure.yaml` | Comunicação HTTPS interna, escalabilidade independente | Intermédio |
| [Aplicação com base de dados](../../../examples/database-app) | API Flask de leitura, Azure SQL, App Service, Bicep, `azure.yaml` | Conectividade SQL, inicialização, logs | Intermédio |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python local, Azure OpenAI e Key Vault Bicep, infraestrutura apenas `azure.yaml` | Aprovisionamento de modelos, histórico de chat, estimativas de tokens | Intermédio |
| [Infraestrutura para retalho](../../../examples/retail-multiagent-arm-template) | Template ARM, parâmetros, script de implantação Bash; **apenas containers hello-world** | Infraestrutura para uma aplicação multi-agente futura | Avançado |

O [cenário de retalho](retail-scenario.md) é uma **planta arquitetónica**, não uma
implementação multi-agente completa. Não inclui código de agente de retalho, frontend de chat,
API do router, pipeline de pesquisa de dados, CLI de avaliação, failover automático nem
endurecimento para produção. Estes devem ser desenhados, construídos e testados separadamente.

A [visão geral dos microserviços](microservices/README.md) aponta para o exemplo executável dos dois serviços;
não é outro diretório de implantação.

## Caminho de aprendizagem recomendado

1. Implante a API Flask e verifique `/health` e operações CRUD.
2. Implante a aplicação com base de dados e verifique os seus cinco produtos pré-criados.
3. Implante o exemplo com dois serviços e verifique os pedidos do gateway ao serviço de produto.
4. Provisionar os recursos do chat e execute a CLI interativa **localmente**.
5. Estude a planta arquitetónica do retalho após completar os exemplos funcionais.

Reserve aproximadamente 30–60 minutos por exemplo de aplicação, incluindo pré-requisitos e
verificação. A implementação para retalho é um projeto de desenvolvimento separado, não um
workshop de 30 minutos. A leitura da sua arquitetura demora cerca de 2–3 horas; a implementação
e preparação para produção podem levar substancialmente mais do que as ilustrativas
80–120 horas de desenvolvimento indicadas no guia.

## Início rápido

A partir da raiz do repositório, para o primeiro exemplo de container:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Esperado: HTTP 200 e JSON contendo `"status": "healthy"`.
Precisa de ter o Docker a correr para construir o container localmente.

Para chat, siga o [README do chat](azure-openai-chat/README.md): use
`azd provision`, carregue a chave API do Key Vault para a shell atual, instale
`src/requirements.txt`, e execute `python src/chat.py`. Não existe um serviço de chat alojado.

Para retalho, utilize o [guia ARM](retail-multiagent-arm-template/README.md).
Não tem `azure.yaml` e **não** é implantado nem removido por `azd up`/`azd down`.

## Custos e limitações

- Todas as implantações criam recursos Azure faturáveis. A escala até zero aplica-se apenas ao
  cálculo da aplicação; não elimina custos de registo, base de dados, armazenamento, pesquisa ou logs.
- Os preços exatos dependem da região, moeda, tráfego, modelo/SKU e retenção.
  Use a [calculadora de preços Azure](https://azure.microsoft.com/pricing/calculator/)
  antes da implantação e configure um orçamento no Azure Cost Management.
- Os dados CRUD do Flask ficam em memória, limitados a um trabalhador e no máximo uma réplica por
  defeito. Desaparecem na reinicialização ou escala para zero. Isto não é armazenamento durável.
- O microserviço de produto expõe apenas endpoints GET. Não inclui serviço de encomendas, serviço de
  utilizadores, base de dados, Service Bus, implementações em C# ou Go.
- Os recursos Application Insights não instrumentam automaticamente todas as aplicações.
  Consulte cada exemplo para a telemetria realmente emitida.
- Os exemplos não implementam autenticação de aplicação. Adicione identidade, autorização,
  armazenamento persistente, controlos de rede, testes e procedimentos operacionais antes da produção.

## Amostras Azure externas — clone separadamente

Estes links referem-se a repositórios separados, **não exemplos locais**.
Os mantenedores deles são responsáveis pelas instruções de configuração, implementação, dependências e custos.

| Exemplo | Foco |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplicação Node.js com base de dados |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# e Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend estático com Funções C# e SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Aplicação serverless Python |
| [API de loja Container Apps](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend de loja conteinerizado |
| [Início rápido chat IA](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplicação de chat IA |
| [Início rápido agentes IA](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplicação de agente |
| [Demonstração Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG com pesquisa e citações |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Exemplo de IA conversacional |
| [Java em Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microserviços Java |

Descubra mais projetos na [galeria de modelos AZD](https://azure.github.io/awesome-azd/).
Não presuma que um projeto externo suporta `azd` sem verificar o seu README atual.

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

Não existe nenhum diretório partilhado `configurations/`, `scripts/` ou de testes prometido
por este índice. Ficheiros reais e ideias opcionais de extensão são identificados em cada guia.

## Limpeza

Para os quatro exemplos AZD, execute isto **a partir do diretório do exemplo selecionado**:

```bash
azd down
```

Reveja o pedido de confirmação de eliminação. Para retalho, apague apenas o grupo de recursos
dedicado que criou, usando as instruções do seu guia ARM. Verifique o Azure Cost Management
após a limpeza; os dados de faturação podem chegar mais tarde.

## Contribuir

Inclua código-fonte, infraestrutura, configuração de implantação, etapas de configuração prática e
verificação, limitações e instruções de limpeza com cada exemplo de aplicação.
Etiquete explicitamente material apenas de arquitetura e fragmentos incompletos.
Não afirme prontidão para produção sem testes de implantação, funcionais e operacionais.

[FAQ](../resources/faq.md) · [Guia de estudo](../resources/study-guide.md) ·
[Reportar um problema](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
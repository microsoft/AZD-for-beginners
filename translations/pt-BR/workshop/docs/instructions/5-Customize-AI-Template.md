# 5. Personalize um Template

!!! tip "AO FINAL DESTE MÓDULO, VOCÊ SERÁ CAPAZ DE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Estabelecer uma linha de base

Use o repositório inicializado [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dos módulos anteriores. Registre a revisão do template, a versão do AZD, o ambiente selecionado, a implantação do modelo e as perguntas de amostra funcionais antes de alterar qualquer coisa.

A amostra implementa um aplicativo de chat sustentado por agente. Ele **não** se torna um sistema de varejo com dois agentes simplesmente configurando variáveis de ambiente ou salvando arquivos adicionais de instrução. Agentes extras, manipuladores de ferramentas, roteamento, autorização e acesso a dados exigem código de aplicação.

Inspecione as instruções e as ferramentas do agente atualmente implantado no Foundry. Teste uma pergunta factual, uma pergunta de recuperação e uma pergunta que os dados de amostra não podem responder. Verifique as citações contra os documentos-fonte reais em vez de assumir que uma resposta fluente é correta.

## 5.2 Personalize a recuperação do conhecimento

O template suporta recuperação baseada em arquivos e integração opcional com Azure AI Search. Siga o [guia atual do AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para indexação e configuração da ferramenta.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Habilitar o serviço é apenas uma parte da recuperação. Antes de carregar seus próprios dados:

1. Confirme que você tem permissão para usar os documentos e remova informações sensíveis.
2. Selecione um modelo de incorporação suportado em sua região e defina sua versão compatível, tipo de implantação e dimensões vetoriais.
3. Crie/popule o índice usando o processo documentado da amostra.
4. Configure a ferramenta de recuperação do agente para usar esse índice.
5. Teste a recuperação, citações, autorização e comportamento quando nenhum documento relevante existir.

Não troque de `text-embedding-3-small` para um modelo de incorporação diferente sem verificar as dimensões e reconstruir/reindexar os vetores conforme necessário. Um nome como `retail-products` não é um catálogo implementado nem uma política de controle de acesso.

## 5.3 Rastreamento e monitoramento

Siga o [guia de observabilidade da amostra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assegure-se de que o recurso Application Insights necessário e a conexão já existam; se estiver alterando configurações de infraestrutura, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envie uma solicitação de teste, depois inspecione os logs da aplicação do Container App e a visualização de rastreamento do agente no Foundry. Verifique a latência, chamadas de ferramenta, erros e a correlação entre a solicitação e o rastreamento. Não presuma que a telemetria está conectada apenas porque a implantação foi bem-sucedida.

Deixe `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` desativado a menos que você tenha analisado explicitamente consentimento, redação, retenção e controles de acesso. Os rastreamentos podem conter argumentos sensíveis de ferramentas ou conteúdo de documentos mesmo quando os logs de aplicação comuns parecem inofensivos.

## 5.4 Avaliação do agente

O ponto de entrada para avaliação da amostra agora é [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), não um diretório `evals/`. A partir da raiz da amostra, use um ambiente Python que atenda aos seus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de executar, complete os [pré-requisitos da avaliação](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Os testes carregam a configuração do `.azure/<environment>/.env` selecionado; confirme que o ambiente pretendido está selecionado. Entradas importantes incluem:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando o formato exigido pela amostra atual (a versão revisada usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como implantação do modelo juiz

Inspecione os testes para entender a escolha do avaliador, limites, regras necessárias e custos do modelo. Uma execução completa não é automaticamente uma aprovação; inspecione pontuações, casos falhados/erro e os resultados vinculados no Foundry.

### Extensão separada de avaliações AZD

O teste Python acima é um **fluxo de trabalho específico da amostra**. A extensão `azure.ai.evaluations` opcional é um fluxo de trabalho diferente, com sua própria configuração `evals/azure.eval.yaml`. Ela é instalada separadamente, não incluída no pacote `microsoft.foundry` 1.0 geralmente disponível:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para uma configuração completa da extensão, veja [fluxos de trabalho de avaliação e migração](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde a versão beta.22 da extensão agentes, não use os comandos `azd ai agent eval` removidos. Instalar a extensão de avaliações não converte os testes Python da amostra nem cria automaticamente uma configuração de avaliação.

Para um exercício separado de **agente hospedado GA**, use uma pasta vazia fora da amostra deste workshop e siga o [tutorial local-para-nuvem do Foundry](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ele usa AZD 1.37.0+, o pacote `microsoft.foundry`, Python 3.13+ e UV atual. Você irá inspecionar `azure.yaml`, testar localmente com Agent Inspector, implantar fonte para uma build remota no Foundry, gerar/revisar um conjunto de dados e rubrica antes de configurar `azd ai eval init --name quality`. Não substitua os testes desta amostra nem assuma que instalar o pacote altera seu modelo de hospedagem.

## 5.5 Red teaming de IA e avaliação contínua

A amostra atual fornece [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete seus pré-requisitos e revise o alvo pretendido e custos antes de executar:

```bash
pytest tests/test_red_teaming.py -s
```

Use uma implantação de teste autorizada e dados sintéticos. Revise os ataques e resultados gerados; esta varredura não estabelece que uma aplicação é segura ou está em conformidade.

O [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) também descreve avaliação contínua configurada na inicialização do container. Ela avalia interações reais dos usuários, não tráfego gerado para testes, e o suporte ao avaliador varia por região. Sem interações não há entradas de avaliação. Verifique a versão instalada da amostra e a configuração do avaliador em vez de assumir que todas as implantações têm os mesmos padrões.

A autenticação é separada da avaliação. Siga a configuração documentada de identidade/acesso da amostra. Não existe uma “retirada básica de autenticação” documentada para proteção de endpoint público.

## 5.6 Exercício de design: personalização para varejo

!!! warning "Exercício de design, não uma implantação concluída"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escreva um plano curto abordando:

| Área | Decisão e evidências a coletar |
|------|----------------------------------|
| Responsabilidades do agente | Comece com um agente, ou justifique agentes separados Shopper e Loyalty e lógica de roteamento |
| Dados | Defina um catálogo/dataset de recompensas sintético e responsabilidade pelas atualizações |
| Ferramentas | Implemente primeiro manipuladores somente leitura; especifique autorização e validação para quaisquer gravações |
| Modelos | Escolha combinações de modelo/versão/SKU disponíveis e verifique cota; evite provisionar modelos não usados |
| Recuperação | Defina indexação, dimensões de incorporação, citações e controles de acesso ao nível de documento |
| Avaliação | Adicione casos de resposta esperada, perguntas não suportadas, uso de ferramenta e segurança com limites explícitos |
| Operações | Defina telemetria, orçamentos de latência/erro, limites de custo e responsabilidade pela limpeza |

Salvar `custom-agents/shopper-agent-instructions.md` não faz a amostra carregá-lo. Encontre o código da aplicação que cria/atualiza o agente, conecte suas instruções revisadas ali, e verifique a versão resultante do agente antes de testar. Instruções não podem conceder acesso a dados ou ferramentas que você não tenha implementado.

Aplique uma mudança por vez, reimplante os componentes afetados e execute novamente suas perguntas e avaliações de linha de base. Mantenha uma revisão funcional para comparação. Para inspiração arquitetural, veja o [blueprint de varejo](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que também não é uma aplicação de varejo completa.

!!! quote "AO FINAL DESTE LAB VOCÊ DEVE TER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continue para [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 5. Personalizar um Modelo

!!! tip "NO FINAL DESTE MÓDULO IRÁ SABER COMO"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Estabelecer uma linha base

Utilize o repositório inicializado [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dos módulos anteriores. Registe a revisão do modelo, versão do AZD, ambiente selecionado, implantação do modelo e perguntas de amostra funcionais antes de alterar qualquer coisa.

A amostra implementa uma aplicação de chat suportada por agente. Ela **não** se torna um sistema de retalho com dois agentes apenas definindo variáveis de ambiente ou guardando ficheiros adicionais de instruções. Agentes extra, manipuladores de ferramentas, encaminhamento, autorização e acesso a dados requerem código de aplicação.

Inspecione as instruções e ferramentas do agente atualmente implantado no Foundry. Teste uma questão factual, uma questão de recuperação e uma questão que os dados de amostra não conseguem responder. Verifique as citações contra os documentos-fonte reais em vez de assumir que uma resposta fluente está correta.

## 5.2 Personalizar a recuperação do conhecimento

O modelo suporta recuperação baseada em ficheiros e integração opcional com Azure AI Search. Siga o [guia atual do AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para indexação e configuração de ferramentas.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Ativar o serviço é apenas uma parte da recuperação. Antes de carregar os seus próprios dados:

1. Confirme que tem permissão para usar os documentos e remova informação sensível.
2. Selecione um modelo de incorporação suportado na sua região e defina a versão compatível, tipo de implantação e dimensões do vetor.
3. Crie/popule o índice usando o processo documentado da amostra.
4. Configure a ferramenta de recuperação do agente para usar esse índice.
5. Teste a recuperação, citações, autorização e comportamento quando não existir documento relevante.

Não altere de `text-embedding-3-small` para um modelo de incorporação diferente sem verificar as dimensões e reconstruir/reindexar os vetores conforme necessário. Um nome como `retail-products` não é um catálogo implementado nem uma política de controlo de acesso.

## 5.3 Rastreamento e monitorização

Siga o [guia de observabilidade da amostra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Garanta que o recurso necessário do Application Insights e a ligação já existem; se alterar definições de infraestrutura, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envie um pedido de teste, depois inspecione os registos da aplicação do Container App e a vista de rastreamento do agente no Foundry. Verifique latência, chamadas de ferramentas, erros e correlação entre o pedido e o rastreamento. Não presuma que a telemetria está ligada apenas porque a implantação teve sucesso.

Mantenha `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` desativado a menos que tenha revisto explicitamente consentimentos, redação, retenção e controlos de acesso. Rastreamentos podem conter argumentos sensíveis de ferramentas ou conteúdo de documentos mesmo quando os registos de aplicação normais parecem inofensivos.

## 5.4 Avaliação do agente

O ponto de entrada da avaliação da amostra é agora [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), não um diretório `evals/`. A partir da raiz da amostra, use um ambiente Python que cumpra os seus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de correr, complete os [pré-requisitos da avaliação](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Os testes carregam configuração do `.azure/<environment>/.env` selecionado; confirme que o ambiente pretendido está selecionado. Entradas importantes incluem:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando o formato requerido pela amostra atual (a versão revista usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como implantação do modelo de juíz

Inspecione os testes para entender a escolha do avaliador, limiares, funções necessárias e custos dos modelos. Uma execução completa não é automaticamente um gate de qualidade aprovado; inspecione as pontuações, casos falhados/erros e os resultados ligados ao Foundry.

### Extensão separada de avaliações AZD

O teste Python acima é um **fluxo de trabalho específico da amostra**. A extensão opcional `azure.ai.evaluations` é um fluxo de trabalho diferente, com a sua própria configuração `evals/azure.eval.yaml`. É instalada separadamente, não incluída no pacote `microsoft.foundry` 1.0 geralmente disponível:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para uma configuração completa da extensão, veja [fluxos de trabalho e migração de avaliação](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde a beta.22 da extensão dos agentes, não use os comandos removidos `azd ai agent eval`. Instalar a extensão de avaliações não converte os testes Python da amostra nem cria automaticamente configurações de avaliação.

Para um exercício separado **com agente hospedado GA**, use uma pasta vazia fora da amostra deste workshop e siga o [passo a passo Foundry local para cloud](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Usa AZD 1.37.0+, o pacote `microsoft.foundry`, Python 3.13+ e uv atual. Vai inspecionar `azure.yaml`, testar localmente com Agent Inspector, implantar o código-fonte para uma compilação remota Foundry, e gerar/rever um conjunto de dados e rubric antes de configurar `azd ai eval init --name quality`. Não substitua os testes desta amostra nem presuma que instalar o pacote altera o seu modelo de alojamento.

## 5.5 Red teaming de IA e avaliação contínua

A amostra atual fornece [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete os pré-requisitos e reveja o alvo e custos pretendidos antes de executar:

```bash
pytest tests/test_red_teaming.py -s
```

Use uma implantação de teste autorizada e dados sintéticos. Reveja os ataques gerados e resultados; esta varredura não estabelece que uma aplicação é segura ou está em conformidade.

O [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) também descreve avaliação contínua configurada na inicialização do contentor. Avalia interações reais de utilizadores, não tráfego de teste gerado, e o suporte do avaliador varia por região. Sem interações não há entradas de avaliação. Verifique a versão da amostra instalada e configuração do avaliador em vez de assumir que cada implantação tem os mesmos padrões.

A autenticação é separada da avaliação. Siga a configuração documentada de identidade/acesso da amostra. Não há um “fallback” documentado de autenticação básica para proteger um endpoint público.

## 5.6 Exercício de design: personalização para retalho

!!! warning "Exercício de design, não uma implantação completada"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escreva um plano curto abordando:

| Área | Decisão e evidências a recolher |
|------|----------------------------------|
| Responsabilidades do agente | Começar com um agente, ou justificar agentes separados Shopper e Loyalty e a lógica de encaminhamento |
| Dados | Definir um catálogo/recompensas sintético e propriedade das atualizações |
| Ferramentas | Implementar manipuladores só de leitura primeiro; especificar autorização e validação para quaisquer escritas |
| Modelos | Escolher combinações disponíveis de modelo/versão/SKU e verificar quota; evitar provisionar modelos não usados |
| Recuperação | Definir indexação, dimensões de incorporação, citações e controlos de acesso a nível de documento |
| Avaliação | Adicionar respostas esperadas, questões não suportadas, uso de ferramentas, e casos de segurança com limiares explícitos |
| Operações | Definir telemetria, orçamento de latência/erros, limites de custo e propriedade da limpeza |

Gravar `custom-agents/shopper-agent-instructions.md` não faz a amostra carregá-lo. Encontre o código de aplicação que cria/atualiza o agente, ligue aí as instruções revistas e verifique a versão do agente resultante antes de testar. Instruções não podem conceder acesso a dados ou ferramentas que não tenha implementado.

Aplique uma alteração de cada vez, reimplante os componentes afetados, e volte a correr as perguntas base e avaliações. Mantenha uma revisão funcional para comparação. Para inspiração de arquitetura, veja o [blueprint de retalho](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que também não é uma aplicação de retalho completa.

!!! quote "NO FINAL DESTE LAB DEVE TER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continue para [Desmontagem da Infraestrutura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
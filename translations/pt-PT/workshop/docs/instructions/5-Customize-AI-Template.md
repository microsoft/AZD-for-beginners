# 5. Personalizar um Modelo

!!! tip "NO FINAL DESTE MÓDULO SERÁS CAPAZ DE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Estabelecer uma linha base

Usa o repositório inicializado [Começar com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) dos módulos anteriores. Regista a revisão do modelo, versão AZD, ambiente selecionado, implementação do modelo e perguntas de exemplo a funcionar antes de alterar qualquer coisa.

O exemplo implementa uma aplicação de chat suportada por agente. Não se torna um sistema de retalho com dois agentes simplesmente por definir variáveis de ambiente ou guardar ficheiros de instruções adicionais. Agentes extra, manipuladores de ferramentas, encaminhamento, autorização e acesso a dados requerem código de aplicação.

Inspeciona as instruções e ferramentas do agente atualmente implementado no Foundry. Testa uma pergunta factual, uma pergunta de recuperação e uma pergunta que os dados de exemplo não conseguem responder. Verifica as citações contra os documentos fonte reais em vez de assumir que uma resposta fluente está correta.

## 5.2 Personalizar a recuperação de conhecimento

O modelo suporta recuperação baseada em ficheiros e integração opcional com Azure AI Search. Segue o [guia atual do AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para configuração de indexação e ferramentas.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Ativar o serviço é apenas uma parte da recuperação. Antes de carregar os teus próprios dados:

1. Confirma que tens permissão para usar os documentos e remove informações sensíveis.
2. Seleciona um modelo de embedding suportado na tua região e define a sua versão compatível, tipo de implementação e dimensões do vetor.
3. Cria/popula o índice usando o processo documentado do exemplo.
4. Configura a ferramenta de recuperação do agente para usar esse índice.
5. Testa a recuperação, citações, autorização e comportamento quando não existir documento relevante.

Não mudes de `text-embedding-3-small` para um modelo de embedding diferente sem verificar as dimensões e reconstruir/reindexar os vetores conforme necessário. Um nome como `retail-products` não é um catálogo implementado nem uma política de controlo de acesso.

## 5.3 Rastreio e monitorização

Segue o [guia de observabilidade do exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assegura que o recurso necessário Application Insights e a conexão já existem; se alterares as definições da infraestrutura, usa `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envia um pedido de teste, depois inspeciona os logs de aplicação do Container App e a vista de rastreio do agente no Foundry. Verifica latência, chamadas a ferramentas, erros e correlação entre o pedido e o rastreio. Não assumes que a telemetria está ligada só porque a implementação teve sucesso.

Mantém `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` desativado a menos que tenhas revisto explicitamente consentimento, redação, retenção e controlos de acesso. Os rastreios podem conter argumentos de ferramenta sensíveis ou conteúdo de documentos mesmo quando os logs comuns da aplicação parecem inofensivos.

## 5.4 Avaliação do agente

O ponto de entrada da avaliação do exemplo é agora [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), não um diretório `evals/`. A partir da raiz do exemplo, usa um ambiente Python que cumpra os seus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de executar, completa os [pré-requisitos da avaliação](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Os testes carregam configuração a partir do `.azure/<environment>/.env` selecionado; confirma que o ambiente pretendido está selecionado. Entradas importantes incluem:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando o formato exigido pelo exemplo atual (a versão revista usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como implementação do modelo juiz

Inspeciona os testes para compreender a escolha do avaliador, limites, funções necessárias e custos do modelo. Uma execução concluída não é automaticamente uma gateway de qualidade aprovada; observa os resultados, casos falhados/errados e os resultados vinculados no Foundry.

### Extensão separada de avaliações AZD

O teste Python acima é um **fluxo de trabalho específico do exemplo**. A extensão opcional `azure.ai.evaluations` é um fluxo de trabalho diferente, com a sua própria configuração `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para uma configuração completa da extensão, vê [fluxos de trabalho de avaliação e migração](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde a beta.22 da extensão de agentes, não uses os comandos removidos `azd ai agent eval`. Instalar a extensão de avaliações não converte os testes Python do exemplo nem cria automaticamente uma configuração de avaliação.

## 5.5 Red teaming de IA e avaliação contínua

O exemplo atual fornece [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completa os seus pré-requisitos e revê o alvo e custos pretendidos antes de executar:

```bash
pytest tests/test_red_teaming.py -s
```

Usa uma implementação de teste autorizada e dados sintéticos. Revê os ataques e resultados gerados; esta análise não estabelece que uma aplicação é segura ou cumpre requisitos.

O [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) também descreve avaliação contínua configurada no arranque do contêiner. Avalia interações reais de utilizadores, não tráfego de teste gerado, e o suporte do avaliador varia por região. Sem interações, não há entradas de avaliação. Verifica a versão do exemplo instalada e configuração do avaliador em vez de assumir que todas as implementações têm os mesmos padrões.

A autenticação é separada da avaliação. Segue a configuração documentada de identidade/acesso do exemplo. Não existe uma “fallback basic auth” documentada para proteger um ponto final público.

## 5.6 Exercício de design: personalização para retalho

!!! warning "Exercício de design, não uma implementação completa"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escreve um plano curto abordando:

| Área | Decisão e evidências a recolher |
|------|----------------------------------|
| Responsabilidades do agente | Começar com um agente ou justificar agentes Shopper e Loyalty separados e lógica de encaminhamento |
| Dados | Definir um catálogo/dados de recompensas sintéticos e propriedade das atualizações |
| Ferramentas | Implementar manipuladores só de leitura primeiro; especificar autorização e validação para quaisquer escritas |
| Modelos | Escolher combinações modelo/versão/SKU disponíveis e verificar quota; evitar provisionar modelos não usados |
| Recuperação | Definir indexação, dimensões do embedding, citações e controlos de acesso a nível de documento |
| Avaliação | Adicionar casos de resposta esperada, perguntas não suportadas, uso de ferramentas e segurança com limites explícitos |
| Operações | Definir telemetria, latência/orçamentos de erro, limites de custo e propriedade da limpeza |

Guardar `custom-agents/shopper-agent-instructions.md` não faz com que o exemplo o carregue. Encontra o código da aplicação que cria/atualiza o agente, liga as instruções revistas lá e verifica a versão do agente resultante antes de testar. Instruções não podem conceder acesso a dados ou ferramentas que não implementaste.

Aplica uma alteração de cada vez, implementa novamente os componentes afetados e executa de novo as perguntas da linha base e as avaliações. Mantém uma revisão funcional para comparação. Para inspiração de arquitetura, vê o [modelo de retalho](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que também não é uma aplicação de retalho completa.

!!! quote "NO FINAL DESTE LAB DEVERÁS TER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continua para [Desmontar Infraestrutura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
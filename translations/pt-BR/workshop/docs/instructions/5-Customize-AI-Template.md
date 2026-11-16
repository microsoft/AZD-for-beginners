# 5. Personalize um Modelo

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Estabeleça uma linha de base

Use o repositório inicializado [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dos módulos anteriores. Registre a revisão do modelo, versão do AZD, ambiente selecionado, implantação do modelo e perguntas de amostra funcionando antes de alterar qualquer coisa.

A amostra implementa um aplicativo de chat com suporte de agente. Ele **não** se torna um sistema de varejo com dois agentes apenas definindo variáveis de ambiente ou salvando arquivos de instruções adicionais. Agentes extras, manipuladores de ferramentas, roteamento, autorização e acesso a dados exigem código de aplicação.

Inspecione as instruções e ferramentas do agente atualmente implantado no Foundry. Teste uma pergunta factual, uma pergunta de recuperação e uma pergunta que os dados da amostra não possam responder. Verifique as citações em relação aos documentos-fonte reais, em vez de assumir que uma resposta fluente está correta.

## 5.2 Personalize a recuperação de conhecimento

O modelo suporta recuperação baseada em arquivos e integração opcional com Azure AI Search. Siga o [guia atual do AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para indexação e configuração da ferramenta.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Habilitar o serviço é apenas uma parte da recuperação. Antes de carregar seus próprios dados:

1. Confirme que você tem permissão para usar os documentos e remova informações sensíveis.
2. Selecione um modelo de embedding suportado em sua região e configure sua versão compatível, tipo de implantação e dimensões do vetor.
3. Crie/popule o índice usando o processo documentado da amostra.
4. Configure a ferramenta de recuperação do agente para usar esse índice.
5. Teste a recuperação, citações, autorização e comportamento quando nenhum documento relevante existir.

Não mude do `text-embedding-3-small` para um modelo de embedding diferente sem verificar as dimensões e reconstruir/reindexar vetores conforme necessário. Um nome como `retail-products` não é um catálogo implementado ou uma política de controle de acesso.

## 5.3 Rastreamento e monitoramento

Siga o [guia de observabilidade da amostra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Certifique-se de que o recurso Application Insights necessário e a conexão já existam; se alterar configurações de infraestrutura, use `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envie uma solicitação de teste, depois inspecione os logs de aplicação do Container App e a visualização de rastreamento do agente no Foundry. Verifique latência, chamadas de ferramenta, erros e correlação entre a solicitação e o rastreamento. Não assuma que a telemetria está conectada apenas porque a implantação foi bem-sucedida.

Mantenha `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` desabilitado, a menos que você tenha revisado explicitamente consentimento, redação, retenção e controles de acesso. Rastreamentos podem conter argumentos sensíveis de ferramentas ou conteúdo de documentos mesmo quando os logs comuns da aplicação parecem inofensivos.

## 5.4 Avaliação do agente

O ponto de entrada da avaliação na amostra é agora [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), não um diretório `evals/`. A partir da raiz da amostra, use um ambiente Python que atenda seus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de executar, complete os [pré-requisitos da avaliação](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Os testes carregam configuração do `.azure/<environment>/.env` selecionado; confirme se o ambiente pretendido está selecionado. Entradas importantes incluem:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando o formato exigido pela amostra atual (a versão analisada usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como implantação do modelo juiz

Inspecione os testes para entender a escolha do avaliador, limites, papéis requeridos e custos dos modelos. Uma execução concluída não é automaticamente uma aprovação na entrada de qualidade; inspecione as pontuações, casos falhados/com erro e os resultados vinculados no Foundry.

### Extensão separada de avaliações AZD

O teste Python acima é um **fluxo de trabalho específico da amostra**. A extensão opcional `azure.ai.evaluations` é um fluxo de trabalho diferente, com sua própria configuração `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para uma configuração completa da extensão, veja [fluxos de trabalho e migração de avaliação](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde a beta.22 da extensão agentes, não use os comandos `azd ai agent eval` removidos. Instalar a extensão de avaliações não converte os testes Python da amostra nem cria automaticamente uma configuração de avaliação.

## 5.5 Red teaming de IA e avaliação contínua

A amostra atual fornece [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complete seus pré-requisitos e revise o alvo pretendido e custos antes de executar:

```bash
pytest tests/test_red_teaming.py -s
```

Use uma implantação de teste autorizada e dados sintéticos. Analise os ataques e resultados gerados; essa varredura não estabelece que uma aplicação é segura ou compatível.

O [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) também descreve avaliação contínua configurada na inicialização do container. Ela avalia interações reais de usuários, não tráfego de teste gerado, e o suporte ao avaliador varia por região. Nenhuma interação significa nenhuma entrada de avaliação. Verifique a versão da amostra instalada e a configuração do avaliador em vez de assumir que toda implantação tem os mesmos padrões.

Autenticação é separada da avaliação. Siga a configuração documentada de identidade/acesso da amostra. Não existe uma “autenticação básica como fallback” documentada para proteger um endpoint público.

## 5.6 Exercício de design: personalização para varejo

!!! warning "Exercício de design, não uma implantação completa"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escreva um plano curto abordando:

| Área | Decisão e evidências a coletar |
|------|----------------------------------|
| Responsabilidades do agente | Começar com um agente, ou justificar agentes Shopper e Loyalty separados e lógica de roteamento |
| Dados | Definir um conjunto sintético de catálogo/recompensas e propriedade das atualizações |
| Ferramentas | Implementar manipuladores somente leitura primeiro; especificar autorização e validação para quaisquer escritas |
| Modelos | Escolher combinações de modelo/versão/SKU disponíveis e verificar cota; evitar provisionar modelos não usados |
| Recuperação | Definir indexação, dimensões de embedding, citações e controles de acesso a nível de documento |
| Avaliação | Adicionar casos de resposta esperada, pergunta não suportada, uso de ferramenta e segurança com limites explícitos |
| Operações | Definir telemetria, orçamento de latência/erros, limites de custo e propriedade da limpeza |

Salvar `custom-agents/shopper-agent-instructions.md` não faz com que a amostra o carregue. Encontre o código da aplicação que cria/atualiza o agente, conecte suas instruções revisadas lá e verifique a versão do agente resultante antes de testar. Instruções não podem conceder acesso a dados ou ferramentas que você não tenha implementado.

Aplique uma alteração por vez, reimplante os componentes afetados e execute novamente suas perguntas base e avaliações. Mantenha uma revisão funcional para comparação. Para inspiração arquitetural, veja o [blueprint para varejo](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que também não é uma aplicação completa de varejo.

!!! quote "AO FINAL DESTE LAB VOCÊ DEVE TER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continue para [Desmontar Infraestrutura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
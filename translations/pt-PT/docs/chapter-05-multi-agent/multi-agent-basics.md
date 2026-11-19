# Noções Básicas de Multi-Agente - Desdobre o Seu Primeiro Sistema de IA Coordenado

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 5 - Soluções de IA Multi-Agente
- **⬅️ Anterior**: [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md)
- **➡️ Seguinte**: [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md)

> Orientação de comando revista em relação à referência `azd 1.37.2` publicada. Implantações na cloud não foram executadas.

## Introdução

Nos capítulos anteriores, implantou uma aplicação única—e no Capítulo 2 implantou um único agente de IA. Esta lição dá o próximo passo: implantar um **sistema multi-agente**, onde vários agentes especializados trabalham juntos para resolver um problema que nenhum agente isolado conseguiria gerir bem.

A boa notícia para iniciantes: **não precisa de novos comandos.** Uma solução multi-agente continua a ser um projeto azd. Vai `azd init`, `azd up`, testar e `azd down`—exatamente o fluxo de trabalho que já conhece. O que muda é a *forma* da aplicação por dentro.

## Objetivos de Aprendizagem

No final desta lição, vai:
- Compreender o que significa "multi-agente" e quando vale a pena a complexidade extra
- Reconhecer os papéis comuns num sistema multi-agente (orquestrador + especialistas)
- Implantar um modelo multi-agente real e funcional com `azd up`
- Compreender os recursos do Azure que suportam uma aplicação multi-agente
- Saber como verificar, personalizar e desmontar a solução de forma segura

## Resultados de Aprendizagem

Após completar esta lição, será capaz de:
- Explicar a diferença entre um agente único e um sistema multi-agente
- Escolher entre um agente único com ferramentas e um verdadeiro design multi-agente
- Implantar e testar um modelo multi-agente de ponta a ponta com azd
- Identificar onde cada agente corre e como comunicam
- Limpar todos os recursos para evitar custos contínuos

---

## O Que É um Sistema Multi-Agente?

Um único agente de IA é um modelo com um conjunto de instruções e (opcionalmente) algumas ferramentas. Isso funciona bem para tarefas focadas. Mas à medida que a tarefa cresce—investigação, depois escrita, depois edição, depois verificação de factos—agrupando tudo num único prompt torna o agente mais lento, menos fiável e mais difícil de depurar.

Um **sistema multi-agente** divide o trabalho em especialistas que fazem bem uma tarefa, coordenados por um orquestrador:

```mermaid
graph TD
    User([User request]) --> Orchestrator[Orchestrator Agent<br/>Plans and routes the work]
    Orchestrator --> Researcher[Researcher Agent<br/>Gathers facts]
    Orchestrator --> Writer[Writer Agent<br/>Drafts content]
    Orchestrator --> Editor[Editor Agent<br/>Reviews and refines]
    Researcher --> Orchestrator
    Writer --> Orchestrator
    Editor --> Orchestrator
    Orchestrator --> Result([Final answer])
```

### Os dois papéis que verá sempre

| Papel | Trabalho | Exemplo |
|------|-----|---------|
| **Orquestrador** | Decide *o que acontece a seguir* e dirige o trabalho entre agentes | "Primeiro investiga, depois escreve, depois edita" |
| **Especialista** | Faz uma tarefa focada e retorna um resultado | Um "investigador" que apenas recolhe factos |

### Precisa mesmo de múltiplos agentes?

Comece simples. Use multi-agente **apenas** quando uma destas condições for verdadeira:

- ✅ A tarefa tem **etapas distintas** que beneficiam de instruções diferentes (investigar vs escrever vs rever)
- ✅ Quer que especialistas trabalhem **em paralelo** para poupar tempo
- ✅ Diferentes passos precisam de **ferramentas ou fontes de dados diferentes**
- ✅ Precisa que cada passo seja **testável e depurável independentemente**

Se a sua tarefa for uma única pergunta e resposta ou uma chamada simples a uma ferramenta, um **agente único com ferramentas** (Capítulo 2) é mais simples, mais económico e mais fácil de operar.

> **Dica para iniciantes:** "Mais agentes" não é "melhor". Cada agente adiciona latência, custo e mais coisas para monitorizar. Adicione agentes apenas quando o problema claramente se dividir em partes.

---

## Duas Formas de Construir Multi-Agente no Azure

| Abordagem | O que é | Melhor para |
|----------|-----------|----------|
| **Agente único + ferramentas** | Um agente Foundry que chama funções/ferramentas | Fluxos de trabalho simples, começar a usar |
| **Vários agentes coordenados** | Vários agentes com um orquestrador | Etapas distintas, trabalho em paralelo, especialização |

Esta lição foca a segunda abordagem usando um **modelo pronto a usar**, para que possa ver um sistema multi-agente real em funcionamento antes de construir o seu próprio.

---

## Prático: Implemente Uma Aplicação Multi-Agente Funcional

Vamos implantar o **Contoso Creative Writer**, um exemplo oficial do Azure que coordena agentes de investigação, produto, escrita e edição para produzir um artigo. Antes de prosseguir, verifique os [pré-requisitos e custos do exemplo](https://github.com/Azure-Samples/contoso-creative-writer#azure-account-requirements): precisa de cota de modelo, Azure AI Search, acesso ao Bing Grounding, Python, Docker e ganchos compatíveis com Bash. A disponibilidade de modelo e região depende da sua subscrição; a implantação não é garantida ao escolher uma região específica.

### Passo 1: Inicialize o modelo

```bash
# Create a working folder
mkdir creative-writer && cd creative-writer

# Initialize from the official multi-agent template
azd init --template Azure-Samples/contoso-creative-writer .
```

> Explore mais modelos multi-agente a qualquer momento na [galeria Awesome AZD AI](https://azure.github.io/awesome-azd/?tags=ai). Outras opções para iniciantes incluem `get-started-with-ai-agents` e `azure-ai-travel-agents`.

### Passo 2: Autentique-se

```bash
# Required for azd workflows
azd auth login

# Also required by this sample's Azure CLI hooks
az login
```

### Passo 3: Verifique o ambiente

```bash
# init normally creates/selects an environment; confirm it before proceeding
azd env list
# Only if you need an additional environment:
# azd env new dev
```

### Passo 4: Pré-visualize, depois implante

```bash
# See what will be created before spending anything (recommended)
azd provision --preview

# Provision infrastructure and deploy all agents in one step
azd up
```

`azd up` perguntará pelas definições de subscrição e região em falta, depois providenciará recursos e implantará a aplicação. A pré-visualização não reserva cota nem garante sucesso; ganchos do modelo podem ainda correr durante uma pré-visualização de provisionamento, por isso examine-os primeiro. Para prolongar o tempo que azd espera por cada **implantação de serviço** (não por provisionamento de modelo):

```bash
azd deploy --timeout 1800
```

Um tempo limite faz azd parar de esperar; não cancela a implantação no Azure. Examine o estado do recurso antes de repetir.

> **Aviso de custo e capacidade:** Aplicações multi-agente implantam modelos de IA que consomem cota e geram custo. Se `azd up` falhar na cota do modelo, veja [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md) para correções de região e cota, e o Capítulo 6 [Planeamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md).

---

## Compreender o Que Implantou

Uma aplicação multi-agente típica como esta providencia um conjunto de recursos Azure que correspondem diretamente às responsabilidades no diagrama acima:

| Recurso | Por que existe |
|----------|----------------|
| **Microsoft Foundry / Modelos** | Hospeda os modelos de linguagem que cada agente usa |
| **Azure AI Search** | Dá ao agente pesquisador dados fundamentados para pesquisar |
| **Container Apps** (ou App Service) | Hospeda o código do orquestrador e dos agentes |
| **Cosmos DB** (em alguns exemplos) | Armazena estado/memória partilhados entre agentes |
| **Application Insights** | Rastreia pedidos *entre* agentes para poder depurar o fluxo |

### Como os agentes comunicam entre si

Na maioria dos exemplos azd multi-agente, o **orquestrador corre no seu código da aplicação** (por exemplo, usando um framework como Semantic Kernel ou Microsoft Agent Framework). O orquestrador chama cada agente especialista por sua vez, passa os resultados e monta a resposta final. Os agentes partilham contexto através de:

- **Chamadas de função/ferramenta** — o orquestrador invoca um especialista e obtém um resultado de volta
- **Memória partilhada** — uma base de dados (frequentemente Cosmos DB) guarda estado que ambos os agentes podem ler
- **Mensagens/eventos** — para um acoplamento mais frouxo, os agentes comunicam via fila ou Service Bus

> **Por que isto importa para depuração:** porque cada passo é separado, o Application Insights mostra-lhe *qual* agente foi lento ou falhou. Essa é uma das maiores razões para dividir trabalho entre agentes desde o início.

---

## Verifique a Implantação

Confirme que o sistema está realmente a funcionar antes de avançar:

```bash
# Show the deployed endpoints
azd show

# Open the app's monitoring dashboard
azd monitor

# Open Application Insights Logs (not a terminal log stream)
azd monitor --logs
```

Depois abra o URL da aplicação a partir de `azd show` e solicite um artigo curto. Use a visualização de depuração do exemplo para inspecionar o fluxo de trabalho do agente. A pesquisa de transações do Application Insights pode mostrar os passos individuais só se o exemplo os instrumentar e correlacionar; azd não adiciona spans de agentes automaticamente.

**Critérios de sucesso:**
- ✅ `azd show` lista um endpoint acessível
- ✅ Um pedido produz um resultado que claramente passou por várias etapas
- ✅ A visualização de depuração mostra múltiplos passos de agentes; se o rastreio estiver ativado, verifique a telemetria correspondente após ingestão

---

## Personalize: Adicione ou Ajuste um Agente

Como cada agente é apenas instruções mais ferramentas, a personalização é acessível:

1. **Encontre as definições dos agentes** no modelo (frequentemente um conjunto de ficheiros `prompts/`, `agents/`, ou `*.prompty`).
2. **Ajuste as instruções de um agente** — por exemplo, diga ao agente editor para aplicar um tom ou número de palavras específico.
3. **Reimplante apenas o código** (a infraestrutura permanece inalterada):

   ```bash
   azd deploy
   ```

Para avançar com o seu *próprio* projeto de agente Foundry, use o pacote GA com AZD 1.37.0+ num diretório vazio separado:

```bash
azd ext install microsoft.foundry
azd ai agent init
azd up
azd ai agent invoke      # test, with response timing
```

Veja o [tutorial do agente hospedado GA](../chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) para teste local com Agent Inspector, implantação remota de código e gestão da limpeza. A [referência AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) também cobre a extensão separada de avaliações, otimização e remoção de agentes.

---

## Limpeza

Aplicações multi-agente executam vários serviços faturáveis. Desmonte tudo quando terminar:

```bash
# Review the resources and confirm deletion interactively
azd down
```

A eliminação é destrutiva. Para um laboratório descartável, `azd down --force --purge` ignora a eliminação e confirmações de purga suportadas; a purga é irreversível onde suportada e pode ser bloqueada por proteção contra purga. A eliminação suave é uma preocupação de recuperação/reatribuição de nome, não prova em si a continuidade de cobranças. Verifique por recursos retidos e faturação após a limpeza.

Se também inicializou um agente hospedado contra um projeto Foundry existente, `azd down` mantém o agente desse projeto e outros recursos no lugar. Remove apenas recursos indesejados que possuir separadamente. Para um novo projeto Foundry criado pelo ambiente AZD, `azd down` elimina o grupo de recursos e tudo nele.

---

## Uma Nota Sobre Sistemas Multi-Agente em Produção

A [Solução Multi-Agente para Retalho](../../examples/retail-scenario.md) neste repositório é uma **planta arquitetónica**, não um modelo de um comando—documenta como um sistema de retalho em produção *seria* construído (e é explícito que uma construção completa é um esforço substancial). Use-o como referência de design *depois* de ter implantado um exemplo funcional aqui. Para preocupações de produção (resiliência, custo, monitorização, governação), continue para [Capítulo 8: Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md).

---

## Resumo

- Um sistema multi-agente divide o trabalho entre especialistas coordenados por um orquestrador.
- Use-o apenas quando a tarefa tem etapas distintas, paralelismo ou ferramentas diferentes por passo—caso contrário, prefira um agente único.
- O fluxo de trabalho azd mantém-se: `azd init` → `azd up` → test → `azd down`.
- Um modelo real como `contoso-creative-writer` permite ver e personalizar uma aplicação multi-agente funcional hoje.
- O rastreio do Application Insights entre agentes é um dos maiores benefícios práticos do design multi-agente.

---

## 🔗 Navegação

| Direção | Lição |
|-----------|--------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Seguinte** | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
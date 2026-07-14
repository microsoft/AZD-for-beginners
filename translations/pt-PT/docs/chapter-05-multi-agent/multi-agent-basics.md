# Noções Básicas de Multi-Agente - Desperte o Seu Primeiro Sistema de IA Coordenado

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 5 - Soluções de IA Multi-Agente
- **⬅️ Anterior**: [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md)
- **➡️ Seguinte**: [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md)

> Validado contra `azd 1.27.1` em julho de 2026.

## Introdução

Nos capítulos anteriores, você implantou uma única aplicação — e no Capítulo 2 implantou um único agente de IA. Esta lição dá o próximo passo: implantar um **sistema multi-agente**, onde vários agentes especializados trabalham juntos para resolver um problema que nenhum agente sozinho poderia resolver bem.

A boa notícia para iniciantes: **não precisa de comandos novos.** Uma solução multi-agente é ainda um projeto azd. Você fará `azd init`, `azd up`, testará, e `azd down` — exatamente o fluxo de trabalho que já conhece. O que muda é a *forma* da aplicação no seu interior.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Perceber o que "multi-agente" significa e quando vale a pena a complexidade adicional
- Reconhecer os papéis comuns num sistema multi-agente (orquestrador + especialistas)
- Implantar um modelo multi-agente real e funcional com `azd up`
- Compreender os recursos Azure que suportam uma aplicação multi-agente
- Saber como verificar, personalizar e desmontar a solução com segurança

## Resultados da Aprendizagem

Após completar esta lição, será capaz de:
- Explicar a diferença entre um agente único e um sistema multi-agente
- Escolher entre um agente único com ferramentas e um design verdadeiramente multi-agente
- Implantar e testar um modelo multi-agente de ponta a ponta com azd
- Identificar onde cada agente corre e como comunicam entre si
- Limpar todos os recursos para evitar custos contínuos

---

## O Que É Um Sistema Multi-Agente?

Um único agente de IA é um modelo com um conjunto de instruções e (opcionalmente) algumas ferramentas. Isso funciona bem para tarefas focadas. Mas à medida que a tarefa cresce — pesquisa, depois escrita, depois edição, depois verificação de fatos — enfiar tudo num único prompt torna o agente mais lento, menos fiável e mais difícil de debugar.

Um **sistema multi-agente** divide o trabalho em especialistas que cada um faz uma tarefa bem, coordenados por um orquestrador:

```mermaid
graph TD
    User([Pedido do utilizador]) --> Orchestrator[Agente Orquestrador<br/>Planeia e direciona o trabalho]
    Orchestrator --> Researcher[Agente Investigador<br/>Recolhe factos]
    Orchestrator --> Writer[Agente Redator<br/>Elabora conteúdo]
    Orchestrator --> Editor[Agente Editor<br/>Revisa e refina]
    Researcher --> Orchestrator
    Writer --> Orchestrator
    Editor --> Orchestrator
    Orchestrator --> Result([Resposta final])
```

### Os dois papéis que verá sempre

| Papel | Função | Exemplo |
|------|--------|---------|
| **Orquestrador** | Decide *o que acontece a seguir* e encaminha o trabalho entre agentes | "Primeiro pesquisa, depois escreve, depois edita" |
| **Especialista** | Faz uma tarefa focada e devolve um resultado | Um "pesquisador" que só recolhe factos |

### Precisa realmente de vários agentes?

Comece simples. Use multi-agente **apenas** quando uma destas condições for verdadeira:

- ✅ A tarefa tem **etapas distintas** que beneficiam de instruções diferentes (pesquisa vs. escrita vs. revisão)
- ✅ Deseja que especialistas corram **em paralelo** para poupar tempo
- ✅ Passos diferentes precisam de **ferramentas ou fontes de dados diferentes**
- ✅ Precisa que cada passo seja **testável e debugável independentemente**

Se a sua tarefa é uma única pergunta e resposta ou uma simples chamada de ferramenta, um **agente único com ferramentas** (Capítulo 2) é mais simples, barato e fácil de operar.

> **Dica para principiantes:** "Mais agentes" não é "melhor." Cada agente adiciona latência, custo e uma nova coisa para monitorizar. Adicione agentes só quando o problema realmente se dividir em partes.

---

## Duas Formas de Construir Multi-Agente na Azure

| Abordagem | O que é | Melhor para |
|-----------|---------|------------|
| **Agente único + ferramentas** | Um agente Foundry que chama funções/ferramentas | Fluxos de trabalho simples, início rápido |
| **Múltiplos agentes coordenados** | Vários agentes com um orquestrador | Etapas distintas, trabalho paralelo, especialização |

Esta lição foca-se na segunda abordagem usando um **modelo pronto**, para que possa ver um sistema multi-agente real a funcionar antes de construir o seu próprio.

---

## Prático: Implante uma Aplicação Multi-Agente Funcional

Vamos implantar o **Contoso Creative Writer**, um exemplo oficial da Azure que usa múltiplos agentes (pesquisador, escritor, editor) coordenados para produzir um artigo. É uma ótima primeira aplicação multi-agente porque os papéis são fáceis de compreender.

### Passo 1: Inicializar o modelo

```bash
# Criar uma pasta de trabalho
mkdir creative-writer && cd creative-writer

# Inicializar a partir do modelo oficial multi-agente
azd init --template contoso-creative-writer
```

> Explore mais modelos multi-agente a qualquer momento na [Galeria Awesome AZD AI](https://azure.github.io/awesome-azd/?tags=ai). Outras opções amigáveis para iniciantes incluem `get-started-with-ai-agents` e `azure-ai-travel-agents`.

### Passo 2: Autenticar

```bash
# Necessário para fluxos de trabalho azd
azd auth login
```

### Passo 3: Criar um ambiente

```bash
azd env new dev
```

### Passo 4: Pré-visualizar, depois implantar

```bash
# Veja o que será criado antes de gastar qualquer coisa (recomendado)
azd provision --preview

# Provisione a infraestrutura e implante todos os agentes numa só etapa
azd up
```

`azd up` solicitará uma subscrição e região, depois provisionará os recursos Azure e implantará a aplicação. Implantações de IA podem demorar mais que uma aplicação web simples — se estiver a implantar modelos maiores, pode estender o tempo limite de implantação:

```bash
azd deploy --timeout 1800
```

> **Aviso sobre custo e capacidade:** Aplicações multi-agente implantam modelos IA que consomem quota e geram custo. Se `azd up` falhar por limite de quota de modelo, veja [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md) para correções de região e quota, e Capítulo 6 [Planeamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md).

---

## Compreender o Que Foi Implantado

Uma aplicação multi-agente típica como esta provisiona um conjunto de recursos Azure que se correlacionam diretamente com as responsabilidades no diagrama acima:

| Recurso | Por que está lá |
|---------|----------------|
| **Microsoft Foundry / Modelos** | Hospeda os modelos de linguagem usados por cada agente |
| **Azure AI Search** | Dá ao agente pesquisador dados fundamentados para pesquisar |
| **Container Apps** (ou App Service) | Hospeda o orquestrador e o código dos agentes |
| **Cosmos DB** (em alguns exemplos) | Armazena o estado/memória partilhada entre agentes |
| **Application Insights** | Rastreia pedidos *entre* agentes para facilitar o debug do fluxo |

### Como os agentes comunicam entre si

Na maioria dos exemplos multi-agente azd, o **orquestrador corre no seu código de aplicação** (por exemplo, usando um framework como Semantic Kernel ou o Microsoft Agent Framework). O orquestrador chama cada agente especialista por sua vez, passa os resultados adiante e monta a resposta final. Os agentes partilham contexto através de:

- **Chamadas de função/ferramenta** — o orquestrador invoca um especialista e recebe um resultado
- **Memória partilhada** — uma base de dados (frequentemente Cosmos DB) mantém estado que ambos os agentes conseguem ler
- **Mensagens/eventos** — para acoplamento mais frouxo, agentes comunicam via fila ou Service Bus

> **Por que isto importa para debug:** porque cada passo é separado, o Application Insights mostra *qual* agente foi lento ou falhou. Essa é uma das principais razões para dividir o trabalho entre agentes.

---

## Verificar a Implantação

Confirme que o sistema está realmente a funcionar antes de continuar:

```bash
# Mostrar os endpoints implementados
azd show

# Abrir o painel de monitorização da app
azd monitor

# Seguir os logs se algo parecer errado
azd monitor --logs
```

Depois abra a URL da aplicação obtida com `azd show` e faça uma solicitação que envolva todos os agentes (para o Creative Writer, peça para escrever um artigo curto sobre um tema). Na **pesquisa de transações** do Application Insights, deverá ver o pedido dividir-se pelas etapas pesquisador, escritor e editor.

**Critérios de sucesso:**
- ✅ `azd show` lista um endpoint acessível
- ✅ Um pedido produz um resultado que passou claramente por múltiplas etapas
- ✅ O Application Insights mostra rastros para mais que uma etapa de agente

---

## Personalizar: Adicionar ou Ajustar um Agente

Como cada agente é apenas instruções mais ferramentas, personalizar é acessível:

1. **Encontre as definições dos agentes** no modelo (normalmente uma pasta `prompts/`, `agents/` ou um conjunto de ficheiros `*.prompty`).
2. **Ajuste as instruções de um agente** — por exemplo, diga ao agente editor para aplicar um tom específico ou contar palavras.
3. **Volte a implantar apenas o código** (a infraestrutura permanece inalterada):

   ```bash
   azd deploy
   ```

Para avançar e construir agentes a partir do seu *próprio* manifesto, use a extensão de agente e seu ciclo de vida completo:

```bash
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
azd ai agent invoke      # teste, com temporização da resposta
```

Veja [Capítulo 2: Agentes](../chapter-02-ai-development/agents.md) e a [referência AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para o ciclo completo de vida do agente (`invoke`, `eval generate`, `optimize`, `delete`).

---

## Limpar

Aplicações multi-agente usam vários serviços faturados. Desmonte tudo quando terminar:

```bash
azd down --force --purge
```

A flag `--purge` também remove recursos IA eliminados suavemente (como contas Foundry/Azure AI Services) para não bloquearem uma nova implantação nem continuarem a gerar custos.

---

## Uma Nota Sobre Sistemas Multi-Agente em Produção

O [Retail Multi-Agent Solution](../../examples/retail-scenario.md) neste repositório é um **plano de arquitetura**, não um modelo de um só comando — documenta como um sistema de retalho em produção *seria* construído (e é explícito que uma construção completa requer um esforço substancial). Use-o como referência de design *depois* de ter implantado um exemplo funcional aqui. Para preocupações de produção (resiliência, custo, monitorização, governação), continue para o [Capítulo 8: Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md).

---

## Sumário

- Um sistema multi-agente divide o trabalho entre especialistas coordenados por um orquestrador.
- Use-o apenas quando a tarefa tiver etapas distintas, paralelismo ou ferramentas diferentes por passo — caso contrário prefira um agente único.
- O fluxo azd permanece o mesmo: `azd init` → `azd up` → teste → `azd down`.
- Um modelo real como `contoso-creative-writer` permite ver e personalizar uma aplicação multi-agente funcional hoje.
- Giant Application Insights com rastreio entre agentes é um dos maiores benefícios práticos do design multi-agente.

---

## 🔗 Navegação

| Direção | Lição |
|---------|-------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Seguinte** | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
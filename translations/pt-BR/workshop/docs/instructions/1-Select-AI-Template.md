# 1. Selecione um Modelo

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Descrever o que são templates AZD
    - [ ] Descobrir e usar templates AZD para IA
    - [ ] Começar com o template AI Agents
    - [ ] **Laboratório 1:** AZD Quickstart com GitHub Codespaces

---

## 1. Uma analogia do construtor

Construir uma aplicação de IA moderna e pronta para empresas _do zero_ pode ser intimidador. É um pouco como construir sua nova casa por conta própria, tijolo por tijolo. Sim, pode ser feito! Mas não é a maneira mais eficaz de obter o resultado desejado!

Em vez disso, muitas vezes começamos com uma _planta de projeto_ existente e trabalhamos com um arquiteto para personalizá-la conforme nossos requisitos pessoais. E essa é exatamente a abordagem a adotar ao construir aplicações inteligentes. Primeiro, encontre uma boa arquitetura de projeto que se encaixe no seu espaço de problema. Depois, trabalhe com um arquiteto de soluções para customizar e desenvolver a solução para o seu cenário específico.

Mas onde podemos encontrar essas plantas de projeto? E como encontramos um arquiteto disposto a nos ensinar como personalizar e implantar essas plantas por conta própria? Neste workshop, respondemos a essas perguntas apresentando três tecnologias:

1. [Azure Developer CLI](https://aka.ms/azd) - uma ferramenta de código aberto que acelera o caminho do desenvolvedor ao ir do desenvolvimento local (build) à implantação na nuvem (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - repositórios padronizados de código aberto contendo código de exemplo, infraestrutura e arquivos de configuração para implantar uma arquitetura de solução de IA.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - um agente de codificação fundamentado no conhecimento do Azure, que pode nos guiar na navegação pela base de código e na realização de alterações — usando linguagem natural.

Com essas ferramentas em mãos, agora podemos _descobrir_ o template certo, _implantá-lo_ para validar que funciona e _personalizá-lo_ para adequá-lo aos nossos cenários específicos. Vamos mergulhar e aprender como elas funcionam.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) é uma ferramenta de linha de comando de código aberto que pode acelerar sua jornada do código para a nuvem com um conjunto de comandos amigáveis ao desenvolvedor que funcionam de forma consistente em seu IDE (desenvolvimento) e em ambientes de CI/CD (devops).

Com `azd`, sua jornada de implantação pode ser tão simples quanto:

- `azd init` - Inicializa um novo projeto de IA a partir de um template AZD existente.
- `azd up` - Provisiona a infraestrutura e implanta sua aplicação em um único passo.
- `azd monitor` - Obtenha monitoramento e diagnóstico em tempo real para sua aplicação implantada.
- `azd pipeline config` - Configure pipelines de CI/CD para automatizar a implantação no Azure.

**🎯 | EXERCÍCIO**: <br/> Explore a ferramenta de linha de comando `azd` em seu ambiente GitHub Codespaces agora. Comece digitando este comando para ver o que a ferramenta pode fazer:

```bash title="" linenums="0"
azd help
```

![Fluxo](../../../../../translated_images/pt-BR/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. O Template AZD

Para que o `azd` consiga fazer isso, ele precisa saber a infraestrutura a ser provisionada, as configurações a serem aplicadas e a aplicação a ser implantada. É aí que os [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) entram.

AZD templates são repositórios de código aberto que combinam código de exemplo com arquivos de infraestrutura e configuração necessários para implantar a arquitetura da solução.
Ao usar uma abordagem _Infraestrutura como Código_ (IaC), eles permitem que as definições de recursos do template e as configurações sejam controladas por versão (assim como o código-fonte do aplicativo) - criando fluxos de trabalho reutilizáveis e consistentes entre os usuários desse projeto.

Ao criar ou reutilizar um AZD template para o _seu_ cenário, considere estas perguntas:

1. O que você está construindo? → Existe um template que tenha código inicial para esse cenário?
1. Como sua solução é arquitetada? → Existe um template que tenha os recursos necessários?
1. Como sua solução é implantada? → Pense em `azd deploy` com hooks de pré/pós-processamento!
1. Como você pode otimizá-la ainda mais? → Pense em monitoramento embutido e pipelines de automação!

**🎯 | EXERCÍCIO**: <br/> 
Visite a galeria [Awesome AZD](https://azure.github.io/awesome-azd/) e use os filtros para explorar os 250+ templates atualmente disponíveis. Veja se você consegue encontrar um que se alinhe aos requisitos do _seu_ cenário.

![Código](../../../../../translated_images/pt-BR/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Modelos de Aplicativos de IA

Para aplicações impulsionadas por IA, a Microsoft fornece templates especializados com **Microsoft Foundry** e **Foundry Agents**. Esses templates aceleram seu caminho para construir aplicações inteligentes e prontas para produção.

### Templates Microsoft Foundry & Foundry Agents

Selecione um template abaixo para implantar. Cada template está disponível no [Awesome AZD](https://azure.github.io/awesome-azd/) e pode ser inicializado com um único comando.

| Template | Descrição | Comando de implantação |
|----------|-----------|------------------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplicação de chat com Retrieval Augmented Generation usando Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Crie agentes de IA com Foundry Agents para execução autônoma de tarefas | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordene múltiplos Foundry Agents para fluxos de trabalho complexos | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extraia e analise documentos com modelos Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Crie chatbots inteligentes com integração Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Gere imagens usando DALL-E via Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agentes de IA usando Semantic Kernel com Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistemas multiagentes usando o framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Início Rápido

1. **Navegue pelos templates**: Visite [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) e filtre por `AI`, `Agents`, ou `Microsoft Foundry`
2. **Selecione seu template**: Escolha um que corresponda ao seu caso de uso
3. **Inicialize**: Execute o comando `azd init` para o template escolhido
4. **Implante**: Execute `azd up` para provisionar e implantar

**🎯 | EXERCÍCIO**: <br/>
Selecione um dos templates acima com base no seu cenário:

- **Construindo um chatbot?** → Comece com **AI Chat with RAG** ou **Conversational AI Bot**
- **Precisa de agentes autônomos?** → Experimente **Foundry Agent Service Starter** ou **Multi-Agent Orchestration**
- **Processando documentos?** → Utilize **AI Document Intelligence**
- **Quer assistência de codificação por IA?** → Explore **Semantic Kernel Agent** ou **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explore Mais Templates"
    A [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contém 250+ templates. Use os filtros para encontrar templates que correspondam aos seus requisitos específicos de linguagem, framework e serviços do Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 1. Selecionar um Modelo

!!! tip "NO FINAL DESTE MÓDULO VAI SER CAPAZ DE"

    - [ ] Descrever o que são os modelos AZD
    - [ ] Descobrir e usar modelos AZD para IA
    - [ ] Começar com o modelo AI Agents
    - [ ] **Laboratório 1:** Início Rápido AZD com GitHub Codespaces

---

## 1. Uma Analogía com um Construtor

Construir uma aplicação de IA moderna e pronta para a empresa _do zero_ pode ser assustador. É um pouco como construir a sua nova casa sozinho, tijolo a tijolo. Sim, pode ser feito! Mas não é a forma mais eficaz de obter o resultado final desejado!

Em vez disso, muitas vezes começamos com uma _planta de design_ existente, e trabalhamos com um arquiteto para a personalizar conforme os nossos requisitos pessoais. E é exatamente esta abordagem que se deve tomar ao construir aplicações inteligentes. Primeiro, encontre uma boa arquitetura de design que se encaixe no seu espaço de problema. Depois trabalhe com um arquiteto de soluções para personalizar e desenvolver a solução para o seu cenário específico.

Mas onde podemos encontrar estas plantas de design? E como encontramos um arquiteto que esteja disposto a ensinar-nos a personalizar e implementar estas plantas por nossa conta? Neste workshop, respondemos a essas perguntas apresentando-lhe três tecnologias:

1. [Azure Developer CLI](https://aka.ms/azd) - uma ferramenta open-source que acelera o percurso do programador desde o desenvolvimento local (construção) até ao deployment na cloud (entrega).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - repositórios open-source padronizados contendo código exemplo, infraestrutura e ficheiros de configuração para implementar uma arquitetura de solução de IA.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - um agente de codificação baseado no conhecimento Azure, que pode guiar-nos na navegação pela base de código e fazer alterações usando linguagem natural.

Com estas ferramentas em mãos, podemos agora _descobrir_ o modelo correto, _deployá-lo_ para validar que funciona, e _personalizá-lo_ para se adequar aos nossos cenários específicos. Vamos começar e aprender como estas ferramentas funcionam.

---

## 2. Azure Developer CLI

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (ou `azd`) é uma ferramenta de linha de comando open-source que pode acelerar o seu percurso do código para a cloud com um conjunto de comandos amigáveis para programadores que funcionam de forma consistente no seu IDE (desenvolvimento) e ambientes CI/CD (devops).

Com o `azd`, o seu percurso de deployment pode ser tão simples como:

- `azd init` - Inicializa um novo projeto de IA a partir de um modelo AZD existente.
- `azd up` - Provisiona a infraestrutura e implementa a sua aplicação num só passo.
- `azd monitor` - Obtenha monitorização e diagnóstico em tempo real para a aplicação implementada.
- `azd pipeline config` - Configure pipelines CI/CD para automatizar o deployment no Azure.

**🎯 | EXERCÍCIO**: <br/> Explore agora a ferramenta de linha de comandos `azd` no seu ambiente GitHub Codespaces. Comece por escrever este comando para ver o que a ferramenta pode fazer:

```bash title="" linenums="0"
azd help
```

![Fluxo](../../../../../translated_images/pt-PT/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. O Modelo AZD

Para que o `azd` consiga fazer isto, precisa de saber a infraestrutura a provisionar, as configurações a aplicar, e a aplicação a implementar. É aqui que entram os [modelos AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Os modelos AZD são repositórios open-source que combinam código de exemplo com ficheiros de infraestrutura e configuração necessários para implementar a arquitetura da solução.
Usando uma abordagem _Infrastructure-as-Code_ (IaC), permitem que as definições de recursos do modelo e as configurações sejam controladas por versões (como o código fonte da aplicação) - criando fluxos de trabalho reutilizáveis e consistentes entre os utilizadores do projeto.

Ao criar ou reutilizar um modelo AZD para _o seu_ cenário, considere estas questões:

1. O que está a construir? → Existe algum modelo que tenha código inicial para esse cenário?
1. Como está a arquitetura da sua solução? → Existe algum modelo que tenha os recursos necessários?
1. Como é que a sua solução é implementada? → Pense no `azd deploy` com hooks para pré/pós-processamento!
1. Como pode otimizá-la ainda mais? → Pense em monitorização integrada e pipelines de automação!

**🎯 | EXERCÍCIO**: <br/> 
Visite a galeria [Awesome AZD](https://azure.github.io/awesome-azd/) e use os filtros para explorar os mais de 250 modelos atualmente disponíveis. Veja se consegue encontrar um que alinhe com os requisitos do _seu_ cenário.

![Código](../../../../../translated_images/pt-PT/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Modelos de Aplicações de IA

Para aplicações com IA, a Microsoft fornece modelos especializados com **Microsoft Foundry** e **Foundry Agents**. Estes modelos aceleram o seu caminho para construir aplicações inteligentes prontas para produção.

### Modelos Microsoft Foundry & Foundry Agents

Selecione um modelo abaixo para implementar. Cada modelo está disponível no [Awesome AZD](https://azure.github.io/awesome-azd/) e pode ser inicializado com um único comando.

| Modelo | Descrição | Comando de Implementação |
|----------|-------------|----------------|
| **[Chat IA com RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplicação de chat com Geração Aumentada por Recuperação usando Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Início Serviço Foundry Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Construa agentes de IA com Foundry Agents para execução autónoma de tarefas | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Orquestração Multi-Agente](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordene múltiplos Foundry Agents para fluxos de trabalho complexos | `azd init -t azure-samples/multi-agent-orchestration` |
| **[Inteligência Documental IA](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extraia e analise documentos com modelos Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Bot de IA Conversacional](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Construa chatbots inteligentes com integração Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[Geração de Imagens IA](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Gere imagens usando DALL-E através da Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Agente Semantic Kernel](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agentes de IA usando Semantic Kernel com Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agente](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistemas multi-agente usando o framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Início Rápido

1. **Navegar pelos modelos**: Visite [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) e filtre por `AI`, `Agents`, ou `Microsoft Foundry`
2. **Selecione o seu modelo**: Escolha um que corresponda ao seu caso de uso
3. **Inicialize**: Execute o comando `azd init` para o modelo escolhido
4. **Implemente**: Execute `azd up` para provisionar e implementar

**🎯 | EXERCÍCIO**: <br/>
Selecione um dos modelos acima com base no seu cenário:

- **A construir um chatbot?** → Comece com **Chat IA com RAG** ou **Bot de IA Conversacional**
- **Precisa de agentes autónomos?** → Experimente **Início Serviço Foundry Agent** ou **Orquestração Multi-Agente**
- **A processar documentos?** → Use **Inteligência Documental IA**
- **Quer assistência na codificação com IA?** → Explore **Agente Semantic Kernel** ou **AutoGen Multi-Agente**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explore Mais Modelos"
    A galeria [Awesome AZD](https://azure.github.io/awesome-azd/) contém mais de 250 modelos. Use os filtros para encontrar modelos que correspondam aos seus requisitos específicos de linguagem, framework e serviços Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2. Validar um Template

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Entender o Fluxo de Implantação do AZD
    - [ ] Usar o GitHub Copilot para obter ajuda sobre o uso do AZD
    - [ ] **Lab 2:** Implantar & Validar o template AI Agents

---


## 1. Introdução

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comando de código aberto que simplifica o fluxo de trabalho do desenvolvedor ao construir e implantar aplicações no Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios padronizados que incluem código de aplicação de exemplo, ativos de _infrastructure-as-code_ e arquivos de configuração do `azd` para uma arquitetura de solução coesa. Provisionar a infraestrutura torna-se tão simples quanto um comando `azd provision` - enquanto usar `azd up` permite que você provision e implante sua aplicação em um único passo!

Como resultado, iniciar seu processo de desenvolvimento de aplicativo pode ser tão simples quanto encontrar o _AZD Starter template_ certo que mais se aproxima das necessidades da sua aplicação e infraestrutura - e então personalizar o repositório para atender aos requisitos do seu cenário.

Antes de começarmos, vamos nos certificar de que você tem o Azure Developer CLI instalado.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You should see something like this!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Você agora está pronto para selecionar e implantar um template com azd**

---

## 2. Seleção do Template

A plataforma Microsoft Foundry vem com um [conjunto de templates AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários de solução populares como _automação de fluxo de trabalho multiagente_ e _processamento de conteúdo multimodal_. Você também pode descobrir esses templates visitando o portal Microsoft Foundry.

1. Visite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Faça login no portal Microsoft Foundry quando solicitado - você verá algo assim.

![Escolher](../../../../../translated_images/pt-BR/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Básico** são seus templates iniciais:

1. [ ] [Comece com AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que implanta uma aplicação de chat básica _com seus dados_ no Azure Container Apps. Use isto para explorar um cenário básico de chatbot de IA.
1. [X] [Comece com AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implanta um AI Agent padrão (com os Foundry Agents). Use isto para se familiarizar com soluções de IA com agentes envolvendo ferramentas e modelos.

Visite o segundo link em uma nova aba do navegador (ou clique em `Open in GitHub` no cartão relacionado). Você deverá ver o repositório para este AZD Template. Reserve um minuto para explorar o README. A arquitetura da aplicação se parece com isto:

![Arquitetura](../../../../../translated_images/pt-BR/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

Vamos tentar implantar este template e garantir que ele seja válido. Seguiremos as diretrizes na seção [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirme a ação padrão para `Create codespace`
1. Isso abre uma nova aba do navegador - aguarde a sessão do GitHub Codespaces terminar de carregar
1. Abra o terminal do VS Code no Codespaces - digite o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete as etapas do fluxo de trabalho que isso irá acionar:

1. Você será solicitado a entrar no Azure - siga as instruções para autenticar
1. Insira um nome de ambiente único para você - por exemplo, eu usei `nitya-mshack-azd`
1. Isso criará uma pasta `.azure/` - você verá uma subpasta com o nome do ambiente
1. Você será solicitado a selecionar um nome de assinatura - selecione o padrão
1. Você será solicitado por uma localidade - use `East US 2`

Agora, aguarde a conclusão do provisionamento. **Isto leva 10-15 minutos**

1. Quando terminar, seu console exibirá uma mensagem de SUCESSO como esta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![Infraestrutura](../../../../../translated_images/pt-BR/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Você agora está pronto para validar a infraestrutura implantada e a aplicação**.

---

## 4. Template Validation

1. Visite a página de [Resource Groups](https://portal.azure.com/#browse/resourcegroups) do Azure Portal - faça login quando solicitado
1. Clique no RG do nome do seu ambiente - você verá a página acima

      - clique no recurso Azure Container Apps
      - clique na Application Url na seção _Essentials_ (canto superior direito)

1. Você deverá ver uma interface frontend da aplicação hospedada como esta:

   ![Aplicativo](../../../../../translated_images/pt-BR/03-test-application.471910da12c3038e.webp)

1. Tente fazer um par de [perguntas de exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. Você deverá obter respostas semelhantes ao que é mostrado abaixo. _Mas como isso funciona?_ 

      ![Aplicativo](../../../../../translated_images/pt-BR/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

O Azure Container App implanta um endpoint que se conecta ao AI Agent provisionado no projeto Microsoft Foundry para este template. Vamos dar uma olhada no que isso significa.

1. Retorne à página _Overview_ do Azure Portal para o seu resource group

1. Clique no recurso `Microsoft Foundry` nessa lista

1. Você deverá ver isto. Clique no botão `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pt-BR/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Você deverá ver a página do Projeto Foundry para sua aplicação de IA
   ![Projeto](../../../../../translated_images/pt-BR/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clique em `Agents` - você verá o Agent padrão provisionado no seu projeto
   ![Agents](../../../../../translated_images/pt-BR/06-visit-agents.bccb263f77b00a09.webp)

1. Selecione-o - e você verá os detalhes do Agent. Note o seguinte:

      - O agente usa File Search por padrão (sempre)
      - a propriedade `Knowledge` do agente indica que ele tem 32 arquivos enviados (para pesquisa de arquivos)
      ![Agents](../../../../../translated_images/pt-BR/07-view-agent-details.0e049f37f61eae62.webp)

1. Procure a opção `Data+indexes` no menu à esquerda e clique para ver os detalhes. 

      - Você deverá ver os 32 arquivos de dados enviados para conhecimento.
      - Estes corresponderão aos 12 arquivos de clientes e 20 arquivos de produtos em `src/files` 
      ![Dados](../../../../../translated_images/pt-BR/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Você validou a operação do Agente!** 

1. As respostas do agente são fundamentadas no conhecimento presente nesses arquivos. 
1. Agora você pode fazer perguntas relacionadas a esses dados e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas por "Amanda Perez"

Retorne à aba do navegador com o endpoint do Container App e pergunte: `What products does Amanda Perez own?`. Você deverá ver algo como isto:

![Dados](../../../../../translated_images/pt-BR/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Vamos construir um pouco mais de intuição sobre as capacidades do Microsoft Foundry, experimentando o Agent no Agents Playground. 

1. Retorne à página `Agents` no Microsoft Foundry - selecione o agente padrão
1. Clique na opção `Try in Playground` - você deverá obter uma UI do Playground como esta
1. Faça a mesma pergunta: `What products does Amanda Perez own?`

    ![Dados](../../../../../translated_images/pt-BR/09-ask-in-playground.a1b93794f78fa676.webp)

Você obtém a mesma (ou similar) resposta - mas você também recebe informações adicionais que pode usar para entender a qualidade, custo e desempenho do seu aplicativo agentico. Por exemplo:

1. Observe que a resposta cita arquivos de dados usados para "fundamentar" a resposta
1. Passe o cursor sobre qualquer uma dessas etiquetas de arquivo - os dados correspondem à sua consulta e à resposta exibida?

Você também vê uma linha de _stats_ abaixo da resposta. 

1. Passe o cursor sobre qualquer métrica - por exemplo, Safety. Você verá algo assim
1. A classificação avaliada corresponde à sua intuição sobre o nível de segurança da resposta?

      ![Dados](../../../../../translated_images/pt-BR/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade Integrada

Observabilidade é sobre instrumentar sua aplicação para gerar dados que possam ser usados para entender, depurar e otimizar suas operações. Para ter uma noção disso:

1. Clique no botão `View Run Info` - você deverá ver esta visualização. Este é um exemplo de [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Você também pode obter esta visualização clicando em Thread Logs no menu de nível superior_.

   - Tenha uma noção das etapas de execução e das ferramentas acionadas pelo agente
   - Entenda a contagem total de Tokens (vs. uso de tokens de saída) para a resposta
   - Entenda a latência e onde o tempo está sendo gasto na execução

      ![Agente](../../../../../translated_images/pt-BR/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clique na aba `Metadata` para ver atributos adicionais da execução, que podem fornecer contexto útil para depurar problemas posteriormente.   

      ![Agente](../../../../../translated_images/pt-BR/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clique na aba `Evaluations` para ver autoavaliações feitas sobre a resposta do agente. Estas incluem avaliações de segurança (por exemplo, Autoagressão) e avaliações específicas do agente (por exemplo, resolução de intenção, adesão à tarefa).

      ![Agente](../../../../../translated_images/pt-BR/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, mas não menos importante, clique na aba `Monitoring` no menu lateral.

      - Selecione a aba `Resource usage` na página exibida - e visualize as métricas.
      - Acompanhe o uso da aplicação em termos de custos (tokens) e carga (requisições).
      - Acompanhe a latência da aplicação até o primeiro byte (processamento de entrada) e o último byte (saída).

      ![Agente](../../../../../translated_images/pt-BR/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

Até agora, percorremos a implantação no navegador - e validamos que nossa infraestrutura foi provisionada e a aplicação está operacional. Mas para trabalhar com o código da aplicação de forma _code-first_, precisamos configurar nosso ambiente de desenvolvimento local com as variáveis relevantes necessárias para trabalhar com esses recursos. Usar o `azd` facilita isso.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for  the application deployments.

1. Environment variables are stored in `.azure/<env-name>/.env` - this scopes them to the `env-name` environment used during deployment and helps you isolate environments between different deployment targets in the same repo.

1. Environment variables are automatically loaded by the `azd` command whenever it executes a specific command (e.g., `azd up`). Note that `azd` does not automatically read _OS-level_ environment variables (e.g., set in the shell) - instead use `azd set env` and `azd get env` to transfer information within scripts.


Let's try out a few commands:

1. Get all the environment variables set for `azd` in this environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You see something like:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You see something like this - it was not set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we should find the value is set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note that some resources are persistent (e.g., model deployments) and will require more than just an `azd up` to force the redeployment. Let's try tearing down the original deployment and redeploying with changed env vars.

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta é uma forma poderosa de _sincronizar_ variáveis de ambiente entre dois ou mais ambientes de desenvolvimento local (por exemplo, equipe com vários desenvolvedores) - permitindo que a infraestrutura implantada sirva como a fonte da verdade para o estado das variáveis de ambiente. Os membros da equipe simplesmente _atualizam_ as variáveis para se manterem sincronizados.

---

## 9. Parabéns 🏆

Você acabou de concluir um fluxo de trabalho de ponta a ponta onde você:

- [X] Selecionou o AZD Template que deseja usar
- [X] Iniciou o Template com o GitHub Codespaces 
- [X] Implantou o Template e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido com o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para manter a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
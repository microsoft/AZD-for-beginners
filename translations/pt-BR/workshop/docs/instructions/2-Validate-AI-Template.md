# 2. Validar um Template

> Validado contra `azd 1.27.1` em julho de 2026.

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Entender o Fluxo de Trabalho de Implantação do AZD
    - [ ] Usar o GitHub Copilot para obter ajuda sobre o uso do AZD
    - [ ] **Laboratório 2:** Implantar e Validar o template de Agentes de IA

---


## 1. Introdução

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comando open-source que simplifica o fluxo de trabalho do desenvolvedor ao construir e implantar aplicações no Azure.

Os [Templates AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios padronizados que incluem código de aplicação de exemplo, ativos de _infraestrutura-como-código_ e arquivos de configuração `azd` para uma arquitetura de solução coesa. Provisionar a infraestrutura se torna tão simples quanto um comando `azd provision` - enquanto usar o `azd up` permite provisionar a infraestrutura **e** implantar sua aplicação em uma única etapa!

Como resultado, iniciar seu processo de desenvolvimento de aplicação pode ser tão simples quanto encontrar o _template inicial AZD_ certo que mais se aproxima das suas necessidades de aplicação e infraestrutura - e então personalizar o repositório para atender aos requisitos do seu cenário.

Antes de começarmos, vamos garantir que você tenha o Azure Developer CLI instalado.

1. Abra um terminal do VS Code e digite este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Você deverá ver algo parecido com isto!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Agora você está pronto para selecionar e implantar um template com azd**

---

## 2. Seleção do Template

A plataforma Microsoft Foundry vem com um [conjunto de templates AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários populares de solução como _automação de fluxo de trabalho multiagente_ e _processamento de conteúdo multimodal_. Você também pode descobrir esses templates visitando o portal Microsoft Foundry.

1. Visite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Faça login no portal Microsoft Foundry quando solicitado - você verá algo assim.

![Pick](../../../../../translated_images/pt-BR/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Basic** são seus templates iniciais:

1. [ ] [Comece com AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que implanta uma aplicação básica de chat _com seus dados_ no Azure Container Apps. Use isso para explorar um cenário básico de chatbot de IA.
1. [X] [Comece com AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implanta um Agente de IA padrão (com os Agentes Foundry). Use isso para se familiarizar com soluções agenticas de IA envolvendo ferramentas e modelos.

Visite o segundo link em uma nova aba do navegador (ou clique em `Open in GitHub` no cartão relacionado). Você deverá ver o repositório para este Template AZD. Reserve um minuto para explorar o README. A arquitetura da aplicação é esta:

![Arch](../../../../../translated_images/pt-BR/architecture.8cec470ec15c65c7.webp)

---

## 3. Ativação do Template

Vamos tentar implantar este template e garantir que ele é válido. Seguiremos as diretrizes da seção [Começando](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Escolha um ambiente de trabalho para o repositório do template:

      - **GitHub Codespaces**: Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) e confirme `Create codespace`
      - **Clone local ou container de desenvolvimento**: Clone `Azure-Samples/get-started-with-ai-agents` e abra no VS Code

1. Espere até que o terminal do VS Code esteja pronto, então digite o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete as etapas do fluxo de trabalho que isso irá disparar:

1. Você será solicitado a fazer login no Azure - siga as instruções para autenticação
1. Insira um nome único para seu ambiente - por exemplo, usei `nitya-mshack-azd`
1. Isso criará uma pasta `.azure/` - você verá uma subpasta com o nome do ambiente
1. Você será solicitado a selecionar um nome de assinatura - selecione o padrão
1. Você será solicitado por uma localização - use `East US 2`

Agora, espere até o provisionamento ser concluído. **Isso leva de 10 a 15 minutos**

1. Quando terminar, seu console mostrará uma mensagem de SUCESSO como esta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Seu Portal do Azure agora terá um grupo de recursos provisionado com esse nome de ambiente:

      ![Infra](../../../../../translated_images/pt-BR/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Agora você está pronto para validar a infraestrutura implantada e a aplicação**.

---

## 4. Validação do Template

1. Visite a página de [Grupos de Recursos](https://portal.azure.com/#browse/resourcegroups) do Azure Portal - faça login quando solicitado
1. Clique no RG com o nome do seu ambiente - você verá a página acima

      - clique no recurso Azure Container Apps
      - clique na URL da Aplicação na seção _Essentials_ (canto superior direito)

1. Você deverá ver uma interface de front-end da aplicação hospedada assim:

   ![App](../../../../../translated_images/pt-BR/03-test-application.471910da12c3038e.webp)

1. Tente fazer algumas [perguntas de exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pergunte: ```Qual é a capital da França?``` 
      1. Pergunte: ```Qual é a melhor barraca de até $200 para duas pessoas, e quais recursos ela inclui?```

1. Você deverá receber respostas semelhantes ao mostrado abaixo. _Mas como isso funciona?_

      ![App](../../../../../translated_images/pt-BR/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validação do Agente

O Azure Container App implanta um endpoint que conecta ao Agente de IA provisionado no projeto Microsoft Foundry para este template. Vamos dar uma olhada no que isso significa.

1. Volte para a página _Visão geral_ do Azure Portal para seu grupo de recursos

1. Clique no recurso `Microsoft Foundry` nesta lista

1. Você verá isso. Clique no botão `Ir para o Portal Microsoft Foundry`.
   ![Foundry](../../../../../translated_images/pt-BR/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Você verá a página do Projeto Foundry para sua aplicação de IA
   ![Project](../../../../../translated_images/pt-BR/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clique em `Agentes` - você verá o Agente padrão provisionado em seu projeto
   ![Agents](../../../../../translated_images/pt-BR/06-visit-agents.bccb263f77b00a09.webp)

1. Selecione-o - e você verá os detalhes do Agente. Observe o seguinte:

      - O agente usa Pesquisa de Arquivos por padrão (sempre)
      - O `Conhecimento` do agente indica que ele tem 32 arquivos carregados (para pesquisa de arquivos)
      ![Agents](../../../../../translated_images/pt-BR/07-view-agent-details.0e049f37f61eae62.webp)

1. Procure a opção `Dados+índices` no menu à esquerda e clique para detalhes.

      - Você verá os 32 arquivos de dados carregados para conhecimento.
      - Estes corresponderão aos 12 arquivos de clientes e 20 arquivos de produtos em `src/files`
      ![Data](../../../../../translated_images/pt-BR/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Você validou o funcionamento do Agente!**

1. As respostas do agente são fundamentadas no conhecimento contido nesses arquivos.
1. Agora você pode fazer perguntas relacionadas a esses dados e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas por "Amanda Perez"

Volte à aba do navegador com o endpoint do Container App e pergunte: `Quais produtos Amanda Perez possui?`. Você deverá ver algo assim:

![Data](../../../../../translated_images/pt-BR/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground do Agente

Vamos construir um pouco mais de intuição para as capacidades do Microsoft Foundry, testando o Agente no Playground dos Agentes.

1. Volte para a página `Agentes` no Microsoft Foundry - selecione o agente padrão
1. Clique na opção `Testar no Playground` - você deverá ver uma interface do Playground assim
1. Faça a mesma pergunta: `Quais produtos Amanda Perez possui?`

    ![Data](../../../../../translated_images/pt-BR/09-ask-in-playground.a1b93794f78fa676.webp)

Você recebe a mesma (ou semelhante) resposta - mas também obtém informações adicionais que podem ajudá-lo a entender a qualidade, custo e desempenho da sua aplicação agentica. Por exemplo:

1. Note que a resposta cita os arquivos de dados usados para "fundamentar" a resposta
1. Passe o mouse sobre qualquer uma dessas etiquetas de arquivos - os dados correspondem à sua consulta e à resposta exibida?

Você também verá uma linha de _estatísticas_ abaixo da resposta.

1. Passe o mouse sobre qualquer métrica - por exemplo, Segurança. Você vê algo assim
1. A avaliação corresponde à sua intuição sobre o nível de segurança da resposta?

      ![Data](../../../../../translated_images/pt-BR/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade Integrada

Observabilidade é sobre instrumentar sua aplicação para gerar dados que podem ser usados para entender, depurar e otimizar suas operações. Para ter uma noção disso:

1. Clique no botão `Ver Informações da Execução` - você deverá ver esta visão. Este é um exemplo de [rastreamento de Agentes](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Você também pode acessar esta visão clicando em Logs de Thread no menu principal_.

   - Tenha uma noção das etapas da execução e ferramentas engajadas pelo agente
   - Entenda a contagem total de Tokens (vs. uso de tokens de saída) para a resposta
   - Entenda a latência e onde o tempo está sendo gasto na execução

      ![Agent](../../../../../translated_images/pt-BR/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clique na aba `Metadados` para ver atributos adicionais da execução, que podem fornecer contexto útil para depuração de problemas depois.

      ![Agent](../../../../../translated_images/pt-BR/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clique na aba `Avaliações` para ver autoavaliações feitas sobre a resposta do agente. Estas incluem avaliações de segurança (por exemplo, Autolesão) e avaliações específicas do agente (por exemplo, Resolução de Intenção, Adesão à Tarefa).

      ![Agent](../../../../../translated_images/pt-BR/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último mas não menos importante, clique na aba `Monitoramento` no menu lateral.

      - Selecione a aba `Uso de Recursos` na página exibida - e veja as métricas.
      - Acompanhe o uso da aplicação em termos de custos (tokens) e carga (requisições).
      - Acompanhe a latência da aplicação até o primeiro byte (processamento de entrada) e último byte (saída).

      ![Agent](../../../../../translated_images/pt-BR/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variáveis de Ambiente

Até agora, percorremos a implantação no navegador - e validamos que nossa infraestrutura foi provisionada e a aplicação está operacional. Mas para trabalhar com o _código da aplicação_ primeiro, precisamos configurar nosso ambiente de desenvolvimento local com as variáveis relevantes necessárias para trabalhar com esses recursos. Usar o `azd` torna isso fácil.

1. O Azure Developer CLI [usa variáveis de ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para armazenar e gerenciar configurações de cada implantação da aplicação.

1. Variáveis de ambiente são armazenadas em `.azure/<nome-do-ambiente>/.env` - isso delimita elas para o ambiente `nome-do-ambiente` usado durante a implantação e ajuda a isolar ambientes entre diferentes alvos de implantação no mesmo repositório.

1. Variáveis de ambiente são automaticamente carregadas pelo comando `azd` sempre que ele executa um comando específico (por exemplo, `azd up`). Note que `azd` não lê automaticamente variáveis de ambiente no _nível do SO_ (por exemplo, definidas no shell) - use em vez disso `azd set env` e `azd get env` para transferir informação dentro de scripts.


Vamos experimentar alguns comandos:

1. Obtenha todas as variáveis de ambiente definidas para `azd` neste ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Você verá algo parecido com:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtenha um valor específico - por exemplo, quero saber se definimos o valor `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Você verá algo assim - não foi definido por padrão!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Defina uma nova variável de ambiente para `azd`. Aqui, atualizamos o nome do modelo do agente. _Nota: quaisquer alterações feitas serão imediatamente refletidas no arquivo `.azure/<nome-do-ambiente>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Agora, devemos encontrar o valor definido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note que alguns recursos são persistentes (por exemplo, implantações de modelo) e requerem mais do que apenas um `azd up` para forçar a reimplantação. Vamos tentar desmontar a implantação original e reimplantar com variáveis de ambiente alteradas.

1. **Atualizar** Se você já implantou infraestrutura anteriormente usando um template azd - você pode _atualizar_ o estado das variáveis de ambiente locais baseado no estado atual da sua implantação Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Esta é uma maneira poderosa de _sincronizar_ variáveis de ambiente em dois ou mais ambientes de desenvolvimento locais (por exemplo, equipe com vários desenvolvedores) - permitindo que a infraestrutura implantada sirva como a verdade fundamental para o estado das variáveis de ambiente. Os membros da equipe simplesmente _atualizam_ as variáveis para voltar a ficar sincronizados.

---

## 9. Parabéns 🏆

Você acabou de completar um fluxo de trabalho de ponta a ponta onde você:

- [X] Selecionou o Modelo AZD que Deseja Usar
- [X] Abriu o modelo em um ambiente de desenvolvimento suportado
- [X] Implantou o Modelo e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2. Validar um Template

> Validado com `azd 1.25.6` em junho de 2026.

!!! tip "AO FINAL DESTE MÓDULO, SERÁ CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Compreender o Fluxo de Trabalho de Implantação AZD
    - [ ] Usar o GitHub Copilot para obter ajuda sobre o uso do AZD
    - [ ] **Lab 2:** Implantar e Validar o template de Agentes de IA

---


## 1. Introdução

A [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comandos open-source que simplifica o fluxo de trabalho do programador ao construir e implantar aplicações no Azure.

[Templates AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios padronizados que incluem código de amostra de aplicação, ativos de _infraestrutura-como-código_, e ficheiros de configuração `azd` para uma arquitetura de solução coesa. Provisionar a infraestrutura torna-se tão simples como um comando `azd provision` — enquanto usar `azd up` permite-lhe provisionar a infraestrutura **e** implantar a sua aplicação de uma só vez!

Como resultado, acelerar o seu processo de desenvolvimento de aplicações pode ser tão simples quanto encontrar o template _AZD Starter_ correto que mais se aproxima das suas necessidades de aplicação e infraestrutura - para depois personalizar o repositório para se ajustar aos seus requisitos de cenário.

Antes de começarmos, vamos garantir que tem a Azure Developer CLI instalada.

1. Abra um terminal no VS Code e escreva este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Deve ver algo semelhante a isto!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Agora está pronto para selecionar e implantar um template com o azd**

---

## 2. Seleção do Template

A plataforma Microsoft Foundry vem com um [conjunto de templates AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários populares como _automação de workflows multi-agente_ e _processamento multimodal de conteúdo_. Pode também descobrir estes templates visitando o portal Microsoft Foundry.

1. Visite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicie sessão no portal Microsoft Foundry quando solicitado - verá algo semelhante a isto.

![Pick](../../../../../translated_images/pt-PT/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Básicas** são os seus templates de início:

1. [ ] [Comece com AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que implanta uma aplicação de chat básica _com os seus dados_ para Azure Container Apps. Use isto para explorar um cenário básico de chatbot com IA.
1. [X] [Comece com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implanta um Agente de IA padrão (com os Agentes Foundry). Use isto para se familiarizar com soluções de IA agente envolvendo ferramentas e modelos.

Visite o segundo link numa aba do navegador nova (ou clique em `Open in GitHub` no cartão relacionado). Deve ver o repositório para este Template AZD. Tire um minuto para explorar o README. A arquitetura da aplicação é assim:

![Arch](../../../../../translated_images/pt-PT/architecture.8cec470ec15c65c7.webp)

---

## 3. Ativação do Template

Vamos tentar implantar este template e garantir que é válido. Vamos seguir as orientações na secção [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Escolha um ambiente de trabalho para o repositório do template:

      - **GitHub Codespaces**: Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) e confirme `Create codespace`
      - **Clone local ou contentor de desenvolvimento**: Clone `Azure-Samples/get-started-with-ai-agents` e abra-o no VS Code

1. Espere até o terminal do VS Code estar pronto, depois escreva o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete os passos do workflow que isto irá disparar:

1. Será solicitado que inicie sessão no Azure - siga as instruções para autenticar
1. Insira um nome único para o ambiente - por exemplo, usei `nitya-mshack-azd`
1. Isto criará uma pasta `.azure/` - verá uma subpasta com o nome do ambiente
1. Será solicitado que selecione um nome de subscrição - selecione a predefinição
1. Será solicitado para uma localização - use `East US 2`

Agora, aguarde pela conclusão do provisionamento. **Isto demora 10-15 minutos**

1. Quando terminar, o seu consola mostrará uma mensagem de SUCESSO como esta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. O seu Portal Azure terá agora um grupo de recursos provisionado com esse nome de ambiente:

      ![Infra](../../../../../translated_images/pt-PT/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Agora está pronto para validar a infraestrutura implantada e a aplicação**.

---

## 4. Validação do Template

1. Visite a página [Resource Groups](https://portal.azure.com/#browse/resourcegroups) do Azure Portal - inicie sessão quando solicitado
1. Clique no RG do nome do seu ambiente - verá a página acima

      - clique no recurso Azure Container Apps
      - clique no URL da Aplicação na secção _Essentials_ (canto superior direito)

1. Deve ver uma interface de front-end da aplicação alojada como esta:

   ![App](../../../../../translated_images/pt-PT/03-test-application.471910da12c3038e.webp)

1. Tente fazer um par de [perguntas de amostra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pergunte: ```Qual é a capital de França?``` 
      1. Pergunte: ```Qual é a melhor tenda abaixo de 200 dólares para duas pessoas, e que características inclui?```

1. Deve obter respostas semelhantes às mostradas abaixo. _Mas como funciona isto?_ 

      ![App](../../../../../translated_images/pt-PT/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validação do Agente

A aplicação Azure Container App implanta um endpoint que liga ao Agente de IA provisionado no projeto Microsoft Foundry para este template. Vamos ver o que isto significa.

1. Volte à página _Overview_ no Azure Portal para o seu grupo de recursos

1. Clique no recurso `Microsoft Foundry` nessa lista

1. Deve ver isto. Clique no botão `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pt-PT/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deve ver a página do projeto Foundry para a sua aplicação de IA
   ![Project](../../../../../translated_images/pt-PT/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clique em `Agents` - verá o Agente predefinido provisionado no seu projeto
   ![Agents](../../../../../translated_images/pt-PT/06-visit-agents.bccb263f77b00a09.webp)

1. Selecione-o - e verá os detalhes do Agente. Note o seguinte:

      - O agente usa Pesquisa de Ficheiros por predefinição (sempre)
      - O `Knowledge` do agente indica que tem 32 ficheiros carregados (para pesquisa de ficheiros)
      ![Agents](../../../../../translated_images/pt-PT/07-view-agent-details.0e049f37f61eae62.webp)

1. Procure a opção `Data+indexes` no menu da esquerda e clique para detalhes. 

      - Deve ver os 32 ficheiros de dados carregados para conhecimento.
      - Estes correspondem aos 12 ficheiros de clientes e 20 ficheiros de produtos em `src/files` 
      ![Data](../../../../../translated_images/pt-PT/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validou o funcionamento do Agente!** 

1. As respostas do agente são baseadas no conhecimento desses ficheiros. 
1. Agora pode fazer perguntas relacionadas com esses dados e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas por "Amanda Perez"

Reveja a aba do navegador com o endpoint da Container App e pergunte: `Que produtos possui Amanda Perez?`. Deve ver algo assim:

![Data](../../../../../translated_images/pt-PT/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground do Agente

Vamos construir um pouco mais de intuição para as capacidades do Microsoft Foundry, testando o Agente no Agents Playground.

1. Volte à página `Agents` no Microsoft Foundry - selecione o agente predefinido
1. Clique na opção `Try in Playground` - deverá obter uma UI do Playground como esta
1. Pergunte a mesma questão: `Que produtos possui Amanda Perez?`

    ![Data](../../../../../translated_images/pt-PT/09-ask-in-playground.a1b93794f78fa676.webp)

Obtém a mesma (ou semelhante) resposta - mas também recebe informação adicional para entender a qualidade, custo e desempenho da sua aplicação agente. Por exemplo:

1. Note que a resposta cita ficheiros de dados usados para "fundamentar" a resposta
1. Passe o rato sobre qualquer uma destas etiquetas de ficheiro - os dados correspondem à sua consulta e à resposta apresentada?

Também verá uma linha de _estatísticas_ abaixo da resposta.

1. Passe o rato sobre qualquer métrica - por exemplo, Segurança. Verá algo assim
1. A avaliação corresponde à sua intuição para o nível de segurança da resposta?

      ![Data](../../../../../translated_images/pt-PT/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade Incorporada

Observabilidade consiste em instrumentar a sua aplicação para gerar dados que podem ser usados para entender, debugar e otimizar as suas operações. Para ter uma noção disto:

1. Clique no botão `View Run Info` - deverá ver esta vista. Este é um exemplo de [agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Também pode obter esta vista clicando em Thread Logs no menu principal_.

   - Veja os passos de execução e as ferramentas usadas pelo agente
   - Entenda a contagem total de Tokens (vs. uso de tokens de saída) para a resposta
   - Compreenda a latência e onde o tempo está a ser gasto na execução

      ![Agent](../../../../../translated_images/pt-PT/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clique no separador `Metadata` para ver atributos adicionais da execução, que podem fornecer contexto útil para depuração de problemas futuramente.   

      ![Agent](../../../../../translated_images/pt-PT/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clique no separador `Evaluations` para ver as autoavaliações feitas sobre a resposta do agente. Estas incluem avaliações de segurança (por exemplo, Autolesão) e avaliações específicas do agente (por exemplo, resolução de intenção, aderência à tarefa).

      ![Agent](../../../../../translated_images/pt-PT/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, mas não menos importante, clique no separador `Monitoring` no menu lateral.

      - Selecione o separador `Resource usage` na página apresentada - e veja as métricas.
      - Acompanhe o uso da aplicação em termos de custos (tokens) e carga (requisições).
      - Acompanhe a latência da aplicação até ao primeiro byte (processamento de entrada) e último byte (saída).

      ![Agent](../../../../../translated_images/pt-PT/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variáveis de Ambiente

Até agora, percorremos a implantação no navegador - e validámos que a nossa infraestrutura está provisionada e a aplicação está operacional. Mas para trabalhar com o código da aplicação _primeiro_, precisamos configurar o ambiente de desenvolvimento local com as variáveis relevantes para trabalhar com estes recursos. Usar `azd` torna isto fácil.

1. A Azure Developer CLI [usa variáveis de ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para armazenar e gerir definições de configuração para as implantações da aplicação.

1. As variáveis de ambiente são armazenadas em `.azure/<env-name>/.env` - isto limita-as ao ambiente `env-name` usado durante a implantação e ajuda a isolar ambientes entre diferentes alvos de implantação no mesmo repositório.

1. As variáveis de ambiente são automaticamente carregadas sempre que o comando `azd` executa um comando específico (por exemplo, `azd up`). Note que `azd` não lê automaticamente variáveis de ambiente _ao nível do SO_ (por exemplo, definidas na shell) - em vez disso, use `azd set env` e `azd get env` para transferir informação dentro de scripts.


Vamos experimentar alguns comandos:

1. Obtenha todas as variáveis de ambiente definidas para `azd` neste ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Verá algo assim:

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
      
      Verá algo assim - não foi definido por predefinição!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Defina uma nova variável de ambiente para `azd`. Aqui, atualizamos o nome do modelo do agente. _Nota: quaisquer alterações feitas serão refletidas imediatamente no ficheiro `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Agora, devemos encontrar o valor definido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note que alguns recursos são persistentes (por exemplo, implantações de modelo) e vão exigir mais do que apenas um `azd up` para forçar uma reimplantação. Vamos tentar desmantelar a implantação original e implantá-la novamente com variáveis de ambiente alteradas.

1. **Atualizar** Se antes tiver implantado infraestrutura usando um template azd - pode _atualizar_ o estado das suas variáveis de ambiente locais com base no estado atual da sua implantação Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta é uma forma poderosa de _sincronizar_ variáveis de ambiente entre dois ou mais ambientes de desenvolvimento local (por exemplo, equipa com vários desenvolvedores) - permitindo que a infraestrutura implantada sirva como a verdade fundamental para o estado das variáveis de ambiente. Os membros da equipa simplesmente _atualizam_ as variáveis para voltarem a sincronizar.

---

## 9. Parabéns 🏆

Acabou de concluir um fluxo de trabalho completo onde:

- [X] Selecionou o Modelo AZD que Quer Usar
- [X] Abriu o modelo num ambiente de desenvolvimento suportado
- [X] Implantou o Modelo e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
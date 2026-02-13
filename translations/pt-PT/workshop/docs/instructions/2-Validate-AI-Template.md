# 2. Validar um Template

!!! tip "NO FINAL DESTE MÓDULO VAI SER CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Compreender o Workflow de Deployment AZD
    - [ ] Usar o GitHub Copilot para obter ajuda sobre o uso do AZD
    - [ ] **Laboratório 2:** Implementar e Validar o template de Agentes de IA

---


## 1. Introdução

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comando open-source que simplifica o fluxo de trabalho do programador ao construir e implementar aplicações no Azure.

[Templates AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios padronizados que incluem código de aplicação de exemplo, recursos _infraestrutura-como-código_ e ficheiros de configuração `azd` para uma arquitetura de solução coerente. Provisionar a infraestrutura torna-se tão simples como o comando `azd provision` - enquanto o uso de `azd up` permite providenciar infraestrutura **e** implementar a sua aplicação de uma só vez!

Como resultado, iniciar o processo de desenvolvimento da sua aplicação pode ser tão simples como encontrar o _template inicial AZD_ que mais se aproxima das suas necessidades de aplicação e infraestrutura - e depois personalizar o repositório para adequar aos requisitos do seu cenário.

Antes de começarmos, vamos garantir que tem o Azure Developer CLI instalado.

1. Abra um terminal do VS Code e digite este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Deverá ver algo como isto!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Agora está pronto para selecionar e implementar um template com azd**

---

## 2. Seleção do Template

A plataforma Microsoft Foundry vem com um [conjunto de templates AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários populares, como _automação de fluxo de trabalho multiagente_ e _processamento multimodal de conteúdos_. Também pode descobrir estes templates visitando o portal Microsoft Foundry.

1. Visite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicie sessão no portal Microsoft Foundry quando solicitado – verá algo assim.

![Pick](../../../../../translated_images/pt-PT/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Basic** são os seus templates iniciais:

1. [ ] [Começar com Chat de IA](https://github.com/Azure-Samples/get-started-with-ai-chat) que implementa uma aplicação de chat básica _com os seus dados_ para Azure Container Apps. Use isto para explorar um cenário básico de chatbot de IA.
1. [X] [Começar com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implementa um Agente de IA padrão (com os Agentes Foundry). Use isto para se familiarizar com soluções de IA agentica envolvendo ferramentas e modelos.

Visite o segundo link numa nova aba do navegador (ou clique em `Open in GitHub` no cartão relacionado). Deverá ver o repositório para este Template AZD. Dedique um momento para explorar o README. A arquitetura da aplicação é a seguinte:

![Arch](../../../../../translated_images/pt-PT/architecture.8cec470ec15c65c7.webp)

---

## 3. Ativação do Template

Vamos tentar implementar este template e garantir que é válido. Seguiremos as orientações na secção [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirme a ação predefinida para `Create codespace`
1. Isto abre uma nova aba do navegador - aguarde que a sessão do GitHub Codespaces termine de carregar
1. Abra o terminal VS Code no Codespaces - digite o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete os passos do workflow que isto irá disparar:

1. Será solicitado que inicie sessão no Azure – siga as instruções para autenticar-se
1. Introduza um nome de ambiente único para si – por ex., usei `nitya-mshack-azd`
1. Isto criará uma pasta `.azure/` - verá uma subpasta com o nome do ambiente
1. Será solicitado que selecione um nome de subscrição – selecione a predefinição
1. Será solicitado que escolha uma localização – use `East US 2`

Agora, aguarde que o provisionamento seja concluído. **Isto demora entre 10 a 15 minutos**

1. Quando terminar, o seu console mostrará uma mensagem de SUCESSO como esta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. O seu Portal Azure terá agora um grupo de recursos provido com esse nome de ambiente:

      ![Infra](../../../../../translated_images/pt-PT/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Agora está pronto para validar a infraestrutura e aplicação implementadas**.

---

## 4. Validação do Template

1. Visite a página [Resource Groups](https://portal.azure.com/#browse/resourcegroups) do Azure Portal – inicie sessão quando solicitado
1. Clique no RG para o seu nome de ambiente – verá a página acima

      - clique no recurso Azure Container Apps
      - clique no URL da aplicação na secção _Essentials_ (canto superior direito)

1. Deverá ver uma interface de utilizador da aplicação hospedada assim:

   ![App](../../../../../translated_images/pt-PT/03-test-application.471910da12c3038e.webp)

1. Tente fazer algumas [perguntas de exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pergunte: ```Qual é a capital de França?```
      1. Pergunte: ```Qual é a melhor tenda abaixo de 200$ para duas pessoas, e que características inclui?```

1. Deverá obter respostas semelhantes às mostradas abaixo. _Mas como é que isto funciona?_

      ![App](../../../../../translated_images/pt-PT/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validação do Agente

A Azure Container App implementa um endpoint que se liga ao Agente de IA provisionado no projeto Microsoft Foundry para este template. Vamos ver o que isso implica.

1. Regressar à página _Overview_ do Azure Portal para o seu grupo de recursos

1. Clique no recurso `Microsoft Foundry` nessa lista

1. Deve ver isto. Clique no botão `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/pt-PT/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deve ver a página do Projeto Foundry para a sua aplicação de IA
   ![Project](../../../../../translated_images/pt-PT/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clique em `Agents` - verá o Agente predefinido provisionado no seu projeto
   ![Agents](../../../../../translated_images/pt-PT/06-visit-agents.bccb263f77b00a09.webp)

1. Selecione-o - e verá os detalhes do Agente. Atente nos seguintes pontos:

      - O agente usa Pesquisa de Ficheiros por defeito (sempre)
      - O `Knowledge` do agente indica que há 32 ficheiros carregados (para pesquisa nos ficheiros)
      ![Agents](../../../../../translated_images/pt-PT/07-view-agent-details.0e049f37f61eae62.webp)

1. Procure a opção `Data+indexes` no menu à esquerda e clique para detalhes.

      - Deve ver os 32 ficheiros de dados carregados para o conhecimento.
      - Estes correspondem aos 12 ficheiros de cliente e 20 ficheiros de produto em `src/files`
      ![Data](../../../../../translated_images/pt-PT/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validou o funcionamento do Agente!**

1. As respostas do agente estão baseadas no conhecimento contido nesses ficheiros.
1. Pode agora fazer perguntas relacionadas com esses dados e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas por "Amanda Perez"

Volte à aba do navegador com o endpoint do Container App e pergunte: `Quais produtos são de Amanda Perez?`. Deve ver algo assim:

![Data](../../../../../translated_images/pt-PT/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground do Agente

Vamos ganhar um pouco mais de intuição sobre as capacidades do Microsoft Foundry, experimentando o Agente na Agents Playground.

1. Regressar à página `Agents` no Microsoft Foundry – selecione o agente predefinido
1. Clique na opção `Try in Playground` – deverá obter uma interface de Playground assim
1. Pergunte a mesma questão: `Quais produtos são de Amanda Perez?`

    ![Data](../../../../../translated_images/pt-PT/09-ask-in-playground.a1b93794f78fa676.webp)

Obtém a mesma (ou semelhante) resposta – mas também recebe informações adicionais que pode usar para compreender a qualidade, custo e desempenho da sua aplicação agentica. Por exemplo:

1. Note que a resposta cita os ficheiros de dados usados para "fundamentar" a resposta
1. Passe o rato sobre qualquer uma dessas etiquetas de ficheiros – os dados correspondem à sua consulta e à resposta exibida?

Também vê uma linha de _estatísticas_ abaixo da resposta.

1. Passe o rato sobre qualquer métrica – por exemplo, Segurança. Verá algo assim
1. A avaliação corresponde à sua intuição sobre o nível de segurança da resposta?

      ![Data](../../../../../translated_images/pt-PT/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade Incorporada

Observabilidade é sobre instrumentar a sua aplicação para gerar dados que podem ser usados para entender, depurar e otimizar as suas operações. Para ter uma ideia disto:

1. Clique no botão `View Run Info` – verá esta vista. Este é um exemplo de [tracing do Agente](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Também pode obter esta vista clicando em Thread Logs no menu superior_.

   - Tenha uma ideia dos passos de execução e ferramentas envolvidas pelo agente
   - Compreenda a contagem total de Tokens (vs. uso de tokens de saída) para a resposta
   - Compreenda a latência e onde está a ser gasta o tempo na execução

      ![Agent](../../../../../translated_images/pt-PT/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clique no separador `Metadata` para ver atributos adicionais da execução, que podem fornecer contexto útil para depurar problemas mais tarde.

      ![Agent](../../../../../translated_images/pt-PT/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clique no separador `Evaluations` para ver autoavaliações feitas na resposta do agente. Estas incluem avaliações de segurança (ex., auto-dano) e avaliações específicas do agente (ex., resolução de intenção, adesão à tarefa).

      ![Agent](../../../../../translated_images/pt-PT/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, mas não menos importante, clique no separador `Monitoring` no menu lateral.

      - Selecione o separador `Resource usage` na página exibida – e visualize os métricos.
      - Acompanhe o uso da aplicação em termos de custos (tokens) e carga (pedidos).
      - Acompanhe a latência da aplicação ao primeiro byte (processamento de entrada) e último byte (saída).

      ![Agent](../../../../../translated_images/pt-PT/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variáveis de Ambiente

Até agora, percorremos a implementação no navegador – e validámos que a nossa infraestrutura está provida e a aplicação operacional. Mas para trabalhar com o _código_ da aplicação primeiro, precisamos de configurar o nosso ambiente de desenvolvimento local com as variáveis relevantes necessárias para trabalhar com esses recursos. Usar `azd` torna isso fácil.

1. O Azure Developer CLI [usa variáveis de ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para armazenar e gerir configurações de configuração para as implementações da aplicação.

1. As variáveis de ambiente são armazenadas em `.azure/<env-name>/.env` – isto delimita-as ao ambiente `env-name` usado durante a implementação e ajuda a isolar ambientes entre diferentes destinos de implementação no mesmo repositório.

1. As variáveis de ambiente são automaticamente carregadas pelo comando `azd` sempre que executa um comando específico (ex., `azd up`). Note que o `azd` não lê automaticamente variáveis de ambiente a nível de _SO_ (ex., definidas no shell) – em vez disso, use `azd set env` e `azd get env` para transferir informação dentro dos scripts.


Vamos experimentar alguns comandos:

1. Obtenha todas as variáveis de ambiente definidas para `azd` neste ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Verá algo como:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtenha um valor específico – por exemplo, quero saber se definimos o valor `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Verá algo assim – não foi definido por defeito!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Defina uma nova variável de ambiente para `azd`. Aqui, atualizamos o nome do modelo do agente. _Nota: quaisquer alterações feitas serão refletidas imediatamente no ficheiro `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Agora, devemos encontrar o valor definido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note que alguns recursos são persistentes (ex., implementações de modelo) e irão requerer mais do que um simples `azd up` para forçar a reimplementação. Vamos tentar desmontar a implementação original e reimplantar com as variáveis de ambiente alteradas.

1. **Atualizar** Se tiver implementado previamente infraestrutura usando um template azd – pode _atualizar_ o estado das suas variáveis de ambiente locais com base no estado atual da sua implementação Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta é uma forma poderosa de _sincronizar_ variáveis de ambiente entre dois ou mais ambientes de desenvolvimento locais (por exemplo, uma equipa com múltiplos desenvolvedores) - permitindo que a infraestrutura implementada sirva como a verdade fundamental para o estado das variáveis de ambiente. Os membros da equipa apenas precisam de _atualizar_ as variáveis para voltarem a estar sincronizados.

---

## 9. Parabéns 🏆

Acabou de completar um fluxo de trabalho de ponta a ponta onde:

- [X] Selecionou o Modelo AZD que Quer Usar
- [X] Lançou o Modelo com GitHub Codespaces 
- [X] Implementou o Modelo e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, tenha em atenção que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por um ser humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
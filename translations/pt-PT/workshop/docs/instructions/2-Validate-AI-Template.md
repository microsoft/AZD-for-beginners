# 2. Validar um Template

!!! tip "NO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Compreender o Workflow de Implementação do AZD
    - [ ] Usar o GitHub Copilot para obter ajuda no uso do AZD
    - [ ] **Lab 2:** Implementar & Validar o template de Agentes de IA

---


## 1. Introdução

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comandos open-source que simplifica o workflow do programador ao construir e implementar aplicações na Azure. 

[Templates AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios standardizados que incluem código de aplicação de exemplo, recursos de _infraestrutura como código_, e ficheiros de configuração `azd` para uma arquitetura de solução coesa. A provisão da infraestrutura torna-se tão simples quanto o comando `azd provision` - enquanto o uso de `azd up` permite que faça a provisão da infraestrutura **e** implemente a sua aplicação de uma só vez!

Como resultado, começar o seu desenvolvimento de aplicação pode ser tão simples quanto encontrar o _template AZD Starter_ mais próximo das suas necessidades de aplicação e infraestrutura - e depois personalizar o repositório para adequar-se aos seus requisitos de cenário.

Antes de começarmos, vamos garantir que tem o Azure Developer CLI instalado.

1. Abra um terminal no VS Code e escreva este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Deve ver algo parecido com isto!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Está agora pronto para selecionar e implementar um template com azd**

---

## 2. Seleção do Template

A plataforma Microsoft Foundry vem com um [conjunto de templates AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários populares de solução como _automação de workflows multi-agente_ e _processamento multimodal de conteúdos_. Também pode encontrar estes templates visitando o portal Microsoft Foundry.

1. Visite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicie sessão no portal Microsoft Foundry quando solicitado - verá algo parecido com isto.

![Pick](../../../../../translated_images/pt-PT/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Basic** são os seus templates de início:

1. [ ] [Começar com Chat de IA](https://github.com/Azure-Samples/get-started-with-ai-chat) que implementa uma aplicação básica de chat _com os seus dados_ para Azure Container Apps. Use este para explorar um cenário básico de chatbot de IA.
1. [X] [Começar com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implementa um Agente de IA standard (com os Foundry Agents). Use este para se familiarizar com soluções de IA agentic que envolvem ferramentas e modelos.

Visite o segundo link numa nova aba do navegador (ou clique em `Open in GitHub` no cartão associado). Deve ver o repositório para este Template AZD. Tire um minuto para explorar o README. A arquitetura da aplicação é como esta:

![Arch](../../../../../translated_images/pt-PT/architecture.8cec470ec15c65c7.webp)

---

## 3. Ativação do Template

Vamos tentar implementar este template e garantir que é válido. Seguiremos as instruções na seção [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirme a ação padrão para `Create codespace`
1. Isto abre uma nova aba no navegador - aguarde a sessão GitHub Codespaces carregar completamente
1. Abra o terminal VS Code nos Codespaces - escreva o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete as etapas do workflow que este comando irá disparar:

1. Será solicitado que inicie sessão na Azure - siga as instruções para autenticar
1. Digite um nome único para o seu ambiente - por exemplo, usei `nitya-mshack-azd`
1. Será criada uma pasta `.azure/` - verá uma subpasta com o nome do ambiente
1. Será solicitado que selecione um nome de subscrição - selecione o padrão
1. Será solicitado que escolha uma localização - use `East US 2`

Agora, espere que a provisão seja concluída. **Isto demora entre 10 a 15 minutos**

1. Quando terminar, o seu console mostrará uma mensagem de SUCESSO como esta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. O seu Portal Azure terá agora um grupo de recursos provisionado com esse nome do ambiente:

      ![Infra](../../../../../translated_images/pt-PT/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Está agora pronto para validar a infraestrutura e a aplicação implementadas**.

---

## 4. Validação do Template

1. Visite a página de [Resource Groups](https://portal.azure.com/#browse/resourcegroups) do Portal Azure - inicie sessão quando solicitado
1. Clique no RG para o nome do seu ambiente - verá a página acima

      - clique no recurso Azure Container Apps
      - clique no Application Url na secção _Essentials_ (canto superior direito)

1. Deve ver uma interface de front-end da aplicação alojada como esta:

   ![App](../../../../../translated_images/pt-PT/03-test-application.471910da12c3038e.webp)

1. Tente fazer algumas [perguntas de exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pergunte: ```Qual é a capital de França?``` 
      1. Pergunte: ```Qual é a melhor tenda abaixo de 200$ para duas pessoas, e quais as funcionalidades que inclui?```

1. Deve receber respostas semelhantes às mostradas abaixo. _Mas como é que isto funciona?_ 

      ![App](../../../../../translated_images/pt-PT/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validação do Agente

A Azure Container App implementa um endpoint que se conecta ao Agente de IA provisionado no projeto Microsoft Foundry para este template. Vamos ver o que isso significa.

1. Volte à página _Overview_ do Portal Azure para o seu grupo de recursos

1. Clique no recurso `Microsoft Foundry` nessa lista

1. Deve ver isto. Clique no botão `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pt-PT/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deve ver a página do Projeto Foundry para a sua aplicação de IA
   ![Project](../../../../../translated_images/pt-PT/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clique em `Agents` - verá o Agente padrão provisionado no seu projeto
   ![Agents](../../../../../translated_images/pt-PT/06-visit-agents.bccb263f77b00a09.webp)

1. Selecione-o - e verá os detalhes do Agente. Note os seguintes pontos:

      - O agente usa File Search por padrão (sempre)
      - O `Knowledge` do agente indica que tem 32 ficheiros carregados (para a pesquisa de ficheiros)
      ![Agents](../../../../../translated_images/pt-PT/07-view-agent-details.0e049f37f61eae62.webp)

1. Procure a opção `Data+indexes` no menu à esquerda e clique para detalhes. 

      - Deve ver os 32 ficheiros de dados carregados para o conhecimento.
      - Estes correspondem aos 12 ficheiros de clientes e 20 ficheiros de produtos em `src/files` 
      ![Data](../../../../../translated_images/pt-PT/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validou o funcionamento do Agente!** 

1. As respostas do agente estão fundamentadas no conhecimento desses ficheiros. 
1. Agora pode fazer perguntas relacionadas a esses dados, e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas pela "Amanda Perez"

Volte à aba do navegador com o endpoint da Container App e pergunte: `Que produtos possui Amanda Perez?`. Deve ver algo assim:

![Data](../../../../../translated_images/pt-PT/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground do Agente

Vamos desenvolver um pouco mais a intuição sobre as capacidades da Microsoft Foundry, experimentando o Agente no Agents Playground. 

1. Volte à página `Agents` na Microsoft Foundry - selecione o agente padrão
1. Clique na opção `Try in Playground` - deverá ver uma interface de Playground como esta
1. Pergunte a mesma questão: `Que produtos possui Amanda Perez?`

    ![Data](../../../../../translated_images/pt-PT/09-ask-in-playground.a1b93794f78fa676.webp)

Obterá a mesma (ou semelhante) resposta - mas também informações adicionais que pode usar para compreender a qualidade, custo e desempenho da sua aplicação agentic. Por exemplo:

1. Note que a resposta cita ficheiros de dados usados para "sustentar" a resposta
1. Passe o cursor sobre qualquer uma das etiquetas dos ficheiros - os dados correspondem à sua query e resposta mostrada?

Também verá uma linha de _stats_ abaixo da resposta. 

1. Passe o cursor sobre qualquer métrica - ex.: Segurança. Verá algo assim
1. A avaliação corresponde à sua intuição sobre o nível de segurança da resposta?

      ![Data](../../../../../translated_images/pt-PT/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade incorporada

Observabilidade consiste em instrumentar a sua aplicação para gerar dados que possam ser usados para compreender, diagnosticar e otimizar as suas operações. Para ter uma noção disso:

1. Clique no botão `View Run Info` - deve ver esta vista. Este é um exemplo de [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Também pode obter esta vista clicando em Thread Logs no menu principal_.

   - Tenha uma noção dos passos da execução e das ferramentas envolvidas pelo agente
   - Compreenda o total de Tokens usados (vs. tokens de output) na resposta
   - Compreenda a latência e onde o tempo é gasto na execução

      ![Agent](../../../../../translated_images/pt-PT/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clique no separador `Metadata` para ver atributos adicionais da execução, que podem proporcionar contexto útil para depurar problemas depois.   

      ![Agent](../../../../../translated_images/pt-PT/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clique no separador `Evaluations` para ver autoavaliações feitas sobre a resposta do agente. Estas incluem avaliações de segurança (ex.: auto-dano) e avaliações específicas do agente (ex.: resolução de intenções, aderência a tarefas).

      ![Agent](../../../../../translated_images/pt-PT/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, mas não menos importante, clique no separador `Monitoring` no menu lateral.

      - Selecione a aba `Resource usage` na página exibida - e veja os métricos.
      - Acompanhe o uso da aplicação em termos de custos (tokens) e carga (requisições).
      - Acompanhe a latência da aplicação até ao primeiro byte (processamento da entrada) e último byte (output).

      ![Agent](../../../../../translated_images/pt-PT/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variáveis de Ambiente

Até agora, caminharam pela implementação no navegador - e validaram que a infraestrutura está provisionada e a aplicação está operacional. Mas para trabalhar com o código da aplicação _primeiro_, precisamos configurar o nosso ambiente local de desenvolvimento com as variáveis relevantes requeridas para trabalhar com esses recursos. Usar `azd` torna isto fácil.

1. O Azure Developer CLI [usa variáveis de ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para armazenar e gerir configurações para a implementação das aplicações.

1. As variáveis de ambiente são guardadas em `.azure/<env-name>/.env` - isto limita-as ao ambiente `env-name` usado durante a implementação e ajuda a isolar os ambientes entre diferentes alvos de implementação no mesmo repositório.

1. As variáveis de ambiente são carregadas automaticamente pelo comando `azd` sempre que este executa um comando específico (ex.: `azd up`). Note que o `azd` não lê automaticamente variáveis de ambiente ao nível do SO (ex.: definidas no shell) - em vez disso use `azd set env` e `azd get env` para transferir informação dentro de scripts.


Vamos experimentar alguns comandos:

1. Obtenha todas as variáveis de ambiente definidas para `azd` neste ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Deve ver algo como:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtenha um valor específico - ex.: quero saber se definimos o valor `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Deve ver algo assim - não foi definido por omissão!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Defina uma nova variável de ambiente para o `azd`. Aqui, atualizamos o nome do modelo do agente. _Nota: quaisquer alterações feitas serão imediatamente refletidas no ficheiro `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Agora, deve encontrar que o valor está definido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note que alguns recursos são persistentes (ex.: implementações de modelos) e vai ser necessário mais do que um `azd up` para forçar a reimplementação. Vamos tentar desmontar a implementação original e reimplementar com as variáveis de ambiente alteradas.

1. **Atualizar** Se já tiver implementado infraestrutura usando um template azd - pode _atualizar_ o estado das suas variáveis de ambiente locais baseado no estado atual da sua implementação Azure com este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta é uma forma poderosa de _sincronizar_ variáveis de ambiente entre dois ou mais ambientes de desenvolvimento locais (por exemplo, equipa com múltiplos desenvolvedores) - permitindo que a infraestrutura implantada sirva como a verdade fundamental para o estado das variáveis de ambiente. Os membros da equipa simplesmente _atualizam_ as variáveis para se voltarem a sincronizar.

---

## 9. Parabéns 🏆

Acabou de completar um fluxo de trabalho de ponta a ponta onde você:

- [X] Selecionou o Modelo AZD Que Quer Usar
- [X] Lançou O Modelo Com GitHub Codespaces
- [X] Implantou o Modelo e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
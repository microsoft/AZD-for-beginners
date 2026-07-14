# 2. Validar um Modelo

> Validado com `azd 1.27.1` em Julho de 2026.

!!! tip "AO FINAL DESTE MÓDULO SERÁS CAPAZ DE"

    - [ ] Analisar a Arquitetura da Solução de IA
    - [ ] Compreender o Fluxo de Trabalho de Implantação do AZD
    - [ ] Usar o GitHub Copilot para obter ajuda sobre o uso do AZD
    - [ ] **Laboratório 2:** Implantar e Validar o modelo de Agentes de IA

---


## 1. Introdução

O [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` é uma ferramenta de linha de comando open-source que simplifica o fluxo de trabalho do programador ao construir e implantar aplicações no Azure. 

[Modelos AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) são repositórios padronizados que incluem código de aplicação de exemplo, recursos de _infraestrutura como código_ e ficheiros de configuração `azd` para uma arquitetura de solução coerente. O provisionamento da infraestrutura torna-se tão simples quanto o comando `azd provision` - enquanto usar `azd up` permite provisionar a infraestrutura **e** implantar a tua aplicação num só passo!

Como resultado, iniciar o processo de desenvolvimento da tua aplicação pode ser tão simples quanto encontrar o modelo _AZD Starter_ adequado que corresponde às necessidades da tua aplicação e infraestrutura - e depois personalizar o repositório para se adequar aos requisitos do teu cenário.

Antes de começarmos, certifiquemo-nos que tens instalado o Azure Developer CLI.

1. Abre um terminal no VS Code e escreve este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Deverás ver algo assim!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Agora estás pronto para selecionar e implantar um modelo com azd**

---

## 2. Seleção de Modelo

A plataforma Microsoft Foundry disponibiliza um [conjunto de modelos AZD recomendados](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cobrem cenários populares de solução como _automação de fluxo de trabalho multiagente_ e _processamento multi-modal de conteúdos_. Podes também descobrir estes modelos visitando o portal Microsoft Foundry.

1. Visita [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicia sessão no portal Microsoft Foundry quando solicitado - verás algo assim.

![Pick](../../../../../translated_images/pt-PT/01-pick-template.60d2d5fff5ebc374.webp)


As opções **Básicas** são os teus modelos iniciais:

1. [ ] [Começar com Chat de IA](https://github.com/Azure-Samples/get-started-with-ai-chat) que implanta uma aplicação básica de chat _com os teus dados_ para Azure Container Apps. Utiliza isto para explorar um cenário básico de chatbot IA.
1. [X] [Começar com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) que também implanta um Agente IA padrão (com os Agentes Foundry). Usa isto para te familiarizares com soluções de IA agenticas envolvendo ferramentas e modelos.

Visita o segundo link numa nova aba do navegador (ou clica em `Open in GitHub` no cartão relacionado). Deverás ver o repositório para este Modelo AZD. Tira um minuto para explorar o README. A arquitetura da aplicação é assim:

![Arch](../../../../../translated_images/pt-PT/architecture.8cec470ec15c65c7.webp)

---

## 3. Ativação do Modelo

Vamos tentar implantar este modelo e garantir que é válido. Seguiremos as diretrizes na secção [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Escolhe um ambiente de trabalho para o repositório do modelo:

      - **GitHub Codespaces**: Clique [neste link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) e confirma `Create codespace`
      - **Clone local ou contentor de desenvolvimento**: Clona `Azure-Samples/get-started-with-ai-agents` e abre-o no VS Code

1. Espera até o terminal VS Code estar pronto, depois escreve o seguinte comando:

   ```bash title="" linenums="0"
   azd up
   ```

Completa os passos do fluxo de trabalho que isto irá ativar:

1. Será solicitado que inicies sessão no Azure - segue as instruções para autenticação
1. Introduz um nome de ambiente único para ti - por exemplo, usei `nitya-mshack-azd`
1. Isto criará uma pasta `.azure/` - verás uma subpasta com o nome do ambiente
1. Te vai ser pedido que seleciones uma subscrição - seleciona a padrão
1. Será pedido um local - usa `East US 2`

Agora aspetas que o provisionamento se complete. **Isto demora 10-15 minutos**

1. Quando terminar, o teu console mostrará uma mensagem de SUCESSO assim:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. O teu Portal Azure terá agora um grupo de recursos provisionado com esse nome de ambiente:

      ![Infra](../../../../../translated_images/pt-PT/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Agora estás pronto para validar a infraestrutura e aplicação implantadas**.

---

## 4. Validação do Modelo

1. Visita a página [Grupos de Recursos](https://portal.azure.com/#browse/resourcegroups) do Azure Portal - inicia sessão quando solicitado
1. Clica no GR do teu nome de ambiente - verás a página acima

      - clica no recurso Azure Container Apps
      - clica na URL da Aplicação na secção _Essentials_ (canto superior direito)

1. Deverás ver uma interface de front-end da aplicação hospedada assim:

   ![App](../../../../../translated_images/pt-PT/03-test-application.471910da12c3038e.webp)

1. Tenta fazer umas quantas [perguntas de exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pergunta: ```Qual é a capital de França?``` 
      1. Pergunta: ```Qual é a melhor tenda por menos de 200 dólares para duas pessoas, e que caraterísticas tem?```

1. Deverás obter respostas semelhantes às mostradas abaixo. _Mas como funciona isto?_ 

      ![App](../../../../../translated_images/pt-PT/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validação do Agente

A Azure Container App implanta um endpoint que conecta ao Agente de IA provisionado no projeto Microsoft Foundry para este modelo. Vamos ver o que isto significa.

1. Volta à página _Overview_ do Azure Portal para o teu grupo de recursos

1. Clica no recurso `Microsoft Foundry` nessa lista

1. Deverás ver isto. Clica no botão `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pt-PT/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deverás ver a página do Projeto Foundry para a tua aplicação de IA
   ![Project](../../../../../translated_images/pt-PT/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clica em `Agents` - verás o Agente padrão provisionado no teu projeto
   ![Agents](../../../../../translated_images/pt-PT/06-visit-agents.bccb263f77b00a09.webp)

1. Seleciona-o - verás os detalhes do Agente. Nota o seguinte:

      - O agente usa a Pesquisa de Ficheiros por defeito (sempre)
      - O atributo `Knowledge` do agente indica que tem 32 ficheiros carregados (para pesquisa de ficheiros)
      ![Agents](../../../../../translated_images/pt-PT/07-view-agent-details.0e049f37f61eae62.webp)

1. Procura a opção `Data+indexes` no menu lateral e clica para detalhes. 

      - Deverás ver os 32 ficheiros de dados carregados para o conhecimento.
      - Estes correspondem aos 12 ficheiros de clientes e aos 20 ficheiros de produtos em `src/files` 
      ![Data](../../../../../translated_images/pt-PT/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validaste o funcionamento do Agente!** 

1. As respostas do agente baseiam-se no conhecimento contido nesses ficheiros. 
1. Agora podes fazer perguntas relacionadas com esses dados e obter respostas fundamentadas.
1. Exemplo: `customer_info_10.json` descreve as 3 compras feitas por "Amanda Perez"

Regressa ao separador do navegador com o endpoint da Container App e pergunta: `Que produtos possui a Amanda Perez?`. Deverás ver algo assim:

![Data](../../../../../translated_images/pt-PT/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground do Agente

Vamos desenvolver um pouco mais a intuição para as capacidades do Microsoft Foundry, experimentando o Agente no Agents Playground. 

1. Volta à página `Agents` no Microsoft Foundry - seleciona o agente padrão
1. Clica na opção `Try in Playground` - deverás obter uma UI do Playground assim
1. Pergunta a mesma questão: `Que produtos possui a Amanda Perez?`

    ![Data](../../../../../translated_images/pt-PT/09-ask-in-playground.a1b93794f78fa676.webp)

Recebes a mesma resposta (ou muito semelhante) - mas também obténs informação adicional que podes usar para entender a qualidade, custo e desempenho da tua aplicação agentica. Por exemplo:

1. Nota que a resposta cita ficheiros de dados usados para "fundamentar" a resposta
1. Passa o cursor sobre qualquer uma destas etiquetas de ficheiros - os dados correspondem à tua pergunta e à resposta exibida?

Também vês uma linha de _estatísticas_ abaixo da resposta. 

1. Passa o cursor sobre qualquer métrica - por exemplo, Segurança. Vês algo assim
1. A avaliação coincide com a tua intuição sobre o nível de segurança da resposta?

      ![Data](../../../../../translated_images/pt-PT/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidade Incorporada

Observabilidade consiste em instrumentar a tua aplicação para gerar dados que possam ser usados para compreender, depurar e otimizar as suas operações. Para teres uma noção disto:

1. Clica no botão `View Run Info` - deverás ver esta vista. Este é um exemplo de [rastreio do Agente](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) em ação. _Também podes obter esta vista clicando em Logs de Tópicos no menu principal_.

   - Percebe os passos da execução e as ferramentas usadas pelo agente
   - Compreende a contagem total de Tokens (vs. tokens de saída usados) para a resposta
   - Compreende a latência e onde o tempo está a ser gasto na execução

      ![Agent](../../../../../translated_images/pt-PT/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clica no separador `Metadados` para ver atributos adicionais da execução, que podem proporcionar contexto útil para depurar problemas posteriormente.   

      ![Agent](../../../../../translated_images/pt-PT/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clica no separador `Avaliações` para ver autoavaliações feitas sobre a resposta do agente. Estas incluem avaliações de segurança (e.g., Auto-dano) e avaliações específicas do agente (e.g., Resolução de intenção, Adesão à tarefa).

      ![Agent](../../../../../translated_images/pt-PT/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, mas não menos importante, clica no separador `Monitorização` no menu lateral.

      - Seleciona o separador `Uso de recursos` na página mostrada - e vê as métricas.
      - Acompanha o uso da aplicação em termos de custos (tokens) e carga (requisições).
      - Acompanha a latência da aplicação até ao primeiro byte (processamento de entrada) e ao último byte (saída).

      ![Agent](../../../../../translated_images/pt-PT/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variáveis de Ambiente

Até agora, percorremos a implantação no navegador - e validámos que a infraestrutura está provisionada e a aplicação está operacional. Mas para trabalhar _com o código da aplicação primeiro_, precisamos de configurar o nosso ambiente de desenvolvimento local com as variáveis relevantes necessárias para trabalhar com estes recursos. Usar `azd` torna isso fácil.

1. O Azure Developer CLI [usa variáveis de ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para armazenar e gerir definições de configuração para as implantações da aplicação.

1. As variáveis de ambiente são armazenadas em `.azure/<env-name>/.env` - isto restringe-as ao ambiente `env-name` usado durante a implantação e ajuda a isolar ambientes entre diferentes destinos de implantação no mesmo repositório.

1. As variáveis de ambiente são carregadas automaticamente pelo comando `azd` sempre que este executa um comando específico (por exemplo, `azd up`). Nota que o `azd` não lê automaticamente variáveis de ambiente a nível de SO (ex.: definidas no shell) - em vez disso, usa `azd set env` e `azd get env` para transferir informação dentro de scripts.


Vamos experimentar alguns comandos:

1. Obtém todas as variáveis de ambiente definidas para `azd` neste ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vês algo como:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtém um valor específico - por exemplo, quero saber se definimos o valor de `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vês algo assim - não foi definido por defeito!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Define uma nova variável de ambiente para `azd`. Aqui, atualizamos o nome do modelo do agente. _Nota: quaisquer alterações feitas serão imediatamente refletidas no ficheiro `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Agora, deveríamos encontrar o valor definido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota que alguns recursos são persistentes (e.g., implantações de modelos) e irão requerer mais do que um `azd up` para forçar a reimplantação. Vamos tentar desmantelar a implantação original e reimplantar com as variáveis de ambiente alteradas.

1. **Atualizar** Se já tiveste uma infraestrutura previamente implantada usando um modelo azd - podes _atualizar_ o estado das tuas variáveis de ambiente locais com base no estado atual da tua implantação Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Esta é uma forma poderosa de _sincronizar_ variáveis de ambiente em dois ou mais ambientes de desenvolvimento locais (ex., equipa com vários desenvolvedores) - permitindo que a infraestrutura implementada sirva como a fonte de verdade para o estado das variáveis de ambiente. Os membros da equipa simplesmente _atualizam_ as variáveis para voltarem a estar sincronizados.

---

## 9. Parabéns 🏆

Acabou de completar um fluxo de trabalho de ponta a ponta onde você:

- [X] Selecionou o Modelo AZD que Quer Usar
- [X] Abriu o modelo num ambiente de desenvolvimento suportado
- [X] Implementou o Modelo e validou que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
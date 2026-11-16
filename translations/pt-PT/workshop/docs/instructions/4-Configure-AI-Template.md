# 4. Configurar um Modelo

!!! tip "NO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Comece com o modelo real

Abra o [`azure.yaml` em Começar com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) no repositório que inicializou. O modelo original pode mudar independentemente deste workshop. O seguinte **excerto** foi verificado a 4 de Novembro de 2026; não é um substituto para o ficheiro completo:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifica o projeto AZD; `metadata.template` regista a versão do modelo.
- `requiredVersions.azd` é o mínimo do modelo, não uma recomendação para usar um CLI antigo. Use uma versão AZD suportada e atual.
- `services` define os destinos de implantação da aplicação. Este modelo implementa a sua API Python e frontend como um único serviço Container Apps.
- `project` é relativo a `azure.yaml`.
- `remoteBuild` solicita uma compilação remota de container. A sua identidade ainda precisa das permissões necessárias no Azure.

Os ficheiros Bicep do modelo em `infra/`, e não só a lista `services`, declaram recursos como Microsoft Foundry, implantações de modelos, armazenamento e a opção AI Search.

## 2. Compreender os ganchos do ciclo de vida

Inspecione a secção `hooks` e os respetivos scripts antes de executar o modelo. A versão revista contém:

| Gancho | Propósito | Comportamento importante |
|------|---------|--------------------|
| `preup` | Validar entradas do ambiente do modelo antes do fluxo de trabalho `up` | Scripts shell específicos da plataforma podem parar o fluxo de trabalho em caso de falha |
| `postdeploy` | Executar configuração específica do modelo após a implantação da aplicação | Inspecione `continueOnError` e a saída do script; uma implantação bem-sucedida não prova que todas as tarefas de configuração foram concluídas com sucesso |

Esta versão **não** contém o antigo gancho `postprovision` / `write_env` apresentado em material anterior do workshop. Não copie referências de gancho para scripts que já não existem.

As chaves dos ganchos selecionam eventos do ciclo de vida; `posix` e `windows` selecionam implementações da plataforma. `shell`, `run`, `interactive` e `continueOnError` controlam a execução. São scripts executáveis com as suas permissões, por isso reveja-os tal como faria com código da aplicação.

Consulte a [documentação dos ganchos AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) para o ciclo de vida completo.

## 3. Rastrear entradas do ambiente na infraestrutura

Execute estes comandos a partir do repositório de exemplo inicializado:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspecione `infra/main.parameters.json` para ver quais variáveis de ambiente o modelo realmente consome. Definir um nome arbitrário com `azd env set` não altera automaticamente um recurso Azure.

Os padrões revistos incluem:

| Entrada | Padrão / propósito |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; as unidades de quota dependem do modelo e tipo de implantação |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; mantenha desativado a menos que a manipulação de dados tenha sido revista |

Estas são entradas específicas do exemplo, não definições globais do AZD. Verifique a [documentação de suporte a modelos e regiões](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) e a quota da sua subscrição antes de escolher um modelo, SKU, capacidade ou localização. Não interprete cada unidade de capacidade como 1.000 tokens por minuto.

Para selecionar um modelo de chat diferente, atualize o seu **nome, versão, formato, SKU e capacidade compatíveis em conjunto**, seguindo o [guia de personalização do exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Alterar só o nome pode deixar uma versão ou tipo de implantação incompatível.

## 4. Laboratório: ativar pesquisa e rastreamento opcionais

!!! warning "Estas definições podem adicionar recursos faturáveis"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

As alterações na infraestrutura precisam de provisão; `azd deploy` sozinho apenas implementa serviços da aplicação. Para indexação de pesquisa e opções de recuperação suportadas, siga o [guia AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Para monitorização, siga o [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Não ative captura de conteúdo de pedidos/respostas em dados reais de clientes sem o consentimento necessário, controlos de acesso, política de retenção e redacção.

## 5. Recursos existentes e CI/CD

Para reutilizar um projeto Foundry, siga as [instruções para recursos existentes do exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Definir `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` altera o caminho de implantação; nesse cenário, o modelo não cria Application Insights ou AI Search para si. Verifique explicitamente dependências, atribuições de papel e implantações de modelos.

A secção `pipeline.variables` controla os valores passados para um pipeline gerado; não é um armazenador de segredos e não cria recursos Azure. Prefira identidade gerida na app e OIDC para CI/CD. Os ficheiros de ambiente AZD são em texto simples e não devem ser comitados.

O AZD suporta importar um ficheiro dotenv de confiança preparado localmente:

```bash
azd env set --file .env
```

Reveja esse ficheiro antes de o importar, e não imprima ficheiros de ambiente contendo segredos em terminais partilhados ou logs CI.

## 6. Verifique a sua compreensão

- Qual serviço `azure.yaml` implementa a aplicação?
- Qual parâmetro da infraestrutura consome cada valor que alterou?
- Quais alterações requerem provisão em vez de só implementação?
- A região e subscrição selecionadas suportam o modelo e a quota?
- Todos os ganchos de configuração tiveram sucesso, e pode verificar o comportamento da aplicação implementada?

Continue para [Personalizar um Modelo](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 4. Configure um Template

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Comece com o template real

Abra o [`azure.yaml` em Comece com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) no repositório que você inicializou. O template upstream pode mudar independentemente deste workshop. O seguinte **trecho** foi verificado em 4 de novembro de 2026; não é um substituto para o arquivo completo:

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

- `name` identifica o projeto AZD; `metadata.template` registra a versão do template.
- `requiredVersions.azd` é o mínimo do template, não uma recomendação para usar uma CLI antiga. Use uma versão AZD suportada atual.
- `services` define os alvos de implantação da aplicação. Este template implanta sua API Python e frontend como um único serviço Container Apps.
- `project` é relativo a `azure.yaml`.
- `remoteBuild` solicita uma build de container remota. Sua identidade ainda precisa das permissões Azure necessárias.

Os arquivos Bicep do template sob `infra/`, não apenas a lista `services`, declaram recursos como Microsoft Foundry, implantações de modelo, armazenamento e AI Search opcional.

## 2. Entenda os hooks do ciclo de vida

Inspecione a seção `hooks` e seus scripts referenciados antes de executar o template. A versão revisada contém:

| Hook | Propósito | Comportamento importante |
|------|---------|--------------------|
| `preup` | Validar entradas do ambiente do template antes do workflow `up` | Scripts shell específicos da plataforma podem interromper o fluxo em caso de falha |
| `postdeploy` | Executar configuração específica do template após a implantação da aplicação | Inspecione `continueOnError` e a saída do script; uma implantação bem-sucedida não prova que todas as tarefas de configuração foram concluídas |

Esta versão **não** contém o antigo hook `postprovision` / `write_env` mostrado em material anterior do workshop. Não copie referências de hooks para scripts que não existem mais.

As chaves dos hooks selecionam eventos do ciclo de vida; `posix` e `windows` selecionam implementações de plataforma. `shell`, `run`, `interactive` e `continueOnError` controlam a execução. Estes são scripts executáveis com suas permissões, então revise-os assim como você faria com código de aplicação.

Veja a [documentação dos hooks do AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) para o ciclo de vida completo.

## 3. Trace entradas do ambiente para a infraestrutura

Execute estes comandos no repositório de exemplo inicializado:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspecione `infra/main.parameters.json` para ver quais variáveis de ambiente o template realmente consome. Definir um nome arbitrário com `azd env set` não altera automaticamente um recurso do Azure.

Os padrões revisados incluem:

| Entrada | Padrão / propósito |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; unidades de cota dependem do modelo e tipo de implantação |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; deixe desabilitado a menos que o manuseio de dados tenha sido revisado |

Estas são entradas específicas do exemplo, não configurações globais do AZD. Verifique a [documentação de suporte a modelos e regiões](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) e a cota da sua assinatura antes de escolher modelo, SKU, capacidade ou região. Não interprete toda unidade de capacidade como 1.000 tokens por minuto.

Para selecionar um modelo de chat diferente, atualize seu **nome, versão, formato, SKU e capacidade compatíveis juntos**, seguindo o [guia de personalização do exemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Alterar apenas o nome pode deixar uma versão incompatível ou tipo de implantação diferente.

## 4. Laboratório: habilitar busca opcional e rastreamento

!!! warning "Estas configurações podem adicionar recursos faturáveis"

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

Mudanças na infraestrutura precisam de provisionamento; `azd deploy` sozinha apenas implanta serviços da aplicação. Para indexação de busca e opções de recuperação suportadas, siga o [guia do AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Para monitoramento, siga o [guia de observabilidade](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Não habilite captura de conteúdo de prompt/resposta com dados reais de clientes sem o consentimento necessário, controles de acesso, política de retenção e redaction.

## 5. Recursos existentes e CI/CD

Para reutilizar um projeto Foundry, siga as [instruções para recursos existentes](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) do exemplo. Definir `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` muda o caminho de implantação; nesse cenário, o template não cria Application Insights ou AI Search para você. Verifique dependências, atribuições de função e implantações de modelo explicitamente.

A seção `pipeline.variables` controla valores passados para um pipeline gerado; não é um cofre de segredos e não cria recursos Azure. Prefira identidade gerenciada no app e OIDC para CI/CD. Arquivos de ambiente AZD são texto simples e não devem ser comitados.

AZD suporta importar um arquivo dotenv local confiável e preparado:

```bash
azd env set --file .env
```

Revise esse arquivo antes de importá-lo, e não imprima arquivos de ambiente com segredos em terminais compartilhados ou logs de CI.

## 6. Teste seu entendimento

- Qual serviço `azure.yaml` implanta a aplicação?
- Qual parâmetro de infraestrutura consome cada valor que você alterou?
- Quais mudanças requerem provisionamento em vez de apenas implantação?
- A região e assinatura selecionadas suportaram o modelo e cota?
- Todos os hooks de configuração tiveram sucesso, e você pode verificar o comportamento da aplicação implantada?

Continue para [Personalizar um Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
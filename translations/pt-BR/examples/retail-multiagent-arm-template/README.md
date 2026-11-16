# Estrutura de Infraestrutura Multi-Agente para Varejo

**Exemplo avançado de arquitetura — não é uma aplicação multi-agente funcional.**

[Página inicial do curso](../../README.md) ·
[Capítulo 5](../../docs/chapter-05-multi-agent/README.md) ·
[Planta da arquitetura](../retail-scenario.md)

## O que isto implementa

Este diretório contém um template ARM, parâmetros e um script de implantação em Bash.
Não há **`azure.yaml` ou código-fonte de aplicação de varejo**.

| Recurso | Estado real após o provisionamento |
|---|---|
| Conta principal Azure OpenAI | Implantação `gpt-4.1-chat` usando `gpt-4.1` versão `2025-04-14`, `GlobalStandard` |
| Conta OpenAI secundária (opcional) | `gpt-4.1-mini-inventory`, modelo `gpt-4.1-mini` versão `2025-04-14`, `GlobalStandard` |
| Conta de Embeddings (opcional) | `text-embedding-ada-002` versão `2`, `Standard`; sem pipeline de indexação |
| Conta OpenAI do Avaliador | `gpt-4.1-grader`, modelo `gpt-4.1` versão `2025-04-14`, `GlobalStandard`; sem avaliador |
| AI Search | Serviço vazio; sem índice ou documentos |
| Armazenamento | Contêineres de blob `documents` e `uploads` vazios |
| Cosmos DB | Conta serverless, banco de dados `chathistory`, contêiner `conversations` particionado por `/userId`, TTL de itens de 30 dias |
| Container Apps | O roteador e o frontend executam `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na porta 80 |
| Key Vault (opcional) | Cofre vazio habilitado para RBAC; **sem segredos ou atribuições de funções** |
| Application Insights / Log Analytics (opcional) | Recursos e coleta de logs do ambiente; sem instrumentação personalizada, alertas ou dashboards |
| Document Intelligence | Conta S0; sem fluxo de trabalho para processamento de documentos |

O Legacy Bing Search v7 foi descontinuado em 11 de agosto de 2025 e **não está provisionado**.
Nenhuma integração substituta de web-grounding está implementada.

**Não incluído:** agentes de cliente/inventário, API do roteador `/chat`, interface de chat frontend,
esquema de busca ou scripts de ingestão, Azure Container Registry, endpoints privados,
identidades gerenciadas, atribuições de RBAC, failover automático, Front Door, scanner para equipe red-team,
CLI de avaliação, autenticação ou CI/CD.

Uma mensagem de sucesso do ARM confirma apenas o provisionamento dos recursos. Ela não certifica
a funcionalidade, segurança, disponibilidade ou prontidão para produção da aplicação.

## Pré-requisitos e custos

- Bash (Git Bash/WSL no Windows) e
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Uma assinatura com permissões para criar todos os recursos listados.
- Verifique a disponibilidade de **cada modelo/versão/SKU em cada região selecionada** e
  a cota para sua assinatura. Os padrões são exemplos, não garantias.
  Consulte [disponibilidade de modelos](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Escolha um grupo de recursos dedicado que possa excluir após os testes.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Localizações padrão: principal `eastus2`, secundária `westus2`, embeddings `francecentral`;
o avaliador utiliza por padrão a região principal, a menos que `graderLocation` seja fornecido.
`--no-multi-region` pula contas secundárias e de embeddings; não pula a
conta do avaliador.

O Search é cobrado enquanto provisionado mesmo quando vazio. Réplicas mínimas do Container,
redundância de armazenamento, requisições/armazenamento do Cosmos DB, tokens de modelo, chamadas do Document Intelligence
e ingestão/armazenamento de logs podem gerar cobranças adicionais. Não existe **um total mensal fixo ou previamente validado**.
Estime as SKUs exatas no
[calculador de preços do Azure](https://azure.microsoft.com/pricing/calculator/) e
configure um orçamento antes de implantar.

### Modos de implantação

Estas configurações são tamanhos de recurso, **não certificações de produção ou SLA**:

| Modo | Unidades de capacidade para chat / mini / embedding / avaliador | Réplicas de roteador | Réplicas do frontend | Nível do Search | Armazenamento |
|---|---|---|---|---|---|
| mínimo | 10 / 10 / 20 / 5 | 0–3 | 1–2 | básico, 1 réplica | Standard_LRS |
| padrão | 20 / 15 / 30 / 15 | 1–3 | 1–2 | padrão, 1 réplica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 réplicas | Standard_GRS |

Unidades de capacidade do modelo são específicas para modelo/SKU; não as some como uma garantia universal TPM.
O premium não habilita Container Apps com redundância de zona: isso requer
um design adicional de rede. O Search básico suporta busca vetorial, sujeito aos
limites do serviço; não é incompatível inerentemente com vetores.

## 🚀 Implantação rápida

Revise `azuredeploy.json` e `azuredeploy.parameters.json` primeiro. Os comandos
abaixo **criam recursos Azure faturáveis**; não são verificações offline.

A partir da raiz do repositório:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

O script usa caminhos relativos ao seu diretório, verifica login/ferramentas/argumentos,
cria o grupo de recursos se ausente, valida a implantação, provisiona e
mostra outputs não secretos. Nenhum `jq`, povoamento de dados, recuperação de segredos ou
configuração pós-implantação da aplicação é necessário ou realizado.

Os valores padrão do script para linha de comando substituem os correspondentes no
arquivo de parâmetros. Edite o arquivo de parâmetros para configurações como regiões secundária/terciária;
use implantação direta no CLI se precisar de substituições arbitrárias de parâmetros:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

O provisionamento pode levar de 15 a 45 minutos ou mais, e pode falhar por cotas regionais ou
restrições do ciclo de vida do modelo. Não tente novamente cegamente: leia a operação falhada primeiro.

## Opções de configuração

| Parâmetro | Padrão no template | Significado |
|---|---|---|
| `projectName` | Obrigatório (`retail` no arquivo de parâmetros) | 3–10 letras minúsculas/dígitos |
| `location` | Localização do grupo de recursos | Região principal (`eastus2` no arquivo de parâmetros) |
| `secondaryLocation` | `westus2` | Região da conta do modelo Mini |
| `tertiaryLocation` | `francecentral` | Região da conta de embeddings |
| `graderLocation` | Região principal | Região da conta do avaliador independente |
| `environmentName` | `dev` | `dev`, `staging` ou `prod`; apenas nome, não um toggle de endurecimento |
| `deploymentMode` | `standard` | Seleção de SKU/capacidade |
| `enableMultiRegion` | `true` | Adicionar contas secundárias e de embeddings |
| `enableMonitoring` | `true` | Adicionar Insights/workspace e coleta de logs do ambiente |
| `enableSecurity` | `true` | Criar apenas um cofre vazio habilitado para RBAC |

O parâmetro enganoso `openAiApiVersion` foi removido: uma versão da API do plano de dados
não controla versões dos recursos ARM ou versões de modelos. Pares nome/versão do modelo
estão em `variables.modelDeployments`; confira-os juntamente com a SKU de implantação.

## Verificar provisionamento

Use o nome da implantação do output do script ou `az deployment group list`.
Para implantação direta acima:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Esperado: estado da implantação `Succeeded`. Em caso de falha, inspecione detalhes do erro da operação.
O output da lista de recursos sozinho não é uma verificação confiável do estado do provisionamento.

Teste o placeholder **root**, não um endpoint de agente inexistente:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Esperado: página HTTP 200 hello-world, **não uma resposta de chat**. Um erro HTTP
não conta como verificação bem-sucedida.

Para testar a inferência do modelo principal real (faturável):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Esperado: JSON com `choices` e `usage`. O nome da implantação é
`gpt-4.1-chat`, não o nome do modelo subjacente `gpt-4.1`.

## 🔧 Pós-Implantação: Próximos Passos

Isto é um **backlog de desenvolvimento**, não um exercício concluído:

1. Implemente agentes autenticados de cliente/inventário e o contrato do roteador.
2. Implemente o frontend e valide sua configuração.
3. Crie e popule um índice de busca com uma dimensão/perfil que corresponda ao seu
   modelo de embedding, e trate falhas e atualizações de documentos.
4. Crie um registro e configure identidade/permissões para pull de imagem.
5. Construa e envie imagens reais. Altere as portas e sondas de entrada do Container App para
   corresponder às dessas imagens antes de testar; a porta 80 aqui pertence aos placeholders.
6. Configure segredos ou identidades gerenciadas e funções específicas do plano de dados. Não
   faça referência a nomes de segredos imaginários: este template não cria segredos de aplicação.
7. Instrumente aplicações, configure alertas, teste falhas/recuperações e avalie
   os resultados com dados representativos e revisão humana.

Veja a [planta da arquitetura](../retail-scenario.md) para delimitadores de design.

## Resolução de problemas e limites de segurança

- **Modelo indisponível:** verifique modelo/versão/SKU, região e cota da assinatura;
  o script não checa o catálogo de modelos antecipadamente.
- **Monitoramento desativado:** o destino dos logs do ambiente é `none`, não uma
  configuração inválida vazia do Log Analytics.
- **Apenas placeholders:** `/chat`, avaliação de agente e ingestão de arquivos não existem.
- **Rede/identidade:** endpoints públicos e autenticação local estão habilitados.
  Apenas habilitar RBAC no Key Vault não cria atribuições de função ou identidades.
- **Produção:** adicione autenticação, identidades com escopo, gerenciamento de segredos,
  redes privadas quando apropriado, design de disponibilidade e testes operacionais.
  Contas de modelo multi-região sozinhas não fornecem failover.

## Limpeza

Não há projeto AZD aqui; `azd down` não é o comando de limpeza.
Depois de verificar que o grupo contém apenas seus recursos de aprendizado:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Esperado após a exclusão terminar: `false`. Recursos do Key Vault e Cognitive Services deletados suavemente podem
manter nomes; a limpeza completa requer permissões adequadas.
Verifique o Gerenciamento de Custos para cobranças retardadas de uso.

[Reportar um problema](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
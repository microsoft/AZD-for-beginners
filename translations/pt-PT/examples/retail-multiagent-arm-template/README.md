# Estrutura de Infraestrutura Multiagente para Retalho

**Exemplo de arquitetura avançada — não é uma aplicação multiagente funcional.**

[Início do curso](../../README.md) ·
[Capítulo 5](../../docs/chapter-05-multi-agent/README.md) ·
[Esquema de arquitetura](../retail-scenario.md)

## O que isto implementa

Este diretório contém um template ARM, parâmetros e um script de deploy em Bash.
Não existe **`azure.yaml` nem código fonte de aplicação comercial**.

| Recurso | Estado atual após provisionamento |
|---|---|
| Conta primária Azure OpenAI | Desdobramento `gpt-4.1-chat` usando versão `gpt-4.1` do `2025-04-14`, `GlobalStandard` |
| Conta OpenAI secundária (opcional) | `gpt-4.1-mini-inventory`, modelo `gpt-4.1-mini` versão `2025-04-14`, `GlobalStandard` |
| Conta de embeddings (opcional) | `text-embedding-ada-002` versão `2`, `Standard`; sem pipeline de indexação |
| Conta OpenAI de grader | `gpt-4.1-grader`, modelo `gpt-4.1` versão `2025-04-14`, `GlobalStandard`; sem avaliador |
| AI Search | Serviço vazio; sem índice ou documentos |
| Armazenamento | Contentores de blob `documents` e `uploads` vazios |
| Cosmos DB | Conta serverless, base de dados `chathistory`, contentor `conversations` particionado por `/userId`, TTL do item de 30 dias |
| Container Apps | Router e frontend ambos correm em `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na porta 80 |
| Key Vault (opcional) | Cofre vazio com RBAC ativado; **sem segredos ou atribuições de função** |
| Application Insights / Log Analytics (opcional) | Recursos e recolha de logs do ambiente; sem instrumentação personalizada da app, alertas ou dashboards |
| Document Intelligence | Conta S0; sem fluxo de processamento de documentos |

O Legacy Bing Search v7 foi descontinuado a 11 de agosto de 2025 e **não está provisionado**.
Não foi implementada uma integração substituta de web-grounding.

**Não incluído:** agentes de cliente/inventário, API router `/chat`, interface de chat frontend,
esquema de pesquisa ou scripts de ingestão, Azure Container Registry, endpoints privados,
identidades geridas, atribuições RBAC, failover automático, Front Door, scanner
da equipa vermelha, CLI de avaliação, autenticação nem CI/CD.

Uma mensagem de sucesso ARM apenas confirma o provisionamento do recurso. Não certifica
funcionalidade da aplicação, segurança, disponibilidade ou prontidão para produção.

## Pré-requisitos e custos

- Bash (Git Bash/WSL no Windows) e
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Uma subscrição com permissões para criar todos os recursos listados.
- Verifique a disponibilidade de **cada modelo/versão/SKU em cada região selecionada** e
  quota para a sua subscrição. Os valores por defeito são exemplos, não garantias.
  Consulte [disponibilidade de modelos](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Escolha um grupo de recursos dedicado que possa eliminar após testar.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Localizações por defeito: primária `eastus2`, secundária `westus2`, embeddings `francecentral`;
o grader usa por defeito a região primária a menos que `graderLocation` seja fornecido.
`--no-multi-region` ignora contas secundárias e de embeddings; não ignora a
conta de grader.

A Search é cobrada enquanto provisionada mesmo vazia. Réplicas mínimas de contentores,
redundância de armazenamento, pedidos/armazenamento Cosmos DB, tokens de modelo, chamadas Document Intelligence
e ingestão/armazenamento de logs podem adicionar custos. Não há **total mensal fixo ou validado**.
Estime os SKUs exatos no
[calculador de preços Azure](https://azure.microsoft.com/pricing/calculator/) e
configure um orçamento antes de desdobrar.

### Modos de desdobramento

Estas definições são tamanhos de recursos, **não certificações de produção ou SLA**:

| Modo | Unidades de capacidade de chat / mini / embedding / grader | Réplicas do router | Réplicas do frontend | Tier do Search | Armazenamento |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | básico, 1 réplica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 réplica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 réplicas | Standard_GRS |

As unidades de capacidade do modelo são específicas do modelo/SKU; não as some como uma garantia universal TPM.
O modo premium não ativa Container Apps com redundância por zona: isso requer
desenho adicional de rede. O Search básico suporta pesquisa vetorial, sujeito a
limites do serviço; não é incompatível intrinsecamente com vetores.

## 🚀 Desdobramento Rápido

Reveja `azuredeploy.json` e `azuredeploy.parameters.json` primeiro. Os comandos
abaixo **criam recursos faturáveis no Azure**; não são verificações offline.

A partir da raiz do repositório:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

O script usa caminhos relativos à sua própria diretoria, verifica login/ferramentas/argumentos,
cria o grupo de recursos se ausente, valida o desdobramento, provisiona e
mostra saídas não secretas. Não é necessário nem realizado `jq`, povoamento de dados, obtenção de segredos ou
configuração da aplicação pós-desdobramento.

Os valores padrão da linha de comandos do script sobrepõem correspondentes valores no
ficheiro de parâmetros. Edite o ficheiro de parâmetros para definições tais como regiões secundárias/terciárias;
use desdobramento direto via CLI se precisar de substituições arbitrárias de parâmetros:

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

O provisionamento pode levar 15–45 minutos ou mais, e pode falhar por quotas regionais ou
restrições do ciclo de vida do modelo. Não repita cegamente: leia primeiro a operação falhada.

## Opções de configuração

| Parâmetro | Padrão no modelo | Significado |
|---|---|---|
| `projectName` | Obrigatório (`retail` no ficheiro de parâmetros) | 3–10 letras minúsculas/dígitos |
| `location` | Localização do grupo de recursos | Região primária (`eastus2` no ficheiro de parâmetros) |
| `secondaryLocation` | `westus2` | Região da conta do modelo mini |
| `tertiaryLocation` | `francecentral` | Região da conta de embeddings |
| `graderLocation` | Região primária | Região da conta de grader independente |
| `environmentName` | `dev` | `dev`, `staging`, ou `prod`; só nome, não um alternador de hardening |
| `deploymentMode` | `standard` | Seleção de SKU/capacidade |
| `enableMultiRegion` | `true` | Adicionar contas secundária e de embeddings |
| `enableMonitoring` | `true` | Adicionar Insights/workspace e recolha de logs do ambiente |
| `enableSecurity` | `true` | Criar apenas um cofre vazio com RBAC ativado |

O parâmetro enganador `openAiApiVersion` foi removido: uma versão de API de plano de dados
não controla versões de recursos ARM nem versões do modelo. Pares nome/versão do modelo
estão em `variables.modelDeployments`; verifique-os junto com o SKU do desdobramento.

## Verificar o provisionamento

Use o nome do desdobramento a partir da saída do script ou `az deployment group list`.
Para desdobramento direto acima:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Esperado: estado do desdobramento `Succeeded`. Para falha, inspeccione os detalhes do erro da operação.
Apenas a saída da lista de recursos não é uma verificação fiável do estado do provisionamento.

Teste o placeholder **root**, e não um endpoint de agente inexistente:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Esperado: página hello-world HTTP 200, **não uma resposta de chat**. Erro HTTP não conta como verificação bem-sucedida.


Para testar a inferência do modelo primário real (faturável):

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

Esperado: JSON com `choices` e `usage`. O nome do desdobramento é
`gpt-4.1-chat`, não o nome subjacente do modelo `gpt-4.1`.

## 🔧 Pós-desdobramento: Próximos passos

Isto é um **backlog de desenvolvimento**, não um exercício finalizado:

1. Implemente agentes autenticados de cliente/inventário e o contrato do router.
2. Implemente o frontend e valide a sua configuração.
3. Crie e preencha um índice de pesquisa com uma dimensão/perfil correspondente ao seu
   modelo de embedding, e trate falhas e atualizações de documentos.
4. Crie um registo e configure identidade/permissões de pull de imagens.
5. Construa e envie imagens reais. Altere portas e sondas de ingressos do Container App para
   corresponder a essas imagens antes de testar; a porta 80 aqui pertence aos placeholders.
6. Configure segredos ou identidades geridas e funções limitadas no plano de dados. Não
   refira nomes imaginários de segredos: este modelo não cria segredos de aplicação.
7. Instrumente aplicações, configure alertas, teste falhas/recuperação, e avalie
   resultados com ground truth representativo e revisão humana.

Veja o [blueprint de arquitetura](../retail-scenario.md) para fronteiras de desenho.

## Resolução de problemas e fronteiras de segurança

- **Modelo indisponível:** verifique modelo/versão/SKU, região e quota da subscrição;
  o script não pré-verifica catálogos de modelos.
- **Monitorização desativada:** o destino de log do ambiente é `none`, não uma
  configuração inválida vazia do Log Analytics.
- **Apenas placeholders:** `/chat`, avaliação de agente e ingestão de ficheiros não existem.
- **Rede/identidade:** endpoints públicos e autenticação local estão ativados.
  Apenas ativar RBAC no Key Vault não cria atribuições de função ou identidades.
- **Produção:** adicione autenticação, identidades limitadas, gestão de segredos,
  redes privadas quando apropriado, desenho de disponibilidade e testes operacionais.
  Contas de modelo multi-região isoladamente não fornecem failover.

## Limpeza

Não há projeto AZD aqui; `azd down` não é o comando de limpeza.
Após confirmar que o grupo contém apenas seus recursos de aprendizagem:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Esperado após a conclusão da exclusão: `false`. Recursos soft-deleted de Key Vault e Cognitive Services
podem reter nomes; a purga requer permissões apropriadas.
Verifique Gestão de Custos para cobranças de uso atrasadas.

[Reportar um problema](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
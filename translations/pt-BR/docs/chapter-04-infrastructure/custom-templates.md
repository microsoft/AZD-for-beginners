# Criando Seu Próprio Template azd

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agentes](../chapter-05-multi-agent/README.md)

> Revisado com base em `azd 1.37.2` (Novembro 2026). Este é um **tutorial de criação com arquivos parciais**, não um template completo: você deve fornecer o código do aplicativo e `modules/web.bicep` com seu ambiente, registro, Container App e saídas antes da implantação. O provisionamento do Azure não foi executado nesta revisão.

## Introdução

Até agora você *consumiu* templates com `azd init --template <name>`. Mas quando você tiver um layout de projeto que sua equipe goste — por exemplo, um Container App com um Cosmos DB e o monitoramento adequado — você vai querer transformá-lo em um template reutilizável próprio. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe ler. Esta lição mostra como construir um do zero, testá-lo e (opcionalmente) publicá-lo na galeria comunitária.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender o que faz uma pasta ser um "template azd"
- Conhecer os arquivos necessários e a estrutura de pastas
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar seu template localmente antes de compartilhá-lo
- Publicá-lo e (opcionalmente) enviá-lo para o Awesome AZD

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Scaffoldar um novo repositório de template
- Parametrizar a infraestrutura para que funcione em qualquer assinatura
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados que a galeria comunitária requer

---

## O Que É Um Template, Realmente?

Um template azd é **um repositório Git** que contém, no mínimo:

| Arquivo / pasta | Propósito | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e provedor de infra | ✅ Sim |
| `infra/` | Definições de provisionamento Bicep ou Terraform | Obrigatório para este exemplo explícito-IaC; projetos de infraestrutura gerada podem omitir |
| `src/` (ou seu código) | O código aplicativo que o azd implanta | Obrigatório para serviços baseados em código-fonte; nem todos os templates contêm código de aplicação |
| `README.md` | Como usar o template | ✅ Altamente recomendado |
| `.azdo/` ou `.github/` | Definições de pipeline CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reproduzível | Opcional |
| `azure.yaml` `metadata` | Informações de identidade/telemetria do template | Recomendado; publicar um repositório Git não requer |

Não há nada mágico aqui: quando você roda `azd init --template you/your-repo`, o azd clona o repositório e lê `azure.yaml`.

---

## Passo 1: Scaffold do Repositório

Crie a estrutura de pastas manualmente ou inicie a partir de um template mínimo e edite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Uma estrutura típica finalizada fica assim:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Passo 2: Escreva `azure.yaml`

Este é o coração do template. Diz ao azd o que implantar e como:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> O campo `metadata.template` é o que a telemetria da galeria utiliza para contar usos. Use a convenção `name@version`.

---

## Passo 3: Parametrizar a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos de assinatura.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione na assinatura de qualquer pessoa.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Duas coisas tornam este template amigável:

1. **Tag `azd-env-name`** — o azd a usa para rastrear e limpar recursos por ambiente.
2. **Token de recurso `uniqueString(...)`** — produz um sufixo hash estável para reduzir colisões; não é garantia de unicidade global.

O `modules/web.bicep` ausente deve aceitar `name`, `location`, e `tags`, provisionar o ambiente/registro e app do Container Apps, marcar o app com `azd-service-name: web`, e exportar `uri`. Também deve expor valores do registro necessários pelo fluxo escolhido de build/deploy (por exemplo, `AZURE_CONTAINER_REGISTRY_ENDPOINT` do módulo raiz). Apenas uma saída de endpoint não conecta descoberta de serviço, configurações de aplicativo ou autenticação do registro.

Forneça um arquivo de parâmetros correspondente que leia valores que o azd injeta do ambiente:

Salve o seguinte como `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

O azd substitui `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` do ambiente atual automaticamente.

---

## Passo 4: Teste Seu Template Localmente

Antes de compartilhar, prove que o template funciona a partir de um estado limpo.

**Teste da pasta local** (não requer push Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Depois teste a desmontagem** — um bom template limpa tudo completamente:

```bash
azd down --force --purge
```

Se `azd down` deixar recursos para trás, verifique descoberta de ambiente/grupo de recursos, recursos externos/compartilhados, permissões, bloqueios e proteção de purga. `--purge` não deleta estado local `.azure/`.

> **Dica:** após fornecer todos os arquivos faltantes, rode `azd provision --preview` primeiro. Inspecione os hooks antes do preview porque eles podem executar comandos com efeitos colaterais. Preview não é uma estimativa de preço nem garantia de que o provisionamento irá suceder.

---

## Passo 5: Publique o Template

Envie o repositório para o GitHub (público se quiser que outros o usem):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Qualquer pessoa agora pode usá-lo:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Passo 6 (Opcional): Enviar para o Awesome AZD

A [galeria Awesome AZD](https://azure.github.io/awesome-azd/) lista templates comunitários. Para ser listado, seu repositório deve incluir:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama de arquitetura e notas de custo
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisiona limpo em uma assinatura nova
- ✅ Um arquivo `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Envie abrindo um pull request que adiciona seu template ao arquivo de dados da galeria, seguindo o guia de contribuição no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Armadilha | Correção |
|---------|-----|
| Nomes de recurso codificados | Use o token de recurso `uniqueString()` |
| `azd down` deixa recursos | Marque cada recurso (ou o grupo de recursos) com `azd-env-name` |
| Template funciona para você, falha para outros | Remova IDs de assinatura, IDs de locatário, e suposições de regiões |
| Saídas não conectadas ao app | Faça corresponder `azd-service-name`/`resourceName` para implantação e mapeie explicitamente saídas para configurações do app |
| Envio para galeria rejeitado | Adicione `README.md`, `LICENSE` e `metadata.template` |

---

## Resumo

- Um template é apenas um repositório Git com `azure.yaml`, `infra/` e seu código.
- Parametrize tudo — nomes, regiões e IDs — para rodar em qualquer lugar.
- Sempre marque recursos com `azd-env-name` para que `azd down` funcione.
- Teste localmente com `azd init --template <local-path>` antes de publicar.
- Adicione metadados e um README para submeter ao Awesome AZD.

---

## 🔗 Navegação

| Direção | Recurso |
|-----------|----------|
| **Anterior** | [Guia de Implantação](deployment-guide.md) |
| **Início do Capítulo** | [Capítulo 4: Infraestrutura como Código](README.md) |
| **Próximo Capítulo** | [Capítulo 5: Soluções Multi-Agentes](../chapter-05-multi-agent/README.md) |

## 📖 Recursos Relacionados

- [Provisionando Recursos](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentação oficial de templates azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
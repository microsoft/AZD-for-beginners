# Criando Seu Próprio Template azd

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md)

> Validado com `azd 1.27.1` em julho de 2026.

## Introdução

Até agora você *consumiu* templates com `azd init --template <nome>`. Mas depois de ter um layout de projeto que sua equipe goste — por exemplo, um Container App com um Cosmos DB e o monitoramento adequado — você vai querer transformá-lo em um template reutilizável seu. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe ler. Esta lição mostra como criar um do zero, testá-lo e (opcionalmente) publicá-lo na galeria da comunidade.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender o que faz uma pasta ser um "template azd"
- Conhecer os arquivos e o layout de pastas necessários
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar seu template localmente antes de compartilhá-lo
- Publicá-lo e (opcionalmente) submetê-lo ao Awesome AZD

## Resultados de Aprendizagem

Depois de completar esta lição, você será capaz de:
- Criar um novo repositório de template
- Parametrizar infraestruturas para que funcionem em qualquer assinatura
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados que a galeria da comunidade exige

---

## O Que É um Template, Realmente?

Um template azd é **um repositório Git** que contém, no mínimo:

| Arquivo / pasta | Propósito | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e provedor de infraestrutura | ✅ Sim |
| `infra/` | Bicep, Terraform ou Pulumi que provisiona recursos | ✅ Sim |
| `src/` (ou seu código) | O código da aplicação que o azd implanta | ✅ Sim |
| `README.md` | Como usar o template | ✅ Fortemente recomendado |
| `.azdo/` ou `.github/` | Definições de pipeline CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reprodutível | Opcional |
| `azure.yaml` `metadata` | Informações para galeria + telemetria | Opcional (obrigatório para publicar) |

Não há nada mágico aqui: quando você executa `azd init --template you/your-repo`, o azd clona o repo e lê o `azure.yaml`.

---

## Passo 1: Criar o Esqueleto do Repositório

Crie a estrutura de pastas manualmente ou comece de um template mínimo e edite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Crie o layout padrão
mkdir -p src infra
```

Um layout típico finalizado se parece com isto:

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

## Passo 2: Escrever o `azure.yaml`

Este é o coração do template. Ele diz ao azd o que implantar e como:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> O campo `metadata.template` é o que a telemetria da galeria usa para contabilizar uso. Use a convenção `nome@versão`.

---

## Passo 3: Parametrizar a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos da assinatura.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione em assinaturas de qualquer pessoa.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Duas coisas tornam isso amigável para templates:

1. **Tag `azd-env-name`** — o azd a usa para rastrear e limpar recursos por ambiente.
2. **Token de recurso `uniqueString(...)`** — gera um sufixo estável e globalmente único para que nomes não colidam.

Forneça um arquivo de parâmetros correspondente que leia valores que o azd injeta do ambiente:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

O azd substitui automaticamente `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` pelo ambiente atual.

---

## Passo 4: Testar Seu Template Localmente

Antes de compartilhar, comprove que o template funciona a partir de um estado limpo.

**Teste a partir da pasta local** (não precisa de push no Git):

```bash
# A partir de um diretório vazio, inicialize usando o caminho do seu modelo local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionar + implantar de ponta a ponta
azd auth login
azd up
```

**Depois teste o desligamento** — um bom template limpa tudo completamente:

```bash
azd down --force --purge
```

Se o `azd down` deixar recursos para trás, provavelmente faltou a tag `azd-env-name` em algum recurso.

> **Dica:** execute `azd provision --preview` primeiro. Ele realiza um what-if e mostra erros no template antes de criar qualquer recurso.

---

## Passo 5: Publicar o Template

Faça push do repositório para o GitHub (público se quiser que outras pessoas o usem):

```bash
gh repo create my-azd-template --public --source=. --push
```

Qualquer pessoa pode usá-lo agora:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Passo 6 (Opcional): Submeter ao Awesome AZD

A [galeria Awesome AZD](https://azure.github.io/awesome-azd/) lista templates da comunidade. Para ser listado, seu repo deve incluir:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama da arquitetura e notas sobre custos
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisiona limpidamente em uma assinatura nova
- ✅ Um arquivo `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Submeta abrindo um pull request que adiciona seu template ao arquivo de dados da galeria, seguindo o guia de contribuição no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Armadilha | Correção |
|---------|-----|
| Nomes de recursos codificados | Use o token de recurso `uniqueString()` |
| `azd down` deixa recursos para trás | Marque todos os recursos (ou o grupo de recursos) com `azd-env-name` |
| Template funciona para você, falha para outros | Remova IDs de assinatura, IDs de locatário e suposições de região |
| Outputs não integrados no app | Exporte `SERVICE_<NAME>_ENDPOINT_URL` e outras saídas `AZURE_*` |
| Submissão para galeria rejeitada | Adicione `README.md`, `LICENSE` e `metadata.template` |

---

## Resumo

- Um template é simplesmente um repo Git com `azure.yaml`, `infra/` e seu código.
- Parametrize tudo — nomes, regiões e IDs — para que rode em qualquer lugar.
- Sempre marque recursos com `azd-env-name` para que `azd down` funcione.
- Teste localmente com `azd init --template <caminho-local>` antes de publicar.
- Adicione metadados e um README para submeter ao Awesome AZD.

---

## 🔗 Navegação

| Direção | Recurso |
|-----------|----------|
| **Anterior** | [Guia de Implantação](deployment-guide.md) |
| **Início do Capítulo** | [Capítulo 4: Infraestrutura como Código](README.md) |
| **Próximo Capítulo** | [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Recursos Relacionados

- [Provisionamento de Recursos](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentação oficial de templates azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
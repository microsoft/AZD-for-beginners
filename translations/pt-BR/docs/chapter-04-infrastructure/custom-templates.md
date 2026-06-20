# Criando seu próprio template azd

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md)

> Validado contra `azd 1.25.6` em junho de 2026.

## Introdução

Até agora você tem *consumido* templates com `azd init --template <name>`. Mas quando você tiver um layout de projeto que sua equipe goste—por exemplo, um Container App com um Cosmos DB e o monitoramento adequado—você vai querer transformá-lo em um template reutilizável próprio. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe ler. Esta lição mostra como construir um do zero, testá-lo e (opcionalmente) publicá-lo na galeria da comunidade.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender o que torna uma pasta um "template azd"
- Conhecer os arquivos obrigatórios e a estrutura de pastas
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar seu template localmente antes de compartilhar
- Publicá-lo e (opcionalmente) submetê-lo ao Awesome AZD

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Criar a estrutura inicial de um novo repositório de template
- Parametrizar a infraestrutura para que funcione em qualquer assinatura
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados exigidos pela galeria da comunidade

---

## O que é realmente um template?

Um template azd é **um repositório Git** que contém, no mínimo:

| Arquivo / pasta | Propósito | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e o provedor de infra | ✅ Sim |
| `infra/` | Bicep, Terraform ou Pulumi que provisiona recursos | ✅ Sim |
| `src/` (ou seu código) | O código da aplicação que o azd implanta | ✅ Sim |
| `README.md` | Como usar o template | ✅ Altamente recomendado |
| `.azdo/` ou `.github/` | Definições de pipeline CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reprodutível | Opcional |
| `azure.yaml` `metadata` | Informações da galeria + telemetria | Opcional (necessário para publicar) |

Não há nada de mágico aqui: quando você executa `azd init --template you/your-repo`, o azd clona o repositório e lê o `azure.yaml`.

---

## Passo 1: Estruture o Repositório

Crie a estrutura de pastas manualmente ou comece a partir de um template mínimo e edite-o:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Criar o layout padrão
mkdir -p src infra
```

Um layout final típico fica assim:

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

## Passo 2: Escreva o `azure.yaml`

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

> O campo `metadata.template` é o que a telemetria da galeria usa para contar o uso. Use a convenção `name@version`.

---

## Passo 3: Parametrize a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos de assinatura.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione na assinatura de qualquer pessoa.

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

Duas coisas tornam este template amigável:

1. **tag `azd-env-name`** — o azd a usa para rastrear e limpar recursos por ambiente.
2. **token de recurso `uniqueString(...)`** — produz um sufixo estável e globalmente único para que nomes não colidam.

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

O azd substitui `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` automaticamente a partir do ambiente atual.

---

## Passo 4: Teste seu Template Localmente

Antes de compartilhar, comprove que o template funciona a partir de um estado limpo.

**Teste a partir da pasta local** (não é necessário um push para o Git):

```bash
# A partir de um diretório vazio, inicialize usando o caminho do seu modelo local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionar e implantar de ponta a ponta
azd auth login
azd up
```

**Então teste a remoção**—um bom template limpa tudo completamente:

```bash
azd down --force --purge
```

Se `azd down` deixar recursos para trás, provavelmente você esqueceu a tag `azd-env-name` em algum recurso.

> **Dica:** execute `azd provision --preview` primeiro. Ele realiza um what-if e mostra erros de template antes que qualquer recurso seja criado.

---

## Passo 5: Publique o Template

Faça push do repositório para o GitHub (público se você quer que outros o usem):

```bash
gh repo create my-azd-template --public --source=. --push
```

Qualquer pessoa agora pode usá-lo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Passo 6 (Opcional): Submeta ao Awesome AZD

A [galeria Awesome AZD](https://azure.github.io/awesome-azd/) lista templates da comunidade. Para ser listado, seu repositório deve incluir:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama de arquitetura e observações sobre custos
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisiona corretamente em uma assinatura nova
- ✅ Um arquivo `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Submeta abrindo um pull request que adiciona seu template ao arquivo de dados da galeria, seguindo o guia de contribuição no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Armadilha | Correção |
|---------|-----|
| Nomes de recursos codificados | Use o token de recurso `uniqueString()` |
| o `azd down` deixa recursos para trás | Marque todo recurso (ou o grupo de recursos) com `azd-env-name` |
| Template funciona para você, falha para outros | Remova IDs de assinatura, IDs de locatário e suposições de região |
| Saídas não conectadas ao app | Exporte `SERVICE_<NAME>_ENDPOINT_URL` e outras saídas `AZURE_*` |
| Submissão para a galeria rejeitada | Adicione `README.md`, `LICENSE` e `metadata.template` |

---

## Resumo

- Um template é apenas um repositório Git com `azure.yaml`, `infra/` e seu código.
- Parametrize tudo — nomes, regiões e IDs — para que rode em qualquer lugar.
- Sempre marque recursos com `azd-env-name` para que `azd down` funcione.
- Teste localmente com `azd init --template <local-path>` antes de publicar.
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
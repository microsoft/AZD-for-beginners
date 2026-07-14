# Criar o Seu Próprio Template azd

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md)

> Validado com `azd 1.27.1` em julho de 2026.

## Introdução

Até agora você *consumiu* templates com `azd init --template <nome>`. Mas uma vez que tem um layout de projeto que a sua equipa gosta — digamos, uma Container App com um Cosmos DB e a monitorização adequada — você vai querer transformá-lo num template reutilizável seu. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe como ler. Esta lição mostra-lhe como construir um do zero, testá-lo e (opcionalmente) publicá-lo na galeria comunitária.

## Objetivos de Aprendizagem

No final desta lição, você irá:
- Compreender o que faz uma pasta ser um "template azd"
- Conhecer os ficheiros e a estrutura de pastas obrigatórios
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar o seu template localmente antes de partilhá-lo
- Publicar e (opcionalmente) submeter à galeria Awesome AZD

## Resultados de Aprendizagem

Depois de completar esta lição, será capaz de:
- Estruturar um novo repositório de template
- Parametrizar a infraestrutura para funcionar em qualquer subscrição
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados exigidos pela galeria comunitária

---

## O Que É um Template, Mesmo?

Um template azd é **um repositório Git** que contém, no mínimo:

| Ficheiro / pasta | Propósito | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e fornecedor de infra | ✅ Sim |
| `infra/` | Bicep, Terraform, ou Pulumi que provisiona recursos | ✅ Sim |
| `src/` (ou o seu código) | O código da aplicação que o azd implanta | ✅ Sim |
| `README.md` | Como usar o template | ✅ Fortemente recomendado |
| `.azdo/` ou `.github/` | Definições da pipeline CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reproduzível | Opcional |
| `azure.yaml` `metadata` | Informação da galeria + telemetria | Opcional (obrigatório para publicar) |

Não há nada de mágico aqui: quando executa `azd init --template you/your-repo`, o azd clona o repositório e lê o `azure.yaml`.

---

## Passo 1: Estruture o Repositório

Crie a estrutura de pastas manualmente ou comece a partir de um template mínimo e edite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Criar o layout padrão
mkdir -p src infra
```

Um layout acabado típico parece assim:

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

Este é o coração do template. Diz ao azd o que implantar e como:

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

> O campo `metadata.template` é usado pela telemetria da galeria para contar uso. Use a convenção `name@version`.

---

## Passo 3: Parametrize a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos da subscrição.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione em qualquer subscrição.

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

1. **Etiqueta `azd-env-name`** — o azd usa para rastrear e limpar recursos por ambiente.
2. **Token de recurso `uniqueString(...)`** — produz um sufixo estável e globalmente único para que os nomes não colidam.

Forneça um ficheiro de parâmetros correspondente que lê valores que o azd injeta pelo ambiente:

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

O azd substitui `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` do ambiente atual automaticamente.

---

## Passo 4: Teste o Seu Template Localmente

Antes de partilhar, prove que o template funciona a partir de um estado limpo.

**Teste a partir da pasta local** (não é necessário push para o Git):

```bash
# A partir de um diretório vazio, inicialize usando o caminho do seu modelo local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionar + implantar de ponta a ponta
azd auth login
azd up
```

**Depois teste o teardown** — um bom template limpa completamente:

```bash
azd down --force --purge
```

Se `azd down` deixar recursos para trás, provavelmente faltou a etiqueta `azd-env-name` num recurso.

> **Dica:** execute primeiro `azd provision --preview`. Este comando faz um what-if e mostra erros do template antes de criar qualquer recurso.

---

## Passo 5: Publique o Template

Faça push do repositório para o GitHub (público se quiser que outros o usem):

```bash
gh repo create my-azd-template --public --source=. --push
```

Agora qualquer pessoa pode usá-lo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Passo 6 (Opcional): Submeta ao Awesome AZD

A [galeria Awesome AZD](https://azure.github.io/awesome-azd/) lista templates comunitários. Para ser listado, o seu repositório deve incluir:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama de arquitetura, e notas de custo
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisiona corretamente numa subscrição nova
- ✅ Um ficheiro `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Submeta abrindo um pull request que adiciona o seu template ao ficheiro de dados da galeria, seguindo o guia de contribuições no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Armadilha | Correção |
|---------|----------|
| Nomes de recursos codificados | Use o token de recurso `uniqueString()` |
| `azd down` deixa recursos | Etiquete todos os recursos (ou o grupo de recursos) com `azd-env-name` |
| Template funciona para si, falha para outros | Remova IDs de subscrição, IDs de tenant e suposições de região |
| Outputs não ligados à app | Exporte `SERVICE_<NAME>_ENDPOINT_URL` e outros outputs `AZURE_*` |
| Submissão para galeria rejeitada | Adicione `README.md`, `LICENSE`, e `metadata.template` |

---

## Resumo

- Um template é apenas um repositório Git com `azure.yaml`, `infra/`, e o seu código.
- Parametrize tudo — nomes, regiões, e IDs — para correr em qualquer lugar.
- Etiquete sempre recursos com `azd-env-name` para que `azd down` funcione.
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

- [Provisionar Recursos](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentação oficial do template azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
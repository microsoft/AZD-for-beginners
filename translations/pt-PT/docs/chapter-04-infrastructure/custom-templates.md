# Criar o seu próprio template azd

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implementação
- **⬅️ Anterior**: [Guia de Implementação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md)

> Validado contra `azd 1.25.6` em junho de 2026.

## Introdução

Até agora tem *consumido* templates com `azd init --template <name>`. Mas, depois de ter uma estrutura de projeto que a sua equipa goste—por exemplo, uma Container App com um Cosmos DB e a monitorização adequada—vai querer transformá‑la num template reutilizável próprio. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe ler. Esta lição mostra como criar um a partir do zero, testá‑lo e (opcionalmente) publicá‑lo na galeria da comunidade.

## Objetivos de Aprendizagem

Ao terminar esta lição, irá:
- Compreender o que torna uma pasta um "template azd"
- Conhecer os ficheiros e a estrutura de pastas obrigatórios
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar o seu template localmente antes de o partilhar
- Publicá‑lo e (opcionalmente) submetê‑lo ao Awesome AZD

## Resultados de Aprendizagem

Depois de completar esta lição, será capaz de:
- Criar a estrutura inicial de um novo repositório de template
- Parametrizar a infraestrutura para que funcione em qualquer subscrição
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados exigidos pela galeria da comunidade

---

## O que é realmente um template?

Um template azd é **um repositório Git** que contém, no mínimo:

| Ficheiro / pasta | Finalidade | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e o fornecedor de infra | ✅ Sim |
| `infra/` | Bicep, Terraform ou Pulumi que provisione recursos | ✅ Sim |
| `src/` (or your code) | O código da aplicação que o azd implementa | ✅ Sim |
| `README.md` | Como usar o template | ✅ Fortemente recomendado |
| `.azdo/` ou `.github/` | Definições de pipelines CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reprodutível | Opcional |
| `azure.yaml` `metadata` | Informação da galeria + telemetria | Opcional (necessário para publicar) |

Não há nada de mágico aqui: quando executa `azd init --template you/your-repo`, o azd clona o repositório e lê `azure.yaml`.

---

## Passo 1: Estruturar o Repositório

Crie a estrutura de pastas manualmente ou comece a partir de um template mínimo e edite‑o:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Criar o layout padrão
mkdir -p src infra
```

Um layout final típico tem este aspeto:

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

Este é o núcleo do template. Diz ao azd o que implantar e como:

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

> O campo `metadata.template` é o que a telemetria da galeria usa para contar a utilização. Use a convenção `name@version`.

---

## Passo 3: Parametrizar a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos de subscrição.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione na subscrição de qualquer pessoa.

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

1. **`azd-env-name` tag** — o azd usa‑o para rastrear e limpar recursos por ambiente.
2. **`uniqueString(...)` resource token** — produz um sufixo estável e globalmente único para que os nomes não colidam.

Forneça um ficheiro de parâmetros correspondente que leia os valores que o azd injeta do ambiente:

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

O azd substitui `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` a partir do ambiente atual automaticamente.

---

## Passo 4: Testar o Seu Template Localmente

Antes de o partilhar, confirme que o template funciona a partir de um estado limpo.

**Testar a partir da pasta local** (não é necessário fazer push para o Git):

```bash
# A partir de um diretório vazio, inicialize usando o caminho para o seu modelo local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Aprovisionamento + implantação de ponta a ponta
azd auth login
azd up
```

**Depois, teste a remoção** — um bom template limpa tudo completamente:

```bash
azd down --force --purge
```

Se o `azd down` deixar recursos para trás, provavelmente se esqueceu de colocar a tag `azd-env-name` num recurso.

> **Dica:** execute primeiro `azd provision --preview`. Ele realiza um what-if e revela erros do template antes de qualquer recurso ser criado.

---

## Passo 5: Publicar o Template

Faça push do repositório para o GitHub (público se quiser que outros o usem):

```bash
gh repo create my-azd-template --public --source=. --push
```

Qualquer pessoa pode agora usá‑lo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Passo 6 (Opcional): Submeter ao Awesome AZD

A galeria [Awesome AZD](https://azure.github.io/awesome-azd/) lista templates da comunidade. Para ser incluído, o seu repositório deve conter:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama de arquitetura e notas sobre custos
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisione corretamente numa subscrição nova
- ✅ Um ficheiro `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Submeta abrindo um pull request que adicione o seu template ao ficheiro de dados da galeria, seguindo o guia de contribuição no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Problema | Solução |
|---------|-----|
| Nomes de recursos fixos | Use o token de recurso `uniqueString()` |
| O `azd down` deixa recursos para trás | Etiquete cada recurso (ou o grupo de recursos) com `azd-env-name` |
| O template funciona para si, falha para outros | Remova IDs de subscrição, IDs de tenant e pressupostos sobre regiões |
| Saídas não ligadas à aplicação | Exporte `SERVICE_<NAME>_ENDPOINT_URL` e outras saídas `AZURE_*` |
| Submissão à galeria rejeitada | Adicione `README.md`, `LICENSE` e `metadata.template` |

---

## Resumo

- Um template é apenas um repositório Git com `azure.yaml`, `infra/` e o seu código.
- Parametrize tudo — nomes, regiões e IDs — para que funcione em qualquer subscrição.
- Etiquete sempre os recursos com `azd-env-name` para que o `azd down` funcione.
- Teste localmente com `azd init --template <local-path>` antes de publicar.
- Adicione metadados e um README para submeter ao Awesome AZD.

---

## 🔗 Navegação

| Direção | Recurso |
|-----------|----------|
| **Anterior** | [Guia de Implementação](deployment-guide.md) |
| **Início do Capítulo** | [Capítulo 4: Infraestrutura como Código](README.md) |
| **Próximo Capítulo** | [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Recursos Relacionados

- [Provisionamento de Recursos](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentação oficial de templates azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
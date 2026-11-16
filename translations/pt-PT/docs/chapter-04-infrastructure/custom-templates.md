# Criar o Seu Próprio Template azd

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código e Implantação
- **⬅️ Anterior**: [Guia de Implantação](deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md)

> Revisado contra `azd 1.37.2` (Novembro 2026). Esta é uma **demonstração de criação com ficheiros parciais**, não um template completo: deve fornecer o código da aplicação e `modules/web.bicep` com o seu ambiente, registo, Aplicação de Contentor e saídas antes da implantação. O provisionamento do Azure não foi executado nesta revisão.

## Introdução

Até agora, você *consumiu* templates com `azd init --template <name>`. Mas, uma vez que tenha um layout de projeto que a sua equipa goste—por exemplo, uma Aplicação de Contentor com um Cosmos DB e a monitorização adequada—vai querer transformá-lo num template reutilizável seu. Um template é apenas um repositório Git com uma estrutura previsível que o azd sabe como ler. Esta lição mostra como criar um do zero, testá-lo e (opcionalmente) publicá-lo na galeria da comunidade.

## Objetivos de Aprendizagem

No final desta lição, você irá:
- Compreender o que torna uma pasta um "template azd"
- Conhecer os ficheiros e o layout de pasta necessários
- Adicionar um `azure.yaml` e `infra/` que outras pessoas possam reutilizar
- Testar o seu template localmente antes de o partilhar
- Publicá-lo e (opcionalmente) submetê-lo ao Awesome AZD

## Resultados Esperados

Após concluir esta lição, será capaz de:
- Criar o esqueleto de um novo repositório de template
- Parametrizar a infraestrutura para que funcione em qualquer subscrição
- Validar um template com `azd init` e `azd up`
- Adicionar os metadados que a galeria da comunidade requer

---

## O que é um Template, na Realidade?

Um template azd é **um repositório Git** que contém, no mínimo:

| Ficheiro / pasta | Propósito | Obrigatório? |
|---------------|---------|-----------|
| `azure.yaml` | Descreve serviços, hosts e fornecedor de infra | ✅ Sim |
| `infra/` | Definições de provisionamento Bicep ou Terraform | Obrigatório para este exemplo explícito de IaC; projetos com infraestrutura gerada podem omitir |
| `src/` (ou o seu código) | O código da aplicação que o azd implanta | Obrigatório para serviços baseados em código-fonte; nem todos os templates contêm código de aplicação |
| `README.md` | Como usar o template | ✅ Fortemente recomendado |
| `.azdo/` ou `.github/` | Definições da pipeline CI/CD | Opcional |
| `.devcontainer/` | Ambiente de desenvolvimento reproduzível | Opcional |
| `azure.yaml` `metadata` | Informação de identidade/telemetria do template | Recomendado; publicar um repositório Git não o requer |

Não há magia aqui: quando executa `azd init --template you/your-repo`, o azd clona o repositório e lê `azure.yaml`.

---

## Passo 1: Criar o Esqueleto do Repositório

Crie a estrutura de pastas manualmente ou comece com um template minimalista e edite-o:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Um layout típico finalizado é este:

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

## Passo 2: Escrever `azure.yaml`

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

> O campo `metadata.template` é o que a telemetria da galeria usa para contar o uso. Use a convenção `name@version`.

---

## Passo 3: Parametrizar a Infraestrutura

A regra mais importante para um template *reutilizável*: **nunca codifique nomes, regiões ou valores específicos de subscrição.** Use parâmetros e o padrão de token de recurso para que o mesmo template funcione na subscrição de qualquer pessoa.

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

1. **Etiqueta `azd-env-name`** — o azd usa-a para rastrear e limpar recursos por ambiente.
2. **Token de recurso `uniqueString(...)`** — produz um sufixo hash estável para reduzir colisões; não garante unicidade global.

O `modules/web.bicep` que falta deve aceitar `name`, `location` e `tags`, provisionar o ambiente/registo e app da Aplicação de Contentor, etiquetar a app com `azd-service-name: web`, e exportar `uri`. Deve também expor valores do registo necessários ao fluxo de construção/implantação escolhido (por exemplo `AZURE_CONTAINER_REGISTRY_ENDPOINT` do módulo raiz). Apenas uma saída endpoint não configura descoberta de serviço, definições de aplicação ou autenticação no registo.

Forneça um ficheiro de parâmetros correspondente que leia valores que o azd injeta do ambiente:

Guarde o seguinte como `infra/main.parameters.json`:

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

## Passo 4: Teste o Seu Template Localmente

Antes de partilhar, prove que o template funciona a partir de um estado limpo.

**Teste a partir da pasta local** (não é necessário fazer push para Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Depois teste a desmontagem**—um bom template limpa completamente:

```bash
azd down --force --purge
```

Se `azd down` deixar recursos para trás, verifique a descoberta do ambiente/grupo de recursos, recursos externos/partilhados, permissões, bloqueios e proteção contra eliminação. `--purge` não apaga o estado local `.azure/`.

> **Dica:** depois de fornecer todos os ficheiros em falta, execute `azd provision --preview` primeiro. Inspecione os hooks antes da pré-visualização porque podem executar comandos com efeitos colaterais. A pré-visualização não é uma estimativa de preço nem garantia de que o provisionamento terá sucesso.

---

## Passo 5: Publique o Template

Faça push do repositório para o GitHub (público se quiser que outros o utilizem):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Qualquer pessoa pode agora usá-lo:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Passo 6 (Opcional): Submeter ao Awesome AZD

A [galeria Awesome AZD](https://azure.github.io/awesome-azd/) lista templates da comunidade. Para ser listado, o seu repositório deve incluir:

- ✅ Um `README.md` claro com pré-requisitos, um diagrama de arquitetura e notas de custo
- ✅ Um `azure.yaml` funcional com `metadata.template`
- ✅ Infraestrutura que provisiona limpo numa subscrição nova
- ✅ Um ficheiro `LICENSE`
- ✅ (Recomendado) Um `.devcontainer/` para Codespaces com um clique

Submeta abrindo um pull request que adiciona o seu template ao ficheiro de dados da galeria, seguindo o guia de contribuições no [repositório Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Armadilhas Comuns

| Armadilha | Correção |
|---------|-----|
| Nomes de recursos codificados | Use o token de recurso `uniqueString()` |
| `azd down` deixa recursos | Etiquete todos os recursos (ou o grupo de recursos) com `azd-env-name` |
| Template funciona para si, falha para outros | Remova IDs de subscrição, IDs de inquilino e suposições de região |
| Saídas não ligadas à aplicação | Combine `azd-service-name`/`resourceName` para implantação e mapeie explicitamente as saídas para as definições da aplicação |
| Submissão à galeria rejeitada | Adicione `README.md`, `LICENSE`, e `metadata.template` |

---

## Resumo

- Um template é apenas um repositório Git com `azure.yaml`, `infra/` e o seu código.
- Parametrize tudo—nomes, regiões e IDs—para que funcione em qualquer lugar.
- Sempre etiquete os recursos com `azd-env-name` para que `azd down` funcione.
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
- [Documentação oficial do template azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
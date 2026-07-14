# Traga Seu Próprio App - Adicione azd a um Projeto Existente

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo**: [Dev Containers & Codespaces](dev-containers.md)

> Validado com `azd 1.27.1` em julho de 2026.

## Introdução

No [Seu Primeiro Projeto](first-project.md), você implantou um app começando por um modelo. Mas na maioria das vezes você já *tem* um app—uma API Node.js, um serviço Python Flask, um app web .NET—em uma pasta na sua máquina. Esta lição mostra como adicionar azd a esse código existente para que você possa implantá-lo com `azd up`, sem necessidade de modelo.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender as três formas de iniciar um projeto azd
- Executar `azd init` dentro de um código existente
- Entender o que `azure.yaml` e a pasta `infra/` fazem para seu app
- Saber quando deixar o azd gerar a infraestrutura ou escrever você mesmo
- Implantar seu app existente no Azure com `azd up`

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Inicializar azd em um projeto que você já tem
- Ler e editar um arquivo básico `azure.yaml`
- Gerar infraestrutura inicial com `azd infra generate`
- Escolher um host Azure adequado para seu app
- Implantar e limpar sua própria aplicação

---

## Três Formas de Iniciar um Projeto azd

| Ponto de partida | Comando | Quando usar |
|----------------|---------|-------------|
| **A partir de um modelo** | `azd init --template <name>` | Aprendizagem, ou iniciando um app novo a partir de um exemplo comprovado |
| **A partir do seu código existente** | `azd init` (na pasta do projeto) | Você já tem um app e quer implantá-lo |
| **A partir de um repositório Git** | `azd init --from-code` (em um repositório clonado) | Adotando azd para um repositório existente |

Você já praticou a primeira opção. Esta lição cobre a segunda—o cenário real mais comum.

---

## Passo 1: Execute `azd init` no Seu Projeto

Abra um terminal **dentro da pasta do seu projeto existente** e execute:

```bash
cd my-existing-app
azd init
```

O azd vai perguntar como você quer inicializar. Escolha:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Escolha **"Use o código no diretório atual."** azd então escaneia sua pasta, detecta sua linguagem e framework, e propõe um host.

### O que o azd detecta

azd procura sinais como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`, e sugere um host Azure correspondente:

| Seu app | Host provavelmente detectado |
|----------|----------------------|
| App web Node.js / Python / .NET | Azure App Service ou Container Apps |
| App containerizado (`Dockerfile`) | Azure Container Apps |
| App de função | Azure Functions |
| Site estático (build React/Vue) | Azure Static Web Apps |

Confirme o(s) serviço(s) detectado(s), e azd cria os arquivos que você precisa.

---

## Passo 2: Entenda o Que o azd Criou

Após o init, você terá duas coisas novas em seu projeto:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — a definição do projeto

Esta é a essência de um projeto azd. Um arquivo mínimo fica assim:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada relaciona uma pasta do seu código a um host Azure. Se seu app tem frontend e API, terá dois serviços.

### `infra/` — seus recursos Azure como código

A pasta `infra/` contém arquivos Bicep que definem os recursos Azure que seu app precisa (App Service, banco de dados, etc.). Você não precisa escrever isso à mão—azd gera um ponto inicial que funciona. Você *pode* editá-los depois para adicionar recursos ou reforçar segurança (coberto no [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Quer ver ou personalizar a infraestrutura gerada antes de implantar? Execute `azd infra generate` (também disponível como `azd infra synth`) para gravar o IaC no disco para revisar e versionar.

---

## Passo 3: Defina as Configurações Necessárias

Se seu app precisa de configurações ou segredos (string de conexão, chave API), não codifique direto. Use valores de ambiente:

```bash
# Criar um ambiente
azd env new dev

# Definir um valor não secreto
azd env set API_VERSION 1.0.0
```

Para segredos reais, armazene no Key Vault e faça referência pela infraestrutura—veja o [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Implantar

Agora use o mesmo fluxo de trabalho que você já conhece:

```bash
# Autenticar (necessário para azd)
azd auth login

# Visualizar os recursos que serão criados
azd provision --preview

# Provisionar a infraestrutura e implantar seu código
azd up
```

Quando terminar, o azd exibe a URL do seu app. Verifique do mesmo modo que qualquer app azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # verificar logs se necessário
```

---

## Problemas Comuns na Primeira Vez

| Sintoma | Causa provável | Correção |
|---------|--------------|-----|
| azd não detectou meu app | Manifesto faltando (ex: `package.json`) | Adicione o manifesto, ou escolha o host manualmente durante `azd init` |
| Falha na compilação durante `azd up` | App precisa de etapa de build | Adicione `buildCommand`/`outputPath` no serviço em `azure.yaml` |
| App inicia mas retorna erros | Configuração/segredo faltando | Defina valores com `azd env set` ou conecte Key Vault |
| Host errado escolhido | Detecção automática errada | Edite `host:` em `azure.yaml` e execute `azd up` novamente |

Para mais, veja o [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpeza

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Use o código no diretório atual"** adiciona azd a um app que você já tem.
- `azure.yaml` relaciona suas pastas de código a hosts Azure; `infra/` define recursos como Bicep.
- `azd infra generate` permite revisar ou personalizar infraestrutura gerada.
- Uma vez inicializado, seu app existente usa o mesmo fluxo `azd up` / `azd down` que um app baseado em modelo.

---

## 🔗 Navegação

| Direção | Lição |
|-----------|--------|
| **Anterior** | [Seu Primeiro Projeto](first-project.md) |
| **Próximo** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Noções Básicas do AZD](azd-basics.md)
- [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Resumo de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Traga Seu Próprio App - Adicionar azd a um Projeto Existente

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo**: [Dev Containers e Codespaces](dev-containers.md)

> Revisão do comando e configuração alvo: `azd 1.37.2` (Novembro 2026). Arquivos gerados dependem da aplicação detectada; implantação no Azure não foi executada nesta revisão.

## Introdução

Em [Seu Primeiro Projeto](first-project.md) você implantou um app partindo de um modelo. Mas na maioria das vezes você já *tem* um app—uma API Node.js, um serviço Python Flask, um app web .NET—guardado em uma pasta na sua máquina. Esta lição mostra como adicionar azd a esse código existente para que você possa implantá-lo com `azd up`, sem a necessidade de um modelo.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender as três formas de iniciar um projeto azd
- Executar `azd init` dentro de uma base de código existente
- Entender o que `azure.yaml` e a pasta `infra/` fazem pelo seu app
- Saber quando deixar o azd gerar a infraestrutura vs. escrever a sua própria
- Implantar seu app existente no Azure com `azd up`

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Inicializar o azd em um projeto que você já tem
- Ler e editar um arquivo `azure.yaml` básico
- Gerar a infraestrutura inicial com `azd infra generate`
- Escolher um host Azure apropriado para seu app
- Implantar e limpar sua própria aplicação

---

## Três Formas de Iniciar um Projeto azd

| Ponto de partida | Comando | Quando usar |
|----------------|---------|-------------|
| **De um modelo** | `azd init --template <name> .` (diretório vazio) | Aprender, ou iniciar um novo app a partir de um exemplo comprovado |
| **Do seu código existente** | `azd init` (na pasta do seu projeto) | Você já tem um app e quer implantá-lo |
| **De um repositório Git** | `azd init --from-code` (em um repositório clonado) | Adotar o azd para um repositório existente |

Você já praticou a primeira opção. Esta lição cobre a segunda—o cenário mais comum no mundo real.

---

## Passo 1: Execute `azd init` no Seu Projeto

Abra um terminal **dentro da pasta do seu projeto existente** e execute:

```bash
cd my-existing-app
azd init
```

azd perguntará como você deseja inicializar. Escolha:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Selecione **"Use o código no diretório atual."** azd então escaneia sua pasta, detecta sua linguagem e framework, e propõe um host.

### O que o azd detecta

azd busca sinais da aplicação como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`. O fluxo de código existente não é um assistente geral de seleção de host para todo alvo de implantação suportado:

| Seu app | Host provavelmente detectado |
|----------|----------------------|
| App web Node.js / Python / .NET suportado | Normalmente Azure Container Apps; inspecione a definição gerada |
| App conteinerizado (`Dockerfile`) | Azure Container Apps |
| App de função ou projeto Static Web Apps | Use um modelo correspondente ou crie `azure.yaml` e a infraestrutura se o fluxo de código existente não suportar seu layout |

Confirme o(s) serviço(s) detectado(s), e o azd gera os arquivos que você precisa.

---

## Passo 2: Entenda o Que o azd Criou

Após a inicialização, inspecione `azure.yaml`. O fluxo de infraestrutura gerada pode manter a infraestrutura implícita até você executar `azd infra generate`; não considere que `infra/` já existe:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — a definição do projeto

Este é o coração de um projeto azd. A seguinte **definição ilustrativa de App Service** requer infraestrutura correspondente de App Service; não é razão para alterar um host Container Apps gerado sem mudar a infraestrutura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada mapeia uma pasta do seu código para um host Azure. Se seu app tem tanto frontend quanto uma API, você terá dois serviços.

### `infra/` — seus recursos Azure como código

A pasta `infra/` contém arquivos Bicep que definem os recursos Azure que seu app precisa (o App Service, o banco de dados, etc.). Você não precisa escrevê-los manualmente—azd gera um ponto de partida funcional. Você *pode* editá-los depois para adicionar recursos ou reforçar a segurança (abordado em [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Quer ver ou personalizar a infraestrutura gerada antes de implantar? Execute `azd infra generate` (também disponível como `azd infra synth`) para gravar a IaC no disco, assim poderá revisar e controlar versões dela.

---

## Passo 3: Defina a Configuração Necessária

Se seu app precisa de configurações ou segredos (uma string de conexão, uma chave API), não os deixe codificados. Use valores de ambiente:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Isso armazena valor apenas localmente. Para afetar o app, consuma explicitamente ele em parâmetros da infraestrutura, uma configuração de serviço suportada, ou um hook; definir uma variável arbitrária não configura o runtime implantado.

Para segredos reais, armazene-os no Key Vault e faça referência a eles a partir da sua infraestrutura—veja [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Implantar

Agora use o mesmo fluxo de trabalho que você já conhece:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Ao finalizar, azd exibe a URL do seu app. Verifique da mesma forma que qualquer app azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Problemas Comuns na Primeira Vez

| Sintoma | Causa provável | Solução |
|---------|--------------|-----|
| azd não detectou meu app | Manifesto ausente (ex: `package.json`) | Adicione o manifesto, ou escolha o host manualmente durante `azd init` |
| Falha no build durante `azd up` | App precisa de um passo de build | Configure os scripts do pacote do app ou hook de serviço `prepackage`; use `dist` para saída de implantação, não `buildCommand`/`outputPath` |
| App inicia mas retorna erros | Configuração/segredo faltando | Conecte valores em configurações de app runtime ou referência Key Vault; só `azd env set` não é suficiente |
| Host errado escolhido | Detecção automática não corresponde às suas necessidades | Altere tanto `host:` quanto a infraestrutura correspondente, ou escolha um modelo que corresponda |

Para mais, veja [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpeza

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Use o código no diretório atual"** adiciona azd a um app que você já tem.
- `azure.yaml` mapeia suas pastas de código para hosts Azure; `infra/` define os recursos como Bicep.
- `azd infra generate` permite revisar ou personalizar a infraestrutura gerada.
- Depois de inicializado, seu app existente usa exatamente o mesmo fluxo `azd up` / `azd down` que um app baseado em modelo.

---

## 🔗 Navegação

| Direção | Lição |
|-----------|--------|
| **Anterior** | [Seu Primeiro Projeto](first-project.md) |
| **Próximo** | [Dev Containers e Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Conceitos Básicos azd](azd-basics.md)
- [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Folha de Consulta de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
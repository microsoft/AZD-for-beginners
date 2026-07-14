# Traz a tua própria aplicação - Adicionar azd a um projeto existente

**Navegação do capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [O teu Primeiro Projeto](first-project.md)
- **➡️ Seguinte**: [Contêineres de Desenvolvimento & Codespaces](dev-containers.md)

> Validado com `azd 1.27.1` em julho de 2026.

## Introdução

Em [O teu Primeiro Projeto](first-project.md) implantaste uma aplicação começando por um template. Mas a maior parte das vezes já *tens* uma aplicação—uma API Node.js, um serviço Python Flask, uma aplicação web .NET—a guardar numa pasta no teu computador. Esta lição mostra como adicionar o azd a esse código existente para que possas implantá-lo com `azd up`, sem necessidade de template.

## Objetivos de Aprendizagem

No final desta lição, tu vais:
- Compreender as três formas de começar um projeto azd
- Executar `azd init` dentro de um código existente
- Compreender o que fazem o `azure.yaml` e a pasta `infra/` para a tua aplicação
- Saber quando deixar o azd gerar a infraestrutura vs. escrever a tua própria
- Implantar a tua aplicação existente no Azure com `azd up`

## Resultados de Aprendizagem

Depois de completares esta lição, serás capaz de:
- Inicializar o azd num projeto que já tens
- Ler e editar um ficheiro `azure.yaml` básico
- Gerar infraestrutura inicial com `azd infra generate`
- Escolher um anfitrião Azure apropriado para a tua aplicação
- Implantar e limpar a tua própria aplicação

---

## Três Formas de Começar um Projeto azd

| Ponto de partida | Comando | Quando usar |
|----------------|---------|-------------|
| **A partir de um template** | `azd init --template <nome>` | Aprendizagem, ou iniciar uma nova aplicação a partir de um exemplo comprovado |
| **A partir do teu código existente** | `azd init` (na tua pasta do projeto) | Já tens uma aplicação e queres implantá-la |
| **A partir de um repositório Git** | `azd init --from-code` (num repositório clonado) | Adoptar azd para um repositório existente |

Já praticaste a primeira opção. Esta lição cobre a segunda—a situação do mundo real mais comum.

---

## Passo 1: Executar `azd init` no Teu Projeto

Abre um terminal **dentro da pasta do teu projeto existente** e executa:

```bash
cd my-existing-app
azd init
```

O azd vai perguntar como queres inicializar. Escolhe:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Escolhe **"Usar código no diretório atual."**. O azd analisa a tua pasta, deteta a linguagem e framework, e propõe um anfitrião.

### O que o azd deteta

O azd procura sinais como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`, e sugere um anfitrião Azure compatível:

| A tua aplicação | Anfitrião provável detectado |
|----------|----------------------|
| Node.js / Python / aplicação web .NET | Azure App Service ou Azure Container Apps |
| Aplicação conteinerizada (`Dockerfile`) | Azure Container Apps |
| Aplicação Function | Azure Functions |
| Site estático (output de React/Vue) | Azure Static Web Apps |

Confirma os serviços detetados, e o azd cria os ficheiros de que precisas.

---

## Passo 2: Compreende o Que o azd Criou

Após a inicialização, terás duas coisas novas no teu projeto:

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

Este é o coração de um projeto azd. Um minimalista é assim:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada mapeia uma pasta do teu código a um anfitrião Azure. Se a tua app tem frontend e API, terás dois serviços.

### `infra/` — os teus recursos Azure como código

A pasta `infra/` contém ficheiros Bicep que definem os recursos Azure que a tua aplicação precisa (App Service, base de dados, etc.). Não precisas de escrever estes à mão—o azd gera um ponto de partida funcional. Podes *editar* estes ficheiros mais tarde para adicionar recursos ou reforçar segurança (tratado em [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Queres ver ou personalizar a infraestrutura gerada antes de implantar? Executa `azd infra generate` (também disponível como `azd infra synth`) para gerar o IaC no disco e assim poder revisá-lo e controlar a versão.

---

## Passo 3: Define as Configurações Necessárias

Se a tua aplicação precisa de definições ou segredos (uma connection string, uma chave API), não os coloques diretamente no código. Usa valores do ambiente:

```bash
# Criar um ambiente
azd env new dev

# Definir um valor não secreto
azd env set API_VERSION 1.0.0
```

Para segredos reais, armazena-os no Key Vault e referencia-os a partir da tua infraestrutura—vê [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Implantar

Agora usa o mesmo fluxo de trabalho que já conheces:

```bash
# Autenticar (necessário para azd)
azd auth login

# Pré-visualizar os recursos que serão criados
azd provision --preview

# Fornecer a infraestrutura e implementar o seu código
azd up
```

Quando terminar, o azd mostra a URL da tua app. Verifica-a da mesma forma que qualquer app azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # verificar logs se necessário
```

---

## Problemas Comuns na Primeira Vez

| Sintoma | Causa provável | Solução |
|---------|--------------|-----|
| azd não detetou a minha app | Manifesto em falta (ex.: `package.json`) | Adiciona o manifesto, ou escolhe o anfitrião manualmente durante `azd init` |
| A construção falha durante `azd up` | A aplicação precisa de um passo de build | Adiciona `buildCommand`/`outputPath` sob o serviço em `azure.yaml` |
| A app inicia mas retorna erros | Configuração/segredo em falta | Define valores com `azd env set` ou liga ao Key Vault |
| Anfitrião errado escolhido | Deteção automática incorreta | Edita `host:` em `azure.yaml` e executa novamente `azd up` |

Para mais, vê [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpar

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Usar código no diretório atual"** adiciona azd a uma aplicação que já tens.
- `azure.yaml` mapeia as pastas do teu código aos anfitriões Azure; `infra/` define os recursos em Bicep.
- `azd infra generate` permite rever ou personalizar a infraestrutura gerada.
- Uma vez inicializada, a tua aplicação existente usa o mesmo fluxo `azd up` / `azd down` que uma app baseada em template.

---

## 🔗 Navegação

| Direção | Lição |
|-----------|--------|
| **Anterior** | [O teu Primeiro Projeto](first-project.md) |
| **Seguinte** | [Contêineres de Desenvolvimento & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Noções Básicas do AZD](azd-basics.md)
- [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Folha de Consulta de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
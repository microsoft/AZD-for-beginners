# Traga a Sua Aplicação - Adicionar azd a um Projeto Existente

**Chapter Navigation:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [O Seu Primeiro Projeto](first-project.md)
- **➡️ Seguinte**: [Contêineres Dev & Codespaces](dev-containers.md)

> Validado com `azd 1.25.6` em junho de 2026.

## Introdução

Em [O Seu Primeiro Projeto](first-project.md) implantou uma app a partir de um modelo. Mas, na maioria das vezes, já *tem* uma aplicação — uma API Node.js, um serviço Python Flask, uma app web .NET — numa pasta no seu computador. Esta lição mostra como adicionar o azd a esse código existente para que o possa implantar com `azd up`, sem necessidade de um template.

## Objetivos de Aprendizagem

No final desta lição, irá:
- Compreender as três formas de iniciar um projeto azd
- Executar `azd init` dentro de uma base de código existente
- Perceber o que `azure.yaml` e a pasta `infra/` fazem pela sua app
- Saber quando deixar o azd gerar a infraestrutura vs. escrever a sua própria
- Implantar a sua aplicação existente no Azure com `azd up`

## Resultados de Aprendizagem

Depois de completar esta lição, será capaz de:
- Iniciar o azd num projeto que já tem
- Ler e editar um ficheiro `azure.yaml` básico
- Gerar infraestrutura inicial com `azd infra generate`
- Escolher um host Azure apropriado para a sua app
- Implantar e limpar a sua própria aplicação

---

## Três Formas de Iniciar um Projeto azd

| Ponto de partida | Comando | Quando usar |
|----------------|---------|-------------|
| **A partir de um modelo** | `azd init --template <name>` | Aprendizagem, ou iniciar uma nova aplicação a partir de um exemplo comprovado |
| **A partir do seu código existente** | `azd init` (na pasta do seu projeto) | Já tem uma app e quer implantá-la |
| **A partir de um repositório Git** | `azd init --from-code` (num repositório clonado) | Adotar o azd num repositório existente |

Já praticou a primeira opção. Esta lição cobre a segunda — o cenário mais comum no mundo real.

---

## Passo 1: Execute `azd init` no Seu Projeto

Abra um terminal **dentro da pasta do seu projeto existente** e execute:

```bash
cd my-existing-app
azd init
```

o azd irá perguntar como pretende inicializar. Escolha:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Escolha **"Utilizar o código no diretório atual."** o azd então analisa a sua pasta, deteta a linguagem e o framework, e propõe um host.

### O que o azd deteta

o azd procura sinais como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`, e sugere um host Azure correspondente:

| A sua aplicação | Host provavelmente detetado |
|----------|----------------------|
| Aplicação web Node.js / Python / .NET | Azure App Service ou Container Apps |
| Aplicação conteinerizada (`Dockerfile`) | Azure Container Apps |
| Aplicação Function | Azure Functions |
| Site estático (resultado do build de React/Vue) | Azure Static Web Apps |

Confirme o(s) serviço(s) detetado(s), e o azd gera os ficheiros de que precisa.

---

## Passo 2: Compreender o que o azd criou

Depois do init, terá duas coisas novas no seu projeto:

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

Este é o coração de um projeto azd. Um exemplo mínimo parece-se com isto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada mapeia uma pasta do seu código para um host Azure. Se a sua app tiver frontend e API, terá dois serviços.

### `infra/` — os seus recursos Azure como código

A pasta `infra/` contém ficheiros Bicep que definem os recursos Azure que a sua app precisa (o App Service, a base de dados, etc.). Não precisa de escrever estes ficheiros manualmente — o azd gera um ponto de partida funcional. Pode editá-los mais tarde para adicionar recursos ou reforçar a segurança (coberto em [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Quer ver ou personalizar a infraestrutura gerada antes de implantar? Execute `azd infra generate` (também disponível como `azd infra synth`) para escrever o IaC no disco, para que possa rever e controlar versões.

---

## Passo 3: Definir a Configuração Necessária

Se a sua app precisa de definições ou segredos (uma connection string, uma chave de API), não as codifique no código. Utilize valores de ambiente:

```bash
# Criar um ambiente
azd env new dev

# Definir um valor não secreto
azd env set API_VERSION 1.0.0
```

Para segredos reais, guarde-os no Key Vault e faça referência a eles a partir da sua infraestrutura — veja [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Implantar

Agora use o mesmo fluxo de trabalho que já conhece:

```bash
# Autenticar (obrigatório para azd)
azd auth login

# Pré-visualizar os recursos que serão criados
azd provision --preview

# Provisionar a infraestrutura e implantar o seu código
azd up
```

Quando terminar, o azd mostra a URL da sua aplicação. Verifique-a da mesma forma que qualquer aplicação azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # verificar logs se necessário
```

---

## Problemas Comuns na Primeira Utilização

| Sintoma | Causa provável | Solução |
|---------|--------------|-----|
| o azd não detetou a minha aplicação | Manifest em falta (por ex., `package.json`) | Adicione o manifesto, ou selecione o host manualmente durante `azd init` |
| A compilação falha durante `azd up` | A aplicação precisa de uma etapa de build | Adicione `buildCommand`/`outputPath` sob o serviço em `azure.yaml` |
| A aplicação inicia mas retorna erros | Configuração/segredo em falta | Defina valores com `azd env set` ou ligue o Key Vault |
| Host errado selecionado | Deteção automática incorreta | Edite `host:` em `azure.yaml` e volte a executar `azd up` |

Para mais, veja [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpar

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Utilizar o código no diretório atual"** adiciona o azd a uma app que já tem.
- `azure.yaml` mapeia as pastas do seu código para hosts Azure; `infra/` define os recursos como Bicep.
- `azd infra generate` permite rever ou personalizar a infraestrutura gerada.
- Depois de inicializado, a sua app existente usa exatamente o mesmo fluxo `azd up` / `azd down` que uma app baseada em template.

---

## 🔗 Navegação

| Direção | Lição |
|-----------|--------|
| **Anterior** | [O Seu Primeiro Projeto](first-project.md) |
| **Seguinte** | [Contêineres Dev & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Noções Básicas do AZD](azd-basics.md)
- [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Resumo de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
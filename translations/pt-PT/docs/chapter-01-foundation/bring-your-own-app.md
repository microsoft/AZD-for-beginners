# Traga a Sua Própria Aplicação - Adicione azd a um Projeto Existente

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [O Seu Primeiro Projeto](first-project.md)
- **➡️ Seguinte**: [Contentores de Desenvolvimento & Codespaces](dev-containers.md)

> Destino da revisão de comandos e configuração: `azd 1.37.2` (Novembro de 2026). Os ficheiros gerados dependem da aplicação detetada; o deployment para Azure não foi executado nesta revisão.

## Introdução

Em [O Seu Primeiro Projeto](first-project.md) implantou uma aplicação partindo de um template. Mas na maioria das vezes já *tem* uma aplicação – uma API Node.js, um serviço Python Flask, uma app web .NET – numa pasta no seu computador. Esta lição mostra como adicionar azd a esse código existente para que possa implantá-lo com `azd up`, sem necessidade de template.

## Objetivos de Aprendizagem

No final desta lição, irá:
- Compreender as três formas de iniciar um projeto azd
- Executar `azd init` dentro de um código existente
- Compreender o que `azure.yaml` e a pasta `infra/` fazem pela sua app
- Saber quando deixar azd gerar a infraestrutura vs. escrever a sua própria
- Implantar a sua app existente no Azure com `azd up`

## Resultados de Aprendizagem

Após completar esta lição, será capaz de:
- Inicializar azd num projeto que já tem
- Ler e editar um ficheiro básico `azure.yaml`
- Gerar infraestrutura inicial com `azd infra generate`
- Escolher um host Azure apropriado para a sua app
- Implantar e limpar a sua própria aplicação

---

## Três Formas de Iniciar um Projeto azd

| Ponto de partida | Comando | Quando usar |
|----------------|---------|-------------|
| **A partir de um template** | `azd init --template <name> .` (diretório vazio) | Aprendizagem, ou iniciar uma nova app a partir de um exemplo comprovado |
| **A partir do seu código existente** | `azd init` (na pasta do seu projeto) | Já tem uma aplicação e quer implantá-la |
| **A partir de um repositório Git** | `azd init --from-code` (num repositório clonado) | Adotar azd para um repositório existente |

Já praticou a primeira opção. Esta lição cobre a segunda — o cenário real mais comum.

---

## Passo 1: Execute `azd init` no Seu Projeto

Abra um terminal **dentro da sua pasta de projeto existente** e execute:

```bash
cd my-existing-app
azd init
```

azd irá perguntar como pretende iniciar. Escolha:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Selecione **"Usar código no diretório atual."** azd então escaneia a sua pasta, deteta a linguagem e framework, e propõe um host.

### O que azd deteta

azd procura sinais de aplicação como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`. O fluxo a partir do código não é um assistente geral de seleção de host para todos os destinos de deployment suportados:

| A sua app | Host provavelmente detetado |
|----------|--------------------------|
| App web Node.js / Python / .NET suportada | Normalmente Azure Container Apps; inspecione a definição gerada |
| App containerizada (`Dockerfile`) | Azure Container Apps |
| App Function ou projeto Static Web Apps | Use um template correspondente ou escreva `azure.yaml` e infraestrutura se a partir do código não suportar o seu layout |

Confirme o(s) serviço(s) detetado(s) e azd gera os ficheiros que necessita.

---

## Passo 2: Compreenda o que azd Criou

Após a inicialização, inspecione `azure.yaml`. O fluxo de infraestrutura gerada pode manter a infraestrutura implícita até executar `azd infra generate`; não presuma que `infra/` já existe:

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

Este é o coração de um projeto azd. A seguinte **definição ilustrativa de App Service** requer infraestrutura App Service correspondente; não é motivo para alterar um host Container Apps gerado sem mudar a infraestrutura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada mapeia uma pasta do seu código para um host Azure. Se a sua app tiver front-end e API, terá dois serviços.

### `infra/` — os seus recursos Azure como código

A pasta `infra/` contém ficheiros Bicep que definem os recursos Azure que a sua aplicação necessita (o App Service, a base de dados, etc.). Não precisa de os escrever manualmente—o azd gera um ponto de partida funcional. Pode *editar* estes ficheiros mais tarde para adicionar recursos ou reforçar a segurança (explicado no [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Quer ver ou personalizar a infraestrutura gerada antes de fazer o deploy? Execute `azd infra generate` (também disponível como `azd infra synth`) para escrever a IaC para disco e assim poder rever e controlar versões.

---

## Passo 3: Definir Configuração Necessária

Se a sua aplicação precisar de definições ou segredos (uma connection string, uma chave API), não os codifique diretamente. Use valores do ambiente:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Isto armazena um valor local apenas. Para afetar a aplicação, consuma-o explicitamente em parâmetros da infraestrutura, numa definição de serviço suportada, ou num hook; definir uma variável arbitrária não configura o runtime implementado.

Para segredos reais, guarde-os no Key Vault e referencie-os a partir da sua infraestrutura—veja o [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Fazer o Deploy

Agora use o mesmo fluxo de trabalho que já conhece:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Quando acabar, o azd apresenta a URL da sua aplicação. Verifique-a da mesma forma que qualquer app azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Problemas Frequentes na Primeira Utilização

| Sintoma | Causa provável | Solução |
|---------|--------------|-----|
| o azd não detetou a minha app | Manifesto em falta (ex., `package.json`) | Adicione o manifesto ou selecione manualmente o host durante `azd init` |
| A construção falha durante `azd up` | A app necessita de um passo de build | Configure os scripts do pacote da app ou o hook do serviço `prepackage`; use `dist` para saída do deploy, não `buildCommand`/`outputPath` |
| A app inicia mas devolve erros | Configuração/segredo em falta | Ligue os valores às definições da app no runtime ou a uma referência do Key Vault; só `azd env set` não basta |
| Host errado escolhido | Deteção automática não corresponde às suas necessidades | Altere tanto `host:` como a infraestrutura correspondente, ou escolha um template compatível |

Para mais, veja o [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpar

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Usar código no diretório atual"** adiciona o azd a uma app que já tem.
- `azure.yaml` mapeia as suas pastas de código para hosts Azure; `infra/` define os recursos como Bicep.
- `azd infra generate` permite rever ou personalizar a infraestrutura gerada.
- Depois de inicializada, a sua app existente usa exatamente o mesmo fluxo de trabalho `azd up` / `azd down` que uma app baseada em template.

---

## 🔗 Navegação

| Direção | Aula |
|-----------|--------|
| **Anterior** | [O Seu Primeiro Projeto](first-project.md) |
| **Seguinte** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Noções Básicas do AZD](azd-basics.md)
- [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Folha de Trapaça de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
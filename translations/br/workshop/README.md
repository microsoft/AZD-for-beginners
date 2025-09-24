<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9cc966416ab431c38b2ab863884b196c",
  "translation_date": "2025-09-24T14:38:24+00:00",
  "source_file": "workshop/README.md",
  "language_code": "br"
}
-->
# Workshop AZD para Desenvolvedores de IA

Bem-vindo ao workshop prático para aprender a CLI do Desenvolvedor Azure (AZD) com foco na implantação de aplicações de IA. Este workshop ajuda você a adquirir um entendimento aplicado dos templates AZD em 3 etapas:

1. **Descoberta** - encontre o template ideal para você.
1. **Implantação** - implante e valide se está funcionando.
1. **Personalização** - modifique e itere para torná-lo seu!

Ao longo deste workshop, você também será apresentado a ferramentas e fluxos de trabalho essenciais para desenvolvedores, ajudando a otimizar sua jornada de desenvolvimento de ponta a ponta.

<br/>

## Guia Baseado em Navegador

As lições do workshop estão em Markdown. Você pode navegá-las diretamente no GitHub - ou lançar uma pré-visualização baseada em navegador, como mostrado na imagem abaixo.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.br.png)

Para usar esta opção - faça um fork do repositório para o seu perfil e inicie o GitHub Codespaces. Assim que o terminal do VS Code estiver ativo, digite este comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Em poucos segundos, você verá um diálogo pop-up. Selecione a opção `Open in browser`. O guia baseado em navegador será aberto em uma nova aba. Alguns benefícios desta pré-visualização:

1. **Busca integrada** - encontre palavras-chave ou lições rapidamente.
1. **Ícone de copiar** - passe o mouse sobre os blocos de código para ver esta opção.
1. **Alternância de tema** - alterne entre temas claro e escuro.
1. **Obtenha ajuda** - clique no ícone do Discord no rodapé para participar!

<br/>

## Visão Geral do Workshop

**Duração:** 3-4 horas  
**Nível:** Iniciante a Intermediário  
**Pré-requisitos:** Familiaridade com Azure, conceitos de IA, VS Code e ferramentas de linha de comando.

Este é um workshop prático onde você aprende fazendo. Após concluir os exercícios, recomendamos revisar o currículo AZD Para Iniciantes para continuar sua jornada de aprendizado em melhores práticas de Segurança e Produtividade.

| Tempo | Módulo  | Objetivo |
|:---|:---|:---|
| 15 mins | [Introdução](docs/instructions/0-Introduction.md) | Definir o contexto, entender os objetivos |
| 30 mins | [Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) | Explorar opções e escolher um template inicial | 
| 30 mins | [Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) | Implantar solução padrão no Azure |
| 30 mins | [Decompor Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estrutura e configuração |
| 30 mins | [Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) | Ativar e testar recursos disponíveis |
| 30 mins | [Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar o template às suas necessidades |
| 30 mins | [Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) | Limpar e liberar recursos |
| 15 mins | [Conclusão e Próximos Passos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizado, desafio do workshop |

<br/>

## O Que Você Vai Aprender

Pense no Template AZD como um ambiente de aprendizado para explorar várias capacidades e ferramentas para desenvolvimento de ponta a ponta no Azure AI Foundry. Ao final deste workshop, você deve ter uma compreensão intuitiva de várias ferramentas e conceitos neste contexto.

| Conceito  | Objetivo |
|:---|:---|
| **CLI do Desenvolvedor Azure** | Entender comandos e fluxos de trabalho da ferramenta |
| **Templates AZD**| Compreender estrutura e configuração de projetos |
| **Agente de IA do Azure**| Provisionar e implantar projeto no Azure AI Foundry |
| **Busca de IA do Azure**| Ativar engenharia de contexto com agentes |
| **Observabilidade**| Explorar rastreamento, monitoramento e avaliações |
| **Testes Adversariais**| Explorar testes adversariais e mitigações |

<br/>

## Estrutura do Workshop

O workshop é estruturado para levar você em uma jornada desde a descoberta do template, até a implantação, decomposição e personalização - usando o template oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) como base.

### [Módulo 1: Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) (30 mins)

- O que são Templates de IA?
- Onde posso encontrar Templates de IA?
- Como posso começar a construir Agentes de IA?
- **Lab**: Introdução rápida com GitHub Codespaces

### [Módulo 2: Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Qual é a Arquitetura do Template de IA?
- Qual é o Fluxo de Trabalho de Desenvolvimento AZD?
- Como posso obter ajuda com Desenvolvimento AZD?
- **Lab**: Implantar e Validar o template de Agentes de IA

### [Módulo 3: Decompor Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explorar seu ambiente em `.azure/` 
- Explorar sua configuração de recursos em `infra/` 
- Explorar sua configuração AZD em `azure.yaml`s
- **Lab**: Modificar Variáveis de Ambiente e Reimplantar

### [Módulo 4: Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explorar: Geração Aumentada por Recuperação
- Explorar: Avaliação de Agentes e Testes Adversariais
- Explorar: Rastreamento e Monitoramento
- **Lab**: Explorar Agente de IA + Observabilidade 

### [Módulo 5: Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definir: PRD com Requisitos de Cenário
- Configurar: Variáveis de Ambiente para AZD
- Implementar: Hooks de Ciclo de Vida para tarefas adicionais
- **Lab**: Personalizar template para meu cenário

### [Módulo 6: Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recapitular: O que são Templates AZD?
- Recapitular: Por que usar a CLI do Desenvolvedor Azure?
- Próximos Passos: Experimente um template diferente!
- **Lab**: Desprovisionar infraestrutura e limpar

<br/>

## Desafio do Workshop

Quer se desafiar a fazer mais? Aqui estão algumas sugestões de projetos - ou compartilhe suas ideias conosco!!

| Projeto | Descrição |
|:---|:---|
|1. **Decompor um Template de IA Complexo** | Use o fluxo de trabalho e as ferramentas que apresentamos e veja se você consegue implantar, validar e personalizar um template de solução de IA diferente. _O que você aprendeu?_|
|2. **Personalizar com Seu Cenário**  | Tente escrever um PRD (Documento de Requisitos de Produto) para um cenário diferente. Em seguida, use o GitHub Copilot no repositório do seu template no modelo de Agente - e peça para ele gerar um fluxo de trabalho de personalização para você. _O que você aprendeu? Como poderia melhorar essas sugestões?_|
| | |

## Tem feedback?

1. Poste um problema neste repositório - marque-o como `Workshop` para conveniência.
1. Participe do Discord do Azure AI Foundry - conecte-se com seus colegas!


| | | 
|:---|:---|
| **📚 Página do Curso**| [AZD Para Iniciantes](../README.md)|
| **📖 Documentação** | [Introdução aos templates de IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Templates de IA** | [Templates do Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Próximos Passos** | [Aceite o Desafio](../../../workshop) |
| | |

<br/>

---

**Anterior:** [Guia de Solução de Problemas de IA](../docs/troubleshooting/ai-troubleshooting.md) | **Próximo:** Comece com [Lab 1: Fundamentos do AZD](../../../workshop/lab-1-azd-basics)

**Pronto para começar a construir aplicações de IA com AZD?**

[Comece o Lab 1: Fundamentos do AZD →](./lab-1-azd-basics/README.md)

---


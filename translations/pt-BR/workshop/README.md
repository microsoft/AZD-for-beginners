<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD para Desenvolvedores de IA
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Um workshop prático para criar aplicações de IA com Azure Developer CLI.</strong><br>
      Conclua 7 módulos para dominar os templates AZD e os fluxos de implantação de IA.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Última atualização: fevereiro de 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD para Desenvolvedores de IA

Bem-vindo ao workshop prático para aprender Azure Developer CLI (AZD) com foco na implantação de aplicações de IA. Este workshop ajuda você a obter um entendimento aplicado dos templates AZD em 3 passos:

1. **Descoberta** - encontre o template certo para você.
1. **Implantação** - implante e valide que funciona
1. **Customização** - modifique e itere para torná-lo seu!

Ao longo deste workshop, você também será apresentado às ferramentas e fluxos de trabalho essenciais para desenvolvedores, para ajudar a otimizar sua jornada de desenvolvimento de ponta a ponta.

<br/>

## Guia baseado no navegador

As lições do workshop estão em Markdown. Você pode navegá-las diretamente no GitHub - ou iniciar uma pré-visualização baseada no navegador como mostrado na captura de tela abaixo.

![Oficina](../../../translated_images/pt-BR/workshop.75906f133e6f8ba0.webp)

Para usar esta opção - faça um fork do repositório para o seu perfil e inicie o GitHub Codespaces. Assim que o terminal do VS Code estiver ativo, digite este comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Em alguns segundos, você verá um diálogo pop-up. Selecione a opção `Abrir no navegador`. O guia baseado na web agora abrirá em uma nova aba do navegador. Alguns benefícios desta visualização:

1. **Pesquisa integrada** - encontre palavras-chave ou lições rapidamente.
1. **Ícone de copiar** - passe o cursor sobre blocos de código para ver essa opção
1. **Alternar tema** - mude entre temas claro e escuro
1. **Obter ajuda** - clique no ícone do Discord no rodapé para participar!

<br/>

## Visão geral do workshop

**Duração:** 3-4 horas  
**Nível:** Iniciante a Intermediário  
**Pré-requisitos:** Familiaridade com Azure, conceitos de IA, VS Code e ferramentas de linha de comando.

Este é um workshop prático onde você aprende fazendo. Depois de concluir os exercícios, recomendamos revisar o currículo AZD For Beginners para continuar sua jornada de aprendizado em práticas recomendadas de Segurança e Produtividade.

| Tempo| Módulo  | Objetivo |
|:---|:---|:---|
| 15 min | [Introdução](docs/instructions/0-Introduction.md) | Estabelecer o contexto, entender os objetivos |
| 30 min | [Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) | Explorar opções e escolher um modelo inicial | 
| 30 min | [Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) | Implantar a solução padrão no Azure |
| 30 min | [Deconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estrutura e configuração |
| 30 min | [Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) | Ativar e testar recursos disponíveis |
| 30 min | [Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar o template às suas necessidades |
| 30 min | [Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) | Limpar e liberar recursos |
| 15 min | [Conclusão e Próximos Passos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizagem, desafio do workshop |

<br/>

## O que você vai aprender

Pense no Template AZD como uma sandbox de aprendizado para explorar várias capacidades e ferramentas para desenvolvimento de ponta a ponta no Microsoft Foundry. Ao final deste workshop, você deve ter uma noção intuitiva de várias ferramentas e conceitos nesse contexto.

| Conceito  | Objetivo |
|:---|:---|
| **Azure Developer CLI** | Compreender comandos da ferramenta e fluxos de trabalho|
| **Templates AZD**| Entender estrutura do projeto e configuração|
| **Azure AI Agent**| Provisionar e implantar projeto Microsoft Foundry  |
| **Azure AI Search**| Habilitar engenharia de contexto com agentes |
| **Observability**| Explorar rastreamento, monitoramento e avaliações |
| **Red Teaming**| Explorar testes adversariais e mitigacões |

<br/>

## Estrutura do Workshop

O workshop é estruturado para levá-lo em uma jornada desde a descoberta de templates, até implantação, desconstrução e personalização - usando o template inicial oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) como base.

### [Módulo 1: Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) (30 min)

- O que são Templates de IA?
- Onde posso encontrar Templates de IA?
- Como posso começar a construir Agentes de IA?
- **Laboratório**: Início rápido com GitHub Codespaces

### [Módulo 2: Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Qual é a arquitetura do Template de IA?
- Qual é o fluxo de desenvolvimento do AZD?
- Como posso obter ajuda com o desenvolvimento AZD?
- **Laboratório**: Implantar e validar o template AI Agents

### [Módulo 3: Deconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Explore seu ambiente em `.azure/` 
- Explore sua configuração de recursos em `infra/` 
- Explore sua configuração AZD em `azure.yaml`s
- **Laboratório**: Modificar variáveis de ambiente e reimplantar

### [Módulo 4: Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Explorar: Geração Aumentada por Recuperação
- Explorar: Avaliação de Agentes & Red Teaming
- Explorar: Rastreamento & Monitoramento
- **Laboratório**: Explorar Agente de IA + Observabilidade 

### [Módulo 5: Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definir: PRD com requisitos do cenário
- Configurar: variáveis de ambiente para AZD
- Implementar: ganchos de ciclo de vida para tarefas adicionais
- **Laboratório**: Personalizar o template para meu cenário

### [Módulo 6: Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Recapitular: O que são Templates AZD?
- Recapitular: Por que usar Azure Developer CLI?
- Próximos passos: Experimente um template diferente!
- **Laboratório**: Desprovisionar infraestrutura e limpar recursos

<br/>

## Desafio do Workshop

Quer se desafiar a fazer mais? Aqui estão algumas sugestões de projetos - ou compartilhe suas ideias conosco!!

| Projeto | Descrição |
|:---|:---|
|1. **Desconstruir um Template de IA Complexo** | Use o fluxo de trabalho e as ferramentas que descrevemos e veja se você consegue implantar, validar e personalizar um template de solução de IA diferente. _O que você aprendeu?_|
|2. **Personalizar com seu cenário**  | Tente escrever um PRD (Product Requirements Document) para um cenário diferente. Em seguida, use o GitHub Copilot no seu repositório de template no Agent Model - e peça para gerar um fluxo de personalização para você. _O que você aprendeu? Como você poderia melhorar essas sugestões?_|
| | |

## Tem feedback?

1. Abra uma issue neste repositório - marque-a com a tag `Workshop` para conveniência.
1. Junte-se ao Discord do Microsoft Foundry - conecte-se com seus colegas!


| | | 
|:---|:---|
| **📚 Página do Curso**| [AZD For Beginners](../README.md)|
| **📖 Documentação** | [Comece com templates de IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Templates de IA** | [Templates Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Próximos passos** | [Iniciar Workshop](../../../workshop) |
| | |

<br/>

---

**Navegação:** [Curso Principal](../README.md) | [Introdução](docs/instructions/0-Introduction.md) | [Módulo 1: Selecionar Template](docs/instructions/1-Select-AI-Template.md)

**Pronto para começar a construir aplicações de IA com AZD?**

[Iniciar Workshop: Introdução →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
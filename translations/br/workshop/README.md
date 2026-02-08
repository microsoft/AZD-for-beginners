<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:41:56+00:00",
  "source_file": "workshop/README.md",
  "language_code": "br"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop em Construção 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Este workshop está atualmente em desenvolvimento ativo.</strong><br>
      O conteúdo pode estar incompleto ou sujeito a alterações. Volte em breve para atualizações!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Última Atualização: Outubro de 2025
      </span>
    </div>
  </div>
</div>

# Workshop AZD para Desenvolvedores de IA

Bem-vindo ao workshop prático para aprender a CLI do Desenvolvedor Azure (AZD) com foco na implantação de aplicações de IA. Este workshop ajuda você a adquirir um entendimento prático dos templates do AZD em 3 etapas:

1. **Descoberta** - encontre o template certo para você.
1. **Implantação** - implante e valide se funciona.
1. **Personalização** - modifique e adapte para atender às suas necessidades!

Ao longo deste workshop, você também será apresentado a ferramentas e fluxos de trabalho essenciais para desenvolvedores, ajudando a otimizar sua jornada de desenvolvimento de ponta a ponta.

<br/>

## Guia Baseado em Navegador

As lições do workshop estão em Markdown. Você pode navegá-las diretamente no GitHub - ou lançar uma pré-visualização no navegador, como mostrado na imagem abaixo.

![Workshop](../../../translated_images/pt-BR/workshop.75906f133e6f8ba0.webp)

Para usar esta opção - faça um fork do repositório para o seu perfil e inicie o GitHub Codespaces. Assim que o terminal do VS Code estiver ativo, digite este comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Em poucos segundos, você verá um diálogo pop-up. Selecione a opção `Abrir no navegador`. O guia baseado na web será aberto em uma nova aba do navegador. Alguns benefícios desta pré-visualização:

1. **Busca integrada** - encontre palavras-chave ou lições rapidamente.
1. **Ícone de copiar** - passe o mouse sobre os blocos de código para ver esta opção.
1. **Alternância de tema** - alterne entre temas claro e escuro.
1. **Obtenha ajuda** - clique no ícone do Discord no rodapé para participar!

<br/>

## Visão Geral do Workshop

**Duração:** 3-4 horas  
**Nível:** Iniciante a Intermediário  
**Pré-requisitos:** Familiaridade com Azure, conceitos de IA, VS Code e ferramentas de linha de comando.

Este é um workshop prático onde você aprende fazendo. Após concluir os exercícios, recomendamos revisar o currículo AZD Para Iniciantes para continuar sua jornada de aprendizado em melhores práticas de segurança e produtividade.

| Tempo | Módulo  | Objetivo |
|:---|:---|:---|
| 15 mins | [Introdução](docs/instructions/0-Introduction.md) | Definir o contexto, entender os objetivos |
| 30 mins | [Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) | Explorar opções e escolher um ponto de partida | 
| 30 mins | [Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) | Implantar solução padrão no Azure |
| 30 mins | [Desconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estrutura e configuração |
| 30 mins | [Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) | Ativar e testar recursos disponíveis |
| 30 mins | [Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar o template às suas necessidades |
| 30 mins | [Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) | Limpar e liberar recursos |
| 15 mins | [Conclusão e Próximos Passos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizado, desafio do workshop |

<br/>

## O que Você Vai Aprender

Pense no Template AZD como um ambiente de aprendizado para explorar várias capacidades e ferramentas para desenvolvimento de ponta a ponta no Azure AI Foundry. Ao final deste workshop, você deverá ter uma compreensão intuitiva de várias ferramentas e conceitos neste contexto.

| Conceito  | Objetivo |
|:---|:---|
| **CLI do Desenvolvedor Azure** | Entender comandos e fluxos de trabalho da ferramenta |
| **Templates AZD**| Compreender estrutura e configuração de projetos |
| **Agente de IA do Azure**| Provisionar e implantar projeto do Azure AI Foundry |
| **Busca de IA do Azure**| Habilitar engenharia de contexto com agentes |
| **Observabilidade**| Explorar rastreamento, monitoramento e avaliações |
| **Testes Adversariais**| Explorar testes de adversidade e mitigações |

<br/>

## Estrutura do Workshop

O workshop é estruturado para levar você em uma jornada desde a descoberta do template, até a implantação, desconstrução e personalização - usando o template oficial [Introdução aos Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) como base.

### [Módulo 1: Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) (30 mins)

- O que são Templates de IA?
- Onde posso encontrar Templates de IA?
- Como posso começar a construir Agentes de IA?
- **Laboratório**: Introdução rápida com GitHub Codespaces

### [Módulo 2: Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Qual é a Arquitetura do Template de IA?
- Qual é o Fluxo de Trabalho de Desenvolvimento AZD?
- Como posso obter ajuda com o Desenvolvimento AZD?
- **Laboratório**: Implantar e Validar o template de Agentes de IA

### [Módulo 3: Desconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explore seu ambiente em `.azure/` 
- Explore sua configuração de recursos em `infra/` 
- Explore sua configuração AZD em `azure.yaml`s
- **Laboratório**: Modificar Variáveis de Ambiente e Reimplantar

### [Módulo 4: Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explore: Recuperação com Geração Aumentada
- Explore: Avaliação de Agentes e Testes Adversariais
- Explore: Rastreamento e Monitoramento
- **Laboratório**: Explore Agente de IA + Observabilidade 

### [Módulo 5: Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definir: PRD com Requisitos de Cenário
- Configurar: Variáveis de Ambiente para AZD
- Implementar: Hooks de Ciclo de Vida para tarefas adicionais
- **Laboratório**: Personalizar template para meu cenário

### [Módulo 6: Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recapitular: O que são Templates AZD?
- Recapitular: Por que usar a CLI do Desenvolvedor Azure?
- Próximos Passos: Experimente um template diferente!
- **Laboratório**: Desprovisionar infraestrutura e limpar

<br/>

## Desafio do Workshop

Quer se desafiar a fazer mais? Aqui estão algumas sugestões de projetos - ou compartilhe suas ideias conosco!!

| Projeto | Descrição |
|:---|:---|
|1. **Desconstruir um Template de IA Complexo** | Use o fluxo de trabalho e as ferramentas que apresentamos e veja se você consegue implantar, validar e personalizar um template de solução de IA diferente. _O que você aprendeu?_|
|2. **Personalizar com Seu Cenário**  | Tente escrever um PRD (Documento de Requisitos de Produto) para um cenário diferente. Em seguida, use o GitHub Copilot no repositório do seu template no Modelo de Agente - e peça para ele gerar um fluxo de trabalho de personalização para você. _O que você aprendeu? Como poderia melhorar essas sugestões?_|
| | |

## Tem feedback?

1. Publique um problema neste repositório - marque-o como `Workshop` para facilitar.
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

**Anterior:** [Guia de Solução de Problemas de IA](../docs/troubleshooting/ai-troubleshooting.md) | **Próximo:** Comece com [Laboratório 1: Fundamentos do AZD](../../../workshop/lab-1-azd-basics)

**Pronto para começar a construir aplicações de IA com AZD?**

[Comece o Laboratório 1: Fundamentos do AZD →](./lab-1-azd-basics/README.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.